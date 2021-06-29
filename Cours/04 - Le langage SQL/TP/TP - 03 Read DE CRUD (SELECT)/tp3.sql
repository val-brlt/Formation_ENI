-- CREATION DATABASE
CREATE DATABASE BDD_TP_SELECT;
GO
USE BDD_TP_SELECT;
GO

-- CREATION TABLE 
CREATE TABLE crm_client (
	id INT CONSTRAINT pk_clients PRIMARY KEY,
	nom VARCHAR(100),
	tel INT,
	adress VARCHAR(100),
	ca INT,
	date DATE,
	actif INT
);



-- INSERER LES VALEURS
Insert into crm_client(id, nom, tel, adress, ca, date, actif) 
Values (1, 'Microsoft', '063456789', '15 rue de la Poste 44 100 Nantes', 5000, '02/11/2017', 1)
Insert into crm_client(id, nom, tel, adress, ca, date, actif) 
Values (2, 'google Inc.', '073456789', '8 rue de La gare 44 100 Nantes', 8000, '01/11/2017', 1)
Insert into crm_client(id, nom, tel, adress, ca, date, actif) 
Values (3, 'Accenture', '0123456789', '12 rue L''église 44 100 Nantes', 2000, '01/10/2017', 1)



-- afficher le plus gros chiffre d'affaire (avec MAX)
SELECT MAX(ca) FROM crm_client
-- afficher le plus petit chiffre d'affaire (avec MIN)
SELECT MIN(ca) FROM crm_client
-- afficher le nom du client du plus petit CA
SELECT nom FROM crm_client WHERE ca = (SELECT MIN(ca) FROM crm_client)
-- afficher le nom du client du plus gros CA
SELECT nom FROM crm_client WHERE ca = (SELECT MAX(ca) FROM crm_client)
-- afficher le CA moyen
SELECT AVG(ca) FROM crm_client
-- afficher le nombre de client
SELECT COUNT(nom) FROM crm_client
-- proposer une requete avec BETWEEN
SELECT * FROM crm_client
WHERE ca BETWEEN 4000 AND  9000
-- proposer une requete avec UCASE(),
SELECT UPPER(nom) FROM crm_client
-- LCASE(),
SELECT LOWER(nom) FROM crm_client



