<?php
session_start();
require_once '../includes/db.php';

// Total registered users
$totalUsers = $pdo->query("SELECT COUNT(*) FROM users WHERE is_admin = 0")->fetchColumn();

// Total rooms
$totalRooms = $pdo->query("SELECT COUNT(*) FROM rooms")->fetchColumn();

// Total games finished
$totalGames = $pdo->query("SELECT COUNT(*) FROM rooms WHERE status = 'ended'")->fetchColumn();

// Total words in dictionary
$totalWords = $pdo->query("SELECT COUNT(*) FROM words")->fetchColumn();

if (!isset($_SESSION['admin_logged_in'])) {
    header("Location: index.php");
    exit;
}

// Fetch rooms
$stmt = $pdo->query("SELECT * FROM rooms ORDER BY created_at DESC");
$rooms = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html>
<head><title>Admin Dashboard</title></head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../assets/style.css">
<body>
    <h2>Admin Dashboard</h2>
    <div style="background:#f1f1f1; padding: 15px; border-radius: 10px; margin-bottom: 20px; max-width: 600px;">
        <h3>📊 Game Stats</h3>
        <ul style="list-style-type:none; padding-left: 0;">
            <li><strong>👤 Total Users Joined:</strong> <?= $totalUsers ?></li>
            <li><strong>🛖 Rooms Created:</strong> <?= $totalRooms ?></li>
            <li><strong>🏁 Games Finished:</strong> <?= $totalGames ?></li>
            <li><strong>📘 Words in Dictionary:</strong> <?= $totalWords ?></li>
        </ul>
    </div>

    <a href="dictionary.php">📘 View Dictionary</a> |
    <a href="dashboard.php">🏠 Dashboard</a> |
    <a href="players.php">Player Info:</a> |
    <a href="logout.php">🚪 Logout</a>

    <hr>

    <?php foreach ($rooms as $room): ?>
        <div style="margin-bottom: 20px; border: 1px solid #ccc; padding: 10px;">
            <strong>Room Code:</strong> <?= $room['code'] ?> <br>
            <strong>Status:</strong> <?= $room['status'] ?> <br>
            <strong>Word:</strong> <?= $room['word'] ?? '-' ?> <br>

            <strong>Players:</strong>
            <ul>
            <?php
                $stmt = $pdo->prepare("SELECT u.username, p.user_id FROM players p JOIN users u ON p.user_id = u.id WHERE p.room_id = ? ORDER BY p.id ASC");
                $stmt->execute([$room['id']]);
                $players = $stmt->fetchAll();
                $host_id = $players[0]['user_id'] ?? null;

                foreach ($players as $p) {
                    $label = ($p['user_id'] == $host_id) ? " (Host)" : "";
                    echo "<li>{$p['username']}{$label}</li>";
                }
            ?>
            </ul>


            <form method="POST" action="delete_room.php">
                <input type="hidden" name="room_id" value="<?= $room['id'] ?>">
                <button type="submit" onclick="return confirm('Delete this room?')">❌ Delete Room</button>
            </form>
        </div>
    <?php endforeach; ?>
</body>
</html>
