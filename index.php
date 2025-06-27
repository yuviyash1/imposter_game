<?php
session_start();
if (isset($_SESSION['user_id'])) {
    header('Location: home.php');
    exit;
}
require_once 'includes/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username']);
    $ip = $_SERVER['REMOTE_ADDR'];
    $user_agent = $_SERVER['HTTP_USER_AGENT'];

    if (!empty($username)) {
        // Check if user already exists
        $stmt = $pdo->prepare("SELECT id FROM users WHERE username = ?");
        $stmt->execute([$username]);
        $user = $stmt->fetch();

        if ($user) {
            // Update existing user's login info
            $stmt = $pdo->prepare("UPDATE users SET ip_address = ?, user_agent = ?, last_login = NOW() WHERE id = ?");
            $stmt->execute([$ip, $user_agent, $user['id']]);
            $_SESSION['user_id'] = $user['id'];
        } else {
            // Create new user
            $stmt = $pdo->prepare("INSERT INTO users (username, ip_address, user_agent, last_login) VALUES (?, ?, ?, NOW())");
            $stmt->execute([$username, $ip, $user_agent]);
            $_SESSION['user_id'] = $pdo->lastInsertId();
        }

        // Redirect to home
        header("Location: home.php");
        exit;
    } else {
        $error = "Username is required!";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login - Imposter Game</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <div class="card">
        <?php if (!empty($error)) echo "<p style='color:red;'>$error</p>"; ?>
        <h2>Enter your username</h2>
        <form method="POST">
            <input name="username" required placeholder="e.g. YuviTheLegend">
            <button type="submit">Enter</button>
        </form>
    </div>
</body>
</html>
