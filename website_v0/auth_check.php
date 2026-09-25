<?php
require_once __DIR__ . '/../config.php';
session_start(); // Démarre la session

// Connexion à la base de données
$pdo = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME, DB_USER, DB_PASS);

// Vérifie si l'utilisateur est connecté
if (!isset($_SESSION['username'])) {
    header("Location: login.html"); // Redirige vers la page de connexion si non connecté
    exit(); // Quitte le script
}
?>
