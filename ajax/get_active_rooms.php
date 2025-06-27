<?php
session_start();
require_once '../includes/db.php';
require_once '../includes/cleanup.php';
deleteEmptyRooms($pdo);


$stmt = $pdo->query("SELECT r.id, r.code, r.status, COUNT(p.id) as player_count
                     FROM rooms r
                     LEFT JOIN players p ON r.id = p.room_id
                     WHERE r.status != 'ended'
                     GROUP BY r.id
                     ORDER BY r.created_at DESC");

$rooms = $stmt->fetchAll();

foreach ($rooms as $room) {
    echo "<div>
        Room: <b>{$room['code']}</b> | Players: {$room['player_count']} | Status: {$room['status']}
        <form method='POST' action='join_room.php' style='display:inline'>
            <input type='hidden' name='room_id' value='{$room['id']}'>
            <button type='submit'>Join</button>
        </form>
    </div><hr>";
}
