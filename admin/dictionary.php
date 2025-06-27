<?php
session_start();
require_once '../includes/db.php';

if (!isset($_SESSION['admin_logged_in'])) {
    header("Location: index.php");
    exit;
}

$success = '';
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Add new word
    if (isset($_POST['add_word'])) {
        $newWord = trim($_POST['word']);
        if ($newWord) {
            $stmt = $pdo->prepare("INSERT IGNORE INTO words (word) VALUES (?)");
            $stmt->execute([$newWord]);
            $success = "✅ Word added: $newWord";
        } else {
            $error = "⚠️ Please enter a word.";
        }
    }

    // Delete word
    if (isset($_POST['delete_word_id'])) {
        $stmt = $pdo->prepare("DELETE FROM words WHERE id = ?");
        $stmt->execute([$_POST['delete_word_id']]);
        $success = "🗑️ Word deleted.";
    }
}

// Get all words
$words = $pdo->query("SELECT * FROM words ORDER BY word ASC")->fetchAll();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Word Dictionary</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/style.css">
    <style>
        .word-list {
            max-width: 400px;
            background: #f9f9f9;
            padding: 15px;
            border-radius: 10px;
        }

        .word-item {
            display: flex;
            justify-content: space-between;
            margin: 6px 0;
            padding: 6px 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            background: #fff;
        }

        .word-item form {
            margin: 0;
        }

        input[type="text"] {
            padding: 6px;
            width: 200px;
            border-radius: 4px;
            border: 1px solid #bbb;
        }

        .btn {
            padding: 6px 12px;
            font-size: 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
        }

        .btn-add {
            background-color: #2ecc71;
            color: white;
        }
    </style>
</head>
<body>
    <h2>📘 Word Dictionary</h2>
    <a href="dashboard.php">⬅️ Back to Dashboard</a>
    <br><br>

    <?php if ($success): ?><p style="color:green;"><?= $success ?></p><?php endif; ?>
    <?php if ($error): ?><p style="color:red;"><?= $error ?></p><?php endif; ?>

    <form method="POST">
        <input type="text" name="word" placeholder="Enter new word..." required>
        <button type="submit" name="add_word" class="btn btn-add">Add Word</button>
    </form>

    <hr>

    <div class="word-list">
        <h3>Words (<?= count($words) ?>)</h3>
        <?php foreach ($words as $word): ?>
            <div class="word-item">
                <span><?= htmlspecialchars($word['word']) ?></span>
                <form method="POST" onsubmit="return confirm('Delete this word?')">
                    <input type="hidden" name="delete_word_id" value="<?= $word['id'] ?>">
                    <button type="submit" class="btn btn-delete">Delete</button>
                </form>
            </div>
        <?php endforeach; ?>
    </div>
</body>
</html>
