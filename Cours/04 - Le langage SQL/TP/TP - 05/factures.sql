CREATE DATABASE facture ;
GO 
USE facture;

CREATE TABLE client (
  id int CONSTRAINT pk_client PRIMARY KEY,
  name varchar(50) NOT NULL
  
) ;

INSERT INTO client VALUES (1, 'Mairie de Rennes');
INSERT INTO client VALUES (2, 'Neo Soft');
INSERT INTO client VALUES (3, 'Sopra');
INSERT INTO client VALUES (4, 'Accenture');
INSERT INTO client VALUES (5, 'Amazon');




CREATE TABLE project (
  id int CONSTRAINT pk_prj PRIMARY KEY,
  name varchar(50) NOT NULL,
  client_id int NOT NULL CONSTRAINT fk_client FOREIGN KEY REFERENCES client(id)
);


INSERT INTO project VALUES (1, 'Creation de site internet', 1);
INSERT INTO project VALUES(2, 'Logiciel CRM', 2);
INSERT INTO project VALUES(3, 'Logiciel de devis', 3);
INSERT INTO project VALUES(4, 'Site internet ecommerce', 4);
INSERT INTO project VALUES(5, 'logiciel ERP', 2);
INSERT INTO project VALUES(6, 'logiciel Gestion de Stock', 5);

--


CREATE TABLE quote (
  id int CONSTRAINT pk_quote PRIMARY KEY,
  title varchar(50) NOT NULL,
  num varchar(10) NOT NULL,
  version tinyint NOT NULL,
  total float,
  project_id int NOT NULL CONSTRAINT fk_prj FOREIGN KEY REFERENCES project(id)
);
INSERT INTO quote VALUES (1, 'Creation de site internet', 'DEV2100A', 1, 3000, 1);
INSERT INTO quote VALUES (2, 'Creation de site internet', 'DEV2100B', 2, 5000, 1);
INSERT INTO quote VALUES (3, 'Logiciel CRM', 'DEV2100C', 1, 5000, 2);
INSERT INTO quote VALUES (4, 'Logiciel de devis', 'DEV2100D', 1, 3000, 3);
INSERT INTO quote VALUES (5, 'Site internet ecommerce', 'DEV2100E', 1, 5000, 4);
INSERT INTO quote VALUES (6, 'logiciel ERP', 'DEV2100F', 1, 2000, 5);
INSERT INTO quote VALUES (7, 'logiciel Gestion de Stock', 'DEV2100G', 1, 10000, 6);

--

CREATE TABLE invoice (
  id int CONSTRAINT pk_inv PRIMARY KEY,
  title varchar(50) NOT NULL,
  num varchar(10)NOT NULL,
  inv_date date NOT NULL,
  payment date  NULL,
  total float NOT NULL,
  quote_id int  NOT NULL CONSTRAINT fk_quote FOREIGN KEY REFERENCES quote(id)
);



INSERT INTO invoice VALUES (1, 'Site internet partie 1', 'FA001', '2021-01-01', '2021-01-10', 1500, 1);
INSERT INTO invoice VALUES  (2, 'Site internet partie 2', 'FA002', '2021-02-01', NULL, 1500, 1);
INSERT INTO invoice VALUES  (3, 'Logiciel CRM', 'FA003', '2021-02-03', NULL, 5000, 3);
INSERT INTO invoice VALUES  (4, 'Logiciel devis', 'FA004', '2021-03-03', '2021-03-04', 3000, 4);
INSERT INTO invoice VALUES  (5, 'Site internet ecommerce', 'FA005', '2021-05-21', NULL, 5000, 5);
INSERT INTO invoice VALUES  (6, 'logiciel ERP', 'FA006', '2021-06-02', NULL, 2000, 6);

