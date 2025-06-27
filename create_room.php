<?php
session_start();
require_once 'includes/db.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit;
}

function generateCode($length = 6) {
    return strtoupper(substr(md5(time() . rand()), 0, $length));
}

$code = generateCode();

$stmt = $pdo->prepare("INSERT INTO rooms (code) VALUES (?)");
$stmt->execute([$code]);
$room_id = $pdo->lastInsertId();

$stmt = $pdo->prepare("INSERT INTO players (user_id, room_id) VALUES (?, ?)");
$stmt->execute([$_SESSION['user_id'], $room_id]);

$_SESSION['room_id'] = $room_id;
header("Location: lobby.php");
exit;
