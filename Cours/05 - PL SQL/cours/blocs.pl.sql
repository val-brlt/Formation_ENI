-- un bloc qui ne fait rien
BEGIN
  NULL;
END;
/

-- hello world
SET SERVEROUTPUT ON;

BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello World!');
END;
/

/****************************** variables ******************************/
DECLARE
  -- déclaration d'une variable
  num   INT;
BEGIN
  -- affectation d'une valeur à une variable
  num := 9;
  -- affiche la valeur contenue dans la variable
  DBMS_OUTPUT.PUT_LINE('Valeur de la variable : ' || num);
END;
/

DECLARE
  -- déclaration et affectation d'une variable
  num   INT := 9;
BEGIN
  -- affiche la valeur contenue dans la variable
  DBMS_OUTPUT.PUT_LINE('Valeur de la variable : ' || num);
END;
/

-- INTO
DECLARE
  nbServices  INT;
BEGIN
  -- affecter la valeur récupérée par la requête à la variable
  SELECT COUNT(*) INTO nbServices FROM Services;
  DBMS_OUTPUT.PUT_LINE('Il y a ' || nbServices || ' service(s)');
END;
/

-- INTO avec plusieurs colonnes dans plusieurs variables
DECLARE
  nomDeFamille    VARCHAR2(30);
  prenomEmpl      VARCHAR2(30);
BEGIN
  SELECT nom, prenom INTO nomDeFamille, prenomEmpl FROM employes WHERE codeEmp = 64;
  DBMS_OUTPUT.PUT_LINE('Employé : ' || prenomEmpl || ' '|| nomDeFamille);
END;
/

-- %TYPE
DECLARE
  nomDeFamille    Employes.nom%TYPE;
  prenomEmpl      Employes.prenom%TYPE;
BEGIN
  SELECT nom, prenom INTO nomDeFamille, prenomEmpl FROM employes WHERE codeEmp = 64;
  DBMS_OUTPUT.PUT_LINE('Employé : ' || prenomEmpl || ' '|| nomDeFamille);
END;
/

-- %ROWTYPE
DECLARE
  jo              Employes%ROWTYPE;
BEGIN
  SELECT * INTO jo FROM employes WHERE codeEmp = 64;
  DBMS_OUTPUT.PUT_LINE('Employé : ' || jo.prenom || ' ' || jo.nom);
END;
/

-- RECORD
DECLARE
  -- déclaration d'un nouveau type
  TYPE recNomPrenom IS RECORD(
    nom     VARCHAR2(30),
    prenom  VARCHAR2(30)
  );
  -- déclaration d'une variable de ce type
  nomPre recNomPrenom;
BEGIN
  SELECT nom, prenom INTO nomPre FROM employes WHERE codeEmp = 64;
  DBMS_OUTPUT.PUT_LINE('Employé : ' || nomPre.prenom || ' ' || nomPre.nom);
END;
/

/****************************** conditions ******************************/
DECLARE
  nbServices INT;
BEGIN
  SELECT COUNT(*) INTO nbServices FROM Services;
  IF nbServices > 5 THEN
    DBMS_OUTPUT.PUT_LINE('Il y a plus de 5 services');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Il n''y a pas plus de 5 services');
  END IF;
END;
/

DECLARE
  emp   employes%ROWTYPE;
BEGIN
  SELECT * INTO emp FROM employes WHERE codeEmp = 66;
  IF emp.codeService = 'RESHU' THEN
    DBMS_OUTPUT.PUT_LINE(emp.prenom || ' ' || emp.nom || ' travaille aux ressources humaines');
  ELSE
    DBMS_OUTPUT.PUT_LINE(emp.prenom || ' ' || emp.nom || ' ne travaille pas aux ressources humaines');
  END IF;
END;
/

/******************************** Les boucles ********************************/
-- LOOP
DECLARE
  n   INT;
BEGIN
  n := 1;
  <<boucle>> -- étiquette
  LOOP
    DBMS_OUTPUT.PUT_LINE('valeur de n : ' || n);
    n := n + 1;
    EXIT boucle WHEN n > 10;
  END LOOP boucle;
END;
/

-- FOR
DECLARE
  n     INT;
BEGIN
  FOR n IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE('valeur de n : ' || n);
  END LOOP;
END;
/

-- REVERSE
DECLARE
  n     INT;
BEGIN
  FOR n IN REVERSE 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE('valeur de n : ' || n);
  END LOOP;
END;
/

--WHILE
DECLARE
  n     INT;
BEGIN
  n := 1;
  WHILE n <= 10 LOOP
    DBMS_OUTPUT.PUT_LINE('valeur de n : ' || n);
    n := n + 1;
  END LOOP;
END;
/

/***************************** exceptions *****************************/
-- EXCEPTION, WHEN
DECLARE
  nom   Employes.nom%TYPE;
BEGIN
  SELECT nom INTO nom FROM employes WHERE codeService = 'ACHAT';
  DBMS_OUTPUT.PUT_LINE('L''employé de ce service s''appelle : ' || nom);
EXCEPTION
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Il y a plus d''un employé dans ce service');
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Il n''y a aucun employé dans ce service');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Autre erreur');
END;
/

-- RAISE_APPLICATION_ERROR
DECLARE
  salaire  NUMBER(10, 2);
BEGIN
  salaire := 99999999.99;
  IF salaire > 200000 THEN
    RAISE_APPLICATION_ERROR(-20100, 'salaire trop élevé !');
  END IF;
  INSERT INTO employes VALUES(sq_employes.NEXTVAL, 'MACHIN', NULL, '01/05/2000', SYSDATE, 'DIRGE', NULL);
END;
/

-- EXCEPTION, RAISE
DECLARE
  salaire NUMERIC(10,2);
  trop    EXCEPTION;
BEGIN
  salaire := 99999999.99;
  IF salaire > 200000 THEN
    RAISE trop;
  END IF;
  INSERT INTO employes VALUES(sq_employes.NEXTVAL, 'MACHIN', NULL, '01/05/2000', SYSDATE, 'DIRGE', NULL);
EXCEPTION
  WHEN trop THEN
    DBMS_OUTPUT.PUT_LINE('Faut pas abuser !');
END;
/

-- PRAGMA
DECLARE
  salaire NUMERIC(10,2);
  trop    EXCEPTION;
  PRAGMA EXCEPTION_INIT(trop, -20100);
BEGIN
  salaire := 99999999.99;
  IF salaire > 200000 THEN
    RAISE_APPLICATION_ERROR(-20100, 'salaire trop élevé !');
  END IF;
  INSERT INTO employes VALUES(sq_employes.NEXTVAL, 'MACHIN', NULL, '01/05/2000', SYSDATE, 'DIRGE', NULL);
EXCEPTION
  WHEN trop THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/