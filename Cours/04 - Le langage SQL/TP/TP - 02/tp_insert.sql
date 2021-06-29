USE BDD_TP_LOCATION
GO

-- CLIENT
Insert into CLIENTS(noCli,nom,prenom,adresse,cpo,ville) 
Values (1, 'Albert', 'Anatole','Rue des accacias','61000','Amiens')
Insert into CLIENTS(noCli,nom,prenom,adresse,cpo,ville) 
Values (2, 'Bernard', 'Barnabé','Rue du bar','01000','Bourg en Bresse')
Insert into CLIENTS(noCli,nom,prenom,adresse,cpo,ville) 
Values (3, 'Dupond', 'Camille','Rue Crébillon','44000','Nantes')
Insert into CLIENTS(noCli,nom,prenom,adresse,cpo,ville) 
Values (4, 'Desmoulin', 'Daniel','Rue descendante','21000','Dijon')
Insert into CLIENTS(noCli,nom,prenom,adresse,cpo,ville) 
Values (5, 'Ernest', 'Etienne','Rue de l ’échaffaud','42000','Saint Étienne')
Insert into CLIENTS(noCli,nom,prenom,adresse,cpo,ville) 
Values (6, 'Ferdinand', 'François','Rue de la convention','44100','Nantes')
Insert into CLIENTS(noCli,nom,prenom,adresse,cpo,ville) 
Values (9, 'Dupond', 'Jean','Rue des mimosas','75018','Paris')
Insert into CLIENTS(noCli,nom,prenom,adresse,cpo,ville) 
Values (14, 'Boutaud', 'Sabine','Rue des platanes','75002','Paris')

-- FICHES
Insert into FICHES(noFic, noCli, dateCrea, datePaye, etat) 
Values (1001, 14, DATEADD(day, -15, GETDATE()), DATEADD(day, -13,GETDATE()), 'SO')
Insert into FICHES(noFic, noCli, dateCrea, etat) 
Values (1002, 4, DATEADD(day, -13, GETDATE()), 'EC')
Insert into FICHES(noFic, noCli, dateCrea, datePaye, etat) 
Values (1003, 1, DATEADD(day, -12, GETDATE()), DATEADD(day,-10,GETDATE()),'SO')
Insert into FICHES(noFic, noCli, dateCrea, etat) 
Values (1004, 6, DATEADD(day, -11, GETDATE()), 'EC')
Insert into FICHES(noFic, noCli, dateCrea, etat) 
Values (1005, 3, DATEADD(day, -10, GETDATE()), 'EC')
Insert into FICHES(noFic, noCli, dateCrea, etat) 
Values (1006, 9, DATEADD(day, -10, GETDATE()), 'RE')
Insert into FICHES(noFic, noCli, dateCrea, etat) 
Values (1007, 1, DATEADD(day, -13, GETDATE()), 'EC')
Insert into FICHES(noFic, noCli, dateCrea, etat) 
Values (1008, 2, DATEADD(day, 0, GETDATE()), 'EC')




-- GAMMES

Insert into GAMMES(codeGam, libelle) 
Values ('PR', 'Matériel Professionnel')
Insert into GAMMES(codeGam, libelle) 
Values ('HG', 'Haut de gamme')
Insert into GAMMES(codeGam, libelle) 
Values ('MG', 'Moyenne gamme')
Insert into GAMMES(codeGam, libelle) 
Values ('EG', 'Entrée de gamme')

-- CATEGORIE
Insert into CATEGORIES(codeCate, libelle) 
Values ('MONO', 'Monoski')
Insert into CATEGORIES(codeCate, libelle) 
Values ('SURF', 'Surf')
Insert into CATEGORIES(codeCate, libelle) 
Values ('PA', 'Patinette')
Insert into CATEGORIES(codeCate, libelle) 
Values ('FOA', 'Ski de fond alternatif')
Insert into CATEGORIES(codeCate, libelle) 
Values ('FOP', 'Ski de fond patineur')
Insert into CATEGORIES(codeCate, libelle) 
Values ('SA', 'Ski alpin')

-- TARIFS
Insert into TARIFS(codeTarif, libelle, prixJour) 
Values ('T1', 'Base', 10)
Insert into TARIFS(codeTarif, libelle, prixJour) 
Values ('T2', 'Chocolat', 15)
Insert into TARIFS(codeTarif, libelle, prixJour) 
Values ('T3', 'Bronze', 20)
Insert into TARIFS(codeTarif, libelle, prixJour) 
Values ('T4', 'Argent', 30)
Insert into TARIFS(codeTarif, libelle, prixJour) 
Values ('T5', 'Or', 50)
Insert into TARIFS(codeTarif, libelle, prixJour) 
Values ('T6', 'Platine', 90)

-- GRILLETARIFS

Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('EG', 'MONO', 'T1')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('MG', 'MONO', 'T2')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('EG', 'SURF', 'T1')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('MG', 'SURF', 'T2')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('HG', 'SURF', 'T3')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('PR', 'SURF', 'T5')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('EG', 'PA', 'T1')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('MG', 'PA', 'T2')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('EG', 'FOA', 'T1')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('MG', 'FOA', 'T2')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('HG', 'FOA', 'T4')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('PR', 'FOA', 'T6')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('EG', 'FOP', 'T2')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('MG', 'FOP', 'T3')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('HG', 'FOP', 'T4')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('PR', 'FOP', 'T6')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('EG', 'SA', 'T1')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('MG', 'SA', 'T2')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('HG', 'SA', 'T4')
Insert into GRILLETARIFS(codeGam, codeCate, codeTarif) 
Values ('PR', 'SA', 'T6')

-- ARTICLES
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F01', 'Fischer Cruiser', 'EG', 'FOA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F02', 'Fischer Cruiser', 'EG', 'FOA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F03', 'Fischer Cruiser', 'EG', 'FOA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F04', 'Fischer Cruiser', 'EG', 'FOA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F05', 'Fischer Cruiser', 'EG', 'FOA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F10', 'Fischer Sporty Crown', 'MG', 'FOA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F20', 'Fischer RCS Classic GOLD', 'PR', 'FOA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F21', 'Fischer RCS Classic GOLD', 'PR', 'FOA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F22', 'Fischer RCS Classic GOLD', 'PR', 'FOA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F23', 'Fischer RCS Classic GOLD', 'PR', 'FOA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F50', 'Fischer SOSSkating VASA', 'HG', 'FOP')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F60', 'Fischer RCS CARBOLITES kating', 'PR', 'FOP')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F61', 'Fischer RCS CARBOLITES kating', 'PR', 'FOP')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F62', 'Fischer RCS CARBOLITES kating', 'PR', 'FOP')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F63', 'Fischer RCS CARBOLITES kating', 'PR', 'FOP')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('F64', 'Fischer RCS CARBOLITES kating', 'PR', 'FOP')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('P01', 'Décathlon Allegre junior 150', 'EG', 'PA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('P10', 'Fischer mini ski patinette', 'MG', 'PA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('P11', 'Fischer mini ski patinette', 'MG', 'PA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('S01', 'Décathlon Apparition', 'EG', 'SURF')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('S02', 'Décathlon Apparition', 'EG', 'SURF')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('S03', 'Décathlon Apparition', 'EG', 'SURF')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('A01', 'Salomon 24X+Z12', 'EG', 'SA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('A02', 'Salomon 24X+Z12', 'EG', 'SA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('A03', 'Salomon 24X+Z12', 'EG', 'SA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('A04', 'Salomon 24X+Z12', 'EG', 'SA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('A05', 'Salomon 24X+Z12', 'EG', 'SA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('A10', 'Salomon Pro Link Equipe 4S', 'PR', 'SA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('A11', 'Salomon Pro Link Equipe 4S', 'PR', 'SA')
Insert into ARTICLES(refart, designation, codeGam, codeCate) 
Values ('A21', 'Salomon 3V RACE JR+L10', 'PR', 'SA')

--LIGNESFICS
Insert into LIGNESFIC(noFic, noLig, refart, depart, retour) 
Values (1001, 1, 'F05', DATEADD(day, -15, GETDATE()), DATEADD(day, -13, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart, retour) 
Values (1001, 2, 'F50', DATEADD(day, -15, GETDATE()), DATEADD(day, -14, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart, retour) 
Values (1001, 3, 'F60', DATEADD(hour, 0, GETDATE()), DATEADD(hour, 6, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart, retour) 
Values (1002, 1, 'A03', DATEADD(day, -13, GETDATE()), DATEADD(day, -9, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart, retour) 
Values (1002, 2, 'A04', DATEADD(day, -12, GETDATE()), DATEADD(day, -7, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart) 
Values (1002, 3, 'S03', DATEADD(day, -8, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart, retour) 
Values (1003, 1, 'F50', DATEADD(day, -12, GETDATE()), DATEADD(day, -10, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart, retour) 
Values (1003, 2, 'F05', DATEADD(day, -12, GETDATE()), DATEADD(day, -10, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart) 
Values (1004, 1, 'P01', DATEADD(day, -6, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart, retour) 
Values (1005, 1, 'F05', DATEADD(day, -9, GETDATE()), DATEADD(day, -5, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart) 
Values (1005, 2, 'F10', DATEADD(day, -4, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart, retour) 
Values (1006, 1, 'S01', DATEADD(day, -10, GETDATE()), DATEADD(day, -9, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart, retour) 
Values (1006, 2, 'S02', DATEADD(day, -10, GETDATE()), DATEADD(day, -9, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart, retour) 
Values (1006, 3, 'S03', DATEADD(day, -10, GETDATE()), DATEADD(day, -9, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart, retour) 
Values (1007, 1, 'F50', DATEADD(day, -3, GETDATE()), DATEADD(day, -2, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart) 
Values (1007, 3, 'F60', DATEADD(day, -1, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart) 
Values (1007, 2, 'F05', DATEADD(day, -3, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart) 
Values (1007, 4, 'S02', DATEADD(day, 0, GETDATE()))
Insert into LIGNESFIC(noFic, noLig, refart, depart) 
Values (1008, 1, 'S01', DATEADD(day, 0, GETDATE()))