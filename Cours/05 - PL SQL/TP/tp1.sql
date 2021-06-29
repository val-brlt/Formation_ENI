CREATE DATABASE BDD_TP
GO

-- 1.2 Mise en place des tables
 CREATE TABLE Membres(
numMembre     INT           CONSTRAINT pk_membres PRIMARY KEY,
nom           VARCHAR2(30)  NOT NULL,
prenom        VARCHAR2(30)  NOT NULL,
adresse       VARCHAR2(100) NOT NULL,
telephone     CHAR(10)      NOT NULL,
dateAdhesion  DATE          NOT NULL,
duree         INT           NOT NULL CONSTRAINT ck_membres_duree CHECK(duree IN(1, 3, 6, 12))
);

CREATE TABLE Genres(
codeGenre     CHAR(4)       CONSTRAINT pk_genres PRIMARY KEY,
libelle       VARCHAR2(30)  CONSTRAINT un_genres_libelle UNIQUE
);

CREATE TABLE Ouvrages(
isbn          CHAR(10)    CONSTRAINT pk_ouvrages PRIMARY KEY,
titre         VARCHAR2(120) NOT NULL,
auteur        VARCHAR2(50)  NULL,
codeGenre     CHAR(4)       NOT NULL CONSTRAINT fk_ouvrages_genres REFERENCES Genres(codeGenre),
editeur       VARCHAR2(30)  NULL
);

CREATE TABLE Exemplaires(
isbn          CHAR(10)      CONSTRAINT fk_exemplaires_ouvrages REFERENCES Ouvrages(isbn),
numExempl     INT,
etat          CHAR(2)       NOT NULL
                            CONSTRAINT ck_exemplaires_etat CHECK(etat IN('NE', 'BO', 'MO', 'MA', 'RE')),
CONSTRAINT pk_exemplaires PRIMARY KEY(isbn, numExempl)
);

CREATE TABLE Emprunts(
numEmprunt    INT           CONSTRAINT pk_emprunts PRIMARY KEY,
numMembre     INT           NOT NULL
                            CONSTRAINT fk_emprunts_membres REFERENCES membres(numMembre),
dateDepart    DATE          NOT NULL
);

ALTER TABLE Emprunts MODIFY dateDepart DATE DEFAULT SYSDATE;

CREATE TABLE DetailsEmprunts(
numEmprunt    INT           CONSTRAINT fk_details_emprunts REFERENCES emprunts(numEmprunt),
numLigne      INT,
isbn          CHAR(10)      NOT NULL,
numExempl     INT           NOT NULL,
dateRetour    DATE          NULL,
CONSTRAINT pk_details PRIMARY KEY(numEmprunt, numLigne),
CONSTRAINT fk_details_exemplaires FOREIGN KEY(isbn, numExempl) REFERENCES exemplaires(isbn, numExempl)
);

-- 1.3 Création d'une séquence
CREATE SEQUENCE sq_membre START WITH 1 INCREMENT BY 1;
-- 1.4 Ajout de contraintes d'intégrité
alter table membres add constraint uq_membres unique (nom, prenom, telephone);
-- 1.5 Modification de table : ajout d'une colonne
alter table membres add mobile char(10);
alter table membres add constraint ck_membres_mobile check (mobile like '06%' or mobile like '07%');
-- 1.6 Suppression d'une colonne
alter table membres drop constraint uq_membres;
alter table membres set unused (telephone);
alter table membres drop unused columns;
alter table membres add constraint uq_membres unique (nom, prenom, mobile);
-- 1.7 Création d'un index
create index idx_ouvrages_genre on ouvrages(genre);
create index idx_emplaires_isbn on exemplaires(isbn);
create index idx_emprunts_membre on emprunts(membre);
create index idx_details_emprunt on detailsemprunts(emprunt);
create index idx_details_exemplaire on detailsemprunts(isbn, exemplaire);
-- 1.8 Modification d'une contrainte d'intégrité
alter table detailsemprunts drop constraint fk_details_emprunts;
alter table detailsemprunts add constraint fk_details_emprunts foreign key(emprunt)references emprunts(numero) on delete cascade;
-- 1.9 Attribution d'une valeur par défaut à une colonne 
alter table exemplaires modify (etat char(2) default 'NE');

