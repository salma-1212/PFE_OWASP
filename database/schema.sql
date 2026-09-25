-- Base de démonstration pour le labo OWASP (données fictives uniquement)
CREATE DATABASE IF NOT EXISTS `user_auth` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `user_auth`;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` enum('admin','user') DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Comptes de test volontairement faibles (mots de passe en clair = vulnérabilité démontrée : A02 Cryptographic Failures)
INSERT INTO `users` (username, email, password, role) VALUES
  ('admin',   'admin@lab.local',   'admin',   'admin'),
  ('antoine', 'antoine@lab.local', 'antoine', 'user'),
  ('user1',   'user1@lab.local',   'pass1',   'user');

-- Utilisateur applicatif à privilèges limités (à la place de root)
-- Remplacez le mot de passe puis reportez-le dans config.local.php
CREATE USER IF NOT EXISTS 'pfe_app'@'localhost' IDENTIFIED BY 'CHANGE_ME';
GRANT SELECT, INSERT, UPDATE, DELETE ON `user_auth`.* TO 'pfe_app'@'localhost';
FLUSH PRIVILEGES;
