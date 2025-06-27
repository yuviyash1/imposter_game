<?php
session_start();
require_once 'includes/db.php';

$user_id = $_SESSION['user_id'] ?? null;
$room_id = $_SESSION['room_id'] ?? null;

if (!$user_id || !$room_id || !isset($_POST['result'])) {
    header("Location: home.php");
    exit;
}

// Update result only if not already submitted
$stmt = $pdo->prepare("SELECT result FROM game_status WHERE room_id = ?");
$stmt->execute([$room_id]);
$current = $stmt->fetchColumn();

if ($current === 'pending') {
    $stmt = $pdo->prepare("UPDATE game_status SET result = ?, updated_at = NOW() WHERE room_id = ?");
    $stmt->execute([$_POST['result'], $room_id]);

    // Reset room status so users return to lobby
    $pdo->prepare("UPDATE rooms SET status = 'waiting' WHERE id = ?")->execute([$room_id]);
}

header("Location: lobby.php");
exit;
