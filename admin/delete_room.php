<?php
session_start();
require_once '../includes/db.php';

if (!isset($_SESSION['admin_logged_in']) || !isset($_POST['room_id'])) {
    header("Location: index.php");
    exit;
}

$room_id = intval($_POST['room_id']);
$pdo->prepare("DELETE FROM rooms WHERE id = ?")->execute([$room_id]);

header("Location: dashboard.php");
exit;
