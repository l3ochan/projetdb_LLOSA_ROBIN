-- Q1.1  Liste des marques et modèles distincts en stock, triés par ordre alphabétique
SELECT DISTINCT Marque, Modele 
FROM Vehicule 
ORDER BY Marque ASC, Modele ASC;

-- Q1.2  Recherche des véhicules dont la finition contient le terme "Sport" ou "Pack"
SELECT VIN, Marque, Modele, Version_Finition, Prix_de_vente_TTC 
FROM Vehicule 
WHERE Version_Finition LIKE '%Sport%' OR Version_Finition LIKE '%Pack%';

-- Q1.3  Véhicules dont le kilométrage est compris entre 20 000 et 50 000 km, classés du plus récent au plus vieux
SELECT VIN, Marque, Modele, Kilometrage, Date_PMC 
FROM Vehicule 
WHERE Kilometrage BETWEEN 20000 AND 50000 
ORDER BY Kilometrage ASC;

-- Q1.4  Véhicules proposant des énergies alternatives ou récentes (Hybride, 100% Electrique)
SELECT VIN, Marque, Modele, Energie, Transmission, Puissance 
FROM Vehicule 
WHERE Energie IN ('Hybride', '100% Electrique');

-- Q1.5  Clients particuliers dont l'adresse e-mail est chez un fournisseur français ou générique, habitant dans le département 44 ou 69
SELECT Reference_unique, Nom, Prenom, Email, Adresse_postale 
FROM Client 
WHERE Statut_juridique = 'Particulier'
  AND (Email LIKE '%.fr' OR Email LIKE '%.com')
  AND (Adresse_postale LIKE '%44___%' OR Adresse_postale LIKE '%69___%')
ORDER BY Nom ASC;





-- Q2.1  Nombre de véhicules et kilométrage moyen par type d'énergie
SELECT Energie, COUNT(*) AS Nombre_Vehicules, ROUND(AVG(Kilometrage), 0) AS Km_Moyen 
FROM Vehicule 
GROUP BY Energie;

-- Q2.2  Chiffre d'affaires et volume de ventes par collaborateur, pour ceux ayant vendu au moins 1 véhicule
SELECT Matricule, COUNT(Reference) AS Total_Ventes, COUNT(DISTINCT Reference_unique) AS Nb_Clients_Servis 
FROM Bon_de_commande 
GROUP BY Matricule 
HAVING COUNT(Reference) >= 1;

-- Q2.3 : Prix min, max et moyen des véhicules par concession, uniquement pour les concessions ayant un prix moyen supérieur à 15 000 €
SELECT Nom_commercial, MIN(Prix_de_vente_TTC) AS Prix_Min, MAX(Prix_de_vente_TTC) AS Prix_Max, ROUND(AVG(Prix_de_vente_TTC), 2) AS Prix_Moyen 
FROM Vehicule 
GROUP BY Nom_commercial 
HAVING AVG(Prix_de_vente_TTC) > 15000.00;

-- Q2.4  Nombre de photos par véhicule, en isolant les véhicules ayant strictement plus de 2 photos au catalogue
SELECT VIN, COUNT(id_photo) AS Total_Photos 
FROM Photo 
GROUP BY VIN 
HAVING COUNT(id_photo) > 2;

-- Q2.5  Répartition des bons de commande par mode de financement
SELECT Mode_de_financement, COUNT(*) AS Nombre_Dossiers 
FROM Bon_de_commande 
GROUP BY Mode_de_financement;







-- Q3.1  Concession de rattachement de chaque collaborateur
SELECT E.Matricule, E.Nom, E.Prenom, E.Fonction, C.Nom_commercial, C.Ville 
FROM Employe E
INNER JOIN Concession C ON E.Nom_commercial = C.Nom_commercial;

-- Q3.2  Tous les véhicules et leur première photo de vitrine (rang 1), y compris les véhicules sans photo
SELECT V.VIN, V.Marque, V.Modele, V.Cycle_de_vie, P.URL 
FROM Vehicule V
LEFT JOIN Photo P ON V.VIN = P.VIN AND P.rang = 1;

-- Q3.3  Concessions n'ayant actuellement aucun véhicule rattaché en stock
SELECT C.Nom_commercial, C.Ville, COUNT(V.VIN) AS Nb_Stock 
FROM Concession C
LEFT JOIN Vehicule V ON C.Nom_commercial = V.Nom_commercial 
GROUP BY C.Nom_commercial, C.Ville 
HAVING COUNT(V.VIN) = 0;

-- Q3.4  Détail complet de chaque vente (Client, Véhicule, Vendeur, Commande)
SELECT 
    BC.Reference AS Num_Commande,
    BC.Date_d_emission,
    CONCAT(CL.Nom, ' ', COALESCE(CL.Prenom, '')) AS Client,
    CONCAT(V.Marque, ' ', V.Modele) AS Vehicule_Achete,
    V.Prix_de_vente_TTC,
    CONCAT(E.Prenom, ' ', E.Nom) AS Conseiller
FROM Bon_de_commande BC
INNER JOIN Client CL ON BC.Reference_unique = CL.Reference_unique
INNER JOIN Vehicule V ON BC.VIN = V.VIN
INNER JOIN Employe E ON BC.Matricule = E.Matricule;

-- Q3.5  Liste des clients avec leurs commandes éventuelles et le véhicule associé s'il existe
SELECT 
    CL.Reference_unique,
    CL.Nom,
    CL.Statut_juridique,
    BC.Reference AS Ref_Commande,
    BC.Mode_de_financement,
    V.Marque,
    V.Modele
FROM Client CL
LEFT JOIN Bon_de_commande BC ON CL.Reference_unique = BC.Reference_unique
LEFT JOIN Vehicule V ON BC.VIN = V.VIN;






-- Q4.1  Véhicules qui ne font l'objet d'aucun bon de commande (véhicules toujours disponibles)
SELECT VIN, Marque, Modele, Prix_de_vente_TTC 
FROM Vehicule 
WHERE VIN NOT IN (
    SELECT VIN FROM Bon_de_commande
);

-- Q4.2  Clients ayant passé une commande avec un mode de financement à crédit ou LOA
SELECT Reference_unique, Nom, Prenom, Email 
FROM Client 
WHERE Reference_unique IN (
    SELECT Reference_unique 
    FROM Bon_de_commande 
    WHERE Mode_de_financement IN ('Credit classique', 'LOA')
);

-- Q4.3  Collaborateurs qui n'ont encore concrétisé aucune vente
SELECT E.Matricule, E.Nom, E.Prenom, E.Fonction 
FROM Employe E 
WHERE NOT EXISTS (
    SELECT 1 
    FROM Bon_de_commande BC 
    WHERE BC.Matricule = E.Matricule
);

-- Q4.4  Véhicules pour lesquels au moins une photo a été uploadée
SELECT V.VIN, V.Marque, V.Modele 
FROM Vehicule V 
WHERE EXISTS (
    SELECT 1 
    FROM Photo P 
    WHERE P.VIN = V.VIN
);

-- Q4.5  Véhicule(s) dont le prix est strictement supérieur au prix de TOUS les véhicules à boîte manuelle
SELECT VIN, Marque, Modele, Transmission, Prix_de_vente_TTC 
FROM Vehicule 
WHERE Prix_de_vente_TTC > ALL (
    SELECT Prix_de_vente_TTC 
    FROM Vehicule 
    WHERE Transmission = 'Manuelle'
);

