
CREATE DATABASE BDD_TP_LOCATION;
GO
USE BDD_TP_LOCATION;
GO

CREATE TABLE clients (
  [noCli] NUMERIC(6)			not null,
  [nom] varchar(30)				not null,
  [prenom] varchar(30)			null,
  [adresse] varchar(120)		null,
  [cpo] char(5)					not null CONSTRAINT CK_cpo CHECK (convert(numeric(5),cpo) BETWEEN 1000 AND 95999),
  [ville] varchar(80)			not null CONSTRAINT DF_ville DEFAULT 'Nantes',
  CONSTRAINT pk_clients PRIMARY KEY (noCli)
);
GO

CREATE TABLE fiches (
  [noFic] NUMERIC(6)			not null,
  [noCli] NUMERIC(6)			not null,
  [dateCrea] datetime			not null CONSTRAINT DF_dateCrea DEFAULT getdate(),
  [datePaye] datetime			null ,
  [etat] CHAR(2)				not null CONSTRAINT DF_fiches_etat DEFAULT 'EC'
										CONSTRAINT CK_fiches_etat CHECK (etat IN('EC', 'RE', 'SO'))
   CONSTRAINT pk_fiches PRIMARY KEY (noFic),
   CONSTRAINT CK_datePaye CHECK (datePaye is null or datePaye > dateCrea ),
   CONSTRAINT CK_datePaye_etat CHECK ((datePaye IS NULL AND etat != 'SO') OR (datePaye IS NOT NULL AND etat = 'SO'))
);
GO

CREATE TABLE gammes (
  codeGam char(5)				not null,
  [libelle] varchar(30)			not null ,
  CONSTRAINT pk_gammes PRIMARY KEY (codeGam),
  CONSTRAINT uq_lib_gam UNIQUE (libelle)

);
GO

CREATE TABLE categories (
  codeCate char(5)				not null,
  [libelle] varchar(30)			not null,
  CONSTRAINT pk_cate PRIMARY KEY (codeCate),
 CONSTRAINT uq_lib_cat UNIQUE (libelle)
);
GO

CREATE TABLE tarifs (
  codeTarif char(5)				not null,
  [libelle] varchar(30)			not null,
  [prixJour] NUMERIC(5,2)		not null CONSTRAINT CK_prixjour CHECK (prixjour > 0),
  CONSTRAINT pk_tarifs PRIMARY KEY (codeTarif),
  CONSTRAINT pk_lib_tarifs UNIQUE (libelle)
);
GO

CREATE TABLE grilleTarifs (
  [codeTarif] CHAR(5)			not null,
  codeGam char(5)				not null,
  codeCate char(5)				not null
  CONSTRAINT u_codeGam PRIMARY KEY (codeGam),
  CONSTRAINT u_codeCate UNIQUE (codeCate)
);
GO

CREATE TABLE articles (
  refart char(8)				not null,
  [designation] varchar(80)		not null,
  [codeGam] CHAR(5)				not null,
  [codeCate] CHAR(5)			not null,
  CONSTRAINT pk_articles PRIMARY KEY (refart)
);
GO



CREATE TABLE lignesFic (
  [noFic] NUMERIC(6)			null,
  [noLig] NUMERIC(3)			not null,
  [refart] CHAR(8)				not null,
  [depart] datetime				not null CONSTRAINT DF_depart DEFAULT getdate(),
  [retour] datetime				null ,
  CONSTRAINT pk_lignesfiches PRIMARY KEY (noLig),
  CONSTRAINT CK_dateRetour CHECK (retour is null or retour > depart)
);
GO

-- CLE ETRANGERES
ALTER TABLE GRILLETARIFS
ADD CONSTRAINT fk_codeGam2 FOREIGN KEY (codeGam) REFERENCES GAMMES(codeGam),
CONSTRAINT fk_codeCate2 FOREIGN KEY (codeCate) REFERENCES CATEGORIES(codeCate),
CONSTRAINT fk_codeTarif FOREIGN KEY (codeTarif) REFERENCES TARIFS(codeTarif)
GO

ALTER TABLE ARTICLES
ADD CONSTRAINT fk_codeGam FOREIGN KEY (codeGam) REFERENCES GRILLETARIFS(codeGam),
CONSTRAINT fk_codeCate FOREIGN KEY (codeCate) REFERENCES GRILLETARIFS(codeCate)
GO

ALTER TABLE LIGNESFIC
ADD CONSTRAINT fk_refart FOREIGN KEY (refart) REFERENCES ARTICLES(refart),
CONSTRAINT fk_noFic FOREIGN KEY (noFic) REFERENCES FICHES(noFic)
GO

ALTER TABLE FICHES
ADD CONSTRAINT fk_noCli FOREIGN KEY (noCli) REFERENCES CLIENTS(noCli)
GO

