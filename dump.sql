# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.29)
# Database: marvel
# Generation Time: 2020-04-17 10:16:02 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table favorites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `favorites`;

CREATE TABLE `favorites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `character_id` int(10) unsigned NOT NULL,
  `character_name` varchar(32) NOT NULL,
  `image_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `favorites_user_id_character_id_unique` (`user_id`,`character_id`),
  CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;

INSERT INTO `favorites` (`id`, `user_id`, `character_id`, `character_name`, `image_url`, `created_at`, `updated_at`)
VALUES
	(1,1,1011334,'3-D Man','http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',NULL,NULL),
	(2,1,1017100,'A-Bomb (HAS)','http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg',NULL,NULL),
	(3,2,1017100,'A-Bomb (HAS)','http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg',NULL,NULL),
	(4,2,1009144,'A.I.M.','http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec.jpg',NULL,NULL);

/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2016_06_01_000001_create_oauth_auth_codes_table',2),
	(5,'2016_06_01_000002_create_oauth_access_tokens_table',2),
	(6,'2016_06_01_000003_create_oauth_refresh_tokens_table',2),
	(7,'2016_06_01_000004_create_oauth_clients_table',2),
	(8,'2016_06_01_000005_create_oauth_personal_access_clients_table',2),
	(9,'2020_02_05_164527_create_ratings_table',3),
	(10,'2020_02_25_155959_add_firstandlastname_to_users_table',4),
	(11,'2020_03_04_141009_create_visitor_counters_table',5),
	(13,'2020_04_17_073348_create_favorites_table',6);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`)
VALUES
	('1a289e883870149f2b4aac53aa38bc4b40461207b5ebce09cb49f429c119c51d947868701cc6cd5a',2,2,NULL,'[]',0,'2020-04-17 08:28:07','2020-04-17 08:28:07','2020-04-17 09:28:07'),
	('41f875f206759d48a8f1b33c348a3bdb93463f9626f128b872768c79b146cd70f1b0583cb1aa81d4',2,2,NULL,'[]',0,'2020-04-17 09:10:33','2020-04-17 09:10:33','2020-04-17 10:10:33'),
	('4c7d94e1f1300d6427c31b8e99e5cca4d20e0ef0d8a704ae32b6ee691ad88c282f8b295bd99bdde0',1,2,NULL,'[]',0,'2020-04-17 10:13:06','2020-04-17 10:13:06','2020-04-17 11:13:06'),
	('b05b3f09aa3a80b220563c23ba8ef8270b8f09c5714816aaedf1962b83dc00b87d1c9646f472f50a',2,2,NULL,'[]',0,'2020-04-17 09:10:33','2020-04-17 09:10:33','2020-04-17 10:10:33');

/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,1,'Laravel Personal Access Client','7r3Iq1mWMfpdeUgkhwQgnLKwCZJV6REGwMqJjLlG','http://localhost',1,0,0,'2020-02-03 10:50:40','2020-02-03 10:50:40'),
	(2,1,'Laravel Password Grant Client','EWgZb1NOXSYYVOrtaz3b8fpX6vCJBhRKzvdb0L42','http://localhost',0,1,0,'2020-02-03 10:50:40','2020-02-03 10:50:40');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'2020-02-03 10:50:40','2020-02-03 10:50:40'),
	(2,3,'2020-02-03 12:10:12','2020-02-03 12:10:12');

/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`)
VALUES
	('32abe5c8d91046bb73340094e998944d92f676aeabcccb58c4b9af2795d95c3bf4c4d17100d472d4','41f875f206759d48a8f1b33c348a3bdb93463f9626f128b872768c79b146cd70f1b0583cb1aa81d4',0,'2020-04-17 10:09:33'),
	('6817ed0e25349dfe85837a1705c3f5b7d1708e14157360f8b8d5dc3353f9631bcc2e734469654a79','b05b3f09aa3a80b220563c23ba8ef8270b8f09c5714816aaedf1962b83dc00b87d1c9646f472f50a',0,'2020-04-17 10:09:33'),
	('8f01f9122ae567f04dcfc85128df2eab36d4bb50fb3850c25d04947c348930cd15863babc0bae21a','4c7d94e1f1300d6427c31b8e99e5cca4d20e0ef0d8a704ae32b6ee691ad88c282f8b295bd99bdde0',0,'2020-04-17 11:12:06'),
	('b9e6a4e5ecb61cb2f64976e8a6fc5f538eace675755ee8592404c85a783c9b8762fffb20921f50d7','1a289e883870149f2b4aac53aa38bc4b40461207b5ebce09cb49f429c119c51d947868701cc6cd5a',0,'2020-04-17 09:27:07');

/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ratings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `character_id` int(10) unsigned NOT NULL,
  `rating` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ratings_user_id_character_id_unique` (`user_id`,`character_id`),
  CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;

INSERT INTO `ratings` (`id`, `user_id`, `character_id`, `rating`, `created_at`, `updated_at`)
VALUES
	(2,2,1011334,3,'2020-03-09 12:30:43','2020-03-09 12:30:43'),
	(3,2,1017100,3,'2020-03-09 12:30:50','2020-03-09 12:30:50'),
	(4,2,1009144,3,'2020-03-09 12:30:59','2020-03-09 12:30:59'),
	(5,2,1009146,3,'2020-03-09 12:31:15','2020-03-09 12:31:15'),
	(6,1,1011334,2,'2020-03-09 12:32:00','2020-03-09 12:32:00'),
	(7,1,1017100,4,'2020-03-09 12:32:08','2020-03-09 12:32:08'),
	(8,1,1009144,3,'2020-03-09 12:32:16','2020-03-09 12:32:16'),
	(9,1,1009146,4,'2020-03-09 12:32:31','2020-03-09 12:32:31');

/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `firstname`, `lastname`)
VALUES
	(1,'admin','christian.marti@liip.ch','2020-02-03 12:19:00','$2y$12$rhNP8r8ZNBamexay.y6K1u0MVqRNChhBW2ZD6K3p3WqP7A2k/M/bm',NULL,'2020-02-03 12:19:00',NULL,'Christian','Marti'),
	(2,'marvel','test@test.com','2020-02-03 12:19:00','$2y$12$v8ndNVaiwHg42kZZbTIYseBOmrZpoZBU60AZOV9dFnew/H2JHaQVm',NULL,'2020-02-03 12:19:00',NULL,'Captain','Marvel');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table visitor_counters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `visitor_counters`;

CREATE TABLE `visitor_counters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `character_id` int(10) unsigned DEFAULT NULL,
  `visits` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `visitor_counters_character_id_unique` (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `visitor_counters` WRITE;
/*!40000 ALTER TABLE `visitor_counters` DISABLE KEYS */;

INSERT INTO `visitor_counters` (`id`, `character_id`, `visits`, `created_at`, `updated_at`)
VALUES
	(1,1017100,4,'2020-03-09 08:26:31','2020-04-17 10:14:20'),
	(2,1009144,4,'2020-03-09 08:26:45','2020-04-17 10:15:10'),
	(3,1011334,4,'2020-03-09 08:26:55','2020-04-17 10:13:30'),
	(4,1010699,2,'2020-03-09 12:15:34','2020-03-09 12:32:21'),
	(5,1009146,1,'2020-03-09 12:31:11','2020-03-09 12:31:11'),
	(6,1016823,1,'2020-03-09 12:31:22','2020-03-09 12:31:22');

/*!40000 ALTER TABLE `visitor_counters` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
