-- Fichier : wv_index.sql
-- Objectif : Ajout de contraintes et améliorations sur le schéma initial du jeu "Les Loups"

-- ============================
-- CONTRAINTES D’INTÉGRITÉ
-- ============================

-- Exemple : empêcher les doublons dans les identifiants joueurs
ALTER TABLE Joueurs
ADD CONSTRAINT uq_identifiant UNIQUE (identifiant);

-- Exemple : relation entre Joueurs et Partie (FK)
ALTER TABLE Joueurs
ADD CONSTRAINT fk_joueurs_partie FOREIGN KEY (id_partie)
REFERENCES Partie(id_partie);

-- Exemple : relation entre Position et Joueur
ALTER TABLE Position
ADD CONSTRAINT fk_position_joueur FOREIGN KEY (id_joueur)
REFERENCES Joueurs(id_joueur);

-- ============================
-- VALIDATIONS MÉTIER
-- ============================

-- Interdire que deux entités soient sur la même case (position unique par case et tour)
ALTER TABLE Position
ADD CONSTRAINT uq_case_par_tour UNIQUE (x, y, id_tour);

-- Assurer qu’un joueur a un rôle défini
ALTER TABLE Joueurs
ADD CONSTRAINT chk_role_valide CHECK (role IN ('loup', 'villageois'));

-- ============================
-- AJUSTEMENTS DE TYPES
-- ============================

-- Exemple : étendre la longueur du champ 'identifiant'
ALTER TABLE Joueurs
ALTER COLUMN identifiant VARCHAR(100);

-- ============================
-- MISE EN FORME
-- ============================

-- Ajouter une date de création automatique à la partie
ALTER TABLE Partie
ADD date_creation DATETIME DEFAULT GETDATE();
