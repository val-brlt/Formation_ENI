--CREATE DATABASE BDD_TP_LOCATION

CREATE TABLE CLIENTS  (
	NoCli int IDENTITY(1,1) CONSTRAINT pk_Clients PRIMARY KEY		not null,
	nom varchar(30)													not null,
	prenom varchar(30)												null,
	adresse varchar(120)											null,
	cpo char(5)														not null,
	ville varchar(80)												not null
	);

	INSERT INTO  CLIENTS(ville) VALUES ('Nantes'); 

CREATE TABLE FICHES  (
	NoFic int IDENTITY(1,1) CONSTRAINT pk_Fiches PRIMARY KEY	not null,
	noCli int													not null,
	dateCrea DATE												not null,
	datePaye DATE												null,
	etat char(2)												not null
	);

	INSERT INTO  FICHES(etat,dateCrea) VALUES ('EC', '2021-06-21'); 


SELECT * FROM FICHES;
SELECT * FROM CLIENTS;
