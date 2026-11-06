-- ## Règles concernant les véhicules

-- Chaque véhicule a une immatriculation unique
ALTER TABLE Vehicule 
    ADD CONSTRAINT UQ_Vehicule_Immatriculation UNIQUE (Immatriculation);



-- Le kilométrage, la puissance et le prix doivent être des valeurs strictement positives ou nulles
ALTER TABLE Vehicule 
    ADD CONSTRAINT CK_Vehicule_Kilometrage CHECK (Kilometrage >= 0),
    ADD CONSTRAINT CK_Vehicule_Puissance CHECK (Puissance > 0),
    ADD CONSTRAINT CK_Vehicule_Prix CHECK (Prix_de_vente_TTC > 0);


-- Restriction sur les types d'énergie et transmissions autorisés
ALTER TABLE Vehicule 
    ADD CONSTRAINT CK_Vehicule_Energie CHECK (Energie IN ('Essence', 'Diesel', 'Hybride', '100% Electrique')),
    ADD CONSTRAINT CK_Vehicule_Transmission CHECK (Transmission IN ('Manuelle', 'Automatique'));




-- Restriction sur les statuts opérationnels du cycle de vie
ALTER TABLE Vehicule 
    ADD CONSTRAINT CK_Vehicule_Cycle_de_vie CHECK (Cycle_de_vie IN (
        'En arrivage',
        'Reconditionnement atelier',
        'En stock / En ligne',
        'Reserve',
        'Vendu',
        'Livre'
    ));





-- ## Règles concernant les photos & rang d'affichage


-- Le rang d'affichage doit être >= 1
-- Un véhicule ne peut pas avoir deux photos avec le même rang d'affichage (unicité du couple VIN + rang)
ALTER TABLE Photo 
    ADD CONSTRAINT CK_Photo_Rang CHECK (rang >= 1),
    ADD CONSTRAINT UQ_Photo_VIN_Rang UNIQUE (VIN, rang);




--  ## Personnel (e-mail professionnel unique)

ALTER TABLE Employe 
    ADD CONSTRAINT UQ_Employe_Email UNIQUE (Email_pro);





-- ## Clients (statut juridique strict)

ALTER TABLE Client 
    ADD CONSTRAINT CK_Client_Statut_juridique CHECK (Statut_juridique IN ('Particulier', 'Professionnel'));


-- ## Bons de commande (financement & cohérence des dates)

-- Solutions de règlement autorisées
ALTER TABLE Bon_de_commande 
    ADD CONSTRAINT CK_Commande_Financement CHECK (Mode_de_financement IN (
        'Comptant',
        'Credit classique',
        'LOA'
    ));

-- Cohérence temporelle : la date de livraison doit être égale ou postérieure à la date d'émission
ALTER TABLE Bon_de_commande 
    ADD CONSTRAINT CK_Commande_Dates CHECK (Date_de_livraison >= Date_d_emission);
