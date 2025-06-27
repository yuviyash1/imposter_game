<?php
// Get username from user_id
function getUsername($pdo, $user_id) {
    $stmt = $pdo->prepare("SELECT username FROM users WHERE id = ?");
    $stmt->execute([$user_id]);
    return $stmt->fetchColumn();
}

// Is current user the host of this room?
function isHost($pdo, $room_id, $user_id) {
    $stmt = $pdo->prepare("SELECT user_id FROM players WHERE room_id = ? ORDER BY id ASC LIMIT 1");
    $stmt->execute([$room_id]);
    return $stmt->fetchColumn() == $user_id;
}

// Get current user's role in the room
function getUserRole($pdo, $room_id, $user_id) {
    $stmt = $pdo->prepare("SELECT role FROM players WHERE room_id = ? AND user_id = ?");
    $stmt->execute([$room_id, $user_id]);
    return $stmt->fetchColumn();
}
