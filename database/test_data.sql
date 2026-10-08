INSERT INTO Concession (Nom_commercial, Adresse_postale, Code_postal, Ville, Telephone) VALUES
('Autosphere Nantes Ouest', '12 Rue des Concessionnaires', '44800', 'Saint-Herblain', '0240123456'),
('Autosphere Lyon Sud', '45 Avenue de l''Automobile', '69200', 'Venissieux', '0478123456'),
('Autosphere Paris Nord', '8 Boulevard du Parisis', '95130', 'Franconville', '0139123456');

INSERT INTO Employe (Matricule, Nom, Prenom, Email_pro, Fonction, Nom_commercial) VALUES
('EMP001', 'Dubois', 'Thomas', 't.dubois@autosphere-nantes.fr', 'Conseiller commercial', 'Autosphere Nantes Ouest'),
('EMP002', 'Moreau', 'Camille', 'c.moreau@autosphere-nantes.fr', 'Secretaire commerciale', 'Autosphere Nantes Ouest'),
('EMP003', 'Lefebvre', 'Julien', 'j.lefebvre@autosphere-lyon.fr', 'Conseiller commercial', 'Autosphere Lyon Sud'),
('EMP004', 'Bernard', 'Sophie', 's.bernard@autosphere-paris.fr', 'Conseiller commercial', 'Autosphere Paris Nord');

INSERT INTO Client (Reference_unique, Statut_juridique, Nom, Prenom, Telephone, Email, Adresse_postale) VALUES
('CLI000000001', 'Particulier', 'Martin', 'Alexandre', '0612345678', 'alexandre.martin@email.fr', '14 Rue de la Paix, 44000 Nantes'),
('CLI000000002', 'Particulier', 'Petit', 'Emma', '0687654321', 'emma.petit@email.fr', '5 Place Bellecour, 69002 Lyon'),
('CLI000000003', 'Professionnel', 'SARL Plomberie Express', NULL, '0145789632', 'contact@plomberie-express.fr', '22 Rue des Artisans, 95100 Argenteuil'),
('CLI000000004', 'Particulier', 'Roux', 'Lucas', '0754128963', 'lucas.roux@email.fr', '8 Avenue Jean Jaures, 69100 Villeurbanne');

INSERT INTO Vehicule (VIN, Immatriculation, Marque, Modele, Version_Finition, Date_PMC, Kilometrage, Energie, Transmission, Puissance, Couleur, Prix_de_vente_TTC, Cycle_de_vie, Nom_commercial) VALUES
('VF1RJA00567891234', 'GH-456-JK', 'Renault', 'Clio V', '1.0 TCe 90ch Intens', '2021-04-15', 38500, 'Essence', 'Manuelle', 5, 'Gris Titanium', 14990.00, 'En stock / En ligne', 'Autosphere Nantes Ouest'),
('VF3CCHNZT56789012', 'EF-123-AB', 'Peugeot', '208 II', '1.2 PureTech 100ch Allure Pack', '2022-01-10', 24100, 'Essence', 'Automatique', 5, 'Jaune Faro', 17490.00, 'Vendu', 'Autosphere Nantes Ouest'),
('WBA31AY0508B12345', 'CD-789-EF', 'BMW', 'Serie 3', '320d 190ch M Sport', '2020-09-22', 65200, 'Diesel', 'Automatique', 10, 'Noir Saphir', 29900.00, 'Livre', 'Autosphere Lyon Sud'),
('5YJ3E1EB8MF123456', 'KL-321-MN', 'Tesla', 'Model 3', 'Standard Plus 325ch', '2021-11-05', 41000, '100% Electrique', 'Automatique', 6, 'Blanc Nacre', 26800.00, 'Reconditionnement atelier', 'Autosphere Paris Nord');

INSERT INTO Photo (id_photo, URL, rang, VIN) VALUES
('PHT001', 'https://media.autosphere.fr/photos/clio5_avant.jpg', 1, 'VF1RJA00567891234'),
('PHT002', 'https://media.autosphere.fr/photos/clio5_profil.jpg', 2, 'VF1RJA00567891234'),
('PHT003', 'https://media.autosphere.fr/photos/clio5_interieur.jpg', 3, 'VF1RJA00567891234'),
('PHT004', 'https://media.autosphere.fr/photos/208_face.jpg', 1, 'VF3CCHNZT56789012'),
('PHT005', 'https://media.autosphere.fr/photos/bmw_avant.jpg', 1, 'WBA31AY0508B12345');

INSERT INTO Bon_de_commande (Reference, Date_d_emission, Mode_de_financement, Date_de_livraison, Matricule, Reference_unique, VIN) VALUES
('CMD-2024-0001', '2024-02-14', 'Credit classique', '2024-02-28', 'EMP001', 'CLI000000001', 'VF3CCHNZT56789012'),
('CMD-2024-0002', '2024-03-01', 'Comptant', '2024-03-10', 'EMP003', 'CLI000000002', 'WBA31AY0508B12345');