## Miniprojet 1 Database


#### Prompt initial 

> Tu travailles dans le domaine de la distribution automobile et de la vente de véhicules d'occasion (VO) reconditionnés multimarques. Ton entreprise a comme activité de racheter, reconditionner, exposer et vendre des véhicules d'occasion à des particuliers ou à des professionnels, à travers un réseau de concessions physiques et une vitrine digitale. C’est une entreprise comme Autosphere, Aramisauto ou Autohero. Des données ont été collectées sur les véhicules en stock (caractéristiques, état, visuels et cycle de vie), les points de vente physiques, le personnel commercial et administratif, ainsi que les clients acheteurs et les actes de vente. Inspire-toi du site web et du réseau de concessions du groupe Autosphere (autosphere.fr).

> Ton entreprise veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c’est-à-dire de collecter les besoins auprès de l’entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu’il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données.

> D’abord, établis les règles de gestions des données de ton entreprise, sous la forme d'une liste à puce. Elle doit correspondre aux informations que fournit quelqu’un qui connaît le fonctionnement de l’entreprise, mais pas comment se construit un système d’information.

> Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite.

> Fournis donc les règles de gestion et le dictionnaire de données.


### Cahier des charges 

#### 1. Règles de gestion (Métier)

*   Chaque véhicule d'occasion qui entre dans notre réseau possède un numéro de série unique au monde (numéro de châssis / VIN) et une plaque d'immatriculation.
*   Pour chaque véhicule, on renseigne ses informations techniques et commerciales : la marque, le modèle, la version ou finition précise, l'année de première immatriculation, la couleur, le type d'énergie (essence, diesel, hybride, 100 % électrique), le type de transmission (boîte manuelle ou automatique) et la puissance fiscale en chevaux fiscaux.
*   Le kilométrage réel affiché au compteur est relevé et certifié à l'entrée du véhicule dans notre parc.
*   Chaque véhicule possède un prix de vente affiché toutes taxes comprises (TTC), non négociable sur la vitrine digitale.
*   Un véhicule traverse plusieurs étapes dans son cycle de vie ; il a donc un statut opérationnel précis à tout moment (ex. : *En arrivage*, *En reconditionnement atelier*, *En stock / En ligne*, *Réservé*, *Vendu*, *Livré*).
*   Pour alimenter le catalogue en ligne (vitrine web à la façon d'Autosphere), plusieurs photographies numériques sont prises pour chaque véhicule une fois son reconditionnement terminé. Chaque photo dispose d'un lien d'accès et d'un rang d'affichage (pour définir la vue principale de face, le profil, l'habitacle, etc.).
*   À un instant donné, un véhicule en stock est rattaché physiquement à un point de vente précis (concession ou centre de reconditionnement/hub).
*   Chaque concession du réseau est repérée par son nom commercial, dispose d'une adresse géographique complète (rue, code postal, ville) et d'une ligne téléphonique directe d'accueil.
*   Notre personnel (conseillers commerciaux, préparateurs, secrétariat de livraison) est identifié par un matricule interne. Pour chaque collaborateur, on conserve son nom, son prénom, son adresse e-mail professionnelle ainsi que sa fonction (poste occupé).
*   Chaque collaborateur est affecté administrativement à une concession principale du réseau.
*   Nos clients peuvent être des particuliers ou des professionnels (sociétés, artisans). Nous enregistrons leur identité (nom ou raison sociale, prénom pour les particuliers), leurs coordonnées de contact direct (numéro de téléphone mobile/fixe, e-mail) et leur adresse postale complète.
*   Lorsqu'un accord est conclu pour l'achat d'un véhicule, un bon de commande officiel est généré avec une référence unique et sa date d'établissement.
*   Un bon de commande porte systématiquement sur un seul véhicule d'occasion identifié (les véhicules d'occasion étant des pièces uniques en stock).
*   Chaque bon de commande est conclu avec un client unique et géré par un unique conseiller commercial référent.
*   Le bon de commande précise la solution de règlement retenue (comptant, crédit classique, location avec option d'achat - LOA) ainsi que la date prévisionnelle ou confirmée de livraison au client.

---

#### 2. Dictionnaire de données brutes

Le tableau ci-dessous recense l'ensemble des données élémentaires nécessaires à notre activité opérationnelle, sans préjuger de la manière dont elles seront découpées ou reliées dans les futurs modèles conceptuels.

| Signification de la donnée | Type | Taille en nombre de caractères ou de chiffres |
| :--- | :--- | :--- |
| Numéro de châssis international du véhicule (VIN) | Alphanumérique | 17 caractères |
| Numéro d'immatriculation du véhicule | Alphanumérique | 10 caractères |
| Marque constructeur du véhicule | Alphabétique | 30 caractères |
| Modèle commercial du véhicule | Alphanumérique | 40 caractères |
| Version ou niveau de finition du véhicule | Alphanumérique | 60 caractères |
| Date de première mise en circulation | Date | 10 caractères (AAAA-MM-JJ) |
| Kilométrage certifié au compteur | Numérique (entier) | 7 chiffres |
| Énergie / Carburant principal | Alphabétique | 20 caractères |
| Type de boîte de vitesses | Alphabétique | 15 caractères |
| Puissance fiscale (en CV) | Numérique (entier) | 3 chiffres |
| Couleur de la carrosserie | Alphabétique | 30 caractères |
| Prix de vente TTC affiché | Numérique (décimal) | 9 chiffres (dont 2 décimales) |
| Statut du cycle de vie du véhicule | Alphabétique | 25 caractères |
| Lien URL de la photographie du véhicule | Alphanumérique | 255 caractères |
| Numéro d'ordre d'affichage de la photo | Numérique (entier) | 2 chiffres |
| Nom commercial de la concession | Alphanumérique | 50 caractères |
| Adresse de la concession (numéro et voie) | Alphanumérique | 100 caractères |
| Code postal de la concession | Numérique | 5 chiffres |
| Ville d'implantation de la concession | Alphabétique | 50 caractères |
| Numéro de téléphone de la concession | Alphanumérique | 15 caractères |
| Matricule interne du collaborateur | Alphanumérique | 10 caractères |
| Nom de famille du collaborateur | Alphabétique | 50 caractères |
| Prénom du collaborateur | Alphabétique | 50 caractères |
| Adresse e-mail professionnelle du collaborateur | Alphanumérique | 80 caractères |
| Fonction / Rôle du collaborateur | Alphabétique | 30 caractères |
| Référence unique du client | Alphanumérique | 12 caractères |
| Statut juridique du client (Particulier ou Professionnel) | Alphabétique | 15 caractères |
| Nom de famille ou Raison sociale du client | Alphanumérique | 80 caractères |
| Prénom du client | Alphabétique | 50 caractères |
| Numéro de téléphone de contact du client | Alphanumérique | 15 caractères |
| Adresse e-mail de contact du client | Alphanumérique | 80 caractères |
| Adresse postale complète du client | Alphanumérique | 150 caractères |
| Référence du bon de commande | Alphanumérique | 15 caractères |
| Date d'émission du bon de commande | Date | 10 caractères (AAAA-MM-JJ) |
| Mode de financement choisi | Alphabétique | 20 caractères |
| Date de livraison convenue ou effective | Date | 10 caractères (AAAA-MM-JJ) |

*(Total : 36 données élémentaires recouvrant les aspects véhicules, photos, concessions, personnel, clients et transactions).*



## Note sur le stockage de données a contrainte

Certains champs ont des champs a contrainte car ils ont un nombre fini et connu de choix possibles, par exemple : Le statut du cycle de vie du véhicule. 

Ce champ possède un nombre fini et connu de possibilités :
- En attente reconditionnement
- En recoditionnement atelier
- En vente
- Réservé
- Vendu 

Le stockage de ce type de données sous forme étendue en `VARCHAR` n'est pas la solution la plus optimisée. 

Ici la méthode MERISE et le contexte académique nous impose de créer une base de donnée avec des champs énnormes, mais "dans la vraie vie", on stocke plutot un slug ou un numéro qu'on remplace a la volée dans le code de l'application client. 

L'avantage que ca nous donne c'est que si notre entreprise s'étend a l'étranger, par exemple, il nous suffit d'adapter le code de notre page web pour fournir un site dans la langue du pays, a partir du slug. Meme chose si le département marketing souhaite changer le nom d'un champ. 

Il suffit de changer le code de la page web, pas le contenu du champ concerné pour toutes les entrées. 

L'autre avantage est que ca accélère les transactions et ca réduit la taille générale de la base de données sur le disque. 

Voici un exemple d'implémentation en PHP pour l'exemple ci dessus 

```php
[...]
$lifecycleLabel = match (intval($row['Cycle_de_vie'])) {
    1 => 'En attente recoditionnement',
    2 => 'En recoditionnement atelier',
    3 => 'En vente',
    4 => 'Réservé',
    5 => 'Vendu',
    default => 'Inconnu',
};

echo "<div class='energy'>Statut du véhicule : {$lifecycleyLabel}</div>";
[...]
```




### Espace de travail utilisé 

https://git.nekocorp.fr/EFREI-Projects/kasm_db_workbench



