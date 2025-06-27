<?php
session_start();
header('Content-Type: application/json');
require_once '../includes/db.php';

$room_id = $_SESSION['room_id'] ?? null;

if (!$room_id) {
    echo json_encode(['error' => 'Not in room']);
    exit;
}

// Verify room still exists (prevent broken sessions)
$stmt = $pdo->prepare("SELECT status FROM rooms WHERE id = ?");
$stmt->execute([$room_id]);
$room = $stmt->fetch();

if (!$room) {
    echo json_encode(['error' => 'Room not found']);
    exit;
}

// Get players in the room
$stmt = $pdo->prepare("
    SELECT p.user_id, u.username 
    FROM players p 
    JOIN users u ON p.user_id = u.id 
    WHERE p.room_id = ? 
    ORDER BY p.id ASC
");
$stmt->execute([$room_id]);
$players_raw = $stmt->fetchAll();

// Format players for frontend
$players = [];
foreach ($players_raw as $p) {
    $players[] = [
        'id' => $p['user_id'],
        'name' => htmlspecialchars($p['username']) // safe output
    ];
}

// First player is host
$host_id = $players_raw[0]['user_id'] ?? null;

echo json_encode([
    'players' => $players,
    'host_id' => $host_id,
    'status' => $room['status']
]);
