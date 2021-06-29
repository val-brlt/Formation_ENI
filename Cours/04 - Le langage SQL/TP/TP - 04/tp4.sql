USE Locations
GO

-- Liste des clients dont le nom commence par 'D'
SELECT * FROM clients WHERE SUBSTRING(nom,1,1) = 'D';

-- Nom et prénom de tous les clients.
SELECT nom,prenom FROM clients;

-- Liste des fiches (n°, état) pour les clients (nom, prénom) qui habitent en Loire Atlantique (44).

SELECT fiches.noFic 'N° Fiches',
fiches.etat 'état',
clients.nom 'Nom Client',
clients.prenom 'Prénom Client'
FROM fiches
INNER JOIN clients ON clients.noCli = fiches.noCli
WHERE clients.cpo LIKE '44%'

-- Détail de la fiche n°1002.

SELECT fiches.noFic 'Numéro de fiche',
clients.nom 'Nom',
clients.prenom 'Prénom',
articles.refart 'Référence',
articles.designation 'Désignation',
convert(varchar, lignesFic.depart, 3) 'Date départ',
ISNULL((convert(varchar, lignesFic.retour, 3)), '-') 'Date retour' ,
tarifs.prixJour 'Prix par jour',
ISNULL(((DATEDIFF(day, lignesFic.depart, lignesFic.retour) + 1)  * tarifs.prixJour) , (DATEDIFF(day, lignesFic.depart, getdate()) + 1)  * tarifs.prixJour) 'Montant'
FROM tarifs
INNER JOIN grilleTarifs  ON grilleTarifs.codeTarif = tarifs.codeTarif
INNER JOIN articles  ON grilleTarifs.codeGam = articles.codeGam AND grilleTarifs.codeCate = articles.codeCate
INNER JOIN lignesFic  ON lignesFic.refart = articles.refart
INNER JOIN fiches  ON lignesFic.noFic = fiches.noFic
INNER JOIN clients ON fiches.noCli = clients.noCli
WHERE lignesFic.noFic = '1002'


-- Prix journalier moyen de location par gamme.

SELECT gammes.libelle 'Gamme',
SUM(tarifs.prixJour) / COUNT(gammes.codeGam) 'Tarif Moyen'
FROM gammes
INNER JOIN grilleTarifs ON gammes.codeGam = grilleTarifs.codeGam
INNER JOIN tarifs ON tarifs.codeTarif = grilleTarifs.codeTarif
GROUP BY gammes.libelle

-- Liste des articles qui ont été loués au moins trois fois.

SELECT articles.refart 'Référence',
articles.designation 'Désignation',
COUNT(lignesFic.refart) 'Nombre de locations'
FROM lignesFic
INNER JOIN articles ON lignesFic.refart = articles.refart
GROUP BY articles.refart , articles.designation
HAVING COUNT(lignesFic.refart) >= 3


-- Détail de la fiche n°1002 avec le total.

SELECT fiches.noFic 'Numéro de fiche',
clients.nom 'Nom',
clients.prenom 'Prénom',
articles.refart 'Référence',
articles.designation 'Désignation',
convert(varchar, lignesFic.depart, 3) 'Date départ',
ISNULL((convert(varchar, lignesFic.retour, 3)), '-') 'Date retour' ,
tarifs.prixJour 'Prix par jour',
ISNULL(((DATEDIFF(day, lignesFic.depart, lignesFic.retour) + 1)  * tarifs.prixJour) , (DATEDIFF(day, lignesFic.depart, getdate()) + 1)  * tarifs.prixJour) 'Montant'
--(DATEDIFF(day, lignesFic.depart, lignesFic.retour) + 1)  * tarifs.prixJour 'Total'
FROM tarifs
INNER JOIN grilleTarifs  ON grilleTarifs.codeTarif = tarifs.codeTarif
INNER JOIN articles  ON grilleTarifs.codeGam = articles.codeGam AND grilleTarifs.codeCate = articles.codeCate
INNER JOIN lignesFic  ON lignesFic.refart = articles.refart
INNER JOIN fiches  ON lignesFic.noFic = fiches.noFic
INNER JOIN clients ON fiches.noCli = clients.noCli
WHERE lignesFic.noFic = '1002'

-- Grille des tarifs.

SELECT categories.libelle 'Catégorie',
gammes.libelle 'Gamme',
tarifs.libelle 'Nom du tarif',
tarifs.prixJour 'Prix à la journée'
FROM tarifs
INNER JOIN grilleTarifs ON grilleTarifs.codeTarif = tarifs.codeTarif
INNER JOIN gammes ON grilleTarifs.codeGam = gammes.codeGam
INNER JOIN categories ON grilleTarifs.codeCate = categories.codeCate

-- Liste des locations de la catégorie SURF.

SELECT articles.refart 'Référence',
articles.designation 'Désignation',
COUNT(lignesFic.refart) 'Nombre de locations'
FROM lignesFic
INNER JOIN articles ON lignesFic.refart = articles.refart
INNER JOIN grilleTarifs gt ON gt.codeCate = articles.codeCate AND gt.codeGam = articles.codeGam
INNER JOIN categories ON grilleTarifs.codeCate = categories.codeCate
INNER JOIN gammes ON grilleTarifs.codeGam = gammes.codeGam
WHERE categories.codeCate = 'SURF'
GROUP BY articles.refart , articles.designation

-- Calcul du nombre moyen d’article loué par fiche de location.


-- Calcul du nombre de fiches de location établies pour les catégories de location Ski alpin, Surf et Patinette.
-- Calcul du montant moyen des fiches de location.