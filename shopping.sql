-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: shopping
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ayar`
--

DROP TABLE IF EXISTS `ayar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ayar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `anahtar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deger` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ayar`
--

LOCK TABLES `ayar` WRITE;
/*!40000 ALTER TABLE `ayar` DISABLE KEYS */;
INSERT INTO `ayar` VALUES (1,'anasayfa_slider_urun_adet','5'),(2,'anasayfa_liste_urun_adet','4');
/*!40000 ALTER TABLE `ayar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ust_id` int(11) DEFAULT NULL,
  `kategori_adi` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `olusturulma_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `silinme_tarihi` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,NULL,'Elektronik','elektronik','2020-04-30 13:30:31','2020-04-30 13:30:31',NULL),(2,1,'Bilgisayar/Tablet','bilgisayar-tablet','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(3,1,'Telefon','telefon','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(4,1,'TV ve Ses Sistemleri','tv-ses-sistemleri','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(5,1,'Kamera','kamera','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(6,NULL,'Kitap','kitap','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(7,6,'Edebiyat','edebiyat','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(8,6,'Çocuk','cocuk','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(9,6,'Bilgisayar','bilgisayar','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(10,6,'Sınavlara Hazırlık','sinavlara-hazirlik','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(11,NULL,'Dergi','dergi','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(12,NULL,'Mobilya','mobilya','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(13,NULL,'Dekorasyon','dekorasyon','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(14,NULL,'Kozmetik','kozmetik','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(15,NULL,'Kişisel Bakım','kisisel-bakim','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(16,NULL,'Giyim ve Moda','giyim-moda','2020-04-30 13:30:32','2020-04-30 13:30:32',NULL),(17,7,'Anne ve çocuk','anne-cocuk','2020-04-30 13:30:32','2020-05-06 11:39:22',NULL),(18,1,'test','test1','2020-05-06 11:40:01','2020-05-06 11:41:28','2020-05-06 11:41:28');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori_urun`
--

DROP TABLE IF EXISTS `kategori_urun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori_urun` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori_id` int(10) unsigned NOT NULL,
  `urun_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kategori_urun_kategori_id_foreign` (`kategori_id`),
  KEY `kategori_urun_urun_id_foreign` (`urun_id`),
  CONSTRAINT `kategori_urun_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE,
  CONSTRAINT `kategori_urun_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urun` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori_urun`
--

LOCK TABLES `kategori_urun` WRITE;
/*!40000 ALTER TABLE `kategori_urun` DISABLE KEYS */;
INSERT INTO `kategori_urun` VALUES (4,5,3),(5,6,3),(6,7,3),(7,8,3),(9,1,2),(10,1,3),(11,1,4),(12,1,4),(13,17,1),(14,17,2),(15,17,3),(17,2,32),(18,4,32),(19,6,32),(20,3,33),(21,5,33),(22,6,33);
/*!40000 ALTER TABLE `kategori_urun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanici`
--

DROP TABLE IF EXISTS `kullanici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kullanici` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adsoyad` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sifre` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aktivasyon_anahtari` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif_mi` tinyint(1) NOT NULL DEFAULT '0',
  `yonetici_mi` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `olusturma_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `silinme_tarihi` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kullanici_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanici`
--

LOCK TABLES `kullanici` WRITE;
/*!40000 ALTER TABLE `kullanici` DISABLE KEYS */;
INSERT INTO `kullanici` VALUES (1,'Çağla Öztürk','angel_of_the_hell_16@hotmail.com','$2y$10$3U9Oh2YTWGBuJmKvdoF2Lu58TDLafDRH5svb/LcQLMOouvweEUv7S',NULL,1,1,'bDT4kglfmgh1nqFc8bUQGvysyxq1Zvjv1RdcoX8iqux9JEwUv5hJxqmoDqPi','2020-05-06 10:49:04','2020-05-07 15:50:12',NULL),(2,'Birdie Mueller','megane93@example.com','$2y$10$w08ds4Wkwq1PreVjTeP0CObm55foAiRI6HeObA6786u7MAwkyYG/S',NULL,1,0,NULL,'2020-05-06 10:49:04','2020-05-06 10:49:04',NULL),(3,'Ron Bogisich','kayla37@example.com','$2y$10$.hV7CHkZOAjiXKXlU7IMCe/bc9ieeql7vIGiD5g2FaKV/sK0gy9tK',NULL,1,0,NULL,'2020-05-06 10:49:04','2020-05-06 10:49:04',NULL),(4,'Prof. Chad Wunsch','fschumm@example.com','$2y$10$R.PtUH/dUdL3zSoAU1Uc4eOxzCKV4VY1dwGjyuEnbIKMgULPj0Q7.',NULL,1,0,NULL,'2020-05-06 10:49:04','2020-05-06 10:49:04',NULL),(5,'Mr. Trystan Crooks','polly.kris@example.org','$2y$10$RqpoArlcthnTJC/V9uOk2uJ5yFqptNL2ZdRVgLBQUPksoNFkhtFFG',NULL,1,0,NULL,'2020-05-06 10:49:04','2020-05-06 10:49:04',NULL),(6,'Candace Wolff','roob.caroline@example.net','$2y$10$cWY7nC.qHWiUIb6WKTj1CeslZF2ljbrSWgUQAql/AF3gGw72OmeH2',NULL,1,0,NULL,'2020-05-06 10:49:05','2020-05-06 10:49:05',NULL),(7,'Prof. Olin Fritsch Sr.','mlabadie@example.com','$2y$10$m619Usvxpc4witI4BGE4POM/pPlo66PCmbpSwzCbq6u3uhxARamou',NULL,1,0,NULL,'2020-05-06 10:49:05','2020-05-06 10:49:05',NULL),(8,'Prof. Hellen Padberg','osborne.trantow@example.org','$2y$10$gtTdlFC063WQE0fDD4aBnu9RCH8Wwe6jv6ffOGDhtezn8Focv3gsS',NULL,1,0,NULL,'2020-05-06 10:49:05','2020-05-06 10:49:05',NULL),(9,'Derrick Grady','alessia62@example.net','$2y$10$.8R6aQWxu6EiqcSWw4wrAuqjFQ4XWn5suF.VdVBKalpy7JYe0vYvu',NULL,1,0,NULL,'2020-05-06 10:49:05','2020-05-06 10:49:05',NULL),(10,'Miss Kariane Ankunding','kbergnaum@example.org','$2y$10$.TGChQ.TBPsO/rY7I.iGNuTTcUrqYY9B7Z7Y5wBuhrdVgWBdzlwTK',NULL,1,0,NULL,'2020-05-06 10:49:05','2020-05-06 10:49:05',NULL),(11,'Sabrina Stoltenberg','kbatz@example.net','$2y$10$7Aa6oFwq/iRKphP.6O0m7eNkuzPvY4FeTmKuBYxqLLq5p9cBS2tmS',NULL,1,0,NULL,'2020-05-06 10:49:05','2020-05-06 10:49:05',NULL),(12,'Miles Halvorson','eward@example.net','$2y$10$SPin/sUVvOP2s9IT9EzAuuD4c5EimGCihILF4.U/NZaz0Y3uPoc/6',NULL,1,0,NULL,'2020-05-06 10:49:06','2020-05-06 10:49:06',NULL),(13,'Mr. Merl Zulauf','sschinner@example.net','$2y$10$mNM2BSQ8inbYmgZ./7WwE.1CJdOg8plaPr8NSi3.WYZz5ikPEG0Wa',NULL,1,0,NULL,'2020-05-06 10:49:06','2020-05-06 10:49:06',NULL),(14,'Beulah Will','sasha59@example.net','$2y$10$Hi6mtQ7F55hdvzmtcR0j0.FglGK/mbDtH4tQzqQdGQ3XXoWP797ra',NULL,1,0,NULL,'2020-05-06 10:49:06','2020-05-06 10:49:06',NULL),(15,'Trey Williamson DVM','dmedhurst@example.net','$2y$10$vTwOIc3wOAX.fE2txt.ql.Kk7/ZY3OOULYJrOmGSkGocLOJY/ODfq',NULL,1,0,NULL,'2020-05-06 10:49:06','2020-05-06 10:49:06',NULL),(16,'Bessie Sporer','ujones@example.com','$2y$10$6GvbJ1VtCsT.hYtv293xD.X2Hp8QrWmMRBRuhRjKPa4iJb6syavvK',NULL,1,0,NULL,'2020-05-06 10:49:07','2020-05-06 10:49:07',NULL),(17,'Dr. Melisa Watsica','vance72@example.net','$2y$10$UfpzbLHL4KI3U.adDRVfv.yi3gN7ygdqbiESC5fuFO8nQaibfkiIC',NULL,1,0,NULL,'2020-05-06 10:49:07','2020-05-06 10:49:07',NULL),(18,'Adan Flatley','hvandervort@example.org','$2y$10$9fmQo7nn2eh7sY/lhvOyqukN8.TDBD/SYQpXpsysyxO7cBwKiR7ei',NULL,1,0,NULL,'2020-05-06 10:49:07','2020-05-06 10:49:07',NULL),(19,'Ms. April Fritsch','hyatt.jamey@example.net','$2y$10$Wu1YlJaapJO/upA3tbtN3eQxbhLdN917zd58gP1.Lfk75paziYJLe',NULL,1,0,NULL,'2020-05-06 10:49:07','2020-05-06 10:49:07',NULL),(20,'Annetta Nolan','mario48@example.com','$2y$10$IE2ntk2Fq8O6YY4wgb2rduC7n2yOdbXHyGOXy.Xw3WaDWu3u6poF2',NULL,1,0,NULL,'2020-05-06 10:49:07','2020-05-06 10:49:07',NULL),(21,'Asa Rempel','jeffry99@example.net','$2y$10$l3N2bhVHwukbWLsJkMc6yen.JOuyMa6BInGNFMCYD2qd5OOrwlQiu',NULL,1,0,NULL,'2020-05-06 10:49:07','2020-05-06 10:49:07',NULL),(22,'Dr. Name Reichert MD','alexandria.cronin@example.org','$2y$10$BlX5MGpNXZBjPgoJ6qMg2ugpEBIHW1XIR8LKFinteZNCwuBPKTH/e',NULL,1,0,NULL,'2020-05-06 10:49:08','2020-05-06 10:49:08',NULL),(23,'Conrad Medhurst','wolff.omer@example.net','$2y$10$LT0SolC3YcEaRFOXZ66wRuEpvacm5kvEuaqM5nK1zjgdpYc3BkHpi',NULL,1,0,NULL,'2020-05-06 10:49:08','2020-05-06 10:49:08',NULL),(24,'Joan Brekke','lindgren.icie@example.org','$2y$10$2pXNIPRyJI.uXJWes9fTGOeSk7LNqwwOB6W53C88fCw6h2is1iTTC',NULL,1,0,NULL,'2020-05-06 10:49:08','2020-05-06 10:49:08',NULL),(25,'Terrance Rempel','langworth.olen@example.org','$2y$10$vULZojfSYYwSn3SNAQJhz.PY9jQeEvozOoOA1tzP9umMqy9rZ59BG',NULL,1,0,NULL,'2020-05-06 10:49:08','2020-05-06 10:49:08',NULL),(26,'Maida McKenzie II','oma87@example.org','$2y$10$gHEItfPCqqrgvpVs0RGSHehvbXWcFqnrENUUmQFDJQ65KViWGyGr6',NULL,1,0,NULL,'2020-05-06 10:49:08','2020-05-06 10:49:08',NULL),(27,'Ms. Lessie Trantow PhD','oreilly.clifford@example.com','$2y$10$P8gv8LzF5ISbFYtwugE3z.MwKjc6dGMl7yGb3c.KRAqdLV7QhUXJ.',NULL,1,0,NULL,'2020-05-06 10:49:08','2020-05-06 10:49:08',NULL),(28,'Dr. Isaias Balistreri','monica.williamson@example.org','$2y$10$c3Kx.vmIwlzGQMkDCRMYcuRUk0h1eZ2RFA8JyIk2NMjJRTsJpLsUS',NULL,1,0,NULL,'2020-05-06 10:49:09','2020-05-06 10:49:09',NULL),(29,'Ally Marks','jeremy03@example.com','$2y$10$W7W7ICDrNWMmfRT7jrYhL.VI9X9PimGtQeF251J8gznfBCxQNs6W2',NULL,1,0,NULL,'2020-05-06 10:49:09','2020-05-06 10:49:09',NULL),(30,'Jedediah Funk','katlynn.durgan@example.org','$2y$10$Ufymgq3zha3sXnFhollzeu2n61vkv/c9ymVvV/0MP6YewK/zFWBfu',NULL,1,0,NULL,'2020-05-06 10:49:09','2020-05-06 10:49:09',NULL),(31,'Hope Considine','coralie94@example.net','$2y$10$ZEun/B/fKiemLC8x62xsPe7mRlNpU0AkxWbmmgKWLc667iJcHFNZG',NULL,1,0,NULL,'2020-05-06 10:49:09','2020-05-06 10:49:09',NULL),(32,'Koby Gleichner','predovic.jennyfer@example.com','$2y$10$A5DWa2dmewzLb7KQTcevuOd7Odec2BuOyU7NP0iVgl32qhJrnQrXC',NULL,1,0,NULL,'2020-05-06 10:49:09','2020-05-06 10:49:09',NULL),(33,'Prof. Amie Hamill Sr.','rosendo.herzog@example.com','$2y$10$1MEvnrNjhW8WadJnHYHAiOYxMZX/1s/K5i2zyGVqYICuKpl4kccUS',NULL,1,0,NULL,'2020-05-06 10:49:09','2020-05-06 10:49:09',NULL),(34,'Mr. Erich Ziemann Jr.','willis.kuphal@example.org','$2y$10$Xij7ws1gbYBxCcSXzYbZcuKhHK6VND7e1R9BckZG8UySEBToOavqS',NULL,1,0,NULL,'2020-05-06 10:49:10','2020-05-06 10:49:10',NULL),(35,'Xzavier Zboncak','seth.bartell@example.org','$2y$10$iC3GKP8XasPkZM0bXJo88utlvQDRsJI3c0uDGw6a0juDvkafofzdm',NULL,1,0,NULL,'2020-05-06 10:49:10','2020-05-06 10:49:10',NULL),(36,'Adella Marvin MD','angie.prosacco@example.net','$2y$10$rj7ISJiiV98zg0YDIPKTMOi3qJb76B901oqrAWMy.0zfb1G/0Oo/q',NULL,1,0,NULL,'2020-05-06 10:49:10','2020-05-06 10:49:10',NULL),(37,'Mallie Harris','lydia.littel@example.com','$2y$10$7vnTosNlyaEIRzC0utVrSO7mmJHWDDEf7oGhqDGirWuUDzcC0sgKu',NULL,1,0,NULL,'2020-05-06 10:49:10','2020-05-06 10:49:10',NULL),(38,'Mr. Johathan Rempel DDS','boehm.alessia@example.net','$2y$10$uVAjk.RrUWenqo.ewPXvIOaVS2hqDOE9ZajmYXg7vE4Rvb66HxR2e',NULL,1,0,NULL,'2020-05-06 10:49:10','2020-05-06 10:49:10',NULL),(39,'Prof. Pietro Schowalter','ymuller@example.net','$2y$10$4w.h55nb758EGunnt13Eye4A15r89WevEBLyjTZ8VEtbDGbe7jC9a',NULL,1,0,NULL,'2020-05-06 10:49:10','2020-05-06 10:49:10',NULL),(40,'Ena Schuppe','brennan.wuckert@example.com','$2y$10$I8GXa3WIa9/rnnOugYoZju5dKwhxSgeTTtElnUI5DWOXsM1ylNkR6',NULL,1,0,NULL,'2020-05-06 10:49:11','2020-05-06 10:49:11',NULL),(41,'Maddison Kassulke','linwood32@example.org','$2y$10$0FHAYtPK7fqiqjxBjSAV5eI.sAwua8Ta60bDqPnwoC/wPzqZdzgxO',NULL,1,0,NULL,'2020-05-06 10:49:11','2020-05-06 10:49:11',NULL),(42,'Valentina White','meghan.johnston@example.com','$2y$10$cI8DDZlxj6L8/C5uz1Xf1e.I3P1GVTVSd7TClOjukfXgqSX8fuwCi',NULL,1,0,NULL,'2020-05-06 10:49:11','2020-05-06 10:49:11',NULL),(43,'Tatum Keeling','ihyatt@example.net','$2y$10$OBo2ev.ms7SGmuxD98kNyONnrP1Ab45/kwCtAgfYojq3Ik1.Pyxoa',NULL,1,0,NULL,'2020-05-06 10:49:11','2020-05-06 10:49:11',NULL),(44,'Mervin Okuneva','kameron.beahan@example.org','$2y$10$evd1ynn./AgAY7ClewnBw.KroaNOHsj2NEynC40vXWHZBHONzg5qS',NULL,1,0,NULL,'2020-05-06 10:49:11','2020-05-06 10:49:11',NULL),(45,'Hassan Hansen','marley36@example.com','$2y$10$WVYdGGrJzuqdGdjsWThmUO7/Q67lXjwx5IUCHBEw7PvJDM4tzjcHK',NULL,1,0,NULL,'2020-05-06 10:49:11','2020-05-06 10:49:11',NULL),(46,'Louisa Heller','uwilderman@example.com','$2y$10$OOZtlTRrs1iUUmAlBMTUt./s.t1h.oyESsjdEr4kuvL/zZQNHp1p2',NULL,1,0,NULL,'2020-05-06 10:49:12','2020-05-06 10:49:12',NULL),(47,'Marcelle Lehner MD','king.alicia@example.com','$2y$10$zHCpBad7D0tDQN2as3FdzeGSRmEXft0XIz5BFk9GMxgf8X0TsxnI6',NULL,1,0,NULL,'2020-05-06 10:49:12','2020-05-06 10:49:12',NULL),(48,'Norma Blick','baumbach.dianna@example.org','$2y$10$MdygZQCg.4Uk3KmJS6Nz4.YzE0aYkaRB.FNg1XoHu3bPWMl5WhKAC',NULL,1,0,NULL,'2020-05-06 10:49:12','2020-05-06 10:49:12',NULL),(49,'Marilyne Christiansen','kaci.bradtke@example.com','$2y$10$6OsM4pLY0dEDDsMoEEW62.5vb2w8OKJF8A3xIRj3LggcvQNd8HqvS',NULL,1,0,NULL,'2020-05-06 10:49:12','2020-05-06 10:49:12',NULL),(50,'Verlie Rutherford','troy32@example.org','$2y$10$7U4CZieOHjavJu8Eeb/0/e9bIsmI5EEdWZP1s20NdiNxqrh0pZ2Ru',NULL,1,0,NULL,'2020-05-06 10:49:12','2020-05-06 10:49:12',NULL),(51,'Sydnie Gerhold','kayleigh.upton@example.net','$2y$10$IZ7wGz4Fb9veeBvIjcYIteMoGt0uEIZvdELSVdrXdkFXRhfKUJ3JS',NULL,1,0,NULL,'2020-05-06 10:49:12','2020-05-06 10:49:12',NULL);
/*!40000 ALTER TABLE `kullanici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanici_detay`
--

DROP TABLE IF EXISTS `kullanici_detay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kullanici_detay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kullanici_id` int(10) unsigned NOT NULL,
  `adres` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefon` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ceptelefonu` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kullanici_detay_kullanici_id_foreign` (`kullanici_id`),
  CONSTRAINT `kullanici_detay_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanici` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanici_detay`
--

LOCK TABLES `kullanici_detay` WRITE;
/*!40000 ALTER TABLE `kullanici_detay` DISABLE KEYS */;
INSERT INTO `kullanici_detay` VALUES (1,1,'İstanbul','(312) 444 55 66','(555) 444 55 66'),(2,2,'9074 Lois Way Apt. 386\nLoistown, NJ 19817','+3144835962644','+7790918146182'),(3,3,'4128 Flatley Hollow\nBrooklynmouth, PA 37957','+1441574745672','+4930636610873'),(4,4,'3897 Genoveva Stravenue\nPort Melisa, DE 55259-6660','+4184013064275','+8198269637073'),(5,5,'814 Orval Expressway Apt. 992\nFeeneyview, DE 17474-0191','+1768760384599','+5732026366411'),(6,6,'389 Gabriella Pass\nBraxtonburgh, TX 97943','+3405275676977','+7983644868055'),(7,7,'8150 Minnie Groves\nUllrichshire, NY 73138','+8337404528953','+4085011264275'),(8,8,'4050 Torrance Drives Apt. 512\nKarsonville, OK 56981','+2880744243863','+1444947927817'),(9,9,'285 Runolfsson Inlet\nBinsport, NM 87958-0626','+6623809009241','+2307381613584'),(10,10,'9623 Spencer Mews\nPort Ursulaland, MI 33602','+4835850074270','+6244150469074'),(11,11,'3540 Schaefer Square Apt. 897\nEast Meaganside, AR 79029','+7842662036638','+8398941083713'),(12,12,'57239 Alexys Valleys\nBiankaport, NJ 60530','+5642863362506','+8650072854834'),(13,13,'958 Collins Isle Apt. 716\nVonRuedenstad, TN 97654','+5456972555774','+1379853102980'),(14,14,'2728 Stanton Manors Apt. 586\nMartyfort, CO 80057','+7179039951368','+9586360123468'),(15,15,'8915 Jessyca Cove Apt. 716\nNorth Kianashire, ND 33286-0050','+2940283798669','+8120125763021'),(16,16,'880 Prohaska Ranch Apt. 233\nJocelynmouth, ND 34561-2789','+7980879551888','+4093478311716'),(17,17,'852 Lonie Hill Suite 183\nHilpertview, LA 54228-6846','+5339996673415','+8911812543824'),(18,18,'871 Jamaal Burg Suite 005\nLake Federico, MN 29747','+2533592749115','+7401816895238'),(19,19,'4552 Pouros Shore Suite 051\nAlecborough, IL 48058','+3584966511731','+6122236564328'),(20,20,'89283 Mario Turnpike\nHaagtown, RI 12438','+5364146824296','+3319262348156'),(21,21,'50983 Margot Roads\nPort Theodora, AZ 24819-6642','+4344672832076','+1094522304086'),(22,22,'10815 Savion Keys Suite 040\nSchustermouth, NM 45707-2876','+9988910102823','+8638124969679'),(23,23,'970 Lorine Freeway Apt. 242\nGilbertomouth, OH 28321','+7091488505946','+3107285964098'),(24,24,'350 Sadye Expressway Apt. 884\nEttietown, WY 30433-9231','+5030304251771','+4564881529112'),(25,25,'185 Wintheiser Trail\nNew Margarette, MN 70881','+6732290864314','+5742243205483'),(26,26,'6688 Paolo Tunnel Suite 969\nTracetown, NM 75595-2322','+7103663002419','+7971708550163'),(27,27,'218 Schultz Square\nJoyton, MT 29443-6844','+6031857977181','+4818774925819'),(28,28,'7485 Buckridge Mount\nCollinstown, IL 68136','+2610812230685','+4088114197293'),(29,29,'16916 Schumm Street\nGaylordfort, NJ 46947-2799','+9980946620884','+2397729513799'),(30,30,'33366 Pacocha Springs\nKeelington, SD 69517','+1619419579896','+1362828790708'),(31,31,'31604 Elliott Wall Apt. 123\nEast Antonia, IL 96742','+4221546439146','+1708479986791'),(32,32,'89216 Chadd Cove Suite 998\nAlftown, MT 93140-0143','+5990593980642','+8830625700865'),(33,33,'8042 Candice Light Suite 481\nLolahaven, NC 75950','+2161330396542','+1581416447501'),(34,34,'54725 Una Ferry Apt. 671\nNew Bernita, NH 57542-3481','+5738684448915','+3921282903755'),(35,35,'1895 Sterling Trail Suite 378\nMurrayberg, NV 04981','+5884163001308','+9508617760573'),(36,36,'484 Brekke Roads Apt. 591\nFadelberg, RI 72546','+8151923015022','+1008731466287'),(37,37,'6178 Dorcas Pike\nSadyetown, NE 03710-2780','+8567005208991','+1118368857117'),(38,38,'94491 Windler Terrace Suite 259\nLetitiamouth, MI 48170-2513','+9976391530097','+1667218735043'),(39,39,'62737 Annie Port\nJaidenside, MI 32410-1056','+1698445720842','+6889673013790'),(40,40,'1260 Jakubowski Mount Suite 762\nHudsontown, HI 38088','+4848571383471','+3583605279447'),(41,41,'497 Wintheiser Meadow\nFeeneyton, KS 76118-9706','+2492724180245','+5254998903042'),(42,42,'929 Cassie Ranch\nCandidoland, MS 80603','+3502529289897','+3710983805540'),(43,43,'9291 Koss Hollow Suite 204\nSporerstad, VA 03776-0339','+5049049866395','+4078392469278'),(44,44,'9822 Maribel Ramp\nDestanymouth, KY 24676','+1845382202077','+4092829073436'),(45,45,'78105 Loy Way\nNew Javonte, PA 11594','+9991850491491','+2085057668191'),(46,46,'165 Osinski Hill Apt. 053\nNorth Ninaton, TX 67087','+4808561548169','+7578934879922'),(47,47,'777 Enoch Shores\nLake Gonzalo, WV 79764','+3861076152610','+5612382131286'),(48,48,'795 Reginald Row\nRobelland, PA 25562','+6725395030211','+4725374698253'),(49,49,'7735 Deja Trail Suite 822\nNorth Ottis, NM 71560','+1282739898945','+8995246456698'),(50,50,'797 Goldner Rue\nHintzfort, TN 36137-2332','+3361188040727','+3712619352631'),(51,51,'3391 Granville River\nKierafurt, FL 09748-6467','+5977042420658','+2995491013030');
/*!40000 ALTER TABLE `kullanici_detay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (4,'2020_04_30_093129_create_kategori_table',1),(5,'2020_04_30_140320_create_urun_table',2),(6,'2020_04_30_151932_create_kategori_urun_table',3),(7,'2020_05_02_135550_create_urun_detay_table',4),(8,'2020_05_03_161712_create_kullanici_table',5),(9,'2020_05_04_092530_create_sepet_table',6),(10,'2020_05_04_093125_create_sepet_urun_table',7),(13,'2020_05_05_223350_create_siparis_table',8),(14,'2020_05_05_224544_create_kullanici_detay_table',8),(16,'2020_05_07_210546_create_ayar_table',9);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sepet`
--

DROP TABLE IF EXISTS `sepet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sepet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kullanici_id` int(10) unsigned NOT NULL,
  `olusturma_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `silinme_tarihi` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sepet_kullanici_id_foreign` (`kullanici_id`),
  CONSTRAINT `sepet_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanici` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sepet`
--

LOCK TABLES `sepet` WRITE;
/*!40000 ALTER TABLE `sepet` DISABLE KEYS */;
INSERT INTO `sepet` VALUES (4,7,'2020-05-05 14:25:58','2020-05-05 14:25:58',NULL),(5,7,'2020-05-05 21:08:05','2020-05-05 21:08:05',NULL),(6,7,'2020-05-05 21:11:29','2020-05-05 21:11:29',NULL),(7,9,'2020-05-05 23:30:05','2020-05-05 23:30:05',NULL);
/*!40000 ALTER TABLE `sepet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sepet_urun`
--

DROP TABLE IF EXISTS `sepet_urun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sepet_urun` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sepet_id` int(10) unsigned NOT NULL,
  `urun_id` int(10) unsigned NOT NULL,
  `adet` int(11) NOT NULL,
  `fiyati` decimal(5,2) NOT NULL,
  `durum` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `olusturma_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `silinme_tarihi` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sepet_urun_sepet_id_foreign` (`sepet_id`),
  KEY `sepet_urun_urun_id_foreign` (`urun_id`),
  CONSTRAINT `sepet_urun_sepet_id_foreign` FOREIGN KEY (`sepet_id`) REFERENCES `sepet` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sepet_urun_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urun` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sepet_urun`
--

LOCK TABLES `sepet_urun` WRITE;
/*!40000 ALTER TABLE `sepet_urun` DISABLE KEYS */;
INSERT INTO `sepet_urun` VALUES (10,4,25,1,14.54,'Beklemede','2020-05-05 14:25:58','2020-05-05 20:23:05','2020-05-05 20:23:05'),(11,4,20,5,15.62,'Beklemede','2020-05-05 14:25:58','2020-05-05 20:23:05','2020-05-05 20:23:05'),(12,4,24,1,7.29,'Beklemede','2020-05-05 14:25:59','2020-05-05 20:23:05','2020-05-05 20:23:05'),(13,4,23,1,9.78,'Beklemede','2020-05-05 20:24:29','2020-05-05 20:24:29',NULL),(14,4,24,3,7.29,'Beklemede','2020-05-05 20:30:21','2020-05-05 20:30:26',NULL),(15,5,23,3,9.78,'Beklemede','2020-05-05 21:08:05','2020-05-05 21:11:13',NULL),(16,6,23,1,9.78,'Beklemede','2020-05-05 21:11:29','2020-05-05 21:11:29',NULL),(17,6,24,1,7.29,'Beklemede','2020-05-05 23:19:11','2020-05-05 23:19:11',NULL),(18,7,20,1,15.62,'Beklemede','2020-05-05 23:30:05','2020-05-05 23:30:05',NULL);
/*!40000 ALTER TABLE `sepet_urun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siparis`
--

DROP TABLE IF EXISTS `siparis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siparis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sepet_id` int(10) unsigned NOT NULL,
  `siparis_tutari` decimal(10,4) NOT NULL,
  `durum` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adsoyad` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adres` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefon` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ceptelefonu` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banka` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taksit_sayisi` int(11) DEFAULT NULL,
  `olusturma_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `silinme_tarihi` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siparis_sepet_id_unique` (`sepet_id`),
  CONSTRAINT `siparis_sepet_id_foreign` FOREIGN KEY (`sepet_id`) REFERENCES `sepet` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siparis`
--

LOCK TABLES `siparis` WRITE;
/*!40000 ALTER TABLE `siparis` DISABLE KEYS */;
INSERT INTO `siparis` VALUES (1,4,31.6500,'Siparişiniz alındı','Çağla Öztürk','istanbul','(526) 521-41-52','(632) 521-47-85','Garanti',1,'2020-05-05 20:50:28','2020-05-05 20:50:28',NULL),(2,5,29.3300,'Sipariş tamamlandı','Çağla Öztürk','istanbul','(526) 521-41-52','(632) 521-47-85','Garanti',1,'2020-05-05 21:11:22','2020-05-07 17:13:26',NULL),(3,7,15.6200,'Ödeme onaylandı','Hüseyin Öztürk','İstanbul','(111) 111-11-11','(111) 111-11-11','Garanti',1,'2020-05-05 23:30:23','2020-05-07 13:43:27','2020-05-07 13:43:27');
/*!40000 ALTER TABLE `siparis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urun`
--

DROP TABLE IF EXISTS `urun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urun` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urun_adi` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aciklama` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiyati` decimal(6,3) NOT NULL,
  `olusturulma_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `silinme_tarihi` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urun`
--

LOCK TABLES `urun` WRITE;
/*!40000 ALTER TABLE `urun` DISABLE KEYS */;
INSERT INTO `urun` VALUES (1,'quia-veritatis-dolorem','Quia veritatis dolorem.','Reprehenderit dolorem eligendi ut id est deserunt accusamus vel a voluptatem omnis aperiam ut ea deleniti officiis vel et quam consequatur quidem.',9.301,'2020-05-02 11:42:34','2020-05-02 11:42:34',NULL),(2,'omnis-dolorum-amet','Omnis dolorum amet.','Est et corrupti facere non sit iste aperiam beatae inventore et sed architecto aut nobis molestiae optio.',13.289,'2020-05-02 11:42:34','2020-05-02 11:42:34',NULL),(3,'rerum-vitae-sint','Rerum vitae sint.','Beatae eum et labore in qui ut earum consequatur nisi quidem ut officiis qui.',2.547,'2020-05-02 11:42:34','2020-05-02 11:42:34',NULL),(4,'totam-a-quisquam','Totam a quisquam.','Beatae saepe iure odio nesciunt non possimus rerum sapiente est in quia cumque quaerat.',1.127,'2020-05-02 11:42:34','2020-05-02 11:42:34',NULL),(5,'optio-rem','Optio rem.','Velit accusamus aliquid ab sit autem rerum exercitationem rerum animi unde aliquam nisi optio repellat fugit ipsam amet molestiae doloribus.',12.520,'2020-05-02 11:42:34','2020-05-02 11:42:34',NULL),(6,'doloribus-autem-qui','Doloribus autem qui.','Tempore et doloremque hic incidunt quisquam molestiae consequatur est dolorum consequatur officiis eum ut non autem dolore quaerat nisi ut.',4.565,'2020-05-02 11:42:34','2020-05-02 11:42:34',NULL),(7,'veniam-ipsum-quidem','Veniam ipsum quidem.','Expedita quia praesentium omnis qui repellat omnis ut officia recusandae sapiente et nobis accusantium enim omnis.',13.374,'2020-05-02 11:42:35','2020-05-02 11:42:35',NULL),(8,'sint-id','Sint id.','Cum et unde odit esse non aut impedit quam in corrupti consequatur nisi excepturi culpa inventore doloribus sequi aut tenetur nemo qui.',7.108,'2020-05-02 11:42:35','2020-05-02 11:42:35',NULL),(9,'quia-quasi','Quia quasi.','Aliquam sed qui reiciendis deleniti nihil sint ea eum beatae ipsam ut qui distinctio.',18.508,'2020-05-02 11:42:35','2020-05-02 11:42:35',NULL),(10,'id-sed-eaque','Id sed eaque.','Provident laborum consequuntur sunt et omnis placeat accusamus laborum in sunt quia explicabo.',16.455,'2020-05-02 11:42:35','2020-05-02 11:42:35',NULL),(11,'vel-perspiciatis-eveniet','Vel perspiciatis eveniet.','Qui est sint aperiam cupiditate facere perferendis praesentium architecto assumenda accusamus blanditiis qui ut beatae enim aut ut quo sunt ut.',4.407,'2020-05-02 11:42:35','2020-05-02 11:42:35',NULL),(12,'sed-occaecati-labore','Sed occaecati labore.','Est laborum optio quisquam commodi natus magni vero expedita enim expedita quisquam id eius iure dicta enim.',19.036,'2020-05-02 11:42:35','2020-05-02 11:42:35',NULL),(13,'velit-minima-enim','Velit minima enim.','Tempore consequatur aliquid aperiam ducimus et atque eum deserunt cumque dolorem saepe rerum iure ut doloribus sequi voluptates.',11.505,'2020-05-02 11:42:35','2020-05-02 11:42:35',NULL),(14,'quis-libero-omnis','Quis libero omnis.','Neque dolorem dolorem quia nulla et qui harum quibusdam omnis sed cum est adipisci quo et.',10.674,'2020-05-02 11:42:35','2020-05-02 11:42:35',NULL),(15,'molestiae-voluptas-eos','Molestiae voluptas eos.','Fugiat et quo dolores blanditiis ut pariatur provident veniam veritatis numquam nulla tempora tenetur minima corrupti fugiat qui sed esse quia sint fugit aspernatur adipisci in facilis.',3.402,'2020-05-02 11:42:35','2020-05-02 11:42:35',NULL),(16,'et-et-velit','Et et velit.','Esse soluta explicabo facilis voluptates sed sunt inventore quas illo et qui aut saepe illo fuga dolorum accusantium facere incidunt atque aliquid explicabo aut architecto.',13.078,'2020-05-02 11:42:35','2020-05-02 11:42:35',NULL),(17,'aut-excepturi-consequatur','Aut excepturi consequatur.','Laborum eius dolorum consequuntur ullam numquam rerum voluptatem in cupiditate atque quaerat eos autem repellat rem excepturi nobis veniam possimus dolores dolores.',15.297,'2020-05-02 11:42:35','2020-05-02 11:42:35',NULL),(18,'doloribus-officia','Doloribus officia.','Aut qui natus quis odio nostrum inventore possimus sunt aut minus nostrum velit tempora dolor ipsum et ducimus corporis ipsum et et ea non in nulla.',15.364,'2020-05-02 11:42:35','2020-05-02 11:42:35',NULL),(19,'ut-eius','Ut eius.','Dolores ullam neque voluptatibus possimus eum dolorem quaerat assumenda sit sit ullam quam illo blanditiis rerum et veniam vitae placeat quaerat.',1.036,'2020-05-02 11:42:35','2020-05-02 11:42:35',NULL),(20,'ea-facilis','Ea facilis.','Dicta maxime beatae amet consectetur recusandae voluptas cum rerum velit itaque atque et cum et tempore hic consequuntur consequatur eveniet quo dolore veritatis et adipisci unde magni non quia.',15.615,'2020-05-02 11:42:36','2020-05-02 11:42:36',NULL),(21,'facilis-provident-facilis','Facilis provident facilis.','Facilis molestias est animi hic voluptas beatae et accusantium doloremque suscipit voluptate sed consectetur aut corrupti ipsam eos quo repellat nulla et fugiat aut et illum aliquam.',6.506,'2020-05-02 11:42:36','2020-05-02 11:42:36',NULL),(22,'aut-nihil-omnis','Aut nihil omnis.','Ut eveniet et beatae non ut rerum aut eum quisquam sint molestiae illum asperiores nihil eaque molestiae et voluptatem pariatur eius natus aut optio eveniet eligendi aperiam.',18.241,'2020-05-02 11:42:36','2020-05-02 11:42:36',NULL),(23,'ut-non','Ut non.','Officiis beatae est blanditiis enim pariatur occaecati voluptatem et earum vel quo facere omnis nisi et odio eveniet ea impedit eius quas est aut sint facilis qui hic.',9.777,'2020-05-02 11:42:36','2020-05-02 11:42:36',NULL),(24,'sit-cumque-ut','Sit cumque ut.','Repellat et voluptates rerum consequatur distinctio quae eligendi iusto qui et optio praesentium atque sed.',7.291,'2020-05-02 11:42:36','2020-05-02 11:42:36',NULL),(25,'rem-et-atque','Rem et atque.','Quia quidem quisquam qui eos ullam quasi tenetur nihil corporis quidem nulla distinctio vitae enim blanditiis ad explicabo quia nihil.',14.543,'2020-05-02 11:42:36','2020-05-02 11:42:36',NULL),(26,'a-autem-ullam','A autem ullam.','Assumenda tenetur reiciendis a quia animi dicta aut quo architecto laudantium assumenda nulla soluta cupiditate dolorem aspernatur perferendis voluptatem laborum eum sed distinctio.',9.994,'2020-05-02 11:42:36','2020-05-02 11:42:36',NULL),(27,'neque-voluptate-atque','Neque voluptate atque.','Unde aut quisquam id sunt quidem quas saepe quasi doloribus nobis exercitationem veritatis.',3.420,'2020-05-02 11:42:36','2020-05-02 11:42:36',NULL),(28,'vitae-inventore','Vitae inventore.','Nulla perferendis libero et delectus quas voluptas deleniti nulla et nihil et ipsum impedit rem ut placeat fugiat repellat quia nesciunt.',4.504,'2020-05-02 11:42:36','2020-05-02 11:42:36',NULL),(29,'distinctio-ipsa-exercitationem1','Distinctio ipsa exercitationem1.','<p>Distinctio ipsa exercitationem.1</p>',19.281,'2020-05-02 11:42:36','2020-05-06 13:58:26',NULL),(30,'ullam-magnam-quo','Ullam magnam quo.','Autem provident sunt quos vero quia rerum qui numquam mollitia provident debitis ex sint magnam minus molestiae consequatur qui est reprehenderit aut aliquam voluptates.',9.178,'2020-05-02 11:42:36','2020-05-06 13:23:18','2020-05-06 13:23:18'),(31,'test','test','<p>test</p>',15.000,'2020-05-06 14:05:27','2020-05-06 18:19:55','2020-05-06 18:19:55'),(32,'distinctio-ipsa-exercitationem2','Distinctio ipsa exercitationem1.','<p>Distinctio ipsa exercitationem1.</p>',2.000,'2020-05-06 19:05:09','2020-05-06 19:05:09',NULL),(33,'test1','Deneme1','<p>Deneme1</p>',30.000,'2020-05-06 19:06:01','2020-05-06 22:59:02',NULL);
/*!40000 ALTER TABLE `urun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urun_detay`
--

DROP TABLE IF EXISTS `urun_detay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urun_detay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `urun_id` int(10) unsigned NOT NULL,
  `goster_slider` tinyint(1) NOT NULL DEFAULT '0',
  `goster_gunun_firsati` tinyint(1) NOT NULL DEFAULT '0',
  `goster_one_cikan` tinyint(1) NOT NULL DEFAULT '0',
  `goster_cok_satan` tinyint(1) NOT NULL DEFAULT '0',
  `goster_indirimli` tinyint(1) NOT NULL DEFAULT '0',
  `urun_resmi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `urun_detay_urun_id_unique` (`urun_id`),
  CONSTRAINT `urun_detay_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urun` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urun_detay`
--

LOCK TABLES `urun_detay` WRITE;
/*!40000 ALTER TABLE `urun_detay` DISABLE KEYS */;
INSERT INTO `urun_detay` VALUES (1,1,1,1,1,0,0,NULL),(2,2,1,0,0,1,0,NULL),(3,3,1,0,0,1,1,NULL),(4,4,0,0,1,1,1,NULL),(5,5,0,0,1,1,1,NULL),(6,6,1,0,1,1,1,NULL),(7,7,1,1,0,0,0,NULL),(8,8,0,0,0,0,1,NULL),(9,9,0,1,1,1,1,NULL),(10,10,0,1,1,0,0,NULL),(11,11,0,1,0,0,0,NULL),(12,12,1,1,1,1,0,NULL),(13,13,0,0,0,0,0,NULL),(14,14,0,1,1,0,0,NULL),(15,15,0,1,1,1,0,NULL),(16,16,0,0,0,0,1,NULL),(17,17,1,0,1,1,0,NULL),(18,18,0,1,1,0,1,NULL),(19,19,1,1,1,1,1,NULL),(20,20,1,1,1,1,1,NULL),(21,21,1,1,0,0,0,NULL),(22,22,0,1,0,1,1,NULL),(23,23,1,1,1,0,0,NULL),(24,24,1,0,1,0,0,NULL),(25,25,0,0,1,0,0,NULL),(26,26,0,0,1,1,1,NULL),(27,27,0,0,0,1,0,NULL),(28,28,0,1,0,0,0,NULL),(29,29,1,1,1,1,0,NULL),(30,30,0,0,1,0,1,NULL),(31,31,1,0,1,0,0,NULL),(32,32,0,0,0,0,0,NULL),(33,33,1,1,1,1,1,'33-1588816751.jpeg');
/*!40000 ALTER TABLE `urun_detay` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-08 23:03:46
