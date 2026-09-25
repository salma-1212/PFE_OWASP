<?php
// Configuration centralisée de la connexion MySQL.
// Les identifiants réels sont dans config.local.php (ignoré par Git).
if (file_exists(__DIR__ . '/config.local.php')) {
    require_once __DIR__ . '/config.local.php';
}
defined('DB_HOST') || define('DB_HOST', getenv('DB_HOST') ?: 'localhost');
defined('DB_NAME') || define('DB_NAME', getenv('DB_NAME') ?: 'user_auth');
defined('DB_USER') || define('DB_USER', getenv('DB_USER') ?: 'pfe_app');
defined('DB_PASS') || define('DB_PASS', getenv('DB_PASS') ?: '');
