<?php
$host = 'sql205.infinityfree.com';
$db   = 'if0_36981424_test_domain';
$user = 'if0_36981424'; // Change if using InfinityFree
$pass = 'MBALmj66ZsJxyHS';     // Change for InfinityFree
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];
try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    die('DB Connection failed: ' . $e->getMessage());
}
?>
