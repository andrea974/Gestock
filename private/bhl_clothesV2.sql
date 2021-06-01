-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `bhl_clothes`;
CREATE DATABASE `bhl_clothes` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `bhl_clothes`;

DELIMITER ;;

CREATE PROCEDURE `recherche_avis_mot`(mot VARCHAR(100) )
BEGIN 
   SELECT * FROM avis WHERE commentaire LIKE CONCAT('%', mot , '%');
END;;

DELIMITER ;

DROP TABLE IF EXISTS `avis`;
CREATE TABLE `avis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idClient` int(11) NOT NULL,
  `idVet` int(11) NOT NULL,
  `commentaire` text NOT NULL,
  `note` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `valide` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idClient` (`idClient`),
  KEY `idVet` (`idVet`),
  CONSTRAINT `avis_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `client` (`id`),
  CONSTRAINT `avis_ibfk_2` FOREIGN KEY (`idVet`) REFERENCES `vetement` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

INSERT INTO `avis` (`id`, `idClient`, `idVet`, `commentaire`, `note`, `date`, `valide`) VALUES
(1,	8,	1,	'woooooaaaww',	4,	'2020-10-05 21:48:01',	1),
(2,	1,	7,	'Tshirt de bonne qualité qui taille un peu large. Parfait pour faire un style oversize ! ',	5,	'2020-10-09 17:30:14',	0),
(3,	5,	6,	'Short de bonne qualité, conforme à la photo',	4,	'2020-10-01 21:55:01',	1),
(4,	1,	1,	'Je trouve que la robe est un peu transparente à la lumière mais ce problème est vite réglé avec un petit short en dessous',	4,	'2020-10-06 21:57:09',	1),
(5,	6,	1,	'Elle correspond à mes attentes et la livraison était plutôt rapide! \r\nBon produit',	5,	'2020-10-10 21:58:28',	1),
(6,	8,	11,	'Je suis déçu, la texture blanchit facilement. ',	1,	'2020-10-11 00:03:20',	1),
(7,	11,	10,	'Ce pantalon est sympa mais un peu grand pour un 36',	3,	'2020-10-13 20:40:17',	0),
(8,	4,	4,	'Matière souple et confortable. Bon pull',	4,	'2020-10-13 20:51:44',	1),
(9,	22,	15,	'Bon produit! ',	5,	'2020-10-25 19:19:13',	0),
(10,	22,	28,	'Pull très confortable de bonne qualité!',	5,	'2020-10-25 19:20:25',	0),
(11,	23,	50,	'Que dire de plus le site des marques et vous est excellent pour les délais de livraison commande passée le 25/10/20 au soir colis reçu le 26/10/20 en relais colis mondial !Les articles toujours satisfaisants pas de retour a effectuer tout est parfait .Ce site est un de mes préférés! Ne changeait rien des marques et vous! Bravo pour votre réactivité et merci pour les petits carambars dans le colis!!!!',	5,	'2020-10-25 20:03:08',	0),
(22,	11,	17,	'Tshirt souple idéal pour l\'été. Bon achat',	4,	'2020-11-01 13:50:00',	0),
(23,	5,	46,	'Veste très confortable, bien taillé complètement mon style! ',	5,	'2020-11-01 06:30:52',	0),
(24,	10,	47,	'Déçu de cette veste, la couleur s\'en va dès le troisième lavage...',	2,	'2020-07-12 12:50:52',	0),
(25,	7,	47,	'Bonne veste, aucun problème au lavage pour ma part',	4,	'2020-09-17 22:14:17',	0),
(27,	22,	34,	'Short conforme à la photo, les couleurs sont magnifiques et tiennent bien au lavage. 	',	4,	'2020-07-25 09:45:52',	1),
(28,	13,	25,	'Jupe originale de bonne qualité.',	4,	'2020-04-04 18:00:00',	0),
(29,	4,	48,	'Pull doux et confortable mais un peu serré au niveau des bras',	3,	'2020-03-14 12:50:52',	0),
(30,	3,	43,	'Bonne qualité mais taille un peu petit. ',	3,	'2020-11-01 14:14:14',	0),
(31,	6,	39,	'Bon produit',	5,	'2020-07-31 08:50:52',	0),
(32,	13,	36,	'Pantalon agréable à porter, aucun problème de taille ',	5,	'2020-06-11 15:10:59',	0),
(33,	4,	32,	'Short un peu court mais de bonne qualité. Je recommande! ',	4,	'2020-04-18 20:00:00',	0),
(34,	22,	23,	'Robe sympa pour l\'été. Matière de bonne qualité',	5,	'2020-10-29 03:45:52',	1),
(35,	13,	16,	'Ce tshirt est sympa, de bonne qualité mais j\'ai pris la mauvaise taille. Pensez à prendre plus petit que votre taille habituelle ',	4,	'2020-05-15 16:20:00',	0),
(36,	6,	10,	'Bonne qualité de tissu',	4,	'2020-07-07 05:50:52',	0),
(37,	8,	41,	'Superbe short d\'été !',	4,	'2020-11-01 19:53:08',	1),
(38,	13,	4,	'magnifique !!! gros coup de cœur\r\n',	5,	'2021-02-10 09:47:12',	0);

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `categorie` (`id`, `nom`) VALUES
(9,	'Chemisiers & Tuniques'),
(7,	'Gilets'),
(3,	'Jeans'),
(6,	'Jupes'),
(11,	'Pantacourts'),
(12,	'Pantalons'),
(4,	'Pulls'),
(1,	'Robes'),
(5,	'Shorts'),
(2,	'T-shirts & Débardeurs'),
(8,	'Vestes & Manteaux');

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `mdp` varchar(150) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `codePostal` varchar(5) NOT NULL,
  `rue` varchar(100) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `solde` float NOT NULL DEFAULT '200',
  `cleActivation` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `dateInscription` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `codePostal` (`codePostal`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`codePostal`) REFERENCES `code_postal` (`cp`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

INSERT INTO `client` (`id`, `email`, `mdp`, `nom`, `prenom`, `codePostal`, `rue`, `tel`, `solde`, `cleActivation`, `active`, `dateInscription`) VALUES
(1,	'andrea974@gmail.com',	'8aa40001b9b39cb257fe646a561a80840c806c55',	'Andréa',	'Andréa',	'97480',	'4 rue papangue',	'0692466990',	9779,	'544107c473636dc8ee1a114774d35d91a475293c',	1,	'2020-10-19 17:05:09'),
(3,	'jerem_lebon@fauxemail.fr',	'4d13fcc6eda389d4d679602171e11593eadae9b9',	'LEBON',	'Jérémy',	'97410',	'7 rue du pinguin',	'0693122478',	9582.9,	'544107c473636dc8ee1a114774d35d91a475293c',	1,	'2020-10-19 17:05:09'),
(4,	'grondin.chalotte@gmail.com',	'8aa40001b9b39cb257fe646a561a80840c806c55',	'GRONDIN',	'Charlotte',	'97410',	'3 chemin des fleurs',	'0693238645',	45.15,	'544107c473636dc8ee1a114774d35d91a475293c',	0,	'2020-10-19 17:05:09'),
(5,	'lauret.vincent@gmail.com',	'8aa40001b9b39cb257fe646a561a80840c806c55',	'LAURET',	'Vincent',	'97410',	'6 impasse du cocon',	'0692851347',	84.6,	'544107c473636dc8ee1a114774d35d91a475293c',	0,	'2020-10-19 17:05:09'),
(6,	'mathilde20@gmail.com',	'8aa40001b9b39cb257fe646a561a80840c806c55',	'PAYET',	'Mathilde',	'97410',	'9 chemin des zoizeau',	'0692753212',	984.2,	'544107c473636dc8ee1a114774d35d91a475293c',	0,	'2020-10-19 17:05:09'),
(7,	'seb_morel@outlook.com',	'8aa40001b9b39cb257fe646a561a80840c806c55',	'MOREL',	'Seb',	'97480',	'3 rue de lameme',	'0692987874',	351,	'544107c473636dc8ee1a114774d35d91a475293c',	0,	'2020-10-19 17:05:09'),
(8,	'goldow974@gmail.com',	'8aa40001b9b39cb257fe646a561a80840c806c55',	'Hoareau',	'Quentin',	'97400',	'20 rue de la république',	'0628468787',	1587.94,	'544107c473636dc8ee1a114774d35d91a475293c',	1,	'2020-10-20 13:02:48'),
(10,	'roro13@gmail.com',	'8aa40001b9b39cb257fe646a561a80840c806c55',	'Robin',	'Jean',	'97480',	'36 rue des merisier ',	'0692458595',	100,	'544107c473636dc8ee1a114774d35d91a475293c',	0,	'2020-10-19 17:05:09'),
(11,	'antho@gmail.com',	'8aa40001b9b39cb257fe646a561a80840c806c55',	'RIVIÈRE ',	'Anthony',	'97480',	'34 rue des fleurs',	'0693455667',	100,	'544107c473636dc8ee1a114774d35d91a475293c',	0,	'2020-10-19 17:05:09'),
(13,	'leahoareau@orange.fr',	'8aa40001b9b39cb257fe646a561a80840c806c55',	'Hoareau',	'Léa',	'97480',	'10 rue par ici, ter la',	'0692818484',	899.5,	'544107c473636dc8ee1a114774d35d91a475293c',	1,	'2020-10-19 17:05:09'),
(22,	'andrea.bigot974@gmail.com',	'8aa40001b9b39cb257fe646a561a80840c806c55',	'BIGOT',	'Andréa',	'97480',	'22 rue des macarons',	'0692466990',	4910,	'a3fc12f37f04ba3fa82daefe36bd945eee45682f',	1,	'2020-10-25 19:14:02'),
(23,	'ophelien.abufera.bts@gmail.com',	'ae835c4e4a9d5a8876f773313d82f0499ca3dbc6',	'ABUFERA',	'Ophelien',	'97480',	'119 rue leconte de lisle',	'0692991200',	61.61,	'cf72565d2a62067e4e33e16d9e81e366ad08dd54',	1,	'2020-10-25 19:32:53');

DELIMITER ;;

CREATE TRIGGER `after_update_client` AFTER UPDATE ON `client` FOR EACH ROW
BEGIN 
INSERT INTO client_histo VALUES(OLD.id, OLD.email,OLD.mdp,  
OLD.nom, OLD.prenom, OLD.codePostal, OLD.rue, OLD.tel, OLD.solde, OLD.cleActivation, OLD.active, OLD.dateInscription, NOW(),  "UPDATE");
END;;

CREATE TRIGGER `after_delete_client` AFTER DELETE ON `client` FOR EACH ROW
BEGIN 
INSERT INTO client_histo VALUES(OLD.id, OLD.email,OLD.mdp,  
OLD.nom, OLD.prenom, OLD.codePostal, OLD.rue, OLD.tel, OLD.solde, OLD.cleActivation, OLD.active, OLD.dateInscription, NOW(),  "DELETE");
END;;

DELIMITER ;

DROP TABLE IF EXISTS `code_postal`;
CREATE TABLE `code_postal` (
  `cp` varchar(5) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `prixLiv` float NOT NULL DEFAULT '30',
  PRIMARY KEY (`cp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `code_postal` (`cp`, `libelle`, `prixLiv`) VALUES
('97400',	'Saint-Denis',	30),
('97410',	'Saint-Pierre',	30),
('97412',	'Bras-Panon',	30),
('97413',	'Cilaos',	0),
('97414',	'Entre-Deux',	30),
('97419',	'La Possession',	30),
('97420',	'Le port',	30),
('97425',	'Les Avirons',	30),
('97426',	'Trois-Bassins',	30),
('97427',	'L\'Etang-salé',	30),
('97429',	'Petit-Ile',	1.5),
('97430',	'Tampon',	2.2),
('97431',	'La Plaine des Palmistes',	30),
('97433',	'Salazie',	30),
('97436',	'Saint-Leu',	30),
('97438',	'Sainte-Marie',	30),
('97439',	'Sainte-Rose',	30),
('97440',	'Saint-André',	30),
('97441',	'Sainte-Suzanne',	30),
('97442',	'Saint-Philippe',	30),
('97450',	'Saint-Louis',	30),
('97460',	'Saint-Paul',	30),
('97470',	'Saint-Benoit',	30),
('97480',	'Saint-Joseph',	2);

DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre` (
  `code` varchar(1) NOT NULL,
  `libelle` varchar(20) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `libelle` (`libelle`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `genre` (`code`, `libelle`) VALUES
('F',	'Femme'),
('H',	'Homme'),
('M',	'Mixte');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pwd` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` (`id`, `name`, `pwd`) VALUES
(1,	'andrea',	'123456');

DROP TABLE IF EXISTS `vetement`;
CREATE TABLE `vetement` (
  `id` int(11) NOT NULL,
  `nom` varchar(80) NOT NULL,
  `prix` float NOT NULL,
  `motifPosition` varchar(150) DEFAULT '',
  `codeGenre` varchar(1) NOT NULL,
  `description` text NOT NULL,
  `idCateg` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `numGenre` (`codeGenre`),
  KEY `idCateg` (`idCateg`),
  CONSTRAINT `vetement_ibfk_2` FOREIGN KEY (`idCateg`) REFERENCES `categorie` (`id`),
  CONSTRAINT `vetement_ibfk_3` FOREIGN KEY (`codeGenre`) REFERENCES `genre` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `vetement` (`id`, `nom`, `prix`, `motifPosition`, `codeGenre`, `description`, `idCateg`) VALUES
(1,	'Robe D\'Eté Superposée Fleurie Imprimée',	35.5,	NULL,	'F',	'Petite robe imprimée en coton avec des bretelles fines. Matières: rayonne.        ',	1),
(2,	'Short de Survêtement à Cordon',	10,	NULL,	'F',	'Short court à cordon. Matière: coton.',	5),
(3,	'T-shirt Manche longue unicolore',	15,	NULL,	'F',	'Tshirt manche longue en coton.',	2),
(4,	'Pull Court Simple Surdimensionné',	37,	NULL,	'F',	'Pull court manches longues. Matières: coton, polyester',	4),
(5,	'Pull Court Rayé à Col Rond',	38.2,	NULL,	'F',	'Pull rayé manches longues au col rond. Matières: polyester, coton',	4),
(6,	'Short Décontracté En Couleur Jointive à Taille Elastique',	13.8,	NULL,	'H',	'Matières: Polyamide',	5),
(7,	'T-shirt Motif De Lettre Dessin Animé',	15,	NULL,	'H',	'T-shirt pour homme en coton, col rond.',	2),
(8,	'Pull Tordu à Epaule Dénudée',	20,	NULL,	'F',	'Pull qui décore avec un design torsadé à l\'avant. Matières: coton, polyacrylique.',	4),
(9,	'Veste Déchirée En Couleur Unie En Denim',	34.9,	NULL,	'M',	'Veste déchirée avec un col rabattu à manches longues. Matières: coton, polyester.',	8),
(10,	'Pantalon Slim Taille Haute Déchiré',	12,	'background-position: 250px;',	'F',	'Pantalon taille haute, coupe slim avec la taille élastique. Matière: coton.\r\n',	12),
(11,	'Bermuda chino uni',	15,	NULL,	'H',	'Bermuda chino uni parfait pour l\'été.',	5),
(12,	'T-shirt Graphique Grue Barboteuse Chinoise Fleurie Imprimé',	17.99,	'background-position: 305px;',	'H',	'T-shirt manches courtes imprimé en coton.',	2),
(13,	'T-shirt Court Sanglé à Col V',	10,	NULL,	'F',	'T-shirt Court Sanglé à Col V.\r\nMatières: Polyuréthane,Rayonne',	2),
(14,	'Débardeur d\'Entraînement Côtelé à Bretelle Croisée',	11,	NULL,	'F',	'Débardeur d\'Entraînement Côtelé à Bretelle Croisée. \r\nMatières: Coton,Polyester',	2),
(15,	'Haut Court Côtelé Sans Dos à Bretelle ',	12,	'background-position: 90px;',	'F',	'Haut Court Côtelé Sans Dos à Bretelle qui met en valeur la taille marquée. \r\nMatières: Polyuréthane,Rayonne',	2),
(16,	' Haut Court Côtelé à Bretelle Tordu',	15,	'background-position: 100px;',	'F',	'Haut Court Côtelé à Bretelle Trodu.\r\nHaut qui flatte la silhouette avec des fines bretelles mettant en avant le décolleté et le dos. \r\nMatières: Polyuréthane,Rayonne',	2),
(17,	'T-Shirt à Imprimé Rayures En Blocs De Couleurs',	10,	'    background-position: 180px;',	'H',	'Un t-shirt avec un motif à rayures panachées, un col rond, des manches courtes et une coupe classique.\r\nMatières: Polyester',	2),
(18,	'T-shirt Rose Brodée à Manches Courtes',	13.5,	NULL,	'H',	'T-shirt basique surmonté d\'un col rond et manches courtes.\r\nMatières: Coton,Polyester,Spandex',	2),
(19,	'Veste Déchirée Avec Poche à Rabat En Denim',	37.6,	'background-position: 85px;',	'H',	'Veste déchirée manches longues.\r\nMatières: Coton,Polyester,Spandex',	8),
(20,	'Pantalon de Survêtement Lettre Applique à Cordon en Laine',	23.5,	NULL,	'H',	'Pantalon de Survêtement avec élastique à la taille en coton.',	12),
(21,	'Pantalon Panneau En Blocs De Couleurs à Taille Elastique',	19.99,	NULL,	'H',	'Pantalon à Taille Elastique en polyesther. ',	12),
(22,	'T-shirt Rayé Chiffre Brodé à Manches Longues',	14.9,	NULL,	'H',	'T-shirt Rayé Chiffre Brodé à Manches Longues\r\nMatières: Coton,Polyacrylique,Polyester',	4),
(23,	'Robe à Bretelle Fleurie Plissée à Volants',	20,	NULL,	'F',	'Robe à Bretelle Fleurie Plissée à Volants.\r\nLes plis sont réunis avec la taille élastique et le dos smocké aide à façonner les courbes.\r\nMatières: Polyester',	1),
(24,	'Mini Robe à Carreaux Ligne A',	11.2,	NULL,	'F',	'Détendu en forme, féminin dans le style, cette robe cami dispose d\'une impression tout au long de ceindre, fines bretelles et une coupe mini longueur séduisante, dans une silhouette évasée. portez-le avec des talons pour un style charmant.\r\nMatières: Polyester',	1),
(25,	'Jupe Ligne A Teintée à Cordon',	13,	NULL,	'F',	'Jupe colorée en polyester.',	6),
(26,	'Mini Jupe Ligne A Nouée',	14,	NULL,	'F',	'Jupe courte avec une fermeture zippée. \r\nMatières: Polyester,Polyuréthane',	6),
(27,	'Short Déchiré Zippé Design En Denim',	19.65,	NULL,	'H',	'Short déchiré zippé en denim.\r\nMatières: Coton,Polyester,Spandex',	5),
(28,	'Pull Court Simple Surdimensionné - Brique Réfractaire M',	19.5,	'',	'F',	'Pull oversize, manches longues et épaule tombante.\r\nMatières: Coton,Polyester;',	4),
(29,	'Pull Court Rayé à Col Rond - Noir',	15.5,	'',	'F',	'Pull décontracté court à col rond. \r\nMatières: Coton,Polyester',	4),
(30,	'Short Paperbag Ceinturé Fleuri Imprimé à Volants - Multi Xl',	8.66,	'',	'F',	'Short souple taille haute avec une ceinture à nouer. \r\nMatières: Rayonne',	5),
(31,	'Mini Short Plissé Noué ',	10,	'',	'F',	'Short style décontracté, fermeture braguette zippée. \r\nMatières: Polyester',	5),
(32,	'Short en denim avec poche déchirée et ourlet effiloché',	17.5,	'',	'F',	'Short en denim déchiré.\r\nMatières: Coton, Polyester.',	5),
(33,	'Short Paperbag Rayé Ceinturé',	8.5,	'',	'F',	'Doté d\'un motif à rayures tout au long, ce short a une ceinture haute. La ceinture de  nouée autour de la taille ajoute du charme et de la mode. \r\nMatières: Polyester',	5),
(34,	'Short noué à volants et bordure en crochet',	9,	'',	'F',	'Short court à volants resserré à la taille avec un élastiques.\r\nMatières: Rayonne.',	5),
(35,	'Short Teinté Ceinturé à Jambe Large',	10,	'',	'F',	'Short court noué à la taille.\r\nMatières: Polyester.\r\n',	5),
(36,	'Pantalon Droit Boutonné En Velours Côtelé',	13.5,	'    background-position: 425px;',	'F',	'Pantalon droit en velours côtelé.\r\nMatières: Coton, Polyester',	12),
(37,	'Pantalon Visage Souriant Bicolore à Cordon - Multi-b L',	15.6,	'    background-position: 376px;',	'M',	'Pantalon à cordon décontracté. Tissu légèrement extensible.\r\nMatières: Polyester.',	12),
(38,	'Chemise en velours côtelé à manches longues et empiècement color-block',	20,	'',	'H',	'Veste stylée très colorée.\r\nMatières: Coton, Polyester',	8),
(39,	'Mini Robe Moulante Découpée à Col Montant ',	20,	'',	'F',	'Robe moulante manches longues.\r\nMatières: Polyester,Rayonne',	1),
(40,	'Short de bain imprimé avec cordon de serrage',	25.5,	'    background-position: 440px;',	'H',	'Short de bain en polyester avec cordon.',	5),
(41,	'Short De Plage Palmier Imprimé',	15,	'',	'H',	'Short de plage imprimé à cordon.\r\nMatières: Polyester',	5),
(42,	'Short Déchiré Jointif En Denim',	24,	'',	'H',	'Short déchiré en jean style décontracté.\r\nMatières: Coton,Polyester',	5),
(43,	'Short De Plage Rayé Fleur Imprimé à Cordon',	16,	'    background-position: 373px;',	'H',	'Short de plage court imprimé. \r\nMatières: Polyester',	5),
(44,	'Pantalon Cargo Panneau En Blocs De Couleurs à Pieds Etroits',	25.9,	'background-position: 204px;',	'H',	'Pantalon cargo type regular avec cordon de serrage.\r\nMatières: Coton',	12),
(45,	'Veste Poche à Rabat Motif De Rose',	19.5,	'',	'H',	'Veste à motif, col montant.\r\nMatières: Coton,Polyester',	8),
(46,	'Veste Décontractée Contrastée Rayée En Blocs De Couleurs à Goutte Epaule',	39.99,	'background-position: 206px;',	'H',	'Veste rayée en polyester. ',	8),
(47,	'Veste Motif De Lettre Décorée De Poche',	29.99,	'background-position: 204px;',	'H',	'Veste style décontracté en polyester.',	8),
(48,	'Sweat à Capuche Fourré Teinté Lettre Brodée',	27.99,	'',	'M',	'Sweat à capuche très doux.\r\nMatières: Coton, Polyester',	4),
(49,	'Pantalon Déchiré Zippé En Denim - Bleu 2xl',	30,	'background-position: 204px;',	'H',	'Pantalon déchiré type regular. \r\nMatières: Coton, Polyester, Polyuréthane.',	12),
(50,	'Jean Droit Déchiré Long - Noir Xl',	25,	'    background-position: 222px;',	'H',	'Jean déchiré type regular.\r\nMatières: Coton, Polyester',	3),
(51,	'Pantalon Crayon Zippé Ange en Denim - Blanc 32',	35,	'background-position: 204px;',	'H',	'Pantalon crayon type regular.\r\nMatières: Coton, Spandex.',	12),
(52,	'test',	10,	'',	'H',	'ddd',	2);

DELIMITER ;;

CREATE TRIGGER `after_insert_vetement` AFTER INSERT ON `vetement` FOR EACH ROW
BEGIN

DECLARE numVetCouleur int;
SET numVetCouleur= (SELECT max(num )+1
                    FROM vet_couleur);

INSERT INTO vet_couleur VALUES (numVetCouleur, NEW.id, "Couleur orginale", null, 1);

END;;

DELIMITER ;

-- 2021-05-31 06:25:54
