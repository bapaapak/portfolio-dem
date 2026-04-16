<?php

$dbHost = getenv('DB_HOST');
$dbPort = getenv('DB_PORT') ?: '3306';
$dbName = getenv('DB_DATABASE');
$dbUser = getenv('DB_USERNAME');
$dbPass = getenv('DB_PASSWORD');
$sqlFile = $argv[1] ?? __DIR__ . '/ssotoght_portfolio_db.sql';

if (!$dbHost || !$dbName || !$dbUser) {
    fwrite(STDERR, "Missing DB env vars.\n");
    exit(1);
}

if (!is_file($sqlFile)) {
    fwrite(STDERR, "SQL file not found: {$sqlFile}\n");
    exit(1);
}

$dsn = "mysql:host={$dbHost};port={$dbPort};dbname={$dbName};charset=utf8mb4";
$pdo = new PDO($dsn, $dbUser, $dbPass, [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => true,
]);

$handle = fopen($sqlFile, 'r');
if (!$handle) {
    fwrite(STDERR, "Cannot open SQL file.\n");
    exit(1);
}

$statement = '';
$count = 0;

while (($line = fgets($handle)) !== false) {
    $trimmed = trim($line);

    if ($trimmed === '' || str_starts_with($trimmed, '--') || str_starts_with($trimmed, '/*') || str_starts_with($trimmed, '/*!')) {
        continue;
    }

    $statement .= $line;

    if (str_ends_with($trimmed, ';')) {
        $sql = trim($statement);
        $statement = '';

        if ($sql !== '') {
            $pdo->exec($sql);
            $count++;
            if ($count % 100 === 0) {
                echo "Imported {$count} statements\n";
            }
        }
    }
}

if (trim($statement) !== '') {
    $pdo->exec($statement);
    $count++;
}

fclose($handle);

echo "Done. Imported {$count} statements.\n";
