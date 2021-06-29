USE facture
GO

-- Afficher toutes les factures avec le nom du client

SELECT 
invoice.num 'Facture',
invoice.title 'info',
invoice.total 'TOTAL',
client.name 'Client',
invoice.inv_date 'date',
invoice.payment 'paiement'
FROM invoice
INNER JOIN quote ON quote.id = invoice.quote_id
INNER JOIN project ON quote.project_id = project.id
INNER JOIN client ON client.id = project.id

-- Afficher tous les devis avec le nom du client

SELECT 
client.name 'Client',
quote.version 'version',
quote.title 'Projet',
quote.num 'devis',
quote.total 'montant'
FROM quote 
INNER JOIN project ON project.id = quote.project_id
INNER JOIN client ON client.id = project.client_id


-- Afficher les factures non payées avec le nom du client
SELECT 
invoice.num 'Facture',
invoice.title 'info',
invoice.total 'TOTAL',
client.name 'Client',
invoice.inv_date 'date',
invoice.payment 'paiement'
FROM client
INNER JOIN project ON client.id = project.client_id
INNER JOIN quote ON quote.project_id = project.id
INNER JOIN invoice ON quote.id = invoice.quote_id
WHERE invoice.payment IS NULL;


-- Afficher les factures en retard de 30 jours avec le nom du client

SELECT 
invoice.num 'Facture',
invoice.title 'info',
invoice.total 'TOTAL',
client.name 'Client',
invoice.inv_date 'date',
invoice.payment 'paiement'
FROM client
INNER JOIN project ON client.id = project.client_id
INNER JOIN quote ON quote.project_id = project.id
INNER JOIN invoice ON quote.id = invoice.quote_id
WHERE invoice.inv_date <= getdate() - 30 AND invoice.payment IS NULL;

-- Afficher les factures dues avec le nombre de jours écoulés

SELECT 
invoice.num 'Facture',
invoice.title 'info',
invoice.total 'TOTAL',
client.name 'Client',
invoice.inv_date 'date',
invoice.payment 'paiement',
DATEDIFF(day, invoice.inv_date,getdate()) 'Nb jours écoulés'
FROM client
INNER JOIN project ON client.id = project.client_id
INNER JOIN quote ON quote.project_id = project.id
INNER JOIN invoice ON quote.id = invoice.quote_id
WHERE invoice.payment IS NULL;

-- La somme des factures en cours

SELECT 
SUM(invoice.total) 'Somme des factures'
FROM invoice

-- Afficher le chiffre d’affaire par client

SELECT 
client.name 'Client',
quote.total + invoice.total 'Chiffre d''affaire'
FROM client
INNER JOIN project ON client.id = project.client_id
INNER JOIN quote ON quote.project_id = project.id
INNER JOIN invoice ON quote.id = invoice.quote_id
