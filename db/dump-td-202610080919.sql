/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 172.52.0.2    Database: td
-- ------------------------------------------------------
-- Server version	10.11.19-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Bon_de_commande`
--

DROP TABLE IF EXISTS `Bon_de_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bon_de_commande` (
  `Reference` varchar(15) NOT NULL,
  `Date_d_emission` date DEFAULT NULL,
  `Mode_de_financement` varchar(20) DEFAULT NULL,
  `Date_de_livraison` date DEFAULT NULL,
  `Matricule` varchar(10) NOT NULL,
  `Reference_unique` varchar(12) NOT NULL,
  `VIN` varchar(17) NOT NULL,
  PRIMARY KEY (`Reference`),
  UNIQUE KEY `VIN` (`VIN`),
  KEY `Matricule` (`Matricule`),
  KEY `Reference_unique` (`Reference_unique`),
  CONSTRAINT `Bon_de_commande_ibfk_1` FOREIGN KEY (`Matricule`) REFERENCES `Employe` (`Matricule`),
  CONSTRAINT `Bon_de_commande_ibfk_2` FOREIGN KEY (`Reference_unique`) REFERENCES `Client` (`Reference_unique`),
  CONSTRAINT `Bon_de_commande_ibfk_3` FOREIGN KEY (`VIN`) REFERENCES `Vehicule` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bon_de_commande`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `Bon_de_commande` WRITE;
/*!40000 ALTER TABLE `Bon_de_commande` DISABLE KEYS */;
INSERT INTO `Bon_de_commande` VALUES
('CMD-2024-0001','2024-02-14','Credit classique','2024-02-28','EMP001','CLI000000001','VF3CCHNZT56789012'),
('CMD-2024-0002','2024-03-01','Comptant','2024-03-10','EMP003','CLI000000002','WBA31AY0508B12345');
/*!40000 ALTER TABLE `Bon_de_commande` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Client` (
  `Reference_unique` varchar(12) NOT NULL,
  `Statut_juridique` varchar(15) DEFAULT NULL,
  `Nom` varchar(80) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `Telephone` varchar(15) DEFAULT NULL,
  `Email` varchar(80) DEFAULT NULL,
  `Adresse_postale` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Reference_unique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES
('CLI000000001','Particulier','Martin','Alexandre','0612345678','alexandre.martin@email.fr','14 Rue de la Paix, 44000 Nantes'),
('CLI000000002','Particulier','Petit','Emma','0687654321','emma.petit@email.fr','5 Place Bellecour, 69002 Lyon'),
('CLI000000003','Professionnel','SARL Plomberie Express',NULL,'0145789632','contact@plomberie-express.fr','22 Rue des Artisans, 95100 Argenteuil'),
('CLI000000004','Particulier','Roux','Lucas','0754128963','lucas.roux@email.fr','8 Avenue Jean Jaures, 69100 Villeurbanne');
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `Concession`
--

DROP TABLE IF EXISTS `Concession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Concession` (
  `Nom_commercial` varchar(50) NOT NULL,
  `Adresse_postale` varchar(100) DEFAULT NULL,
  `Code_postal` varchar(5) DEFAULT NULL,
  `Ville` varchar(50) DEFAULT NULL,
  `Telephone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Nom_commercial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Concession`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `Concession` WRITE;
/*!40000 ALTER TABLE `Concession` DISABLE KEYS */;
INSERT INTO `Concession` VALUES
('Autosphere Lyon Sud','45 Avenue de l\'Automobile','69200','Venissieux','0478123456'),
('Autosphere Nantes Ouest','12 Rue des Concessionnaires','44800','Saint-Herblain','0240123456'),
('Autosphere Paris Nord','8 Boulevard du Parisis','95130','Franconville','0139123456');
/*!40000 ALTER TABLE `Concession` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `Employe`
--

DROP TABLE IF EXISTS `Employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employe` (
  `Matricule` varchar(10) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `Email_pro` varchar(80) DEFAULT NULL,
  `Fonction` varchar(30) DEFAULT NULL,
  `Nom_commercial` varchar(50) NOT NULL,
  PRIMARY KEY (`Matricule`),
  KEY `Nom_commercial` (`Nom_commercial`),
  CONSTRAINT `Employe_ibfk_1` FOREIGN KEY (`Nom_commercial`) REFERENCES `Concession` (`Nom_commercial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employe`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `Employe` WRITE;
/*!40000 ALTER TABLE `Employe` DISABLE KEYS */;
INSERT INTO `Employe` VALUES
('EMP001','Dubois','Thomas','t.dubois@autosphere-nantes.fr','Conseiller commercial','Autosphere Nantes Ouest'),
('EMP002','Moreau','Camille','c.moreau@autosphere-nantes.fr','Secretaire commerciale','Autosphere Nantes Ouest'),
('EMP003','Lefebvre','Julien','j.lefebvre@autosphere-lyon.fr','Conseiller commercial','Autosphere Lyon Sud'),
('EMP004','Bernard','Sophie','s.bernard@autosphere-paris.fr','Conseiller commercial','Autosphere Paris Nord');
/*!40000 ALTER TABLE `Employe` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `Photo`
--

DROP TABLE IF EXISTS `Photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Photo` (
  `id_photo` varchar(10) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `rang` decimal(2,0) DEFAULT NULL,
  `VIN` varchar(17) NOT NULL,
  PRIMARY KEY (`id_photo`),
  KEY `VIN` (`VIN`),
  CONSTRAINT `Photo_ibfk_1` FOREIGN KEY (`VIN`) REFERENCES `Vehicule` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Photo`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `Photo` WRITE;
/*!40000 ALTER TABLE `Photo` DISABLE KEYS */;
INSERT INTO `Photo` VALUES
('PHT001','https://media.autosphere.fr/photos/clio5_avant.jpg',1,'VF1RJA00567891234'),
('PHT002','https://media.autosphere.fr/photos/clio5_profil.jpg',2,'VF1RJA00567891234'),
('PHT003','https://media.autosphere.fr/photos/clio5_interieur.jpg',3,'VF1RJA00567891234'),
('PHT004','https://media.autosphere.fr/photos/208_face.jpg',1,'VF3CCHNZT56789012'),
('PHT005','https://media.autosphere.fr/photos/bmw_avant.jpg',1,'WBA31AY0508B12345');
/*!40000 ALTER TABLE `Photo` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `Vehicule`
--

DROP TABLE IF EXISTS `Vehicule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vehicule` (
  `VIN` varchar(17) NOT NULL,
  `Immatriculation` varchar(10) DEFAULT NULL,
  `Marque` varchar(30) DEFAULT NULL,
  `Modele` varchar(30) DEFAULT NULL,
  `Version_Finition` varchar(50) DEFAULT NULL,
  `Date_PMC` date DEFAULT NULL,
  `Kilometrage` int(11) DEFAULT NULL,
  `Energie` varchar(20) DEFAULT NULL,
  `Transmission` varchar(15) DEFAULT NULL,
  `Puissance` smallint(6) DEFAULT NULL,
  `Couleur` varchar(30) DEFAULT NULL,
  `Prix_de_vente_TTC` decimal(9,2) DEFAULT NULL,
  `Cycle_de_vie` varchar(25) DEFAULT NULL,
  `Nom_commercial` varchar(50) NOT NULL,
  PRIMARY KEY (`VIN`),
  KEY `Nom_commercial` (`Nom_commercial`),
  CONSTRAINT `Vehicule_ibfk_1` FOREIGN KEY (`Nom_commercial`) REFERENCES `Concession` (`Nom_commercial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicule`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `Vehicule` WRITE;
/*!40000 ALTER TABLE `Vehicule` DISABLE KEYS */;
INSERT INTO `Vehicule` VALUES
('5YJ3E1EB8MF123456','KL-321-MN','Tesla','Model 3','Standard Plus 325ch','2021-11-05',41000,'100% Electrique','Automatique',6,'Blanc Nacre',26800.00,'Reconditionnement atelier','Autosphere Paris Nord'),
('VF1RJA00567891234','GH-456-JK','Renault','Clio V','1.0 TCe 90ch Intens','2021-04-15',38500,'Essence','Manuelle',5,'Gris Titanium',14990.00,'En stock / En ligne','Autosphere Nantes Ouest'),
('VF3CCHNZT56789012','EF-123-AB','Peugeot','208 II','1.2 PureTech 100ch Allure Pack','2022-01-10',24100,'Essence','Automatique',5,'Jaune Faro',17490.00,'Vendu','Autosphere Nantes Ouest'),
('WBA31AY0508B12345','CD-789-EF','BMW','Serie 3','320d 190ch M Sport','2020-09-22',65200,'Diesel','Automatique',10,'Noir Saphir',29900.00,'Livre','Autosphere Lyon Sud');
/*!40000 ALTER TABLE `Vehicule` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Dumping routines for database 'td'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-10-08  9:19:48
