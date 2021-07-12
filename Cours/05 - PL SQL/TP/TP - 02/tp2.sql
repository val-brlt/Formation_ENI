-- 4.1 Mise à jour conditionnellle 

DECLARE
  cursor cLesExemplaires IS 
    select details.isbn,details.exemplaire,etat,count(*) as nbre
          from details d inner join exemplaires ex on d.isbn = ex.isbn and d.numero = ex.numero
          group by d.isbn,d.exemplaire,etat;
  Vetat exemplaires.etat%TYPE;        
BEGIN
  for Vexemplaire IN cLesExemplaires LOOP
    IF (Vexemplaire.nbre<=10) 
      THEN vetat:='NE';
    ELSE IF (Vexemplaire.nbre<=25) 
        THEN vetat:='BO';
    ELSE IF (Vexemplaire.nbre<=40) 
        THEN vetat:='MO';
    ELSE vetat:='MA';
    END IF;
    END IF;
    END IF;
    UPDATE EXEMPLAIRES set etat = Vetat WHERE isbn = Vexemplaire.isbn and numero = Vexemplaire.exemplaire;
  END LOOP;
END;
/

-- 4.2 Suppression conditionelle
 
DECLARE
cursor c_emprunts IS
    SELECT * FROM emprunts 
cursor c_details IS
    SELECT * FROM details 
Vcreele emprunts.creele%TYPE;
Vrendule details.rendule%TYPE;
membres membre%ROWTYPE;
BEGIN
        for v_details IN c_details loop
        
        -- Selection du membre
        SELECT * INTO membres FROM membres m
        INNER JOIN emprunt e ON e.numero = m.numero
        WHERE e.numero = v_details.emprunt;
         -- Sélection de la date de création
        SELECT creele INTO Vcreele FROM emprunt e
        WHERE e.numero = v_details.emprunt; 
        -- Sélection de la date de retour 
        Vrendule := v_details.rendule;

        -- Si adhesion > 2 ans
        if (months_between(sysdate, add_months(membres.adhesion, membres.duree)) > 24) THEN
             -- Si le livre à était rendu
             if (Vrendule IS NOT NULL) THEN
                -- Modif des membres des emprunts en null
                UPDATE emprunt SET membre = null WHERE emprunt.membre = membres.numero;
                -- Suppression du membre
                DELETE FROM membre WHERE membre.numero = membres.numero;
        END IF;
        END IF;

        end loop
END;
/

-- 4.3 Affichage d'informations pendant l'exécution d'un bloc
DECLARE
cursor c_membre IS
    SELECT * from membre
nbEmprunt int;
nbEmprunt2 int;
TYPE membresBAN {
    membre1 membre.name%TYPE;
    membre2 membre.name%TYPE;
    membre3 membre.name%TYPE;
};
membresUP membreBAN;
membresDOWN membreBAN;
begin

    -- Initialisation du tableau
    FOR i in 1..3 LOOP 
        membresUP(i) := 0;
        membresDOWN(i) := 0;
    END LOOP;

    -- Sélection membre N°1
    SELECT membre from emprunt
    ORDER BY COUNT(e.membre);
  
end;