<?php
require_once 'db.php';

function deleteEmptyRooms($pdo) {
    // Find room IDs with 0 players
    $stmt = $pdo->query("
        SELECT r.id
        FROM rooms r
        LEFT JOIN players p ON r.id = p.room_id
        GROUP BY r.id
        HAVING COUNT(p.id) = 0
    ");
    $emptyRooms = $stmt->fetchAll(PDO::FETCH_COLUMN);

    // Delete them
    if (count($emptyRooms)) {
        foreach ($emptyRooms as $room_id) {
            // Delete related players (just in case)
            $pdo->prepare("DELETE FROM players WHERE room_id = ?")->execute([$room_id]);

            // Delete game status
            $pdo->prepare("DELETE FROM game_status WHERE room_id = ?")->execute([$room_id]);

            // Delete room
            $pdo->prepare("DELETE FROM rooms WHERE id = ?")->execute([$room_id]);
        }
    }
}

function deleteIdleRooms($pdo) {
    // Find rooms that are 'waiting' and older than 5 minutes
    $stmt = $pdo->prepare("
        SELECT id FROM rooms 
        WHERE status = 'waiting' 
        AND created_at < NOW() - INTERVAL 5 MINUTE
    ");
    $stmt->execute();
    $staleRooms = $stmt->fetchAll(PDO::FETCH_COLUMN);

    foreach ($staleRooms as $room_id) {
        // Log for each user
        $players = $pdo->prepare("SELECT user_id FROM players WHERE room_id = ?");
        $players->execute([$room_id]);

        foreach ($players->fetchAll() as $player) {
            $pdo->prepare("INSERT INTO activity_logs (user_id, action, details, room_id)
                VALUES (?, 'room_auto_cleanup', 'Room was inactive for 5 minutes', ?)")
                ->execute([$player['user_id'], $room_id]);
        }

        // Delete players
        $pdo->prepare("DELETE FROM players WHERE room_id = ?")->execute([$room_id]);

        // Delete game status
        $pdo->prepare("DELETE FROM game_status WHERE room_id = ?")->execute([$room_id]);

        // Delete room
        $pdo->prepare("DELETE FROM rooms WHERE id = ?")->execute([$room_id]);
    }
}

// Run both cleanup functions
deleteEmptyRooms($pdo);
deleteIdleRooms($pdo);
