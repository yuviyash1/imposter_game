<?php
session_start();
require_once 'includes/db.php';

if (!isset($_SESSION['user_id'], $_POST['room_id'])) {
    header('Location: home.php');
    exit;
}

$room_id = intval($_POST['room_id']);

$stmt = $pdo->prepare("SELECT COUNT(*) FROM players WHERE user_id = ? AND room_id = ?");
$stmt->execute([$_SESSION['user_id'], $room_id]);

if ($stmt->fetchColumn() == 0) {
    $stmt = $pdo->prepare("INSERT INTO players (user_id, room_id) VALUES (?, ?)");
    $stmt->execute([$_SESSION['user_id'], $room_id]);
}

$_SESSION['room_id'] = $room_id;
header('Location: lobby.php');
exit;
