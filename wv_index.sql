-- ==========================================
-- Améliorations du schéma SQL – Les Loups
-- Cerine AZIZ – EPSI B3
-- ==========================================

-- AJOUT DES CLÉS PRIMAIRES

ALTER TABLE parties ADD CONSTRAINT pk_parties PRIMARY KEY (id_party);
ALTER TABLE roles ADD CONSTRAINT pk_roles PRIMARY KEY (id_role);
ALTER TABLE players ADD CONSTRAINT pk_players PRIMARY KEY (id_player);
ALTER TABLE turns ADD CONSTRAINT pk_turns PRIMARY KEY (id_turn);
ALTER TABLE players_in_parties ADD CONSTRAINT pk_players_in_parties PRIMARY KEY (id_party, id_player);
ALTER TABLE players_play ADD CONSTRAINT pk_players_play PRIMARY KEY (id_player, id_turn);

-- AJOUT DES CLÉS ÉTRANGÈRES


-- Table players_in_parties
ALTER TABLE players_in_parties
ADD CONSTRAINT fk_pip_party FOREIGN KEY (id_party) REFERENCES parties(id_party);

ALTER TABLE players_in_parties
ADD CONSTRAINT fk_pip_player FOREIGN KEY (id_player) REFERENCES players(id_player);

ALTER TABLE players_in_parties
ADD CONSTRAINT fk_pip_role FOREIGN KEY (id_role) REFERENCES roles(id_role);

-- Table turns
ALTER TABLE turns
ADD CONSTRAINT fk_turns_party FOREIGN KEY (id_party) REFERENCES parties(id_party);

-- Table players_play
ALTER TABLE players_play
ADD CONSTRAINT fk_pp_player FOREIGN KEY (id_player) REFERENCES players(id_player);

ALTER TABLE players_play
ADD CONSTRAINT fk_pp_turn FOREIGN KEY (id_turn) REFERENCES turns(id_turn);

-- CONTRAINTES D’UNICITÉ
ALTER TABLE players
ADD CONSTRAINT uq_players_pseudo UNIQUE (pseudo);

-- CONTRAINTES DE VALIDATION MÉTIER
ALTER TABLE players_in_parties
ADD CONSTRAINT chk_is_alive CHECK (is_alive IN ('yes', 'no'));

ALTER TABLE roles
ADD CONSTRAINT chk_roles_description CHECK (description_role IN ('loup', 'villageois'));


-- CHAMP DATE PAR DÉFAUT
ALTER TABLE parties
ADD created_at DATETIME DEFAULT GETDATE();
