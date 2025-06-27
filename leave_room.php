<?php
session_start();
require_once 'includes/db.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit;
}

$user_id = $_SESSION['user_id'];

$stmt = $pdo->prepare("DELETE FROM players WHERE user_id = ?");
$stmt->execute([$user_id]);

unset($_SESSION['room_id']);

header('Location: home.php');
exit;
