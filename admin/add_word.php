<?php
session_start();
require_once '../includes/db.php';

if (!isset($_SESSION['admin_logged_in'])) {
    header("Location: index.php");
    exit;
}

$success = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $word = trim($_POST['word']);
    if ($word) {
        $stmt = $pdo->prepare("INSERT IGNORE INTO words (word) VALUES (?)");
        $stmt->execute([$word]);
        $success = "Word added: $word";
    }
}
?>

<!DOCTYPE html>
<html>
<head><title>Add Word</title></head>
<body>
    <h2>Add New Word</h2>
    <?php if ($success): ?><p style="color:green;"><?= $success ?></p><?php endif; ?>
    <form method="POST">
        <input name="word" placeholder="Enter word..." required>
        <button type="submit">Add Word</button>
    </form>
    <br><a href="dashboard.php">⬅️ Back to Dashboard</a>
</body>
</html>
