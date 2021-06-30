CREATE DATABASE BDD_TP
GO

-- 1.2 Mise en place des tables

create table genres(
code char(5) constraint pk_genres primary key,
libelle varchar2(80) not null);

create table ouvrages(
isbn number(10) constraint pk_ouvrages primary key,
titre varchar2(200)not null,
auteur varchar2(80),
genre char(5) not null constraint fk_ouvrages_genres references genres(code),
editeur varchar2(80));


create table exemplaires(
isbn number(10),
numero number(3),
etat char(2),
constraint pk_exemplaires primary key(isbn, numero),
constraint fk_exemplaires_ouvrages foreign key(isbn) references ouvrages(isbn),
constraint ck_exemplaires_etat check (etat in('NE','BO','MO','MA', 'RE')) );


create table membres(
numero number(6) constraint pk_membres primary key,
nom varchar2(80) not null,
prenom varchar2(80) not null,
adresse varchar2(200) not null,
telephone char(10) not null,
adhesion date not null,
duree number(2) not null,
constraint ck_membres_duree check (duree>=0));


create table emprunts(
numero number(10) constraint pk_emprunts primary key,
membre number(6) constraint fk_emprunts_membres references membres(numero),
creele date default sysdate
);


create table detailsemprunts(
emprunt number(10) constraint fk_details_emprunts references emprunts(numero),
numero number(3),
isbn number(10),
exemplaire number(3),
rendule date,
constraint pk_detailsemprunts primary key (emprunt, numero),
constraint fk_detailsemprunts_exemplaires foreign key(isbn, exemplaire) references exemplaires(isbn, numero)
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
-- 1.11
rename detailsemprunts to details;



-- 2.1 Ajout d'informations dans une table

insert into genres values ('REC', 'récit');
insert into genres values ('POL', 'policier');
insert into genres values ('BD', 'Bande Dessinée');
insert into genres values ('INF', 'Informatique');
insert into genres values ('THE', 'Théâtre');
insert into genres values ('ROM', 'Roman');
insert into ouvrages values (2203314168,'LEFRANC-L''ultimatum', 'Martin, Carin', 'BD', 'Casterman');
insert into ouvrages values (2746021285,'HTML entraînez-vous pour maitriser le code source', 'Luc Van Lancker', 'INF', 'ENI');
insert into ouvrages values (2266085816,'ORACLE 12cSQL, PL/SQL, SQL*plis', 'J.Gabillaud', 'INF', 'ENI');
insert into ouvrages values (2746026090,'Pantagruel', 'François Rabelais', 'ROM', 'POCKET');
insert into ouvrages values (2266091611,'Voyage au centre de la terre', 'Jules Vernes', 'ROM', 'POCKET');
insert into ouvrages values (2253010219,'Le crime de l''Orient Express', 'Agatha Cristie', 'POL', 'Livre De Poche');
insert into ouvrages values (2070400816,'Le Bourgeois Gentilhomme', 'Molière', 'THE', 'Gallimard');
insert into ouvrages values (2070367177,'Le curé de Tours', 'Honoré de Balzac', 'ROM', 'Gallimard');
insert into ouvrages values (2080720872,'Boule de suif','Guy de Maupassant', 'REC', 'Flammarion');
insert into ouvrages values (2877065073,'La Gloire de mon père','Marcel Pagnol','ROM','Fallois');
insert into ouvrages values (2020549522,'L''aventure des manuscrits de la mer morte', NULL, 'REC', 'Seuil');
insert into ouvrages values (2253006327,'Vingt mille lieues sous les mers', 'Jules Vernes', 'ROM', 'LGF');
insert into ouvrages values (2038704015,'De la terre à la lune', 'Jules vernes', 'ROM', 'Larousse');
insert into exemplaires values (2203314168,1,'MO');
insert into exemplaires values (2203314168,2,'BO');
insert into exemplaires values (2203314168,3,'NE');
insert into exemplaires values (2746021285,1,'BO');
insert into exemplaires values (2746026090,1,'BO');
insert into exemplaires values (2746026090,2,'MO');
insert into exemplaires values (2266091611,1,'BO');
insert into exemplaires values (2266091611,2,'MO');
insert into exemplaires values (2253010219,1,'BO');
insert into exemplaires values (2253010219,2,'MO');
insert into exemplaires values (2070400816,1,'BO');
insert into exemplaires values (2070400816,2,'MO');
insert into exemplaires values (2070367177,1,'BO');
insert into exemplaires values (2070367177,2,'MO');
insert into exemplaires values (2080720872,1,'BO');
insert into exemplaires values (2080720872,2,'MO');
insert into exemplaires values (2877065073,1,'BO');
insert into exemplaires values (2877065073,2,'MO');
insert into exemplaires values (2020549522,1,'BO');
insert into exemplaires values (2020549522,2,'MO');
insert into exemplaires values (2253006327,1,'BO');
insert into exemplaires values (2253006327,2,'MO');
insert into exemplaires values (2038704015,1,'BO');
insert into exemplaires values (2038704015,2,'MO');

-- 2.2 Utilisation d'une séquence
INSERT INTO membres VALUES (sq_membre.nextvalue, 'ALBERT','Anne','13 rue des alpes', '0601020304', sysdate-60, 1);
INSERT INTO membres VALUES (sq_membre.nextvalue, 'BERNAUD','Barnabé','6 rue des bécasses', '0601020305', sysdate-10, 3);
INSERT INTO membres VALUES (sq_membre.nextvalue, 'CUVARD','Camille','52 rue des cerisiers', '0601020306', sysdate-100, 6);
INSERT INTO membres VALUES (sq_membre.nextvalue, 'DUPOND','Daniel','11 rue des daoùs', '0601020307', sysdate-250, 12);
INSERT INTO membres VALUES (sq_membre.nextvalue, 'EVROUX','Eglantine','34 rue des elfes', '0601020308', sysdate-150, 6);
INSERT INTO membres VALUES (sq_membre.nextvalue, 'FREGEON','Fernand','11 rue des Francs', '0601020309', sysdate-400, 6);
INSERT INTO membres VALUES (sq_membre.nextvalue, 'GORIT','Gaston','96 rue de la glacerie', '0601020310', sysdate-150, 1);
INSERT INTO membres VALUES (sq_membre.nextvalue, 'HEVARD','Hector','12 rue haute', '0601020311', sysdate-250, 12);
INSERT INTO membres VALUES (sq_membre.nextvalue, 'INGRAND','Irène','54 rue de iris', '0601020312', sysdate-50, 12);
INSERT INTO membres VALUES (sq_membre.nextvalue, 'JUSTE','Julien','5 place des jacobins', '0601020313', sysdate-100, 6);

-- 2.3 Exécution d'un script
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

Insert into ouvrages (isbn, titre, auteur, genre, editeur) values (2080703234, 'Cinq semaines en ballon', 'Jules Verne', 'ROM', 'Flammarion');


-- 2.4 Extraction simple d'informations

SELECT * FROM genres;
SELECT * FROM ouvrages;
SELECT * FROM exemplaires;
SELECT * FROM emprunts;
SELECT * FROM details;
SELECT * FROM membres;

-- 2.5 Activation de l'historique des mouvements
ALTER TABLE membres ENABLE ROW MOVEMENT;
ALTER TABLE details ENABLE ROW MOVEMENT;

-- 2.6 Ajout d'une colonne

ALTER TABLE emprunts ADD (etat char(2) DEFAULT 'EC');
ALTER TABLE emprunts ADD CONSTRAINT ck_etat_rendu CHECK (etat IN ('EC', 'RE'));

UPDATE emprunts
SET etat = 'RE'
WHERE etat = 'EC' AND  numero not in (select emprunt from details where rendule is null);
 
