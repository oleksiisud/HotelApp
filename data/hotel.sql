-- MySQL dump 10.19  Distrib 10.3.39-MariaDB, for Linux (x86_64)
--
-- Host: 146.245.252.140    Database: Sudarin72_db
-- ------------------------------------------------------
-- Server version	10.6.21-MariaDB

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
-- Table structure for table `Assistance`
--

DROP TABLE IF EXISTS `Assistance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Assistance` (
  `staffName` varchar(30) NOT NULL,
  `staffEmailAddress` varchar(150) NOT NULL,
  `guestName` varchar(30) NOT NULL,
  `guestEmailAddress` varchar(150) NOT NULL,
  PRIMARY KEY (`staffName`,`staffEmailAddress`,`guestName`,`guestEmailAddress`),
  KEY `guestName` (`guestName`,`guestEmailAddress`),
  CONSTRAINT `Assistance_ibfk_1` FOREIGN KEY (`staffName`, `staffEmailAddress`) REFERENCES `Staff` (`name`, `emailAddress`),
  CONSTRAINT `Assistance_ibfk_2` FOREIGN KEY (`guestName`, `guestEmailAddress`) REFERENCES `Guests` (`name`, `emailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assistance`
--

LOCK TABLES `Assistance` WRITE;
/*!40000 ALTER TABLE `Assistance` DISABLE KEYS */;
INSERT INTO `Assistance` VALUES ('Alice Johnson','alice@example.com','John Doe','john.doe@example.com'),('Alice Johnson','alice@example.com','Olivia Green','olivia.green@example.com'),('Bob Smith','bob@example.com','Emma Watson','emma.w@example.com'),('Bob Smith','bob@example.com','Michael Carter','michael.c@example.com'),('Charlie Brown','charlie@example.com','Ava Martinez','ava.m@example.com'),('Charlie Brown','charlie@example.com','Liam Neeson','liam.n@example.com'),('Diana Ross','diana@example.com','Noah Williams','noah.w@example.com'),('Diana Ross','diana@example.com','Sophia Lee','sophia.lee@example.com'),('Ethan Hunt','ethan@example.com','David Kim','david.kim@example.com'),('Ethan Hunt','ethan@example.com','Isabella Brown','isabella.b@example.com');
/*!40000 ALTER TABLE `Assistance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Booking` (
  `transactionNumber` char(10) NOT NULL,
  `guestName` varchar(30) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `roomNumber` char(4) DEFAULT NULL,
  `hotelName` varchar(30) DEFAULT NULL,
  `hotelAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`transactionNumber`),
  KEY `guestName` (`guestName`),
  KEY `roomNumber` (`roomNumber`),
  KEY `hotelName` (`hotelName`,`hotelAddress`),
  CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`guestName`) REFERENCES `Guests` (`name`),
  CONSTRAINT `Booking_ibfk_2` FOREIGN KEY (`roomNumber`) REFERENCES `Rooms` (`roomNumber`),
  CONSTRAINT `Booking_ibfk_3` FOREIGN KEY (`hotelName`, `hotelAddress`) REFERENCES `Hotel` (`name`, `address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES ('TXN100001','John Doe',250.00,'101A','Grand Plaza','123 Main St, New York, NY'),('TXN100002','Emma Watson',400.00,'202B','Seaside Resort','456 Ocean Ave, Miami, FL'),('TXN100003','Liam Neeson',180.00,'303C','Mountain Lodge','789 Hill Rd, Denver, CO'),('TXN100004','Sophia Lee',500.00,'404D','City Inn','321 Downtown St, Chicago, IL'),('TXN100005','David Kim',220.00,'505E','Sunset Hotel','654 Palm Dr, Los Angeles, CA'),('TXN100006','Olivia Green',120.00,'606F','Grand Plaza','123 Main St, New York, NY'),('TXN100007','Michael Carter',450.00,'707G','Seaside Resort','456 Ocean Ave, Miami, FL'),('TXN100008','Ava Martinez',200.00,'808H','Mountain Lodge','789 Hill Rd, Denver, CO'),('TXN100009','Noah Williams',300.00,'909I','City Inn','321 Downtown St, Chicago, IL'),('TXN100010','Isabella Brown',190.00,'101J','Sunset Hotel','654 Palm Dr, Los Angeles, CA');
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Events`
--

DROP TABLE IF EXISTS `Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Events` (
  `name` varchar(30) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `time` datetime NOT NULL,
  `hotelName` varchar(30) DEFAULT NULL,
  `hotelAddress` varchar(100) DEFAULT NULL,
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
INSERT INTO `Events` VALUES ('Beach Party','Outdoor Party','2025-07-22 18:30:00','Seaside Resort','456 Ocean Ave, Miami, FL'),('Business Meet','Conference','2025-04-05 10:00:00','City Inn','321 Downtown St, Chicago, IL'),('Gala Night','Formal Dinner','2025-06-15 19:00:00','Grand Plaza','123 Main St, New York, NY'),('Ski Trip','Winter Sports','2025-12-10 08:00:00','Mountain Lodge','789 Hill Rd, Denver, CO'),('Sunset Yoga','Wellness','2025-08-20 17:00:00','Sunset Hotel','654 Palm Dr, Los Angeles, CA');
/*!40000 ALTER TABLE `Events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Guests`
--

DROP TABLE IF EXISTS `Guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Guests` (
  `name` varchar(30) NOT NULL,
  `emailAddress` varchar(150) NOT NULL,
  `phoneNumber` char(10) DEFAULT NULL,
  `partySize` int(11) DEFAULT NULL,
  `roomNumber` char(4) DEFAULT NULL,
  `hotelName` varchar(30) DEFAULT NULL,
  `hotelAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`,`emailAddress`),
  KEY `roomNumber` (`roomNumber`),
  KEY `hotelName` (`hotelName`,`hotelAddress`),
  CONSTRAINT `Guests_ibfk_1` FOREIGN KEY (`roomNumber`) REFERENCES `Rooms` (`roomNumber`),
  CONSTRAINT `Guests_ibfk_2` FOREIGN KEY (`hotelName`, `hotelAddress`) REFERENCES `Hotel` (`name`, `address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guests`
--

LOCK TABLES `Guests` WRITE;
/*!40000 ALTER TABLE `Guests` DISABLE KEYS */;
INSERT INTO `Guests` VALUES ('Ava Martinez','ava.m@example.com','5558903456',3,'808H','Mountain Lodge','789 Hill Rd, Denver, CO'),('David Kim','david.kim@example.com','5555678901',2,'505E','Sunset Hotel','654 Palm Dr, Los Angeles, CA'),('Emma Watson','emma.w@example.com','5557654321',4,'202B','Seaside Resort','456 Ocean Ave, Miami, FL'),('Isabella Brown','isabella.b@example.com','5550125678',2,'101J','Sunset Hotel','654 Palm Dr, Los Angeles, CA'),('John Doe','john.doe@example.com','5551234567',2,'101A','Grand Plaza','123 Main St, New York, NY'),('Liam Neeson','liam.n@example.com','5559876543',1,'303C','Mountain Lodge','789 Hill Rd, Denver, CO'),('Michael Carter','michael.c@example.com','5557892345',4,'707G','Seaside Resort','456 Ocean Ave, Miami, FL'),('Noah Williams','noah.w@example.com','5559014567',2,'909I','City Inn','321 Downtown St, Chicago, IL'),('Olivia Green','olivia.green@example.com','5556781234',1,'606F','Grand Plaza','123 Main St, New York, NY'),('Sophia Lee','sophia.lee@example.com','5553456789',3,'404D','City Inn','321 Downtown St, Chicago, IL');
/*!40000 ALTER TABLE `Guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotel`
--

DROP TABLE IF EXISTS `Hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hotel` (
  `name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
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
INSERT INTO `Hotel` VALUES ('City Inn','321 Downtown St, Chicago, IL','3125554321',3.9),('Grand Plaza','123 Main St, New York, NY','2125551234',4.5),('Mountain Lodge','789 Hill Rd, Denver, CO','3035559876',4.7),('Seaside Resort','456 Ocean Ave, Miami, FL','3055555678',4.2),('Sunset Hotel','654 Palm Dr, Los Angeles, CA','2135556789',4.3);
/*!40000 ALTER TABLE `Hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rooms`
--

DROP TABLE IF EXISTS `Rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rooms` (
  `roomNumber` char(4) NOT NULL,
  `roomType` varchar(100) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  `roomCapacity` int(11) DEFAULT NULL,
  `hotelName` varchar(30) DEFAULT NULL,
  `hotelAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roomNumber`),
  KEY `hotelName` (`hotelName`,`hotelAddress`),
  CONSTRAINT `Rooms_ibfk_1` FOREIGN KEY (`hotelName`, `hotelAddress`) REFERENCES `Hotel` (`name`, `address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rooms`
--

LOCK TABLES `Rooms` WRITE;
/*!40000 ALTER TABLE `Rooms` DISABLE KEYS */;
INSERT INTO `Rooms` VALUES ('101A','Deluxe',1,2,'Grand Plaza','123 Main St, New York, NY'),('101J','Double',1,2,'Sunset Hotel','654 Palm Dr, Los Angeles, CA'),('202B','Suite',0,4,'Seaside Resort','456 Ocean Ave, Miami, FL'),('303C','Standard',1,3,'Mountain Lodge','789 Hill Rd, Denver, CO'),('404D','Penthouse',0,5,'City Inn','321 Downtown St, Chicago, IL'),('505E','Double',1,2,'Sunset Hotel','654 Palm Dr, Los Angeles, CA'),('606F','Single',1,1,'Grand Plaza','123 Main St, New York, NY'),('707G','Suite',0,4,'Seaside Resort','456 Ocean Ave, Miami, FL'),('808H','Standard',1,3,'Mountain Lodge','789 Hill Rd, Denver, CO'),('909I','Deluxe',0,2,'City Inn','321 Downtown St, Chicago, IL');
/*!40000 ALTER TABLE `Rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Services`
--

DROP TABLE IF EXISTS `Services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Services` (
  `title` varchar(10) NOT NULL,
  `description` text DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `hotelName` varchar(30) DEFAULT NULL,
  `hotelAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`title`),
  KEY `hotelName` (`hotelName`,`hotelAddress`),
  CONSTRAINT `Services_ibfk_1` FOREIGN KEY (`hotelName`, `hotelAddress`) REFERENCES `Hotel` (`name`, `address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Services`
--

LOCK TABLES `Services` WRITE;
/*!40000 ALTER TABLE `Services` DISABLE KEYS */;
INSERT INTO `Services` VALUES ('Breakfast','Complimentary buffet breakfast',15.00,'Seaside Resort','456 Ocean Ave, Miami, FL'),('Gym','Access to 24-hour fitness center',20.00,'Mountain Lodge','789 Hill Rd, Denver, CO'),('Laundry','Full laundry and dry cleaning service',30.00,'City Inn','321 Downtown St, Chicago, IL'),('Pool','Heated outdoor swimming pool',10.00,'Sunset Hotel','654 Palm Dr, Los Angeles, CA'),('Spa','Relaxing full-body spa treatment',100.00,'Grand Plaza','123 Main St, New York, NY');
/*!40000 ALTER TABLE `Services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Staff` (
  `name` varchar(30) NOT NULL,
  `emailAddress` varchar(150) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `hotelName` varchar(30) DEFAULT NULL,
  `hotelAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`,`emailAddress`),
  KEY `hotelName` (`hotelName`,`hotelAddress`),
  CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`hotelName`, `hotelAddress`) REFERENCES `Hotel` (`name`, `address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES ('Alice Johnson','alice@example.com','Manager',60000.00,'Grand Plaza','123 Main St, New York, NY'),('Bob Smith','bob@example.com','Receptionist',35000.00,'Seaside Resort','456 Ocean Ave, Miami, FL'),('Charlie Brown','charlie@example.com','Chef',50000.00,'Mountain Lodge','789 Hill Rd, Denver, CO'),('Diana Ross','diana@example.com','Housekeeping',28000.00,'City Inn','321 Downtown St, Chicago, IL'),('Ethan Hunt','ethan@example.com','Security',40000.00,'Sunset Hotel','654 Palm Dr, Los Angeles, CA');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-10  1:13:45
