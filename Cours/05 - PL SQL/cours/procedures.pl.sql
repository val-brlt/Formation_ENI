/************************* procédures et fonctions stockées *************************/
-- PROCEDURE
CREATE OR REPLACE PROCEDURE afficheBonjour IS -- ou AS
-- pas de mot clef DECLARE
BEGIN
  DBMS_OUTPUT.PUT_LINE('Bonjour !');
END;
/

-- EXECUTE
EXECUTE afficheBonjour;

-- IN ou rien du tout
CREATE OR REPLACE PROCEDURE afficheBonjour(nombre IN INT, nom VARCHAR2) IS
  i INT;
BEGIN
  FOR i IN 1..nombre LOOP
    DBMS_OUTPUT.PUT_LINE('Bonjour ' || nom || ' !');
  END LOOP;
END;
/

EXECUTE afficheBonjour(4, 'HD2WM141');

--OUT
CREATE OR REPLACE PROCEDURE separeDate(dte DATE, jour OUT INT, mois OUT INT, annee OUT INT) IS
BEGIN
  jour := TO_CHAR(dte, 'DD');
  mois := TO_CHAR(dte, 'MM');
  annee := TO_CHAR(dte, 'YYYY');
END;
/

DECLARE
  j   INT;
  m   INT;
  an  INT;
BEGIN
  separeDate(SYSDATE, j, m, an);
  DBMS_OUTPUT.PUT_LINE('Nous sommes le '||j|| ' du mois n°'||m|| ' de l''année '||an);
END;
/

-- IN OUT
CREATE OR REPLACE PROCEDURE insertService(lib VARCHAR2, code IN OUT VARCHAR2) IS
  existe INT;
BEGIN
  SELECT COUNT(*) INTO existe FROM Services WHERE codeService = code;
  IF existe <> 0 THEN
    code := UPPER(SUBSTR(lib, 1, 5));
  END IF;
  INSERT INTO Services VALUES(code, lib);
END;
/

DECLARE
  codeS CHAR(5) := 'INFOR';
BEGIN
  insertService('Accueil et Informations', codeS);
  DBMS_OUTPUT.PUT_LINE('Le service a été créé avec le code '||codeS);
END;
/

-- DEFAULT -> paramètre optionnel
CREATE OR REPLACE PROCEDURE afficheEmployes(restriction VARCHAR2 DEFAULT '%') IS
  CURSOR cEmploye IS SELECT nom, prenom FROM Employes WHERE nom LIKE restriction;
  lNomPre cEmploye%ROWTYPE;
BEGIN
  FOR lNomPre IN cEmploye LOOP
    DBMS_OUTPUT.PUT_LINE(lNomPre.Prenom || ' ' || lNomPre.Nom);
  END LOOP;
END;
/

EXECUTE afficheEmployes('B%');
EXECUTE afficheEmployes();

-- FUNCTION
CREATE OR REPLACE FUNCTION nbServices RETURN INT IS
  nbS INT;
BEGIN
  SELECT COUNT(*) INTO nbS FROM Services;
  RETURN nbS;
END;
/

SELECT nbServices FROM DUAL;

-- avec paramètres
CREATE OR REPLACE FUNCTION nbEmployes(codeS CHAR) RETURN INT IS
  nbEmp INT;
BEGIN
  SELECT COUNT(*) INTO nbEmp FROM employes WHERE codeService = codeS;
  RETURN nbEmp;
END;
/

SELECT nbEmployes('RESHU') FROM DUAL;
SELECT nbEmployes('ACHAT') FROM DUAL;
SELECT nbEmployes('INFOR') FROM DUAL;

CREATE OR REPLACE FUNCTION departement(numDep CHAR) RETURN VARCHAR2 IS
  nomDep  VARCHAR2(30);
BEGIN
  CASE numDep
    WHEN '01' THEN nomDep := 'Ain';
    WHEN '02' THEN nomDep := 'Aisne';
    WHEN '44' THEN nomDep := 'Loire Atlantique';
    ELSE nomDep := 'Autre département';
  END CASE;
  RETURN nomDep;
END;
/

SELECT departement('44') FROM DUAL;