/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 146.245.252.140    Database: Sudarin72_db
-- ------------------------------------------------------
-- Server version	10.6.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Sudarin72_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Sudarin72_db` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `Sudarin72_db`;

--
-- Table structure for table `Assistance`
--

DROP TABLE IF EXISTS `Assistance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assistance` (
  `staffEmailAddress` varchar(150) NOT NULL,
  `staffPosition` varchar(17) DEFAULT NULL,
  `guestEmailAddress` varchar(150) NOT NULL,
  PRIMARY KEY (`staffEmailAddress`,`guestEmailAddress`),
  KEY `staffEmailAddress` (`staffEmailAddress`,`staffPosition`),
  KEY `guestEmailAddress` (`guestEmailAddress`),
  CONSTRAINT `Assistance_ibfk_1` FOREIGN KEY (`staffEmailAddress`, `staffPosition`) REFERENCES `Staff` (`emailAddress`, `position`),
  CONSTRAINT `Assistance_ibfk_2` FOREIGN KEY (`guestEmailAddress`) REFERENCES `Guests` (`emailAddress`),
  CONSTRAINT `CheckAssistPosition` CHECK (`staffPosition` in ('Front Desk Agent','Concierge'))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assistance`
--

LOCK TABLES `Assistance` WRITE;
/*!40000 ALTER TABLE `Assistance` DISABLE KEYS */;
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('liam.turner1@theroosevelthotel.com', 'Concierge', 'alice.johnson@guestmail.com');
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('robert.brown2@theplazahotel.com', 'Concierge', 'bob.smith@guestmail.com');
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('robert.brown2@theplazahotel.com', 'Concierge', 'carol.davis@guestmail.com');
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('noah.evans1@theroosevelthotel.com', 'Concierge', 'david.wilson@guestmail.com');
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('olivia.carter@theroosevelthotel.com', 'Front Desk Agent', 'eve.martinez@guestmail.com');
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('olivia.carter1@thebeaconinn.com', 'Concierge', 'frank.brown@guestmail.com');
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('sophia.moore2@desertoasisresort.com', 'Concierge', 'grace.lee@guestmail.com');
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('noah.evans2@desertoasisresort.com', 'Concierge', 'henry.clark@guestmail.com');
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('sarah.connor@thebeaconinn.com', 'Concierge', 'ivy.walker@guestmail.com');
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('liam.turner2@thebeaconinn.com', 'Concierge', 'jack.hall@guestmail.com');
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('isabella.thomas1@desertoasisresort.com', 'Concierge', 'karen.allen@guestmail.com');
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('liam.turner2@pacificharborhotel.com', 'Concierge', 'liam.young@guestmail.com');
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('robert.brown1@theplazahotel.com', 'Concierge', 'mia.hernandez@guestmail.com');
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('sarah.connor1@thebeaconinn.com', 'Concierge', 'noah.king@guestmail.com');
INSERT INTO Assistance (staffEmailAddress, staffPosition, guestEmailAddress) VALUES ('liam.turner2@thebeaconinn.com', 'Concierge', 'olivia.wright@guestmail.com');
/*!40000 ALTER TABLE `Assistance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Booking` (
  `transactionNumber` char(10) NOT NULL,
  `guestEmailAddress` varchar(30) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `roomNumber` char(4) DEFAULT NULL,
  `hotelName` varchar(30) DEFAULT NULL,
  `hotelAddress` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`transactionNumber`),
  KEY `guestEmailAddress` (`guestEmailAddress`),
  KEY `roomNumber` (`roomNumber`),
  KEY `hotelName` (`hotelName`,`hotelAddress`),
  CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`guestEmailAddress`) REFERENCES `Guests` (`emailAddress`),
  CONSTRAINT `Booking_ibfk_2` FOREIGN KEY (`roomNumber`) REFERENCES `Rooms` (`roomNumber`),
  CONSTRAINT `Booking_ibfk_3` FOREIGN KEY (`hotelName`, `hotelAddress`) REFERENCES `Hotel` (`name`, `address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000001', 'alice.johnson@guestmail.com', 331.16, 'P022', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000002', 'bob.smith@guestmail.com', 249.46, 'P069', 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000003', 'carol.davis@guestmail.com', 450.1, 'P053', 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000004', 'david.wilson@guestmail.com', 421.44, 'P067', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000005', 'eve.martinez@guestmail.com', 476.12, 'D026', 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000006', 'frank.brown@guestmail.com', 362.91, 'P101', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000007', 'grace.lee@guestmail.com', 115.62, 'P097', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000008', 'henry.clark@guestmail.com', 308.58, 'P079', 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000009', 'ivy.walker@guestmail.com', 210.25, 'P032', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000010', 'jack.hall@guestmail.com', 114.01, 'B004', 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000011', 'karen.allen@guestmail.com', 312.4, 'B015', 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000012', 'liam.young@guestmail.com', 319.89, 'R078', 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000013', 'mia.hernandez@guestmail.com', 302.06, 'R045', 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000014', 'noah.king@guestmail.com', 196.07, 'B032', 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Booking (transactionNumber, guestEmailAddress, cost, roomNumber, hotelName, hotelAddress) VALUES ('TXN0000015', 'olivia.wright@guestmail.com', 187.45, 'P114', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Events`
--

DROP TABLE IF EXISTS `Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Events` (
  `name` varchar(30) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `time` datetime NOT NULL,
  `hotelName` varchar(30) DEFAULT NULL,
  `hotelAddress` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`name`,`time`),
  KEY `hotelName` (`hotelName`,`hotelAddress`),
  CONSTRAINT `Events_ibfk_1` FOREIGN KEY (`hotelName`, `hotelAddress`) REFERENCES `Hotel` (`name`, `address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Events`
--

LOCK TABLES `Events` WRITE;
/*!40000 ALTER TABLE `Events` DISABLE KEYS */;
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Plaza Hotel Live Jazz Night', 'Live Jazz Night', '2025-06-01 18:00:00', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Plaza Hotel Wine Tasting', 'Wine Tasting', '2025-06-02 18:00:00', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Plaza Hotel Art Exhibition', 'Art Exhibition', '2025-06-03 18:00:00', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Plaza Hotel Business Seminar', 'Business Seminar', '2025-06-04 18:00:00', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Plaza Hotel Cooking Class', 'Cooking Class', '2025-06-05 18:00:00', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Plaza Hotel Yoga Session', 'Yoga Session', '2025-06-06 18:00:00', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Plaza Hotel Stand-up Comedy', 'Stand-up Comedy', '2025-06-07 18:00:00', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Plaza Hotel Movie Screening', 'Movie Screening', '2025-06-08 18:00:00', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Plaza Hotel Networking Mixer', 'Networking Mixer', '2025-06-09 18:00:00', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Plaza Hotel Charity Gala', 'Charity Gala', '2025-06-10 18:00:00', 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Roosevelt Hotel Live Jazz Night', 'Live Jazz Night', '2025-06-01 18:00:00', 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Roosevelt Hotel Wine Tasting', 'Wine Tasting', '2025-06-02 18:00:00', 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Roosevelt Hotel Art Exhibition', 'Art Exhibition', '2025-06-03 18:00:00', 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Roosevelt Hotel Business Seminar', 'Business Seminar', '2025-06-04 18:00:00', 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Roosevelt Hotel Cooking Class', 'Cooking Class', '2025-06-05 18:00:00', 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Roosevelt Hotel Yoga Session', 'Yoga Session', '2025-06-06 18:00:00', 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Roosevelt Hotel Stand-up Comedy', 'Stand-up Comedy', '2025-06-07 18:00:00', 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Roosevelt Hotel Movie Screening', 'Movie Screening', '2025-06-08 18:00:00', 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Roosevelt Hotel Networking Mixer', 'Networking Mixer', '2025-06-09 18:00:00', 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Roosevelt Hotel Charity Gala', 'Charity Gala', '2025-06-10 18:00:00', 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Beacon Inn Live Jazz Night', 'Live Jazz Night', '2025-06-01 18:00:00', 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Beacon Inn Wine Tasting', 'Wine Tasting', '2025-06-02 18:00:00', 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Beacon Inn Art Exhibition', 'Art Exhibition', '2025-06-03 18:00:00', 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Beacon Inn Business Seminar', 'Business Seminar', '2025-06-04 18:00:00', 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Beacon Inn Cooking Class', 'Cooking Class', '2025-06-05 18:00:00', 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Beacon Inn Yoga Session', 'Yoga Session', '2025-06-06 18:00:00', 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Beacon Inn Stand-up Comedy', 'Stand-up Comedy', '2025-06-07 18:00:00', 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Beacon Inn Movie Screening', 'Movie Screening', '2025-06-08 18:00:00', 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Beacon Inn Networking Mixer', 'Networking Mixer', '2025-06-09 18:00:00', 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('The Beacon Inn Charity Gala', 'Charity Gala', '2025-06-10 18:00:00', 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Pacific Harbor Hotel Live Jazz Night', 'Live Jazz Night', '2025-06-01 18:00:00', 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Pacific Harbor Hotel Wine Tasting', 'Wine Tasting', '2025-06-02 18:00:00', 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Pacific Harbor Hotel Art Exhibition', 'Art Exhibition', '2025-06-03 18:00:00', 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Pacific Harbor Hotel Business Seminar', 'Business Seminar', '2025-06-04 18:00:00', 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Pacific Harbor Hotel Cooking Class', 'Cooking Class', '2025-06-05 18:00:00', 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Pacific Harbor Hotel Yoga Session', 'Yoga Session', '2025-06-06 18:00:00', 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Pacific Harbor Hotel Stand-up Comedy', 'Stand-up Comedy', '2025-06-07 18:00:00', 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Pacific Harbor Hotel Movie Screening', 'Movie Screening', '2025-06-08 18:00:00', 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Pacific Harbor Hotel Networking Mixer', 'Networking Mixer', '2025-06-09 18:00:00', 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Pacific Harbor Hotel Charity Gala', 'Charity Gala', '2025-06-10 18:00:00', 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Desert Oasis Resort Live Jazz Night', 'Live Jazz Night', '2025-06-01 18:00:00', 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Desert Oasis Resort Wine Tasting', 'Wine Tasting', '2025-06-02 18:00:00', 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Desert Oasis Resort Art Exhibition', 'Art Exhibition', '2025-06-03 18:00:00', 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Desert Oasis Resort Business Seminar', 'Business Seminar', '2025-06-04 18:00:00', 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Desert Oasis Resort Cooking Class', 'Cooking Class', '2025-06-05 18:00:00', 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Desert Oasis Resort Yoga Session', 'Yoga Session', '2025-06-06 18:00:00', 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Desert Oasis Resort Stand-up Comedy', 'Stand-up Comedy', '2025-06-07 18:00:00', 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Desert Oasis Resort Movie Screening', 'Movie Screening', '2025-06-08 18:00:00', 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Desert Oasis Resort Networking Mixer', 'Networking Mixer', '2025-06-09 18:00:00', 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Events (name, type, time, hotelName, hotelAddress) VALUES ('Desert Oasis Resort Charity Gala', 'Charity Gala', '2025-06-10 18:00:00', 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
/*!40000 ALTER TABLE `Events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Guests`
--

DROP TABLE IF EXISTS `Guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Guests` (
  `name` varchar(30) DEFAULT NULL,
  `emailAddress` varchar(150) NOT NULL,
  `phoneNumber` char(10) DEFAULT NULL,
  `partySize` int(11) DEFAULT NULL,
  PRIMARY KEY (`emailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guests`
--

LOCK TABLES `Guests` WRITE;
/*!40000 ALTER TABLE `Guests` DISABLE KEYS */;
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('Alice Johnson', 'alice.johnson@guestmail.com', '4395527356', 4);
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('Bob Smith', 'bob.smith@guestmail.com', '6066832970', 1);
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('Carol Davis', 'carol.davis@guestmail.com', '7889518184', 4);
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('David Wilson', 'david.wilson@guestmail.com', '4446880696', 1);
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('Eve Martinez', 'eve.martinez@guestmail.com', '3643659619', 1);
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('Frank Brown', 'frank.brown@guestmail.com', '2186192860', 2);
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('Grace Lee', 'grace.lee@guestmail.com', '6217675085', 1);
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('Henry Clark', 'henry.clark@guestmail.com', '3766957887', 1);
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('Ivy Walker', 'ivy.walker@guestmail.com', '8673365143', 1);
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('Jack Hall', 'jack.hall@guestmail.com', '9640223358', 2);
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('Karen Allen', 'karen.allen@guestmail.com', '5305730144', 1);
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('Liam Young', 'liam.young@guestmail.com', '5041824170', 4);
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('Mia Hernandez', 'mia.hernandez@guestmail.com', '5956870146', 3);
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('Noah King', 'noah.king@guestmail.com', '8527201520', 1);
INSERT INTO Guests (name, emailAddress, phoneNumber, partySize) VALUES ('Olivia Wright', 'olivia.wright@guestmail.com', '4558389380', 2);
/*!40000 ALTER TABLE `Guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotel`
--

DROP TABLE IF EXISTS `Hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hotel` (
  `name` varchar(30) NOT NULL,
  `address` varchar(60) NOT NULL,
  `phoneNumber` char(10) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`name`,`address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotel`
--

LOCK TABLES `Hotel` WRITE;
/*!40000 ALTER TABLE `Hotel` DISABLE KEYS */;
INSERT INTO Hotel (name, address, phoneNumber, rating) VALUES ('The Plaza Hotel', '768 5th Ave, New York, NY 10019', '2127593000', 4.7);
INSERT INTO Hotel (name, address, phoneNumber, rating) VALUES ('The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603', '3125551234', 4.3);
INSERT INTO Hotel (name, address, phoneNumber, rating) VALUES ('The Beacon Inn', '250 Beacon St, Boston, MA 02116', '6175555678', 4.2);
INSERT INTO Hotel (name, address, phoneNumber, rating) VALUES ('Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105', '4155559012', 4.5);
INSERT INTO Hotel (name, address, phoneNumber, rating) VALUES ('Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016', '6025553456', 4.0);
/*!40000 ALTER TABLE `Hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rooms`
--

DROP TABLE IF EXISTS `Rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rooms` (
  `roomNumber` char(4) NOT NULL,
  `roomType` varchar(8) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  `roomCapacity` int(11) DEFAULT NULL,
  `hotelName` varchar(30) DEFAULT NULL,
  `hotelAddress` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`roomNumber`),
  KEY `hotelName` (`hotelName`,`hotelAddress`),
  CONSTRAINT `Rooms_ibfk_1` FOREIGN KEY (`hotelName`, `hotelAddress`) REFERENCES `Hotel` (`name`, `address`),
  CONSTRAINT `CheckRoomType` CHECK (`roomType` = 'Standard' or `roomType` = 'Single' or `roomType` = 'Double' or `roomType` = 'Deluxe')
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rooms`
--

LOCK TABLES `Rooms` WRITE;
/*!40000 ALTER TABLE `Rooms` DISABLE KEYS */;
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P001', 'Single', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P002', 'Single', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P003', 'Standard', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P004', 'Double', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P005', 'Deluxe', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P006', 'Deluxe', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P007', 'Double', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P008', 'Deluxe', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P009', 'Standard', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P010', 'Standard', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P011', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P012', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P013', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P014', 'Double', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P015', 'Double', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P016', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P017', 'Double', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P018', 'Standard', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P019', 'Single', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P020', 'Double', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P021', 'Double', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P022', 'Deluxe', FALSE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P023', 'Single', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P024', 'Single', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P025', 'Single', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P026', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P027', 'Standard', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P028', 'Deluxe', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P029', 'Single', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P030', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P031', 'Double', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P032', 'Double', FALSE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P033', 'Single', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P034', 'Single', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P035', 'Single', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P036', 'Single', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P037', 'Deluxe', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P038', 'Single', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P039', 'Double', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P040', 'Double', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P041', 'Double', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P042', 'Standard', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P043', 'Double', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P044', 'Deluxe', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P045', 'Double', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P046', 'Standard', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P047', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P048', 'Standard', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P049', 'Single', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P050', 'Deluxe', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P051', 'Standard', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P052', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P053', 'Double', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P054', 'Standard', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P055', 'Double', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P056', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P057', 'Double', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P058', 'Standard', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P059', 'Deluxe', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P060', 'Double', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P061', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P062', 'Deluxe', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P063', 'Double', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P064', 'Deluxe', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P065', 'Standard', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P066', 'Deluxe', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P067', 'Deluxe', FALSE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P068', 'Standard', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P069', 'Standard', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P070', 'Deluxe', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P071', 'Double', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P072', 'Double', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P073', 'Double', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P074', 'Standard', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P075', 'Deluxe', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P076', 'Standard', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P077', 'Double', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P078', 'Standard', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P079', 'Standard', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P080', 'Double', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P081', 'Standard', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P082', 'Standard', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P083', 'Double', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P084', 'Standard', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P085', 'Double', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P086', 'Double', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P087', 'Single', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P088', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P089', 'Standard', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P090', 'Deluxe', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P091', 'Single', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P092', 'Single', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P093', 'Deluxe', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P094', 'Single', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P095', 'Double', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P096', 'Single', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P097', 'Deluxe', FALSE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P098', 'Deluxe', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P099', 'Single', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P100', 'Standard', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P101', 'Deluxe', FALSE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P102', 'Deluxe', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P103', 'Standard', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P104', 'Single', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P105', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P106', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P107', 'Double', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P108', 'Single', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P109', 'Single', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P110', 'Single', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P111', 'Single', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P112', 'Single', TRUE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P113', 'Standard', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P114', 'Single', FALSE, 1, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P115', 'Standard', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P116', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P117', 'Single', TRUE, 3, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P118', 'Deluxe', TRUE, 4, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P119', 'Single', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P120', 'Double', TRUE, 2, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R001', 'Single', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R002', 'Single', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R003', 'Double', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R004', 'Deluxe', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R005', 'Deluxe', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R006', 'Single', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R007', 'Standard', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R008', 'Standard', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R009', 'Double', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R010', 'Single', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R011', 'Deluxe', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R012', 'Standard', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R013', 'Double', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R014', 'Single', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R015', 'Double', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R016', 'Standard', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R017', 'Standard', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R018', 'Standard', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R019', 'Standard', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R020', 'Double', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R021', 'Single', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R022', 'Deluxe', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R023', 'Single', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R024', 'Double', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R025', 'Double', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R026', 'Double', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R027', 'Standard', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R028', 'Deluxe', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R029', 'Standard', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R030', 'Standard', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R031', 'Single', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R032', 'Single', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R033', 'Single', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R034', 'Deluxe', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R035', 'Double', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R036', 'Single', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R037', 'Standard', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R038', 'Standard', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R039', 'Double', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R040', 'Standard', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R041', 'Deluxe', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R042', 'Deluxe', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R043', 'Single', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R044', 'Double', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R045', 'Double', FALSE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R046', 'Standard', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R047', 'Double', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R048', 'Single', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R049', 'Deluxe', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R050', 'Single', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R051', 'Deluxe', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R052', 'Single', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R053', 'Double', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R054', 'Double', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R055', 'Standard', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R056', 'Double', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R057', 'Single', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R058', 'Double', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R059', 'Double', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R060', 'Double', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R061', 'Deluxe', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R062', 'Deluxe', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R063', 'Deluxe', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R064', 'Deluxe', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R065', 'Single', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R066', 'Double', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R067', 'Double', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R068', 'Double', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R069', 'Double', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R070', 'Single', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R071', 'Standard', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R072', 'Standard', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R073', 'Single', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R074', 'Deluxe', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R075', 'Deluxe', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R076', 'Deluxe', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R077', 'Single', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R078', 'Double', FALSE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R079', 'Standard', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R080', 'Deluxe', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R081', 'Standard', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R082', 'Standard', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R083', 'Double', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R084', 'Deluxe', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R085', 'Double', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R086', 'Single', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R087', 'Single', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R088', 'Deluxe', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R089', 'Single', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R090', 'Deluxe', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R091', 'Deluxe', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R092', 'Double', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R093', 'Deluxe', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R094', 'Single', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R095', 'Deluxe', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R096', 'Deluxe', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R097', 'Deluxe', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R098', 'Standard', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R099', 'Single', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R100', 'Deluxe', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R101', 'Deluxe', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R102', 'Standard', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R103', 'Standard', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R104', 'Standard', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R105', 'Double', TRUE, 1, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R106', 'Single', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R107', 'Single', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R108', 'Double', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R109', 'Double', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R110', 'Standard', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R111', 'Deluxe', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R112', 'Double', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R113', 'Deluxe', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R114', 'Deluxe', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R115', 'Single', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R116', 'Double', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R117', 'Standard', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R118', 'Standard', TRUE, 4, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R119', 'Double', TRUE, 2, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('R120', 'Single', TRUE, 3, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B001', 'Standard', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B002', 'Deluxe', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B003', 'Standard', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B004', 'Standard', FALSE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B005', 'Standard', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B006', 'Standard', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B007', 'Standard', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B008', 'Standard', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B009', 'Deluxe', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B010', 'Single', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B011', 'Single', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B012', 'Deluxe', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B013', 'Deluxe', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B014', 'Double', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B015', 'Single', FALSE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B016', 'Double', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B017', 'Single', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B018', 'Deluxe', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B019', 'Double', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B020', 'Double', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B021', 'Deluxe', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B022', 'Double', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B023', 'Double', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B024', 'Deluxe', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B025', 'Deluxe', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B026', 'Standard', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B027', 'Single', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B028', 'Deluxe', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B029', 'Single', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B030', 'Single', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B031', 'Standard', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B032', 'Standard', FALSE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B033', 'Standard', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B034', 'Standard', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B035', 'Single', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B036', 'Double', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B037', 'Double', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B038', 'Single', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B039', 'Single', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B040', 'Deluxe', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B041', 'Deluxe', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B042', 'Deluxe', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B043', 'Standard', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B044', 'Standard', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B045', 'Standard', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B046', 'Standard', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B047', 'Deluxe', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B048', 'Standard', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B049', 'Deluxe', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B050', 'Deluxe', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B051', 'Deluxe', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B052', 'Single', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B053', 'Single', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B054', 'Deluxe', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B055', 'Single', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B056', 'Standard', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B057', 'Single', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B058', 'Double', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B059', 'Deluxe', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B060', 'Deluxe', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B061', 'Deluxe', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B062', 'Deluxe', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B063', 'Double', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B064', 'Single', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B065', 'Deluxe', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B066', 'Double', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B067', 'Single', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B068', 'Deluxe', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B069', 'Deluxe', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B070', 'Single', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B071', 'Double', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B072', 'Standard', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B073', 'Double', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B074', 'Single', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B075', 'Deluxe', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B076', 'Double', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B077', 'Double', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B078', 'Deluxe', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B079', 'Deluxe', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B080', 'Double', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B081', 'Double', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B082', 'Single', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B083', 'Standard', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B084', 'Double', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B085', 'Single', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B086', 'Deluxe', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B087', 'Deluxe', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B088', 'Single', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B089', 'Deluxe', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B090', 'Single', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B091', 'Single', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B092', 'Standard', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B093', 'Double', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B094', 'Deluxe', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B095', 'Standard', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B096', 'Standard', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B097', 'Standard', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B098', 'Double', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B099', 'Single', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B100', 'Single', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B101', 'Deluxe', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B102', 'Single', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B103', 'Single', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B104', 'Single', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B105', 'Deluxe', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B106', 'Single', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B107', 'Standard', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B108', 'Deluxe', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B109', 'Standard', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B110', 'Double', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B111', 'Double', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B112', 'Standard', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B113', 'Double', TRUE, 1, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B114', 'Single', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B115', 'Double', TRUE, 2, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B116', 'Single', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B117', 'Standard', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B118', 'Single', TRUE, 4, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B119', 'Single', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('B120', 'Double', TRUE, 3, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P001', 'Standard', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P002', 'Double', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P003', 'Single', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P004', 'Single', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P005', 'Double', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P006', 'Double', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P007', 'Deluxe', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P008', 'Single', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P009', 'Double', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P010', 'Double', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P011', 'Standard', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P012', 'Standard', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P013', 'Standard', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P014', 'Single', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P015', 'Standard', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P016', 'Single', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P017', 'Deluxe', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P018', 'Single', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P019', 'Double', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P020', 'Double', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P021', 'Standard', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P022', 'Deluxe', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P023', 'Double', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P024', 'Standard', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P025', 'Deluxe', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P026', 'Standard', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P027', 'Standard', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P028', 'Single', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P029', 'Single', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P030', 'Deluxe', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P031', 'Double', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P032', 'Deluxe', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P033', 'Double', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P034', 'Double', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P035', 'Standard', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P036', 'Single', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P037', 'Double', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P038', 'Double', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P039', 'Standard', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P040', 'Standard', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P041', 'Double', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P042', 'Double', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P043', 'Double', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P044', 'Double', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P045', 'Standard', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P046', 'Deluxe', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P047', 'Deluxe', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P048', 'Double', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P049', 'Deluxe', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P050', 'Standard', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P051', 'Single', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P052', 'Double', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P053', 'Standard', FALSE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P054', 'Standard', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P055', 'Single', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P056', 'Deluxe', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P057', 'Deluxe', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P058', 'Standard', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P059', 'Deluxe', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P060', 'Double', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P061', 'Double', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P062', 'Deluxe', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P063', 'Double', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P064', 'Single', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P065', 'Standard', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P066', 'Single', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P067', 'Double', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P068', 'Deluxe', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P069', 'Deluxe', FALSE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P070', 'Standard', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P071', 'Double', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P072', 'Single', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P073', 'Standard', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P074', 'Single', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P075', 'Standard', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P076', 'Double', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P077', 'Double', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P078', 'Double', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P079', 'Deluxe', FALSE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P080', 'Double', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P081', 'Standard', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P082', 'Single', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P083', 'Standard', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P084', 'Deluxe', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P085', 'Double', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P086', 'Deluxe', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P087', 'Standard', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P088', 'Deluxe', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P089', 'Standard', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P090', 'Double', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P091', 'Deluxe', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P092', 'Deluxe', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P093', 'Standard', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P094', 'Deluxe', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P095', 'Standard', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P096', 'Standard', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P097', 'Deluxe', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P098', 'Single', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P099', 'Standard', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P100', 'Standard', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P101', 'Standard', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P102', 'Standard', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P103', 'Single', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P104', 'Double', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P105', 'Single', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P106', 'Deluxe', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P107', 'Double', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P108', 'Deluxe', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P109', 'Single', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P110', 'Standard', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P111', 'Deluxe', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P112', 'Double', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P113', 'Double', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P114', 'Deluxe', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P115', 'Double', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P116', 'Double', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P117', 'Standard', TRUE, 4, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P118', 'Deluxe', TRUE, 1, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P119', 'Double', TRUE, 3, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('P120', 'Double', TRUE, 2, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D001', 'Single', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D002', 'Double', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D003', 'Standard', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D004', 'Double', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D005', 'Deluxe', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D006', 'Single', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D007', 'Single', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D008', 'Double', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D009', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D010', 'Double', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D011', 'Deluxe', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D012', 'Double', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D013', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D014', 'Standard', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D015', 'Single', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D016', 'Double', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D017', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D018', 'Standard', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D019', 'Standard', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D020', 'Double', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D021', 'Standard', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D022', 'Single', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D023', 'Deluxe', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D024', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D025', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D026', 'Double', FALSE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D027', 'Double', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D028', 'Standard', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D029', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D030', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D031', 'Deluxe', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D032', 'Double', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D033', 'Standard', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D034', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D035', 'Double', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D036', 'Single', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D037', 'Single', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D038', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D039', 'Deluxe', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D040', 'Standard', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D041', 'Single', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D042', 'Single', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D043', 'Single', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D044', 'Deluxe', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D045', 'Deluxe', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D046', 'Standard', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D047', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D048', 'Standard', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D049', 'Single', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D050', 'Standard', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D051', 'Single', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D052', 'Double', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D053', 'Double', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D054', 'Single', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D055', 'Double', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D056', 'Deluxe', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D057', 'Deluxe', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D058', 'Single', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D059', 'Deluxe', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D060', 'Double', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D061', 'Single', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D062', 'Standard', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D063', 'Single', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D064', 'Deluxe', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D065', 'Single', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D066', 'Deluxe', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D067', 'Single', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D068', 'Standard', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D069', 'Double', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D070', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D071', 'Standard', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D072', 'Deluxe', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D073', 'Deluxe', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D074', 'Standard', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D075', 'Single', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D076', 'Deluxe', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D077', 'Single', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D078', 'Double', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D079', 'Double', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D080', 'Deluxe', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D081', 'Standard', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D082', 'Deluxe', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D083', 'Deluxe', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D084', 'Deluxe', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D085', 'Deluxe', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D086', 'Single', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D087', 'Single', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D088', 'Single', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D089', 'Standard', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D090', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D091', 'Deluxe', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D092', 'Single', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D093', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D094', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D095', 'Double', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D096', 'Double', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D097', 'Double', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D098', 'Deluxe', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D099', 'Single', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D100', 'Single', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D101', 'Double', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D102', 'Standard', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D103', 'Single', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D104', 'Double', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D105', 'Deluxe', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D106', 'Single', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D107', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D108', 'Deluxe', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D109', 'Single', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D110', 'Deluxe', TRUE, 3, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D111', 'Deluxe', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D112', 'Deluxe', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D113', 'Deluxe', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D114', 'Single', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D115', 'Single', TRUE, 2, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D116', 'Standard', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D117', 'Standard', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D118', 'Single', TRUE, 4, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D119', 'Deluxe', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Rooms (roomNumber, roomType, availability, roomCapacity, hotelName, hotelAddress) VALUES ('D120', 'Double', TRUE, 1, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
/*!40000 ALTER TABLE `Rooms` ENABLE KEYS */;
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'P022';
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'P069';
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'P053';
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'P067';
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'D026';
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'P101';
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'P097';
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'P079';
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'P032';
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'B004';
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'B015';
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'R078';
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'R045';
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'B032';
UPDATE Rooms SET availability = FALSE WHERE roomNumber = 'P114';
UNLOCK TABLES;

--
-- Table structure for table `Services`
--

DROP TABLE IF EXISTS `Services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Services` (
  `title` varchar(10) NOT NULL,
  `description` text DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `hotelName` varchar(30) DEFAULT NULL,
  `hotelAddress` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`title`),
  KEY `hotelName` (`hotelName`,`hotelAddress`),
  KEY `ServiceIndex` (`title`,`hotelName`,`hotelAddress`),
  CONSTRAINT `Services_ibfk_1` FOREIGN KEY (`hotelName`, `hotelAddress`) REFERENCES `Hotel` (`name`, `address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Services`
--

LOCK TABLES `Services` WRITE;
/*!40000 ALTER TABLE `Services` DISABLE KEYS */;
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PLA_RoomService', 'Room Service at The Plaza Hotel', 143.99, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PLA_SpaTreatment', 'Spa Treatment at The Plaza Hotel', 94.6, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PLA_Laundry', 'Laundry at The Plaza Hotel', 76.39, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PLA_ValetParking', 'Valet Parking at The Plaza Hotel', 117.36, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PLA_AirportShuttle', 'Airport Shuttle at The Plaza Hotel', 106.87, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PLA_GymAccess', 'Gym Access at The Plaza Hotel', 95.06, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PLA_BreakfastBuffet', 'Breakfast Buffet at The Plaza Hotel', 149.83, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PLA_ConciergeService', 'Concierge Service at The Plaza Hotel', 63.27, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PLA_MiniBar', 'Mini Bar at The Plaza Hotel', 94.15, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PLA_PoolAccess', 'Pool Access at The Plaza Hotel', 26.31, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('ROS_RoomService', 'Room Service at The Roosevelt Hotel', 56.32, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('ROS_SpaTreatment', 'Spa Treatment at The Roosevelt Hotel', 95.62, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('ROS_Laundry', 'Laundry at The Roosevelt Hotel', 75.14, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('ROS_ValetParking', 'Valet Parking at The Roosevelt Hotel', 39.73, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('ROS_AirportShuttle', 'Airport Shuttle at The Roosevelt Hotel', 69.88, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('ROS_GymAccess', 'Gym Access at The Roosevelt Hotel', 70.73, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('ROS_BreakfastBuffet', 'Breakfast Buffet at The Roosevelt Hotel', 21.33, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('ROS_ConciergeService', 'Concierge Service at The Roosevelt Hotel', 78.75, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('ROS_MiniBar', 'Mini Bar at The Roosevelt Hotel', 52.13, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('ROS_PoolAccess', 'Pool Access at The Roosevelt Hotel', 84.22, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('BEA_RoomService', 'Room Service at The Beacon Inn', 62.69, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('BEA_SpaTreatment', 'Spa Treatment at The Beacon Inn', 103.18, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('BEA_Laundry', 'Laundry at The Beacon Inn', 26.81, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('BEA_ValetParking', 'Valet Parking at The Beacon Inn', 47.49, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('BEA_AirportShuttle', 'Airport Shuttle at The Beacon Inn', 83.41, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('BEA_GymAccess', 'Gym Access at The Beacon Inn', 67.98, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('BEA_BreakfastBuffet', 'Breakfast Buffet at The Beacon Inn', 116.93, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('BEA_ConciergeService', 'Concierge Service at The Beacon Inn', 51.47, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('BEA_MiniBar', 'Mini Bar at The Beacon Inn', 105.26, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('BEA_PoolAccess', 'Pool Access at The Beacon Inn', 73.55, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PAC_RoomService', 'Room Service at Pacific Harbor Hotel', 54.47, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PAC_SpaTreatment', 'Spa Treatment at Pacific Harbor Hotel', 55.5, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PAC_Laundry', 'Laundry at Pacific Harbor Hotel', 137.87, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PAC_ValetParking', 'Valet Parking at Pacific Harbor Hotel', 54.62, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PAC_AirportShuttle', 'Airport Shuttle at Pacific Harbor Hotel', 71.62, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PAC_GymAccess', 'Gym Access at Pacific Harbor Hotel', 37.03, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PAC_BreakfastBuffet', 'Breakfast Buffet at Pacific Harbor Hotel', 43.99, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PAC_ConciergeService', 'Concierge Service at Pacific Harbor Hotel', 58.32, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PAC_MiniBar', 'Mini Bar at Pacific Harbor Hotel', 42.34, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('PAC_PoolAccess', 'Pool Access at Pacific Harbor Hotel', 59.29, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('DES_RoomService', 'Room Service at Desert Oasis Resort', 90.06, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('DES_SpaTreatment', 'Spa Treatment at Desert Oasis Resort', 30.55, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('DES_Laundry', 'Laundry at Desert Oasis Resort', 57.37, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('DES_ValetParking', 'Valet Parking at Desert Oasis Resort', 35.8, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('DES_AirportShuttle', 'Airport Shuttle at Desert Oasis Resort', 138.12, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('DES_GymAccess', 'Gym Access at Desert Oasis Resort', 105.42, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('DES_BreakfastBuffet', 'Breakfast Buffet at Desert Oasis Resort', 35.97, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('DES_ConciergeService', 'Concierge Service at Desert Oasis Resort', 98.05, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('DES_MiniBar', 'Mini Bar at Desert Oasis Resort', 96.99, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Services (title, description, cost, hotelName, hotelAddress) VALUES ('DES_PoolAccess', 'Pool Access at Desert Oasis Resort', 84.26, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
/*!40000 ALTER TABLE `Services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `name` varchar(30) DEFAULT NULL,
  `emailAddress` varchar(150) NOT NULL,
  `position` varchar(17) NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `hotelName` varchar(30) DEFAULT NULL,
  `hotelAddress` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`emailAddress`,`position`),
  KEY `hotelName` (`hotelName`,`hotelAddress`),
  KEY `StaffIndex` (`position`),
  CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`hotelName`, `hotelAddress`) REFERENCES `Hotel` (`name`, `address`),
  CONSTRAINT `CheckPosition` CHECK (`position` in ('Front Desk Agent','Concierge','Housekeeper','Manager','Event Coordinator'))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott@theplazahotel.com', 'Manager', 80000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott1@theplazahotel.com', 'Event Coordinator', 50000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor@theplazahotel.com', 'Event Coordinator', 50000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott2@theplazahotel.com', 'Front Desk Agent', 40000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor1@theplazahotel.com', 'Front Desk Agent', 40000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe@theplazahotel.com', 'Front Desk Agent', 40000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark@theplazahotel.com', 'Front Desk Agent', 40000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown@theplazahotel.com', 'Front Desk Agent', 40000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott3@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor2@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe1@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark1@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown1@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott4@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor3@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe2@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark2@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown2@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter1@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner1@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore1@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans1@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas1@theplazahotel.com', 'Concierge', 35000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott5@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor4@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe3@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark3@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown3@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter2@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner2@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore2@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans2@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas2@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott6@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor5@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe4@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark4@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown4@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter3@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner3@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore3@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans3@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas3@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott7@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor6@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe5@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark5@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown5@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter4@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner4@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore4@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans4@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas4@theplazahotel.com', 'Housekeeper', 30000, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor@theroosevelthotel.com', 'Manager', 80000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor1@theroosevelthotel.com', 'Event Coordinator', 50000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe@theroosevelthotel.com', 'Event Coordinator', 50000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor2@theroosevelthotel.com', 'Front Desk Agent', 40000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe1@theroosevelthotel.com', 'Front Desk Agent', 40000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark@theroosevelthotel.com', 'Front Desk Agent', 40000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown@theroosevelthotel.com', 'Front Desk Agent', 40000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter@theroosevelthotel.com', 'Front Desk Agent', 40000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor3@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe2@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark1@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown1@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter1@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor4@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe3@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark2@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown2@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter2@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner1@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore1@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans1@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas1@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott1@theroosevelthotel.com', 'Concierge', 35000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor5@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe4@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark3@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown3@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter3@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner2@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore2@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans2@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas2@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott2@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor6@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe5@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark4@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown4@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter4@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner3@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore3@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans3@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas3@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott3@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor7@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe6@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark5@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown5@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter5@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner4@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore4@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans4@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas4@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott4@theroosevelthotel.com', 'Housekeeper', 30000, 'The Roosevelt Hotel', '123 S Michigan Ave, Chicago, IL 60603');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe@thebeaconinn.com', 'Manager', 80000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe1@thebeaconinn.com', 'Event Coordinator', 50000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark@thebeaconinn.com', 'Event Coordinator', 50000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe2@thebeaconinn.com', 'Front Desk Agent', 40000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark1@thebeaconinn.com', 'Front Desk Agent', 40000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown@thebeaconinn.com', 'Front Desk Agent', 40000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter@thebeaconinn.com', 'Front Desk Agent', 40000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner@thebeaconinn.com', 'Front Desk Agent', 40000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe3@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark2@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown1@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter1@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner1@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe4@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark3@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown2@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter2@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner2@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore1@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans1@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas1@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott1@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor1@thebeaconinn.com', 'Concierge', 35000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe5@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark4@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown3@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter3@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner3@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore2@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans2@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas2@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott2@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor2@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe6@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark5@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown4@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter4@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner4@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore3@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans3@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas3@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott3@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor3@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe7@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark6@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown5@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter5@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner5@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore4@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans4@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas4@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott4@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor4@thebeaconinn.com', 'Housekeeper', 30000, 'The Beacon Inn', '250 Beacon St, Boston, MA 02116');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark@pacificharborhotel.com', 'Manager', 80000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark1@pacificharborhotel.com', 'Event Coordinator', 50000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown@pacificharborhotel.com', 'Event Coordinator', 50000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark2@pacificharborhotel.com', 'Front Desk Agent', 40000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown1@pacificharborhotel.com', 'Front Desk Agent', 40000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter@pacificharborhotel.com', 'Front Desk Agent', 40000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner@pacificharborhotel.com', 'Front Desk Agent', 40000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore@pacificharborhotel.com', 'Front Desk Agent', 40000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark3@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown2@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter1@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner1@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore1@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark4@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown3@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter2@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner2@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore2@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans1@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas1@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott1@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor1@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe1@pacificharborhotel.com', 'Concierge', 35000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark5@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown4@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter3@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner3@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore3@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans2@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas2@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott2@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor2@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe2@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark6@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown5@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter4@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner4@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore4@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans3@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas3@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott3@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor3@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe3@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark7@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown6@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter5@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner5@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore5@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans4@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas4@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott4@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor4@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe4@pacificharborhotel.com', 'Housekeeper', 30000, 'Pacific Harbor Hotel', '101 Embarcadero, San Francisco, CA 94105');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown@desertoasisresort.com', 'Manager', 80000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown1@desertoasisresort.com', 'Event Coordinator', 50000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter@desertoasisresort.com', 'Event Coordinator', 50000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown2@desertoasisresort.com', 'Front Desk Agent', 40000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter1@desertoasisresort.com', 'Front Desk Agent', 40000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner@desertoasisresort.com', 'Front Desk Agent', 40000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore@desertoasisresort.com', 'Front Desk Agent', 40000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans@desertoasisresort.com', 'Front Desk Agent', 40000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown3@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter2@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner1@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore1@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans1@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown4@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter3@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner2@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore2@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans2@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas1@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott1@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor1@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe1@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark1@desertoasisresort.com', 'Concierge', 35000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown5@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter4@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner3@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore3@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans3@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas2@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott2@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor2@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe2@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark2@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown6@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter5@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner4@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore4@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans4@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas3@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott3@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor3@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe3@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark3@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Robert Brown', 'robert.brown7@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Olivia Carter', 'olivia.carter6@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Liam Turner', 'liam.turner5@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sophia Moore', 'sophia.moore5@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Noah Evans', 'noah.evans5@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Isabella Thomas', 'isabella.thomas4@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Michael Scott', 'michael.scott4@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Sarah Connor', 'sarah.connor4@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('John Doe', 'john.doe4@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
INSERT INTO Staff (name, emailAddress, position, salary, hotelName, hotelAddress) VALUES ('Emily Clark', 'emily.clark4@desertoasisresort.com', 'Housekeeper', 30000, 'Desert Oasis Resort', '500 E Camelback Rd, Phoenix, AZ 85016');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Sudarin72_db'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddGuestBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`Sudarin72`@`%` PROCEDURE `AddGuestBooking`(
    IN p_name         VARCHAR(30),
    IN p_email        VARCHAR(150),
    IN p_phone        CHAR(10),
    IN p_partySize    INT,
    IN p_txnNo        CHAR(10),
    IN p_cost         DECIMAL(10,2),
    IN p_roomNumber   CHAR(4),
    IN p_hotelName    VARCHAR(30),
    IN p_hotelAddress VARCHAR(60)
)
BEGIN
    DECLARE v_avail    BOOLEAN DEFAULT FALSE;

    START TRANSACTION;

    
    SELECT availability
      INTO v_avail
    FROM Rooms
    WHERE roomNumber   = p_roomNumber
      AND hotelName    = p_hotelName
      AND hotelAddress = p_hotelAddress
    FOR UPDATE;

    IF v_avail THEN
        
        INSERT INTO Guests (name, emailAddress, phoneNumber, partySize)
        VALUES (p_name, p_email, p_phone, p_partySize);

        
        INSERT INTO Booking (
            transactionNumber,
            guestEmailAddress,
            cost,
            roomNumber,
            hotelName,
            hotelAddress
        )
        VALUES (
            p_txnNo,
            p_email,
            p_cost,
            p_roomNumber,
            p_hotelName,
            p_hotelAddress
        );

        
        UPDATE Rooms
        SET availability = FALSE
        WHERE roomNumber   = p_roomNumber
          AND hotelName    = p_hotelName
          AND hotelAddress = p_hotelAddress;

        COMMIT;
        SELECT 0 AS retcode, 'Booking successful.' AS retmsg;
    ELSE
        ROLLBACK;
        SELECT 1 AS retcode, 'Room not available.' AS retmsg;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-12  1:12:47
