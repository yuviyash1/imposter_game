<?php
session_start();
require_once 'includes/db.php';

$room_id = $_SESSION['room_id'] ?? null;
$user_id = $_SESSION['user_id'] ?? null;

if (!$room_id || !$user_id) {
    header("Location: home.php");
    exit;
}

// Get player IDs
$stmt = $pdo->prepare("SELECT user_id FROM players WHERE room_id = ?");
$stmt->execute([$room_id]);
$player_ids = $stmt->fetchAll(PDO::FETCH_COLUMN);

// Pick 1 imposter randomly
shuffle($player_ids);
$imposter_id = $player_ids[0];

// Pick a random word
$word = $pdo->query("SELECT word FROM words ORDER BY RAND() LIMIT 1")->fetchColumn();

// Update roles
foreach ($player_ids as $id) {
    $role = ($id == $imposter_id) ? 'imposter' : 'crewmate';
    $stmt = $pdo->prepare("UPDATE players SET role = ? WHERE user_id = ? AND room_id = ?");
    $stmt->execute([$role, $id, $room_id]);
}

// Update room status and assign word
$stmt = $pdo->prepare("UPDATE rooms SET status = 'started', word = ? WHERE id = ?");
$stmt->execute([$word, $room_id]);

// Reset game result
$stmt = $pdo->prepare("DELETE FROM game_status WHERE room_id = ?");
$stmt->execute([$room_id]);
$stmt = $pdo->prepare("INSERT INTO game_status (room_id, result) VALUES (?, 'pending')");
$stmt->execute([$room_id]);

header("Location: game.php");
exit;
