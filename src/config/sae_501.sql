-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2023 at 02:28 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sae_501`
--

-- --------------------------------------------------------

--
-- Table structure for table `entreprise`
--

CREATE TABLE `entreprise` (
  `id_entreprise` int(11) NOT NULL,
  `nom_entreprise` varchar(100) NOT NULL,
  `dpt_entreprise` varchar(100) NOT NULL,
  `ville_entreprise` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entreprise`
--

INSERT INTO `entreprise` (`id_entreprise`, `nom_entreprise`, `dpt_entreprise`, `ville_entreprise`) VALUES
(2, 'Solo-Q', 'Malte', 'La Valette'),
(3, 'Schneider', 'Charente', 'Angoulême'),
(4, 'Carrefour', 'Auvergne', 'Givors');

-- --------------------------------------------------------

--
-- Table structure for table `entretien`
--

CREATE TABLE `entretien` (
  `id_entretien` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_entreprise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entretien`
--

INSERT INTO `entretien` (`id_entretien`, `id_etudiant`, `id_entreprise`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 2, 3),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

CREATE TABLE `etudiant` (
  `id_etudiant` int(11) NOT NULL,
  `id_formation` int(11) NOT NULL,
  `nom_etudiant` varchar(100) NOT NULL,
  `prenom_etudiant` varchar(100) NOT NULL,
  `tel_etudiant` varchar(50) NOT NULL,
  `email_etudiant` varchar(100) NOT NULL,
  `mp_etudiant` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`id_etudiant`, `id_formation`, `nom_etudiant`, `prenom_etudiant`, `tel_etudiant`, `email_etudiant`, `mp_etudiant`) VALUES
(1, 2, 'Smirnov', 'Ilya', '06 30 12 45 68', 'ismirnov@etu.univ-poitiers.fr', 'ab6fd602559fab6fadd1559fab6fcbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db'),
(2, 3, 'Smirenove', 'Illya', '06 35 24 85 26', 'ismirenove@etu.univ-poitiers.fr', 'ab6fd602559fab6fadd1559fab6fcbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db'),
(3, 4, 'smyrnof', 'ily\'a', '06 35 48 69 54', 'ismyrnof@etu.univ-poitiers.fr', 'ab6fd602559fab6fadd1559fab6fcbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db'),
(4, 2, 'Smiernovo', 'illyha', '06 36 78 95 54', 'ismiernovo@etu.univ-poitiers.fr', 'ab6fd602559fab6fadd1559fab6fcbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db'),
(5, 2, 'smerinov', 'ilia', '06 24 25 49 57', 'ismerinov@etu.univ-poitiers.fr', 'ab6fd602559fab6fadd1559fab6fcbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db'),
(6, 3, 'sumerinof', 'ylia', '06 15 48 35 79', 'isumerinof@eut.univ-poitiers.fr', 'ab6fd602559fab6fadd1559fab6fcbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db');

-- --------------------------------------------------------

--
-- Table structure for table `formation`
--

CREATE TABLE `formation` (
  `id_formation` int(11) NOT NULL,
  `nom_BUT` varchar(50) NOT NULL,
  `annee_BUT` int(1) NOT NULL,
  `nom_resp_stage` varchar(50) NOT NULL,
  `prenom_resp_stage` varchar(50) NOT NULL,
  `email_resp_stage` varchar(50) NOT NULL,
  `mp_resp_stage` varchar(255) NOT NULL,
  `date_deb_insc` date NOT NULL,
  `date_fin_insc` date NOT NULL,
  `nb_max_entretiens` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formation`
--

INSERT INTO `formation` (`id_formation`, `nom_BUT`, `annee_BUT`, `nom_resp_stage`, `prenom_resp_stage`, `email_resp_stage`, `mp_resp_stage`, `date_deb_insc`, `date_fin_insc`, `nb_max_entretiens`) VALUES
(2, 'MMI', 2, 'Bachir', 'Smail', 'sbachir@univ-poitiers.fr', 'ab6fd602559fab6fadd1559fab6fcbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', '2023-09-30', '2023-10-05', 3),
(3, 'MMI', 2, 'Chaulet', 'Bernadette', 'bchaulet@univ-poitiers.fr', 'ab6fd602559fab6fadd1559fab6fcbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', '2023-09-21', '2023-10-20', 4),
(4, 'MMI', 1, 'Badulescu', 'Cristina', 'cbadulescu@univ-poitiers.fr', 'ab6fd602559fab6fadd1559fab6fcbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', '2023-09-14', '2023-10-04', 5);

-- --------------------------------------------------------

--
-- Table structure for table `offre`
--

CREATE TABLE `offre` (
  `id_offre` int(11) NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  `id_formation` int(11) NOT NULL,
  `fichier_offre` varchar(50) NOT NULL,
  `ref_offre` varchar(50) NOT NULL,
  `commentaires` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offre`
--

INSERT INTO `offre` (`id_offre`, `id_entreprise`, `id_formation`, `fichier_offre`, `ref_offre`, `commentaires`) VALUES
(4, 4, 2, 'euhouieuhlefichierdel\'offre.pdf', 'MMI3_siteCarrouf', 'euh oui le site carrouf là il est pas ouf en vrai quoi(coubeh)'),
(5, 2, 3, 'lefichierdel\'offrelàààà.pdf', 'MMI2_créaNumPhotosSite', 'Photoshoot cosplay mdr (furry)'),
(6, 3, 4, 'maislefichierlààààààà.pdf', 'MMI1_updateWordpress', 'le wordpress il est nul là ptn wordpress de con j\'cromprend rien mdr aled stp'),
(7, 2, 2, 'fichierdeconilestoulà.pdf', 'MMI3_tournageIRL', 'faut tourner la vidéo sexe là xxx attention c cho!!!!!');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`id_entreprise`);

--
-- Indexes for table `entretien`
--
ALTER TABLE `entretien`
  ADD PRIMARY KEY (`id_entretien`),
  ADD KEY `FK_id_etudiant_entretien` (`id_etudiant`),
  ADD KEY `FK_id_entreprise_entretien` (`id_entreprise`);

--
-- Indexes for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id_etudiant`),
  ADD KEY `FK_id_formation_etud` (`id_formation`);

--
-- Indexes for table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id_formation`);

--
-- Indexes for table `offre`
--
ALTER TABLE `offre`
  ADD PRIMARY KEY (`id_offre`),
  ADD KEY `FK_id_entreprise` (`id_entreprise`),
  ADD KEY `FK_id_formation` (`id_formation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `id_entreprise` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `entretien`
--
ALTER TABLE `entretien`
  MODIFY `id_entretien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `formation`
--
ALTER TABLE `formation`
  MODIFY `id_formation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `offre`
--
ALTER TABLE `offre`
  MODIFY `id_offre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `entretien`
--
ALTER TABLE `entretien`
  ADD CONSTRAINT `FK_id_entreprise_entretien` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprise`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_id_etudiant_entretien` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `FK_id_formation_etud` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id_formation`);

--
-- Constraints for table `offre`
--
ALTER TABLE `offre`
  ADD CONSTRAINT `FK_id_entreprise` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprise`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_id_formation` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id_formation`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;