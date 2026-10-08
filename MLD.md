| Table (Relation) | Attributs (* = Clé primaire, # = Clé étrangère) |
| :--- | :--- |
| **Concession** | **\*Nom_commercial**, Adresse_postale, Code_postal, Ville, Telephone |
| **Vehicule** | **\*VIN**, Immatriculation, Marque, Modele, Version_Finition, Date_PMC, Kilometrage, Energie, Transmission, Puissance, Couleur, Prix_de_vente_TTC, Cycle_de_vie, **#Nom_commercial** |
| **Employe** | **\*Matricule**, Nom, Prenom, Email_pro, Fonction, **#Nom_commercial** |
| **Client** | **\*Reference_unique**, Statut_juridique, Nom, Prenom, Telephone, Email, Adresse_postale |
| **Bon_de_commande** | **\*Reference**, Date_d_emission, Mode_de_financement, Date_de_livraison, **#Matricule**, **#Reference_unique**, **#VIN** |
| **Photo** | **\*id_photo**, URL, rang, **#VIN** |


![image](https://git.nekocorp.fr/EFREI-Projects/Intro-BDD-Miniprojet-1/raw/branch/main/MLD.png)
