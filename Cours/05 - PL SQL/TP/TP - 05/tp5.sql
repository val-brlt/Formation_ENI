SET SERVEROUTPUT ON
/
CREATE OR REPLACE PROCEDURE print(txt IN varchar2(80)) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE(txt);
END;
/


-- 5.1 Calcul de date

CREATE OR REPLACE FUNCTION finValidite(codeMembre INT) RETURN DATE IS
dateAdhesion Membre.adhesion%TYPE;
dateFinAdhesion DATE;
BEGIN
-- Selection date fin adhesion du membre
SELECT trunc(adhesion) + duree INTO dateFinAdhesion FROM membre m WHERE m.numero = codeMembre;
if (dateFinAdhesion > trunc(sysdate) + 14) THEN
    return dateFinAdhesion - 14;
END IF;
END;
/

SELECT finValidite(1) from dual;

-- 5.2 Fonction de comparaison de données de type date

CREATE OR REPLACE FUNCTION adhesionAJour(codeMembre INT) RETURN BOOLEAN IS
dateFinAdhesion DATE;
BEGIN
-- Selection date fin adhesion du membre
SELECT trunc(adhesion) + duree INTO dateFinAdhesion FROM membre m WHERE m.numero = codeMembre;
if (trunc(sysdate) > dateFinAdhesion) THEN
    return TRUE;
ELSE 
    return FALSE;
END IF;
END;
/

begin
  IF (adhesionAJour(1)) THEN
    print('Membre 1 : adhesion à jour');
  ELSE
    print('Membre 1 : adhesion pas à jour');
  END IF;
end;
/

-- 5.3 Procédure pour automatiser un traitement

CREATE OR REPLACE PROCEDURE retourExemplaire(isbn IN details.isbn%TYPE, exemplaire details.exemplaire%TYPE) IS
BEGIN
    update details d 
       set rendule=sysdate
     where d.isbn = isbn AND d.exemplaire = exemplaire;
END;
/

EXECUTE retourExemplaire(2266091611,1);
SELECT * from details 
    WHERE isbn=2266091611 AND exemplaire=1;

-- 5.4 Procèdure de suppression conditionnelle 

CREATE OR REPLACE PROCEDURE purgeMembres() IS
cursor c_membres IS SELECT * from membre;
dateFinAdhesion DATE;
BEGIN
    for v_membres in c_membres loop
        -- Selection date fin adhesion du membre
        SELECT trunc(adhesion) + duree INTO dateFinAdhesion FROM membre m WHERE m.numero = codeMembre;
        if (trunc(date) - dateFinAdhesion > 1096) THEN
            DELETE FROM Membre WHERE numero = v_membres.numero;
        END IF;
    end loop
END;
/

EXECUTE purgeMembres;
SELECT COUNT(*) FROM Membre

-- 5.5 Fonction pour extraire une ligne d'information

CREATE OR REPLACE FUNCTION mesureActivite(months INT) RETURN INT IS
BEGIN
      RETURN  SELECT membre, count(*) 
      FROM emprunts INNER JOIN details
      ON details.emprunt=emprunts.numero
      WHERE months_between(sysdate, creele)<months
      GROUP BY membre
      ORDER BY 2 DESC FETCH FIRST 1 ROWS ONLY ;
END;
/

SELECT numero, nom, prenom FROM membre WHERE numero = mesureActivite(10);

-- 5.6 Fonction pour encapsuler un calcul d'agrégat

CREATE OR REPLACE FUNCTION dureeMoyenne(isbn IN details.isbn%TYPE, ) RETURN INT IS
BEGIN
      RETURN  SELECT membre, count(*) 
      FROM emprunts INNER JOIN details
      ON details.emprunt=emprunts.numero
      WHERE months_between(sysdate, creele)<months
      GROUP BY membre
      ORDER BY 2 DESC FETCH FIRST 1 ROWS ONLY ;
END;
/