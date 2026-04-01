<?php
try {
    $pdo = new PDO('mysql:host=127.0.0.1;port=3306;dbname=ssotoght_portfolio_db', 'ssotoght_user10', 'zahrowani19');
    echo "Database connection successful!";
} catch (Exception $e) {
    echo "Database connection failed: " . $e->getMessage();
}
?>