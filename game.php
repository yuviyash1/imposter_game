<?php
session_start();
require_once 'includes/db.php';

$user_id = $_SESSION['user_id'] ?? null;
$room_id = $_SESSION['room_id'] ?? null;

if (!$user_id || !$room_id) {
    header("Location: home.php");
    exit;
}

// Verify room still exists
$stmt = $pdo->prepare("SELECT COUNT(*) FROM rooms WHERE id = ?");
$stmt->execute([$_SESSION['room_id']]);
if ($stmt->fetchColumn() == 0) {
    unset($_SESSION['room_id']);
    $pdo->prepare("DELETE FROM players WHERE user_id = ?")->execute([$_SESSION['user_id']]);
    header('Location: home.php');
    exit;
}

// Get role and word
$stmt = $pdo->prepare("SELECT role FROM players WHERE user_id = ? AND room_id = ?");
$stmt->execute([$user_id, $room_id]);
$role = $stmt->fetchColumn();

$stmt = $pdo->prepare("SELECT word FROM rooms WHERE id = ?");
$stmt->execute([$room_id]);
$word = $stmt->fetchColumn();
?>
<!DOCTYPE html>
<html>
<head>
    <title>Your Role</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/style.css">
    <style>
        .result-option {
            display: flex;
            align-items: center;
            gap: 8px;
            background: #f4f6fb;
            border-radius: 4px;
            padding: 8px 12px;
            margin-bottom: 8px;
            cursor: pointer;
            border: 1px solid #d1d8e0;
            transition: border 0.2s;
        }
        .result-option:hover, .result-option.selected {
            border: 1.5px solid #2e86de;
            background: #eaf3ff;
        }
        .submit-btn {
            margin-top: 10px;
        }
    </style>
    <script>
        function selectOption(el) {
            document.querySelectorAll('.result-option').forEach(opt => opt.classList.remove('selected'));
            el.classList.add('selected');
        }
    </script>
</head>
<body>
    <h1>You are in the game</h1>
    <a href="logout.php">Logout</a>
    <div class="card">
        <h2>Your Role:</h2>
        <?php if ($role === 'imposter'): ?>
            <h3 style="color:red;">You are the IMPOSTER 🤫</h3>
        <?php else: ?>
            <h3>Your word: <u><?= htmlspecialchars($word) ?></u></h3>
        <?php endif; ?>

        <form method="POST" action="result.php" id="resultForm">
            <label><strong>Select the winner:</strong></label>

            <label class="result-option" onclick="selectOption(this)">
                <input type="radio" name="result" value="crewmates_won" required>
                <span>👨‍🚀 Crewmates Won</span>
            </label>

            <label class="result-option" onclick="selectOption(this)">
                <input type="radio" name="result" value="imposter_won" required>
                <span>🕵️‍♂️ Imposter Won</span>
            </label>

            <button type="submit" class="submit-btn">Submit Result</button>
        </form>
    </div>
</body>
</html>
