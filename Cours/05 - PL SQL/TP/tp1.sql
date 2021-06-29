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
etat char(5),
constraint pk_exemplaires primary key(isbn, numero),
constraint fk_exemplaires_ouvrages foreign key(isbn) references ouvrages(isbn),
constraint ck_exemplaires_etat check (etat in('NE','BO','MO','MA')) );


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
