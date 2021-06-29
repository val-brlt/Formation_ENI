USE BDD_TP_LOCATION
GO


/* TEST TARIFS */
PRINT 'TEST TABLE TARIFS '
-- TEST N°1
PRINT '------------------------------------------'
PRINT 'TEST n°1 '
BEGIN TRY
INSERT INTO TARIFS(codeTarif, libelle, prixJour) VALUES (1, '1', 1);
PRINT 'Succes'
END TRY

BEGIN CATCH
PRINT 'Erreur au niveau des colonnes'
END CATCH

-- TEST N°2
PRINT '------------------------------------------'
PRINT 'TEST n°2 : Valeur négatif'
BEGIN TRY
INSERT INTO TARIFS(codeTarif, libelle, prixJour) VALUES (2, '2', -1);
PRINT 'Erreur -> CHECK prixJour'
END TRY

BEGIN CATCH
PRINT 'Succes'
END CATCH

-- TEST N°3
PRINT '------------------------------------------'
PRINT 'TEST n°3 : libelle unique'
BEGIN TRY
INSERT INTO TARIFS(codeTarif, libelle, prixJour) VALUES (3, '1', 5);
PRINT 'Erreur -> Violation de la contrainte UNIQUE KEY « pk_lib_tarifs ». Impossible d insérer une clé en double dans l objet « dbo.TARIFS ». Valeur de clé dupliquée : (1).'
END TRY

BEGIN CATCH
PRINT 'Succes'
END CATCH


PRINT '------------------------------------------'
/* TEST TARIFS */
PRINT 'TEST TABLE LIGNESFIC'
PRINT '------------------------------------------'
PRINT 'TEST n°1 : retour date'
BEGIN TRY
--INSERT INTO LIGNESFIC(noLig, refart) VALUES (1, '1');
PRINT 'Succes'
END TRY
BEGIN CATCH
PRINT 'Erreur : Manque "retour is null" dans la condition du check'
END CATCH
INSERT INTO LIGNESFIC(noLig, refart, retour) VALUES (1, '1', '20221223 23:59:59.99');
PRINT '------------------------------------------'
PRINT 'TEST n°2 : retour date inf'
BEGIN TRY
INSERT INTO LIGNESFIC(noLig, refart,retour) VALUES (2, '2', '20061223 23:59:59.99');
PRINT 'Erreur : Manque "Date retour supérieur à date départ" dans la condition du check'
END TRY
BEGIN CATCH
PRINT 'Succes'
END CATCH
















PRINT '------------------------------------------'
DELETE FROM TARIFS WHERE codeTarif=1
DELETE FROM TARIFS WHERE codeTarif=2
DELETE FROM TARIFS WHERE codeTarif=3
DELETE FROM LIGNESFIC WHERE noLig=1
DELETE FROM LIGNESFIC WHERE noLig=2


