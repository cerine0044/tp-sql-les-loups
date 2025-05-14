# 🐺 TP SQL – Les Loups (EPSI B3)

## 🎯 Objectif

Ce projet consiste à améliorer un schéma de base de données SQL Server pour un jeu multijoueur dans lequel les joueurs sont soit des loups, soit des villageois.

## 📁 Contenu du dépôt

| Fichier           | Description                                           |
|-------------------|-------------------------------------------------------|
| `wv_schema.sql`   | Schéma initial fourni                                |
| `wv_index.sql`    | Mes requêtes pour améliorer le schéma (clés, contraintes) |
| `README.md`       | Documentation du projet                              |

## 🛠 Instructions

1. Créer une base dans SQL Server.
2. Importer `wv_schema.sql`.
3. Exécuter `wv_index.sql` pour appliquer les améliorations.

## 🧠 Améliorations appliquées

- Clés primaires sur toutes les tables
- Clés étrangères entre joueurs, parties, rôles et tours
- Contrainte d’unicité sur les pseudos
- Validation du champ `is_alive` (`yes` ou `no`)
- Validation des rôles (`loup`, `villageois`)
- Ajout d’un champ `created_at` avec la date automatique sur `parties`

## 📝 Auteur

Cerine AZIZ – EPSI Paris B3
