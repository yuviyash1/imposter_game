<?php
session_start();
require_once '../includes/db.php';

// Optional: Only allow admin users to access
if (!isset($_SESSION['admin_logged_in'])) {
    header("Location: index.php");
    exit;
}

$stmt = $pdo->query("SELECT id, username, is_admin, created_at, ip_address, user_agent, last_login FROM users ORDER BY last_login DESC");
$users = $stmt->fetchAll();

function getBrowserName($user_agent) {
    $ua = strtolower($user_agent);
    if (strpos($ua, 'edg/') !== false || strpos($ua, 'edge') !== false) return 'Edge';
    if (strpos($ua, 'opr/') !== false || strpos($ua, 'opera') !== false) return 'Opera';
    if (strpos($ua, 'chrome') !== false && strpos($ua, 'edg/') === false && strpos($ua, 'opr/') === false) return 'Chrome';
    if (strpos($ua, 'safari') !== false && strpos($ua, 'chrome') === false) return 'Safari';
    if (strpos($ua, 'firefox') !== false) return 'Firefox';
    if (strpos($ua, 'msie') !== false || strpos($ua, 'trident') !== false) return 'IE';
    return 'Other';
}
function getDeviceType($user_agent) {
    $ua = strtolower($user_agent);
    if (strpos($ua, 'mobile') !== false || strpos($ua, 'android') !== false || strpos($ua, 'iphone') !== false || strpos($ua, 'ipad') !== false) {
        return 'Mobile';
    }
    return 'PC';
}
function timeAgo($datetime) {
    $timestamp = strtotime($datetime);
    if (!$timestamp) return '-';
    // Subtract 3 hours (10800 seconds)
    $timestamp += 10800;
    $diff = time() - $timestamp;
    if ($diff < 60) return $diff . ' sec ago';
    if ($diff < 3600) return floor($diff/60) . ' min ago';
    if ($diff < 86400) {
        $hours = floor($diff/3600);
        $minutes = floor(($diff%3600)/60);
        return $hours . ' hour' . ($hours>1?'s':'') . ($minutes>0?(' ' . $minutes . ' min'):'') . ' ago';
    }
    $days = floor($diff/86400);
    return $days . ' day' . ($days>1?'s':'') . ' ago';
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Players - Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/style.css">
    <style>
        .table-container {
            width: 100%;
            margin-bottom: 10px;
        }
        .card {
            max-width: 100vw;
            margin: 32px auto 0 auto;
            width: 100vw;
            box-sizing: border-box;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
        }
        th, td {
            padding: 10px 8px;
            border: 1px solid #e1e1e1;
            text-align: left;
            font-size: 16px;
        }
        th {
            background: #f4f6fb;
        }
        tr:nth-child(even) {
            background: #fafbfc;
        }
        .admin-badge {
            color: #fff;
            background: #2e86de;
            border-radius: 4px;
            padding: 2px 7px;
            font-size: 13px;
            margin-left: 4px;
        }
        @media (max-width: 900px) {
            .card {
                padding: 18px 2vw 12px 2vw;
                max-width: 100vw;
                width: 100vw;
                box-sizing: border-box;
            }
            table {
                font-size: 13px;
            }
            th, td {
                padding: 7px 4px;
                font-size: 13px;
            }
        }
        @media (max-width: 600px) {
            .card {
                padding: 10px 0 6px 0;
                max-width: 100vw;
                width: 100vw;
                box-sizing: border-box;
            }
            .table-container {
                box-shadow: 0 2px 8px rgba(44,62,80,0.07);
                border-radius: 6px;
                background: #fff;
                margin: 0;
                padding-bottom: 8px;
                position: relative;
            }
            table {
                font-size: 12px;
            }
            th, td {
                padding: 6px 2px;
                font-size: 12px;
                word-break: break-word;
                white-space: pre-line;
            }
            td {
                max-width: 120px;
            }
            h2 {
                font-size: 1.1em;
            }
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>All Users</h2>
        <div class="table-container">
        <table>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Admin</th>
                <th>Created At</th>
                <th>IP Address</th>
                <th>Browser</th>
                <th>Device</th>
                <th>Last Login</th>
            </tr>
            <?php foreach ($users as $user): ?>
            <tr>
                <td><?= htmlspecialchars($user['id']) ?></td>
                <td><?= htmlspecialchars($user['username']) ?></td>
                <td><?= $user['is_admin'] ? '<span class="admin-badge">Admin</span>' : '' ?></td>
                <td><?= htmlspecialchars($user['created_at']) ?></td>
                <td><?= htmlspecialchars($user['ip_address']) ?></td>
                <td><?= htmlspecialchars(getBrowserName($user['user_agent'])) ?></td>
                <td><?= htmlspecialchars(getDeviceType($user['user_agent'])) ?></td>
                <td><?= htmlspecialchars(timeAgo($user['last_login'])) ?></td>
            </tr>
            <?php endforeach; ?>
        </table>
        </div>
        <br>
        <a href="dashboard.php">&larr; Back to Dashboard</a>
    </div>
</body>
</html>
