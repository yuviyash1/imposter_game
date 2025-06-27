<?php
session_start();
require_once 'includes/db.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit;
}

// Get username from DB
$user_id = $_SESSION['user_id'];
$stmt = $pdo->prepare("SELECT username FROM users WHERE id = ?");
$stmt->execute([$user_id]);
$user = $stmt->fetch();
$username = $user['username'] ?? 'Guest';

// Check if user already in room
$stmt = $pdo->prepare("SELECT p.room_id FROM players p
    JOIN rooms r ON p.room_id = r.id
    WHERE p.user_id = ?");
$stmt->execute([$_SESSION['user_id']]);
$room_id = $stmt->fetchColumn();

if ($room_id) {
    $_SESSION['room_id'] = $room_id;
    header('Location: lobby.php');
    exit;
} else {
    // Cleanup invalid session or orphaned player row
    unset($_SESSION['room_id']);
    $pdo->prepare("DELETE FROM players WHERE user_id = ?")->execute([$_SESSION['user_id']]);
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>Home - Imposter Game</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/style.css">
    <script>
        function loadRooms() {
            fetch('ajax/get_active_rooms.php')
                .then(res => res.text())
                .then(html => {
                    document.getElementById('roomList').innerHTML = html;
                });
        }
        setInterval(loadRooms, 3000);
        window.onload = loadRooms;
    </script>
</head>
<body>
    <div class="card">
        <h2>Welcome, <?= htmlspecialchars($username) ?>!</h2>
        <form method="POST" action="create_room.php" style="margin-bottom: 18px;">
            <button type="submit">Create Room</button>
        </form>

        <h3>Active Rooms</h3>
        <div id="roomList" style="margin-bottom: 18px;">Loading rooms...</div>

        <a href="logout.php">Logout</a>
    </div>
    <script>
        setInterval(() => {
            fetch('includes/cleanup.php');
        }, 300000); // Cleanup every 5 minutes
    </script>
</body>
</html>
