CREATE TABLE Concession(
   Nom_commercial VARCHAR(50),
   Adresse_postale VARCHAR(100),
   Code_postal VARCHAR(5),
   Ville VARCHAR(50),
   Telephone VARCHAR(15),
   PRIMARY KEY(Nom_commercial)
);

CREATE TABLE Vehicule(
   VIN VARCHAR(17),
   Immatriculation VARCHAR(10),
   Marque VARCHAR(30),
   Modele VARCHAR(30),
   Version_Finition VARCHAR(50),
   Date_PMC DATE,
   Kilometrage INT,
   Energie VARCHAR(20),
   Transmission VARCHAR(15),
   Puissance SMALLINT,
   Couleur VARCHAR(30),
   Prix_de_vente_TTC DECIMAL(9,2),
   Cycle_de_vie VARCHAR(25),
   Nom_commercial VARCHAR(50) NOT NULL,
   PRIMARY KEY(VIN),
   FOREIGN KEY(Nom_commercial) REFERENCES Concession(Nom_commercial)
);

CREATE TABLE Employe(
   Matricule VARCHAR(10),
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   Email_pro VARCHAR(80),
   Fonction VARCHAR(30),
   Nom_commercial VARCHAR(50) NOT NULL,
   PRIMARY KEY(Matricule),
   FOREIGN KEY(Nom_commercial) REFERENCES Concession(Nom_commercial)
);

CREATE TABLE Client(
   Reference_unique VARCHAR(12),
   Statut_juridique VARCHAR(15),
   Nom VARCHAR(80),
   Prenom VARCHAR(50),
   Telephone VARCHAR(15),
   Email VARCHAR(80),
   Adresse_postale VARCHAR(150),
   PRIMARY KEY(Reference_unique)
);

CREATE TABLE Bon_de_commande(
   Reference VARCHAR(15),
   Date_d_emission DATE,
   Mode_de_financement VARCHAR(20),
   Date_de_livraison DATE,
   Matricule VARCHAR(10) NOT NULL,
   Reference_unique VARCHAR(12) NOT NULL,
   VIN VARCHAR(17) NOT NULL,
   PRIMARY KEY(Reference),
   UNIQUE(VIN),
   FOREIGN KEY(Matricule) REFERENCES Employe(Matricule),
   FOREIGN KEY(Reference_unique) REFERENCES Client(Reference_unique),
   FOREIGN KEY(VIN) REFERENCES Vehicule(VIN)
);

CREATE TABLE Photo(
   id_photo VARCHAR(10),
   URL VARCHAR(255),
   rang DECIMAL(2,0),
   VIN VARCHAR(17) NOT NULL,
   PRIMARY KEY(id_photo),
   FOREIGN KEY(VIN) REFERENCES Vehicule(VIN)
);
