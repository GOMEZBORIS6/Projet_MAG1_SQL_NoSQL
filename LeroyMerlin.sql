DROP DATABASE IF EXISTS leroymerlin;

CREATE DATABASE leroymerlin;
USE leroymerlin;


drop table if exists Client ;
drop table if exists Commande_clt ;
drop table if exists Remise ;
drop table if exists Reglement_clt ;
drop table if exists Facture_vente ;
drop table if exists Livraison_clt ;
drop table if exists Taxe;
drop table if exists Categorie;
drop table if exists Sous_Categorie;
drop table if exists Produit;
drop table if exists Ligne_livraison;
drop table if exists Ligne_commande;
drop table if exists Fact_Vte_Prod;
drop table if exists Promotion_produit;
drop table if exists Stock;
drop table if exists Quantite_prod;
drop table if exists Inventaire;
drop table if exists Stock_Inventaire;
drop table if exists Fournisseur;
drop table if exists Commande_frs;
drop table if exists Produit_Commande_frs;
drop table if exists Modele;
drop table if exists Modele_Commande_frs;
drop table if exists Pieces;
drop table if exists Payement_frs;
drop table if exists Facture_Achat;


CREATE TABLE Client (
  id_clt int(11) NOT NULL,
  nom_clt varchar(255) DEFAULT NULL,
  prenom_clt varchar(255) DEFAULT NULL,
  date_naissance_clt date DEFAULT NULL,
  civilite_clt varchar(255) DEFAULT NULL,
  adresse_mail_clt varchar(255) DEFAULT NULL,
  ville_clt varchar(255) DEFAULT NULL,
  telephone_clt varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO Client (id_clt, nom_clt, prenom_clt, date_naissance_clt, civilite_clt, adresse_mail_clt, ville_clt, telephone_clt) VALUES
(1, 'Diallo', 'marion', '2014-01-24', 'Monsieur', 'diallom@gmail.com', 'Marseille', '0625147825'),
(2, 'kall', 'matt', '2010-01-12', 'Monsieur', 'kall@gmail.com', 'Paris', '0614587593'),
(3, 'Egon', 'deyaert', '1999-04-26', 'Monsieur', 'egon@gmail.com', 'Roubaix', '0784152395'),
(4, 'Alpha', 'Barry', '1976-06-20', 'Monsieur', NULL, 'Lille', '07548886254'),
(5, 'Gautier', 'jade', '1998-05-29', 'Madame', 'jadeg@gmail.com', 'Lyon', '0625147825'),
(6, 'Bernard', 'louis', '2010-08-14', 'Monsieur', 'bernard@gmail.com', 'Bordeaux', NULL),
(7, 'Petit', 'alice', '2003-10-25', 'Madame', 'alice@gmail.com', 'Marseille', NULL),
(8, 'Roux', 'mia', '2001-03-01', 'Madame', NULL, 'Bordeaux', '0756421893'),
(9, 'Laurent', 'leo', '2003-09-04', 'Monsieur', 'laurent@gmail.com', 'Paris', NULL),
(10, 'Girard', 'rose', '2009-11-16', 'Madame', 'rose@gmail.com', 'Paris', '0745846523'),
(11, 'Renaud', 'ambre', '2005-04-15', 'Madame', NULL, 'Bordeaux', '0615428476'),
(12, 'Caron', 'chloe', '2002-07-23', 'Madame', 'chloecaron@gmail.com', 'Lille', NULL),
(13, 'Jacquet', 'mael', '2001-05-17', 'Monsieur', 'mael@gmail.com', 'Roubaix', NULL),
(14, 'Fleury', 'adam', '2001-12-06', 'Monsieur', NULL, 'Bordeaux', '0611254875'),
(15, 'Morel', 'hugo', '2001-12-30', 'Monsieur', 'hugo@gmail.com', 'Lyon', NULL);

CREATE TABLE Commande_clt (
  id_cmd_clt int(11) NOT NULL,
  id_clt int(11) NOT NULL,
  date_cmd datetime DEFAULT NULL,
  date_livraison datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Commande_clt (id_cmd_clt, id_clt, date_cmd, date_livraison) VALUES
(1, 3, '2014-01-15 00:00:00', '2014-01-24 00:00:00'),
(2, 6, '2014-03-12 00:00:00', '2014-03-26 00:00:00'),
(3, 9,'2014-03-27 00:00:00', '2014-04-06 00:00:00'),
(4, 10, '2014-06-21 00:00:00', '2014-06-28 00:00:00'),
(5, 2, '2014-03-18 00:00:00', '2014-04-02 00:00:00'),
(6, 5, '2014-08-11 00:00:00', '2014-08-17 00:00:00'),
(7, 15, '2014-06-18 00:00:00', '2014-06-26 00:00:00'),
(8, 4, '2014-08-09 00:00:00', '2014-08-19 00:00:00'),
(9, 11, '2014-03-20 00:00:00', '2014-03-27 00:00:00'),
(10, 12, '2014-03-24 00:00:00', '2014-04-06 00:00:00'),
(11, 13, '2014-04-20 00:00:00', '2014-04-27 00:00:00'),
(12, 7, '2014-06-16 00:00:00', '2014-06-30 00:00:00'),
(13, 1, '2014-08-11 00:00:00', '2014-08-16 00:00:00'),
(14, 8, '2014-03-13 00:00:00', '2014-03-21 00:00:00'),
(15, 14, '2014-08-15 00:00:00', '2014-08-20 00:00:00');

CREATE TABLE Remise (
  id_remise int(11) NOT NULL,
  id_clt int(11) NOT NULL,
  pourcent_remise double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into Remise (id_remise, id_clt, pourcent_remise) values
(1, 2, 0.15),
(2, 5, 0.18),
(3, 6, 0.22),
(4, 9, 0.15),
(5, 11, 0.24),
(6, 1, 0.15),
(7, 4, 0.11),
(8, 10, 0.2),
(9, 12, 0.21),
(10, 14, 0.19),
(11, 15, 0.24),
(12, 7, 0.15),
(13, 8, 0.18),
(14, 13, 0.12),
(15, 3, 0.19);

CREATE TABLE Reglement_clt (   
  id_reglement int(11) NOT NULL,
  date_reglement datetime DEFAULT NULL,
  Moyens_reglement varchar(255) DEFAULT NULL,
  echeance_reglement varchar(255) DEFAULT NULL,
  montant_reglement decimal(19,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



Insert into Reglement_clt (id_reglement, date_reglement, Moyens_reglement, echeance_reglement, montant_reglement) values
(1,'2014-01-15 00:00:00', 'cartes', '3 mois', 1.800),
(2, '2014-03-12 00:00:00','espèce', '2 mois', 2.970 ),
(3, '2014-03-27 00:00:00', 'cartes', '3 mois', 1.890),
(4, '2014-06-21 00:00:00', 'cartes', '5 mois', 1.590),
(5, '2014-03-18 00:00:00', 'espèce', '6 mois', 3.340),
(6, '2014-08-11 00:00:00', 'cheques', '7 mois', 3.990),
(7, '2014-06-18 00:00:00', 'cartes', '7 mois', 1.850),
(8, '2014-08-09 00:00:00', 'espèce', '4 mois', 2.450),
(9, '2014-03-20 00:00:00', 'cartes', '1 mois', 1.880),
(10, '2014-03-24 00:00:00', 'cheques', '2 mois', 0.890),
(11, '2014-04-20 00:00:00', 'cartes', '5 mois', 5.450),
(12, '2014-06-16 00:00:00', 'cartes', '6 mois', 2.400),
(13, '2014-08-11 00:00:00', 'espèce', '1 mois', 3.990),
(14, '2014-03-13 00:00:00', 'cheques', '11 mois', 1.840),
(15, '2014-08-15 00:00:00', 'cheques', '12 mois', 4.290);

CREATE TABLE Facture_vente (   
  id_fact_vte int(11) NOT NULL,
  id_clt int(11) NOT NULL,
  id_reglement int(11) NOT NULL,
  num_fact_vte varchar(255) DEFAULT NULL,
  date_fact_vte datetime DEFAULT NULL,
  date_vte datetime DEFAULT NULL,
  montant_HT_vte decimal(19,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Facture_vente (id_fact_vte, id_clt, id_reglement, num_fact_vte, date_fact_vte, date_vte, montant_HT_vte) VALUES
(1, 2, 11, '0012', '2014-01-16 00:00:00', '2014-01-15 00:00:00', 2.600),
(2, 5, 2, '0013', '2014-03-12 00:00:00', '2014-03-12 00:00:00', 3.400),
(3, 6, 4, '0014', '2014-03-27 00:00:00', '2014-03-27 00:00:00', 1.502),
(4, 9, 10, '0010', '2014-06-21 00:00:00', '2014-06-20 00:00:00', 4.250),
(5, 11, 5, '0101', '2014-03-18 00:00:00', '2014-03-17 00:00:00', 1.840),
(6, 1, 6, '0102', '2014-08-11 00:00:00', '2014-08-10 00:00:00', 5.456),
(7, 4, 1, '0103', '2014-06-18 00:00:00', '2014-06-17 00:00:00', 0.840),
(8, 10, 3, '0104', '2014-08-09 00:00:00', '2014-08-09 00:00:00', 1.880),
(9, 12, 7, '0015', '2014-08-19 00:00:00', '2014-08-19 00:00:00', 1.995),
(10, 14, 15, '0108', '2014-03-24 00:00:00', '2014-03-23 00:00:00', 2.450),
(11, 15, 12, '0109', '2014-03-21 00:00:00', '2014-03-21 00:00:00', 1.850),
(12, 7, 14, '0150', '2014-06-16 00:00:00', '2014-06-16 00:00:00', 2.330),
(13, 8, 13, '0144', '2014-08-11 00:00:00', '2014-08-11 00:00:00', 2.560),
(14, 13, 9, '0111', '2014-03-13 00:00:00', '2014-03-13 00:00:00', 1.684),
(15, 3, 8, '0001', '2014-08-15 00:00:00', '2014-03-14 00:00:00', 0.560);

CREATE TABLE Livraison_clt (   
  id_bon_livraison int(11) NOT NULL,
  id_cmd_clt int(11) NOT NULL,
  date_bl_clt datetime DEFAULT NULL,
  Total_bl_clt int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into Livraison_clt(id_bon_livraison, id_cmd_clt, date_bl_clt, Total_bl_clt) values
(1, 11, '2014-01-15 00:00:00', 1500),
(2, 2, '2014-03-12 00:00:00', 1000),
(3, 4, '2014-03-27 00:00:00', 1025),
(4, 10, '2014-06-20 00:00:00', 900),
(5, 5,'2014-03-17 00:00:00', 2800),
(6, 6, '2014-08-10 00:00:00', 5456),
(7, 1, '2014-06-17 00:00:00', 840),
(8, 3, '2014-08-09 00:00:00', 1880),
(9, 7, '2014-08-19 00:00:00', 1995),
(10, 15, '2014-03-23 00:00:00', 2450),
(11, 12, '2014-03-21 00:00:00', 1850),
(12, 14, '2014-06-16 00:00:00', 2430),
(13, 13, '2014-08-11 00:00:00', 2560),
(14, 9, '2014-03-13 00:00:00', 1684),
(15, 8, '2014-03-14 00:00:00', 5600);


CREATE TABLE Taxe (   
  id_tax int(11) NOT NULL,
  libelle_tax varchar(255) DEFAULT NULL,
  date_valeur_tax datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Taxe (id_tax, libelle_tax, date_valeur_tax) VALUES
(1, 'TVA', '2014-01-15 00:00:00'),
(2, 'La taxe intérieure de consommation sur les produits énergétiques', '2014-03-12 00:00:00'),
(3, 'La taxe foncière', '2014-03-27 00:00:00'),
(4, 'La taxe foncière', '2014-06-20 00:00:00'),
(5, 'La taxe intérieure de consommation sur les produits énergétiques ','2014-03-17 00:00:00'),
(6, 'TVA', '2014-08-10 00:00:00'),
(7, 'La taxe habitation', '2014-06-17 00:00:00'),
(8, 'La taxe intérieure de consommation sur les produits énergétiques ', '2014-08-09 00:00:00'),
(9, 'TVA', '2014-08-19 00:00:00'),
(10, 'La taxe intérieure de consommation sur les produits énergétiques ', '2014-03-23 00:00:00'),
(11, 'TVA', '2014-03-21 00:00:00'),
(12, 'La taxe habitation', '2014-06-16 00:00:00'),
(13, 'La taxe intérieure de consommation sur les produits énergétiques ', '2014-08-11 00:00:00'),
(14, 'La taxe foncière', '2014-03-13 00:00:00'),
(15, 'La taxe habitation', '2014-03-14 00:00:00');


CREATE TABLE Categorie (   
  id_categorie int(11) NOT NULL,
  nom_categorie varchar(255) DEFAULT NULL,
  type_categorie varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into Categorie (id_categorie, nom_categorie, type_categorie) values
(1, 'Terrasse et sol exterieur', 'Terrasse et jardin'),
(2,'Salon et mobilier de jardin', 'Terrasse et jardin' ),
(3,'cloture,grillage,occultation', 'Terrasse et jardin'),
(4, 'Abri,garage et rangement', 'Terrasse et jardin'),
(5, 'bassin et decoration de jardin', 'Terrasse et jardin'),
(6, 'Luminaire interieur', 'Decoration et eclairage'),
(7, 'Ampoule,tube, néons', 'Decoration et eclairage'),
(8, 'Eclairage extérieur', 'Decoration et eclairage'),
(9, 'Eclairage connecté', 'Decoration et eclairage'),
(10, 'Rideau, voilage et vitrage', 'Decoration et eclairage'),
(11, 'Meuble de salle de bains', 'Salle de bains'),
(12, 'Vasque et lavabo', 'Salle de bains'),
(13, 'Miroir salle de bains', 'Salle de bains'),
(14, 'Robinet', 'Salle de bains'),
(15, 'Douche', 'Salle de bains');

CREATE TABLE Sous_Categorie (   
  id_sous_categorie int(11) NOT NULL,
  id_categorie int(11) NOT NULL,
  nom_sous_categorie varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into Sous_Categorie (id_sous_categorie, id_categorie, nom_sous_categorie) values
(1, 5, 'Fontaine'),
(2, 2, 'salon de jardin'),
(3, 6, 'Lustre et suspension'),
(4, 9, 'spot connecté'),
(5, 1, 'Lame de terrase'),
(6, 11, 'Meuble vasque'),
(7, 4, 'Abri de jardin'),
(8, 14, 'Robinet de douche'),
(9, 12, 'Vasque à poser'),
(10, 10, 'Rideau'),
(11, 15, 'Cabine de douche'),
(12, 7, 'Ampoule LED'),
(13, 8, 'Applique Exterieur'),
(14, 13, 'Miroir lumineux'),
(15, 3, 'cloture à compenser');

CREATE TABLE Produit (   
  id_prod int(11) NOT NULL,
  id_sous_categorie int(11) NOT NULL,
  id_tax int(11) NOT NULL,
  nom_prod varchar(255) DEFAULT NULL,
  prix_prod decimal(19,3) DEFAULT NULL,
  largeur_prod double DEFAULT NULL,
  hauteur_prod int DEFAULT NULL,
  Epaisseur_cadre double DEFAULT NULL,
  matiere_prod varchar(255) DEFAULT NULL,
  type_panneau varchar(255) DEFAULT NULL,
  couleur_prod varchar(255) DEFAULT NULL,
  garantie_constructeur_an int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Produit (id_prod, id_sous_categorie, id_tax, nom_prod, 
prix_prod, largeur_prod, hauteur_prod, Epaisseur_cadre, matiere_prod, type_panneau, couleur_prod, garantie_constructeur_an) VALUES
(1, 5, 4, 'Fontaine de jardin en pierre', 159.00, 42.0, 76, NULL, 'Pierre reconstituée', NULL, 'Gris', 1),
(2, 2, 1, 'Salon de jardin résine', 990.00, 500.0,NULL, 50.0, 'Résine tressé',NULL,'Marron', 5),
(3, 6, 3, 'Suspension pour salon', 29.90, NULL, NULL, NULL, 'Metal',NULL, 'Argent', 1),
(4, 9, 2, 'Spot encadré connecté bluetooth', 22.90,NULL, NULL, NULL, NULL,NULL,'Blanc', 1),
(5, 1, 5, 'Lame de terrasse bois', 12.04, 14.5, 205, 15.4, 'bois', NULL, 'beige', NULL),
(6, 11, 8, 'Meuble de salle de bains en bois', 189.00, 99.0, NULL, NULL, 'bois', NULL, 'Vert', 5),
(7, 4, 6, 'Abri de jardin Metal', 319.00, 500.0, 3000, 500.0,'Metal', NULL, 'Argent', 10),
(8, 14, 7, 'Mitigeur de douche', 89.90, NULL, NULL, NULL, NULL, NULL, 'Argent', 2),
(9, 12, 9, 'Vasque à poser céramique rectangulaire', 85.00, NULL, NULL, NULL, NULL, NULL, 'Blanc', NULL),
(10, 10, 15, 'Rideau occulatant', 46.90,350.0, 300, NULL, 'Polyester', NULL, 'Jaune', 1),
(11, 15, 10, 'Cabine de douche hamman', 5761.80, 100.0, NULL, NULL, 'Résine', NULL, 'Blanc', 10),
(12, 7, 11, 'Ampoule E27', 11.90, NULL, NULL, NULL, NULL, NULL, 'blanc ', 1),
(13, 8, 12, 'Applique Extérieur module LED', 29.90, NULL, NULL, NULL, NULL, NULL, 'Noir', 2),
(14, 13, 14, 'Miroir avec éclairage intégré Diam', 240.00, 128.0,128, NULL, NULL, 'Sensitif', 'Blanc', 2),
(15, 3, 13, 'cloture béton', 29.90, 0.9, 240, 1.7, 'béton', NULL, 'noir', 1 );


CREATE TABLE Ligne_livraison (
    id_bon_livraison int(11) NOT NULL,
    id_prod int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


Insert into Ligne_livraison( id_bon_livraison, id_prod) VALUES
(1, 5),
(2, 2),
(3, 6),
(4, 9),
(5, 1),
(6, 11),
(7, 4),
(8, 14),
(9, 12),
(10, 10),
(11, 15),
(12, 7),
(13, 8),
(14, 13),
(15, 3);

CREATE TABLE Ligne_commande (
    id_cmd_clt int(11) NOT NULL,
    id_prod int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Ligne_commande (id_cmd_clt, id_prod) VALUES
(1, 2),
(2, 5),
(3, 6),
(4, 9),
(5, 11),
(6, 1),
(7, 4),
(8, 10),
(9, 12),
(10, 14),
(11, 15),
(12, 7),
(13, 8),
(14, 13),
(15, 3);

CREATE TABLE Fact_Vte_Prod (
    id_fact_vte int(11) NOT NULL,
    id_prod int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into Fact_Vte_Prod (id_fact_vte, id_prod) values
(1, 5),
(2, 2),
(3, 6),
(4, 9),
(5, 1),
(6, 11),
(7, 4),
(8, 14),
(9, 12),
(10, 10),
(11, 15),
(12, 7),
(13, 8),
(14, 13),
(15, 3);

CREATE TABLE Promotion_produit (
    id_promo_prod int(11) NOT NULL,
    id_prod int(11) NOT NULL,
    pourcent_promo double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into Promotion_produit (id_promo_prod, id_prod, pourcent_promo) values
(1, 2, 0.25),
(2, 5, 0.48),
(3, 6, 0.22),
(4, 9, 0.15),
(5, 11, 0.24),
(6, 1, 0.15),
(7, 4, 0.31),
(8, 10, 0.2),
(9, 12, 0.21),
(10, 14, 0.19),
(11, 15, 0.24),
(12, 7, 0.25),
(13, 8, 0.18),
(14, 13, 0.12),
(15, 3, 0.49);

CREATE TABLE Stock (
    id_stock int(11) NOT NULL,
    stock_min int DEFAULT NULL,
    stock_max int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into Stock (id_stock, stock_min, stock_max) values
(1, 20, 2500),
(2, 50, 4800),
(3, 60, 2200),
(4, 90, 1500),
(5, 110, 2400),
(6, 100, 1500),
(7, 40, 3100),
(8, 100, 2000),
(9, 120, 20010),
(10, 140, 1900),
(11, 150, 2400),
(12, 70, 2500),
(13, 80, 1800),
(14, 130, 1200),
(15, 151, 4900);

CREATE TABLE Quantite_prod (
    id_stock int(11) NOT NULL,
    id_prod int(11) NOT NULL,
    quantite int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Quantite_prod (id_stock,id_prod, quantite) VALUES
(1, 2, 25),
(2, 5, 48),
(3, 6, 22),
(4, 9, 15),
(5, 11, 24),
(6, 1, 15),
(7, 4, 31),
(8, 10, 2),
(9, 12, 21),
(10, 14, 19),
(11, 15, 24),
(12, 7, 25),
(13, 8, 18),
(14, 13, 12),
(15, 3, 49);


CREATE TABLE Inventaire (
    Date_inventaire datetime NOT NULL,
    quantite_inventorier int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into Inventaire (Date_inventaire,quantite_inventorier) values
('2014-01-15 00:00:00', 20),
('2014-03-12 00:00:00', 45),
('2014-03-27 00:00:00', 20),
( '2014-06-20 00:00:00', 15),
('2014-03-17 00:00:00', 22),
('2014-08-10 00:00:00', 10),
('2014-06-17 00:00:00', 30),
('2014-08-09 00:00:00', 2),
('2014-08-19 00:00:00', 17),
('2014-03-23 00:00:00', 15),
('2014-03-21 00:00:00', 20),
('2014-06-16 00:00:00', 20),
('2014-08-11 00:00:00', 10),
('2014-03-13 00:00:00', 5),
('2014-03-14 00:00:00', 35);

CREATE TABLE Stock_Inventaire (
    id_stock int(11) NOT NULL,
    Date_inventaire datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Stock_Inventaire (id_stock, Date_inventaire) VALUES
(11, '2014-01-15 00:00:00'),
( 2, '2014-03-12 00:00:00'),
( 4, '2014-03-27 00:00:00'),
( 10, '2014-06-20 00:00:00'),
( 5,'2014-03-17 00:00:00'),
( 6, '2014-08-10 00:00:00'),
( 1, '2014-06-17 00:00:00'),
( 3, '2014-08-09 00:00:00'),
( 7, '2014-08-19 00:00:00'),
( 15, '2014-03-23 00:00:00'),
( 12, '2014-03-21 00:00:00'),
( 14, '2014-06-16 00:00:00'),
( 13, '2014-08-11 00:00:00'),
( 9, '2014-03-13 00:00:00'),
( 8, '2014-03-14 00:00:00');

CREATE TABLE Fournisseur (
    id_frs int(11) NOT NULL,
    nom_frs varchar(255) DEFAULT NULL,
    adresse_mail_frs varchar(255) DEFAULT NULL,
    ville_frs varchar(255) DEFAULT NULL,
    telephone_frs varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into Fournisseur (id_frs,nom_frs, adresse_mail_frs,ville_frs,telephone_frs) values
(1, 'Garcia', 'garcia@gmail.com', 'Marseille', '0625157825'),
(2, 'Renaud', 'renaud@gmail.com', 'Paris', '0614587573'),
(3, 'Martin', 'martin@gmail.com', 'Roubaix', '0714152395'),
(4, 'Dupont', NULL, 'Lille', '07648886254'),
(5, 'Dubois', 'dubois@gmail.com', 'Lyon', '0625147820'),
(6, 'Pages', 'pages@gmail.com', 'Bordeaux', NULL),
(7, 'Fabre','fabre@gmail.com', 'Marseille', NULL),
(8, 'Roux', NULL, 'Bordeaux', '0756421890'),
(9, 'Laurenzo', 'laurenzo@gmail.com', 'Paris', NULL),
(10, 'Marty', 'Marty@gmail.com', 'Paris', '0745846520'),
(11, 'Solez', NULL, 'Bordeaux', '0615428471'),
(12, 'Oliver', 'olivier@gmail.com', 'Lille', NULL),
(13, 'Morel','morel@gmail.com', 'Roubaix', NULL),
(14, 'Meyer', NULL, 'Bordeaux', '0611254870'),
(15, 'Faure', 'Faure@gmail.com', 'Lyon', NULL);


CREATE TABLE Commande_frs (
    id_cmd_frs int(11) NOT NULL,
    id_frs int(11) NOT NULL,
    Date_cmd_frs datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into Commande_frs (id_cmd_frs, id_frs, Date_cmd_frs) values
(1, 11, '2014-01-15 00:00:00'),
(2, 2, '2014-03-12 00:00:00'),
(3, 4, '2014-03-27 00:00:00'),
(4, 10, '2014-06-20 00:00:00'),
(5, 5,'2014-03-17 00:00:00'),
(6, 6, '2014-08-10 00:00:00'),
(7, 1, '2014-06-17 00:00:00'),
(8, 3, '2014-08-09 00:00:00'),
(9, 7, '2014-08-19 00:00:00'),
(10, 15, '2014-03-23 00:00:00'),
(11, 12, '2014-03-21 00:00:00'),
(12, 14, '2014-06-16 00:00:00'),
(13, 13, '2014-08-11 00:00:00'),
(14, 9, '2014-03-13 00:00:00'),
(15, 8, '2014-03-14 00:00:00');

CREATE TABLE Produit_Commande_frs (
    id_cmd_frs int(11) NOT NULL,
    id_prod int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into Produit_Commande_frs (id_cmd_frs, id_prod) values
(1, 5),
(2, 2),
(3, 6),
(4, 9),
(5, 1),
(6, 11),
(7, 4),
(8, 14),
(9, 12),
(10, 10),
(11, 15),
(12, 7),
(13, 8),
(14, 13),
(15, 3);

CREATE TABLE Modele (
    num_modele varchar(255) NOT NULL,
    taille double DEFAULT NULL,
    stock_reserve int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into Modele (num_modele, taille, stock_reserve) values
('014A', 1.50, 25),
('124A', 1.20, 12),
('45B', 6.0, 400),
('7887C', 0.90, 54),
('145S', 1.10, 45),
('144A', 1.10, 56),
('56Q', 0.40, 89),
('54C', 1.40, 56),
('154A', 1.20, 78),
('2555E', 1.00, 789),
('648E', 1.50, 700),
('111A', 1.70, 140),
('122A', 0.80, NULL),
('211R', 1.30, NULL),
('685D', 1.50, 568);

CREATE TABLE Modele_Commande_frs (
    num_modele varchar(255) NOT NULL,
    id_cmd_frs int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into Modele_Commande_frs ( num_modele, id_cmd_frs) values
('014A', 1),
('124A', 2),
('45B', 3),
('7887C', 4),
('145S', 5),
('144A', 6),
('56Q', 9),
('54C', 7),
('154A', 8),
('2555E', 10),
('648E', 11),
('111A', 14),
('122A', 12),
('211R', 13),
('685D', 15);


CREATE TABLE Pieces (
    id_pieces int(11) NOT NULL,
    num_modele varchar(255) NOT NULL,
    id_frs int(11) NOT NULL,
    prix_cmd decimal(19,3) DEFAULT NULL,
    delai_livraison_jr int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Pieces (id_pieces, num_modele, id_frs, prix_cmd, delai_livraison_jr) VALUES
(1, '014A', 1, 3.400, 21),
(2, '124A', 2, 1.502, 12),
(3,'45B', 3, 4.251, 6),
(4, '7887C', 4, 1.880, 5),
(5, '145S', 5, 5.682, 4),
(6, '144A', 6, 0.450, 6),
(7, '56Q', 9, 1.840, NULL),
(8, '54C', 7, 4.250, NULL),
(9, '154A', 8, 2.330, 5),
(10, '2555E', 10, 1.684, 45),
(11, '648E', 11, 0.564, 8),
(12, '111A', 14, 1.995, NULL),
(13, '122A', 12, 2.445, NULL),
(14, '211R', 13, 1.502, 7),
(15, '685D', 15, 3.115, 23);


CREATE TABLE Payement_frs (   
  id_payement int(11) NOT NULL,
  date_payement datetime DEFAULT NULL,
  Moyens_payement varchar(255) DEFAULT NULL,
  echeance_payement varchar(255) DEFAULT NULL,
  montant_payement decimal(19,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

Insert into Payement_frs (id_payement, date_payement, Moyens_payement, echeance_payement, montant_payement) values
(1,'2014-01-15 00:00:00', 'cartes', '4 mois', 2.800),
(2, '2014-03-12 00:00:00','espèce', '2 mois', 1.970 ),
(3, '2014-03-27 00:00:00', 'cartes', '3 mois', 5.890),
(4, '2014-06-21 00:00:00', 'cartes', '5 mois', 2.590),
(5, '2014-03-18 00:00:00', 'espèce', '6 mois', 3.340),
(6, '2014-08-11 00:00:00', 'cheques', '7 mois', 3.990),
(7, '2014-06-18 00:00:00', 'cartes', '8 mois', 1.850),
(8, '2014-08-09 00:00:00', 'espèce', '4 mois', 1.450),
(9, '2014-03-20 00:00:00', 'cartes', '1 mois', 1.880),
(10, '2014-03-24 00:00:00', 'cheques', '2 mois', 0.890),
(11, '2014-04-20 00:00:00', 'cartes', '5 mois', 4.450),
(12, '2014-06-16 00:00:00', 'cartes', '7 mois', 2.400),
(13, '2014-08-11 00:00:00', 'espèce', '1 mois', 3.990),
(14, '2014-03-13 00:00:00', 'cheques', '11 mois', 1.840),
(15, '2014-08-15 00:00:00', 'cheques', '1 mois', 3.290);

CREATE TABLE Facture_Achat (   
  id_fact_ach int(11) NOT NULL,
  id_frs int(11) NOT NULL,
  id_payement int(11) NOT NULL,
  num_fact_ach varchar(255) DEFAULT NULL,
  date_fact_ach datetime DEFAULT NULL,
  date_ach datetime DEFAULT NULL,
  montant_HT_ach decimal(19,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Facture_Achat (id_fact_ach, id_frs, id_payement, num_fact_ach, date_fact_ach, date_ach, montant_HT_ach) VALUES
(1, 2, 11, '0012', '2014-01-16 00:00:00', '2014-01-15 00:00:00', 1.604),
(2, 5, 2, '0016', '2014-03-12 00:00:00', '2014-03-12 00:00:00', 3.415),
(3, 6, 4, '0014', '2014-03-27 00:00:00', '2014-03-27 00:00:00', 5.502),
(4, 9, 10, '0010', '2014-06-21 00:00:00', '2014-06-20 00:00:00', 2.250),
(5, 11, 5, '0101', '2014-03-18 00:00:00', '2014-03-17 00:00:00', 3.840),
(6, 1, 6, '0102', '2014-08-11 00:00:00', '2014-08-10 00:00:00', 6.456),
(7, 4, 1, '0107', '2014-06-18 00:00:00', '2014-06-17 00:00:00', 1.840),
(8, 10, 3, '0104', '2014-08-09 00:00:00', '2014-08-09 00:00:00', 2.880),
(9, 12, 7, '0015', '2014-08-19 00:00:00', '2014-08-19 00:00:00', 3.995),
(10, 14, 15, '0108', '2014-03-24 00:00:00', '2014-03-23 00:00:00', 1.450),
(11, 15, 12, '0109', '2014-03-21 00:00:00', '2014-03-21 00:00:00', 1.850),
(12, 7, 14, '0156', '2014-06-16 00:00:00', '2014-06-16 00:00:00', 1.330),
(13, 8, 13, '0144', '2014-08-11 00:00:00', '2014-08-11 00:00:00', 2.560),
(14, 13, 9, '0111', '2014-03-13 00:00:00', '2014-03-13 00:00:00', 2.684),
(15, 3, 8, '0001', '2014-08-15 00:00:00', '2014-03-14 00:00:00', 0.560);

ALTER TABLE Client
  ADD PRIMARY KEY (id_clt);

ALTER TABLE Commande_clt
  ADD PRIMARY KEY (id_cmd_clt),
  ADD FOREIGN KEY (id_clt) REFERENCES Client (id_clt);

ALTER TABLE Remise
  ADD PRIMARY KEY (id_remise),
  ADD FOREIGN KEY (id_clt) REFERENCES Client (id_clt);

ALTER TABLE Reglement_clt
  ADD PRIMARY KEY (id_reglement);

ALTER TABLE Facture_vente
  ADD PRIMARY KEY (id_fact_vte),
  ADD FOREIGN KEY (id_clt) REFERENCES Client (id_clt),
  ADD FOREIGN KEY (id_reglement) REFERENCES Reglement_clt (id_reglement); 

ALTER TABLE Livraison_clt
  ADD PRIMARY KEY (id_bon_livraison),
  ADD FOREIGN KEY (id_cmd_clt) REFERENCES Commande_clt (id_cmd_clt);

ALTER TABLE Taxe
  ADD PRIMARY KEY (id_tax);

ALTER TABLE Categorie
  ADD PRIMARY KEY (id_categorie);

ALTER TABLE Sous_Categorie
  ADD PRIMARY KEY (id_sous_categorie),
  ADD FOREIGN KEY (id_categorie) REFERENCES Categorie (id_categorie);

ALTER TABLE Produit
  ADD PRIMARY KEY (id_prod),
  ADD FOREIGN KEY (id_tax) REFERENCES Taxe (id_tax),
  ADD FOREIGN KEY (id_sous_categorie) REFERENCES Sous_Categorie (id_sous_categorie);

ALTER TABLE Ligne_livraison
  ADD FOREIGN KEY (id_bon_livraison) REFERENCES Livraison_clt (id_bon_livraison),
  ADD FOREIGN KEY (id_prod) REFERENCES Produit (id_prod);

ALTER TABLE Ligne_commande
  ADD FOREIGN KEY (id_cmd_clt) REFERENCES Commande_clt (id_cmd_clt),
  ADD FOREIGN KEY (id_prod) REFERENCES Produit (id_prod);

ALTER TABLE Fact_Vte_Prod
  ADD FOREIGN KEY (id_fact_vte) REFERENCES Facture_vente (id_fact_vte),
  ADD FOREIGN KEY (id_prod) REFERENCES Produit (id_prod);

ALTER TABLE Promotion_produit
  ADD PRIMARY KEY (id_promo_prod),
  ADD FOREIGN KEY (id_prod) REFERENCES Produit (id_prod);

ALTER TABLE Stock
  ADD PRIMARY KEY (id_stock);

ALTER TABLE Quantite_prod
  ADD FOREIGN KEY (id_prod) REFERENCES Produit (id_prod),
  ADD FOREIGN KEY (id_stock) REFERENCES Stock (id_stock);

ALTER TABLE Inventaire
  ADD PRIMARY KEY (date_inventaire);

ALTER TABLE Stock_Inventaire
  ADD FOREIGN KEY (date_inventaire) REFERENCES Inventaire (date_inventaire),
  ADD FOREIGN KEY (id_stock) REFERENCES Stock (id_stock);

ALTER TABLE Fournisseur
  ADD PRIMARY KEY (id_frs);

ALTER TABLE Commande_frs
  ADD PRIMARY KEY (id_cmd_frs),
  ADD FOREIGN KEY (id_frs) REFERENCES Fournisseur (id_frs);

ALTER TABLE Produit_Commande_frs
  ADD FOREIGN KEY (id_prod) REFERENCES Produit (id_prod),
  ADD FOREIGN KEY (id_cmd_frs) REFERENCES Commande_frs (id_cmd_frs);

ALTER TABLE Modele
  ADD PRIMARY KEY (num_modele);

ALTER TABLE Modele_Commande_frs
  ADD FOREIGN KEY (num_modele) REFERENCES Modele (num_modele),
  ADD FOREIGN KEY (id_cmd_frs) REFERENCES Commande_frs (id_cmd_frs);

ALTER TABLE Pieces
  ADD PRIMARY KEY (id_pieces),
  ADD FOREIGN KEY (num_modele) REFERENCES Modele (num_modele),
  ADD FOREIGN KEY (id_frs) REFERENCES Fournisseur (id_frs);

ALTER TABLE Payement_frs
  ADD PRIMARY KEY (id_payement);

ALTER TABLE Facture_Achat
  ADD PRIMARY KEY (id_fact_ach),
  ADD FOREIGN KEY (id_frs) REFERENCES Fournisseur (id_frs),
  ADD FOREIGN KEY (id_payement) REFERENCES Payement_frs (id_payement); 


