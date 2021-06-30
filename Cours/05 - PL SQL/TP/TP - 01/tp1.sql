
-- 1.1 et 1.2

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

-- 1.3
CREATE SEQUENCE sq_membres;

-- 1.4
ALTER TABLE membres ADD CONSTRAINT un_membres_nompretel UNIQUE(nom, prenom, telephone);

-- 1.5
ALTER TABLE membres ADD portable CHAR(10) NULL;
ALTER TABLE membres ADD CONSTRAINT ck_membres_portable CHECK(portable LIKE '06%' OR portable LIKE '07%');

-- 1.6
ALTER TABLE membres DROP CONSTRAINT un_membres_nompretel;
--ALTER TABLE membres SET UNUSED(telephone);
ALTER TABLE membres ADD CONSTRAINT un_membres_nompretel UNIQUE(nom, prenom, portable);
-- dans la nuit
--ALTER TABLE membres DROP UNUSED COLUMNS;

-- 1.7
CREATE INDEX in_ouvrages_codeGenre ON Ouvrages(codeGenre);
CREATE INDEX in_details_isbnNumExempl ON DetailsEmprunts(isbn, numExempl);
CREATE INDEX in_emprunts_numMembre ON Emprunts(NumMembre);

-- 1.8
ALTER TABLE DetailsEmprunts DROP CONSTRAINT fk_details_emprunts;
ALTER TABLE DetailsEmprunts ADD CONSTRAINT fk_details_emprunts
FOREIGN KEY(numEmprunt) REFERENCES emprunts(numEmprunt) ON DELETE CASCADE;

-- 1.9
ALTER TABLE exemplaires MODIFY etat CHAR(2) DEFAULT 'NE';

-- 1.10
CREATE SYNONYM abonnes FOR membres;

-- 1.11
RENAME DetailsEmprunts TO Details;




-- 1.3 Création d'une séquence
CREATE SEQUENCE sq_membre START WITH 1 INCREMENT BY 1;
-- 1.4 Ajout de contraintes d'intégrité
alter table membres add constraint uq_membres unique (nom, prenom, telephone);
-- 1.5 Modification de table : ajout d'une colonne
alter table membres add mobile char(10);
alter table membres add constraint ck_membres_mobile check (mobile like '06%' or mobile like '07%');
-- 1.6 Suppression d'une colonne
alter table membres drop constraint uq_membres;
--alter table membres set unused (telephone);
--alter table membres drop unused columns;
alter table membres add constraint uq_membres unique (nom, prenom, mobile);
-- 1.7 Création d'un index
create index idx_ouvrages_codeGenre on ouvrages(codeGenre);
create index idx_emplaires_isbn on exemplaires(isbn);
create index idx_emprunts_membre on emprunts(membre);
create index idx_details_emprunt on detailsemprunts(emprunt);
create index idx_details_exemplaire on detailsemprunts(isbn, exemplaire);
-- 1.8 Modification d'une contrainte d'intégrité
alter table detailsemprunts drop constraint fk_details_emprunts;
alter table detailsemprunts add constraint fk_details_emprunts foreign key(emprunt)references emprunts(numero) on delete cascade;
-- 1.9 Attribution d'une valeur par défaut à une colonne 
alter table exemplaires modify (etat char(2) default 'NE');
-- 1.11
rename detailsemprunts to details;

/*2.1 Insertions*/
DELETE FROM Emprunts;
DELETE FROM Membres;
DELETE FROM Exemplaires;
DELETE FROM Ouvrages;
DELETE FROM Genres;

INSERT INTO genres VALUES('REC', 'Récit');
INSERT INTO genres VALUES('POL', 'Policier');
INSERT INTO genres VALUES('BD', 'Bande Dessinée');
INSERT INTO genres VALUES('INF', 'Informatique');
INSERT INTO genres VALUES('THE', 'Théatre');
INSERT INTO genres VALUES('ROM', 'Roman');

INSERT INTO Ouvrages VALUES(2203314168,'LEFRANC-L''utimatum','Martin, Carin','BD','Casterman');
INSERT INTO Ouvrages VALUES(2746021285,'HTML entraînez-vous pour maîtriser le code source','Luc Van Lancker','INF','ENI');
INSERT INTO Ouvrages VALUES(2746026090,'Oracle 10g SQL, PL/SQL, SQL*Plus','J. Gabillaud','INF','ENI');
INSERT INTO Ouvrages VALUES(2266085816,'Pantagruel','François Rabelais','ROM','POCKET');
INSERT INTO OUVRAGES VALUES(2266091611,'Voyage au centre de la terre','Jules Verne','ROM','POCKET');
INSERT INTO OUVRAGES VALUES(2253010219,'Le crime de l''orient express','Agatha Christie','POL','Livre de poche');
INSERT INTO OUVRAGES VALUES(2070400816,'Le bourgeois gentilhomme','Molière','THE','Galimard');
INSERT INTO OUVRAGES VALUES(2070367177,'Le curé de tours','Honoré de Balzac','ROM','Galimard');
INSERT INTO OUVRAGES VALUES(2080720872,'Boule de suif','Guy de Maupassant','REC','Flamarion');
INSERT INTO OUVRAGES VALUES(2877065073,'La gloire de mon père','Marcel Pagnol','ROM','Fallois');
INSERT INTO OUVRAGES VALUES(2020549522,'L''aventure des manuscrits de la mer morte',null,'REC','Seuil');
INSERT INTO OUVRAGES VALUES(2253006327,'Vingt mille lieues sous les mers','Jules Verne','ROM','LGF');
INSERT INTO OUVRAGES VALUES(2038704015,'De la terre à la lune','Jules Verne','ROM','Larousse');

INSERT INTO exemplaires SELECT isbn, 1, 'BO' FROM ouvrages;
INSERT INTO exemplaires SELECT isbn, 2, 'MO' FROM ouvrages;
DELETE FROM exemplaires WHERE isbn = 2746021285 AND numExempl = 2;
UPDATE exemplaires SET etat='MO' WHERE isbn = 2203314168 AND numExempl = 1;
UPDATE exemplaires SET etat='NE' WHERE isbn = 2203314168 AND numExempl = 2;
INSERT INTO exemplaires VALUES(2203314168, 3, 'NE');

/* 2.2 */
DROP SEQUENCE sq_membres;
CREATE SEQUENCE sq_membres;

INSERT INTO membres VALUES(sq_membres.NEXTVAL, 'ALBERT', 'Anne', '13 rue des Alpes', SYSDATE-60, 1, '0601020304');
INSERT INTO membres VALUES(sq_membres.NEXTVAL, 'BERNARD', 'Barnabé', '6 rue des bécasses', SYSDATE-10, 3, '0602030105');
INSERT INTO membres VALUES(sq_membres.NEXTVAL, 'CUVARD', 'Camille', '52 rue des cerisiers', SYSDATE-100, 6, '0602010509');
INSERT INTO membres VALUES(sq_membres.NEXTVAL, 'DUPOND', 'Daniel', '11 rue des daims', SYSDATE-250, 12, '0610236515');
INSERT INTO membres VALUES(sq_membres.NEXTVAL, 'EVROUX', 'Eglantine', '34 rue des elfes', SYSDATE-150, 6, '0658963125');
INSERT INTO membres VALUES(sq_membres.NEXTVAL, 'FREGEON', 'Fernand', '11 rue des Francs', SYSDATE-400, 6, '0602036987');
INSERT INTO membres VALUES(sq_membres.NEXTVAL, 'GORIT', 'Gaston', '96 rue de la glacerie', SYSDATE-150, 1, '0684235781');
INSERT INTO membres VALUES(sq_membres.NEXTVAL, 'HEVRARD', 'Hector', '12 rue haute', SYSDATE-250, 12, '0608546578');
INSERT INTO membres VALUES(sq_membres.NEXTVAL, 'INGRAND', 'Irène', '54 rue de iris', SYSDATE-50, 12, '0605020409');
INSERT INTO membres VALUES(sq_membres.NEXTVAL, 'JUSTE', 'Julien', '5 place des Jaccobins', SYSDATE-100, 6, '0603069876');

/* 2.3 */
insert into emprunts(numero, membre, creele) values(1,1,sysdate-200);
insert into emprunts(numero, membre, creele) values(2,3,sysdate-190);
insert into emprunts(numero, membre, creele) values(3,4,sysdate-180);
insert into emprunts(numero, membre, creele) values(4,1,sysdate-170);
insert into emprunts(numero, membre, creele) values(5,5,sysdate-160);
insert into emprunts(numero, membre, creele) values(6,2,sysdate-150);
insert into emprunts(numero, membre, creele) values(7,4,sysdate-140);
insert into emprunts(numero, membre, creele) values(8,1,sysdate-130);
insert into emprunts(numero, membre, creele) values(9,9,sysdate-120);
insert into emprunts(numero, membre, creele) values(10,6,sysdate-110);
insert into emprunts(numero, membre, creele) values(11,1,sysdate-100);
insert into emprunts(numero, membre, creele) values(12,6,sysdate-90);
insert into emprunts(numero, membre, creele) values(13,2,sysdate-80);
insert into emprunts(numero, membre, creele) values(14,4,sysdate-70);
insert into emprunts(numero, membre, creele) values(15,1,sysdate-60);
insert into emprunts(numero, membre, creele) values(16,3,sysdate-50);
insert into emprunts(numero, membre, creele) values(17,1,sysdate-40);
insert into emprunts(numero, membre, creele) values(18,5,sysdate-30);
insert into emprunts(numero, membre, creele) values(19,4,sysdate-20);
insert into emprunts(numero, membre, creele) values(20,1,sysdate-10);

insert into details(emprunt, numero, isbn, exemplaire, rendule) values(1,1,2038704015,1,sysdate-195);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(1,2,2070367177,2,sysdate-190);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(2,1,2080720872,1,sysdate-180);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(2,2,2203314168,1,sysdate-179);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(3,1,2038704015,1,sysdate-170);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(4,1,2203314168,2,sysdate-155);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(4,2,2080720872,1,sysdate-155);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(4,3,2266085816,1,sysdate-159);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(5,1,2038704015,1,sysdate-140);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(6,1,2266085816,2,sysdate-141);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(6,2,2080720872,2,sysdate-130);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(6,3,2746021285,1,sysdate-133);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(7,1,2070367177,2,sysdate-100);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(8,1,2080720872,1,sysdate-116);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(9,1,2038704015,1,sysdate-100);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(10,1,2080720872,2,sysdate-107);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(10,2,2746026090,1,sysdate-78);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(11,1,2746021285,1,sysdate-81);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(12,1,2203314168,1,sysdate-86);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(12,2,2038704015,1,sysdate-60);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(13,1,2070367177,1,sysdate-65);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(14,1,2266091611,1,sysdate-66);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(15,1,2070400816,1,sysdate-50);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(16,1,2253010219,2,sysdate-41);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(16,2,2070367177,2,sysdate-41);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(17,1,2877065073,2,sysdate-36);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(18,1,2070367177,1,sysdate-14);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(19,1,2746026090,1,sysdate-12);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(20,1,2266091611,1,default);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(20,2,2253010219,1,default);

Insert into ouvrages (isbn, titre, auteur, codeGenre, editeur) values (2080703234, 'Cinq semaines en ballon', 'Jules Verne', 'ROM', 'Flammarion');



/* 2.4 */
SELECT * FROM membres;
SELECT * FROM exemplaires;
SELECT * FROM ouvrages;
SELECT * FROM emprunts;
SELECT * FROM details;
SELECT * FROM genres;

/* 2.5 */
ALTER TABLE Membres ENABLE ROW MOVEMENT;
ALTER TABLE Details ENABLE ROW MOVEMENT;

/* 2.6 */
ALTER TABLE Emprunts ADD etat CHAR(2) DEFAULT 'EC'
  CONSTRAINT ck_emprunts_etat CHECK(etat IN('EC','RE'));
-- maj des données à 'RE'
UPDATE Emprunts SET etat='RE';
-- maj conditionnelle à 'EC'
UPDATE Emprunts SET etat='EC'
WHERE numEmprunt IN (SELECT numEmprunt FROM Details WHERE dateRetour IS NULL);

/* 2.8 Suppresion de lignes */

SELECT * FROM EXEMPLAIRES WHERE etat='MA';

DELETE FROM EXEMPLAIRES WHERE etat='MA';

-- Ajout d'un enregistrement dans la table Exemplaires dont l'etat est 'MA'

INSERT INTO EXEMPLAIRES VALUES ('2203314168', '4', 'MA');

/* 2.9 */
SELECT isbn, titre, COALESCE(auteur, '-') auteur, codeGenre, editeur
FROM ouvrages;

/* 2.10 */
SELECT numMembre, nom, prenom, adresse, dateAdhesion, duree, titre
FROM membres
NATURAL JOIN emprunts
NATURAL JOIN details
NATURAL JOIN ouvrages
WHERE dateDepart < SYSDATE - 14 AND dateRetour IS NULL;

/* 2.11 */
SELECT codeGenre, COUNT(*) nombre
FROM Ouvrages
GROUP BY codeGenre;

/* 2.12 */
SELECT AVG(dateRetour - dateDepart) dureeMoyenne
FROM emprunts
NATURAL JOIN details
WHERE dateRetour IS NOT NULL;

/* 2.13 */
SELECT codeGenre, AVG(dateRetour - dateDepart) dureeMoyenne
FROM emprunts
NATURAL JOIN details
NATURAL JOIN ouvrages
WHERE dateRetour IS NOT NULL
GROUP BY codeGenre;

/* 2.14 */
SELECT titre, COUNT(*) nbEmprunts
FROM details NATURAL JOIN ouvrages
WHERE renduLe IS NULL OR renduLe > ADD_MONTHS(SYSDATE, -12)
GROUP BY isbn, titre
HAVING COUNT(*) > 10;

/* 2.15 */
SELECT o.*, COALESCE(numero, 0) exemplaire
FROM Ouvrages o LEFT OUTER JOIN exemplaires e ON e.isbn = o.isbn
ORDER BY o.isbn, e.numero;

/* 2.16 */
CREATE OR REPLACE VIEW vueNbEmpruntsParMembre AS (
  SELECT m.numero, nom, prenom, COUNT(*) nbEmpruntsEnCours
  FROM membres m
  INNER JOIN emprunts e ON m.numero = e.membre
  INNER JOIN details d ON e.numero = d.emprunt
  WHERE renduLe IS NULL
  GROUP BY nom, prenom, m.numero
);
-- test de la vue
SELECT * FROM vueNbEmpruntsParMembre;

/* 2.17 */
CREATE OR REPLACE VIEW vueNbEmpruntsParOuvrages AS (
  SELECT isbn, COUNT(*) nbEmprunts
  FROM details NATURAL JOIN ouvrages
  GROUP BY isbn
);
-- verif de la creation de la vue
SELECT * FROM vueNbEmpruntsParOuvrages;

/* 2.18 */
SELECT * FROM Membres
ORDER BY nom, prenom;