# OWASP Top 10 (2021) – Vulnerable Web Lab

> 🇫🇷 Version française plus bas · 🇬🇧 English first

⚠️ **Warning — intentionally vulnerable application.** For education and local lab use only. Never deploy it on a public server.

## Overview
Final-year project (MSc Cybersecurity, 2024–2025). It is a small PHP/MySQL user-management app built in two versions, used to **demonstrate, exploit and remediate OWASP Top 10 (2021) vulnerabilities**:

| Folder | Purpose |
|---|---|
| `vulnerable_website/` | Deliberately insecure version (SQL injection, broken access control, plaintext passwords…) |
| `website_v0/` | Hardened version: prepared statements, output encoding, role checks, security headers |
| `database/schema.sql` | Demo database with fictitious users and a least-privilege app account |
| `PFE_Documents/` | Report, attack scenarios, progress meetings |

## Vulnerabilities covered
| OWASP 2021 | Scenario in the lab | Recommended mitigation |
|---|---|---|
| A01 Broken Access Control | Stored XSS + CSRF to escalate a user to admin | Server-side role checks, SameSite cookies, CSRF tokens |
| A02 Cryptographic Failures | Passwords stored in plaintext / weak hashing | `password_hash()` / `password_verify()` (bcrypt/argon2) |
| A03 Injection | `' UNION SELECT …` in the login form to dump `users` | Prepared statements (PDO / mysqli) |
| A05 Security Misconfiguration | Service enumeration (nmap), verbose errors | Hardening, generic error messages |
| A06 Vulnerable & Outdated Components | RCE via vulnerable SMB service | Patch management |
| A07 Identification & Authentication Failures | Brute force, username enumeration | Lockout, MFA, generic messages |
| A09 Logging & Monitoring Failures | Attacks go undetected | Security event logging |
| A10 SSRF | *(future scenario)* | URL allow-listing |

## Setup (local)
Requirements: PHP 8+, MySQL 8+ (or MAMP/XAMPP).
```bash
# 1. Database + least-privilege user (edit the password in the file first)
mysql -u root -p < database/schema.sql
# 2. Credentials (never committed)
cp config.example.php config.local.php   # then set DB_PASS
# 3. Run
php -S localhost:8000
# → http://localhost:8000/vulnerable_website/login.html
# → http://localhost:8000/website_v0/login.html
```
Test accounts (fictitious): `admin/admin`, `antoine/antoine`, `user1/pass1`.
Early commits contained lab-only credentials; they have been rotated and replaced by a least-privilege configuration.

## Tech stack
PHP · MySQL · HTML/CSS · nmap

---

# 🇫🇷 Labo web vulnérable – OWASP Top 10 (2021)

⚠️ **Application volontairement vulnérable.** Usage pédagogique en local uniquement, ne jamais la déployer sur un serveur public.

## Présentation
Projet de fin d'études (MS Cybersécurité, 2024–2025). Une petite application PHP/MySQL de gestion d'utilisateurs, développée en deux versions pour **démontrer, exploiter puis corriger les vulnérabilités du Top 10 OWASP 2021** :

- `vulnerable_website/` : version volontairement non sécurisée (injection SQL, contrôle d'accès défaillant, mots de passe en clair…)
- `website_v0/` : version durcie (requêtes préparées, encodage des sorties, contrôle des rôles, en-têtes de sécurité)
- `database/schema.sql` : base de démonstration avec utilisateurs fictifs et compte applicatif à privilèges minimaux
- `PFE_Documents/` : rapport, scénarios d'attaque, comptes rendus de réunion

Les vulnérabilités couvertes (A01, A02, A03, A05, A06, A07, A09, A10) et leurs corrections sont détaillées dans le tableau ci-dessus et dans le rapport.

## Installation
Voir la section *Setup* : importer `database/schema.sql`, copier `config.example.php` en `config.local.php` et y renseigner le mot de passe, puis lancer `php -S localhost:8000`.

## Auteure
Salma El Bougrini
