<?php
session_start();
require_once 'includes/db.php';

// --- SESSION VALIDATION ---
if (!isset($_SESSION['user_id'], $_SESSION['room_id'])) {
    header("Location: home.php");
    exit;
}

$user_id = $_SESSION['user_id'];
$room_id = $_SESSION['room_id'];

// --- ROOM VALIDATION ---
$stmt = $pdo->prepare("SELECT code, status, created_at FROM rooms WHERE id = ?");
$stmt->execute([$room_id]);
$room = $stmt->fetch();

if (!$room) {
    // Log and cleanup
    $pdo->prepare("INSERT INTO activity_logs (user_id, action, details, room_id)
        VALUES (?, 'room_auto_removed', 'Room deleted while in lobby', ?)")
        ->execute([$user_id, $room_id]);

    unset($_SESSION['room_id']);
    $pdo->prepare("DELETE FROM players WHERE user_id = ?")->execute([$user_id]);

    header("Location: home.php");
    exit;
}

// --- PLAYER LIST FETCH ---
$stmt = $pdo->prepare("
    SELECT p.user_id, u.username
    FROM players p
    JOIN users u ON p.user_id = u.id
    WHERE p.room_id = ?
    ORDER BY p.id ASC
");
$stmt->execute([$room_id]);
$players = $stmt->fetchAll();

// --- Determine Host ---
$host_id = $players[0]['user_id'];
$is_host = ($host_id == $user_id);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Lobby - Room <?= htmlspecialchars($room['code']) ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/style.css">
    <script>
        function pollLobby() {
            fetch('ajax/get_lobby_data.php')
                .then(res => res.json())
                .then(data => {
                    const list = document.getElementById('players');
                    list.innerHTML = '';
                    data.players.forEach(p => {
                        const isHost = p.id == data.host_id;
                        const isYou = p.id == <?= json_encode($_SESSION['user_id']) ?>;

                        let label = p.name;
                        if (isHost) label += " (Host)";
                        if (isYou) label += " (You)";

                        const li = document.createElement('li');
                        li.innerHTML = label;
                        list.appendChild(li);
                    });

                    if (data.status === 'started') {
                        window.location.href = 'game.php';
                    }
                });
        }

        setInterval(pollLobby, 2000);
        window.onload = pollLobby;
    </script>
</head>
<body>
    <h1>Lobby</h1>
    <div class="card">
        <h2>Room Code: <?= htmlspecialchars($room['code']) ?></h2>
        <h3>Players:</h3>
        <ul id="players" style="margin-bottom: 18px;"></ul>

        <?php if ($is_host && $room['status'] === 'waiting'): ?>
            <form method="POST" action="start_game.php" style="margin-bottom: 18px;">
                <button type="submit">Start Game</button>
            </form>
        <?php endif; ?>

        <a href="leave_room.php">Leave Room</a>
    </div>
</body>
</html>
