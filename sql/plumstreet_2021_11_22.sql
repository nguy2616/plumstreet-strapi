# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.26)
# Database: plumstreet
# Generation Time: 2021-11-22 11:52:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `bankName` varchar(255) DEFAULT NULL,
  `bankAddress` varchar(255) DEFAULT NULL,
  `bankZip` varchar(255) DEFAULT NULL,
  `bankCity` varchar(255) DEFAULT NULL,
  `iban` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table companies__contacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companies__contacts`;

CREATE TABLE `companies__contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table companies_cuisine_types__cuisine_types_companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companies_cuisine_types__cuisine_types_companies`;

CREATE TABLE `companies_cuisine_types__cuisine_types_companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `cuisine-type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table contacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fulName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `isInvoice` tinyint(1) DEFAULT NULL,
  `isPrimary` tinyint(1) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contacts_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table core_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `core_store`;

CREATE TABLE `core_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `core_store` WRITE;
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;

INSERT INTO `core_store` (`id`, `key`, `value`, `type`, `environment`, `tag`)
VALUES
	(1,'model_def_strapi::core-store','{\"uid\":\"strapi::core-store\",\"collectionName\":\"core_store\",\"info\":{\"name\":\"core_store\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"key\":{\"type\":\"string\"},\"value\":{\"type\":\"text\"},\"type\":{\"type\":\"string\"},\"environment\":{\"type\":\"string\"},\"tag\":{\"type\":\"string\"}}}','object',NULL,NULL),
	(2,'model_def_application::categories.categories','{\"uid\":\"application::categories.categories\",\"collectionName\":\"categories\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Categories\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"company\":{\"via\":\"categories\",\"model\":\"companies\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),
	(3,'model_def_application::companies.companies','{\"uid\":\"application::companies.companies\",\"collectionName\":\"companies\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Companies\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"phoneNumber\":{\"type\":\"string\"},\"bankName\":{\"type\":\"string\"},\"bankAddress\":{\"type\":\"string\"},\"bankZip\":{\"type\":\"string\"},\"bankCity\":{\"type\":\"string\"},\"iban\":{\"type\":\"string\"},\"address\":{\"type\":\"string\"},\"zip\":{\"type\":\"string\"},\"city\":{\"type\":\"string\"},\"contacts\":{\"collection\":\"contacts\",\"attribute\":\"contact\",\"column\":\"id\",\"isVirtual\":true},\"cuisine_types\":{\"collection\":\"cuisine-types\",\"via\":\"companies\",\"dominant\":true,\"attribute\":\"cuisine-type\",\"column\":\"id\",\"isVirtual\":true},\"categories\":{\"collection\":\"categories\",\"via\":\"company\",\"isVirtual\":true},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),
	(4,'model_def_application::contacts.contacts','{\"uid\":\"application::contacts.contacts\",\"collectionName\":\"contacts\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Contacts\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"fulName\":{\"type\":\"string\"},\"email\":{\"type\":\"email\",\"unique\":true},\"phoneNumber\":{\"type\":\"string\"},\"isInvoice\":{\"type\":\"boolean\"},\"isPrimary\":{\"type\":\"boolean\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),
	(5,'model_def_application::cuisine-types.cuisine-types','{\"uid\":\"application::cuisine-types.cuisine-types\",\"collectionName\":\"cuisine_types\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Cuisine_types\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"companies\":{\"via\":\"cuisine_types\",\"collection\":\"companies\",\"attribute\":\"company\",\"column\":\"id\",\"isVirtual\":true},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),
	(6,'model_def_application::legal-forms.legal-forms','{\"uid\":\"application::legal-forms.legal-forms\",\"collectionName\":\"legal_forms\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Legal_forms\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"companies\":{\"collection\":\"companies\",\"attribute\":\"company\",\"column\":\"id\",\"isVirtual\":true},\"published_at\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),
	(7,'model_def_strapi::webhooks','{\"uid\":\"strapi::webhooks\",\"collectionName\":\"strapi_webhooks\",\"info\":{\"name\":\"Strapi webhooks\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\"},\"url\":{\"type\":\"text\"},\"headers\":{\"type\":\"json\"},\"events\":{\"type\":\"json\"},\"enabled\":{\"type\":\"boolean\"}}}','object',NULL,NULL),
	(8,'model_def_strapi::permission','{\"uid\":\"strapi::permission\",\"collectionName\":\"strapi_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Permission\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"model\":\"role\",\"plugin\":\"admin\"}}}','object',NULL,NULL),
	(9,'model_def_strapi::role','{\"uid\":\"strapi::role\",\"collectionName\":\"strapi_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Role\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"collection\":\"user\",\"via\":\"roles\",\"plugin\":\"admin\",\"attribute\":\"user\",\"column\":\"id\",\"isVirtual\":true},\"permissions\":{\"configurable\":false,\"plugin\":\"admin\",\"collection\":\"permission\",\"via\":\"role\",\"isVirtual\":true}}}','object',NULL,NULL),
	(10,'model_def_strapi::user','{\"uid\":\"strapi::user\",\"collectionName\":\"strapi_administrator\",\"kind\":\"collectionType\",\"info\":{\"name\":\"User\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"collection\":\"role\",\"collectionName\":\"strapi_users_roles\",\"via\":\"users\",\"dominant\":true,\"plugin\":\"admin\",\"configurable\":false,\"private\":true,\"attribute\":\"role\",\"column\":\"id\",\"isVirtual\":true},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false}}}','object',NULL,NULL),
	(11,'model_def_plugins::i18n.locale','{\"uid\":\"plugins::i18n.locale\",\"collectionName\":\"i18n_locales\",\"kind\":\"collectionType\",\"info\":{\"name\":\"locale\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),
	(12,'model_def_plugins::upload.file','{\"uid\":\"plugins::upload.file\",\"collectionName\":\"upload_file\",\"kind\":\"collectionType\",\"info\":{\"name\":\"file\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),
	(13,'model_def_plugins::users-permissions.permission','{\"uid\":\"plugins::users-permissions.permission\",\"collectionName\":\"users-permissions_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"permission\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false}},\"attributes\":{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),
	(14,'model_def_plugins::users-permissions.role','{\"uid\":\"plugins::users-permissions.role\",\"collectionName\":\"users-permissions_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"role\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),
	(15,'model_def_plugins::users-permissions.user','{\"uid\":\"plugins::users-permissions.user\",\"collectionName\":\"users-permissions_user\",\"kind\":\"collectionType\",\"info\":{\"name\":\"user\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}','object',NULL,NULL),
	(16,'plugin_upload_settings','{\"sizeOptimization\":true,\"responsiveDimensions\":true}','object','development',''),
	(17,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"enabled\":false,\"icon\":\"book\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"}}','object','',''),
	(18,'plugin_content_manager_configuration_content_types::application::contacts.contacts','{\"uid\":\"application::contacts.contacts\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"fulName\",\"defaultSortBy\":\"fulName\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"fulName\":{\"edit\":{\"label\":\"FulName\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"FulName\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"phoneNumber\":{\"edit\":{\"label\":\"PhoneNumber\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PhoneNumber\",\"searchable\":true,\"sortable\":true}},\"isInvoice\":{\"edit\":{\"label\":\"IsInvoice\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"IsInvoice\",\"searchable\":true,\"sortable\":true}},\"isPrimary\":{\"edit\":{\"label\":\"IsPrimary\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"IsPrimary\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"fulName\",\"email\",\"phoneNumber\"],\"editRelations\":[],\"edit\":[[{\"name\":\"fulName\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"phoneNumber\",\"size\":6},{\"name\":\"isInvoice\",\"size\":4}],[{\"name\":\"isPrimary\",\"size\":4}]]}}','object','',''),
	(19,'plugin_content_manager_configuration_content_types::application::cuisine-types.cuisine-types','{\"uid\":\"application::cuisine-types.cuisine-types\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"companies\":{\"edit\":{\"label\":\"Companies\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Companies\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"companies\",\"created_at\"],\"editRelations\":[\"companies\"],\"edit\":[[{\"name\":\"name\",\"size\":6}]]}}','object','',''),
	(20,'plugin_content_manager_configuration_content_types::application::companies.companies','{\"uid\":\"application::companies.companies\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"phoneNumber\":{\"edit\":{\"label\":\"PhoneNumber\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PhoneNumber\",\"searchable\":true,\"sortable\":true}},\"bankName\":{\"edit\":{\"label\":\"BankName\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"BankName\",\"searchable\":true,\"sortable\":true}},\"bankAddress\":{\"edit\":{\"label\":\"BankAddress\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"BankAddress\",\"searchable\":true,\"sortable\":true}},\"bankZip\":{\"edit\":{\"label\":\"BankZip\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"BankZip\",\"searchable\":true,\"sortable\":true}},\"bankCity\":{\"edit\":{\"label\":\"BankCity\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"BankCity\",\"searchable\":true,\"sortable\":true}},\"iban\":{\"edit\":{\"label\":\"Iban\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Iban\",\"searchable\":true,\"sortable\":true}},\"address\":{\"edit\":{\"label\":\"Address\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Address\",\"searchable\":true,\"sortable\":true}},\"zip\":{\"edit\":{\"label\":\"Zip\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Zip\",\"searchable\":true,\"sortable\":true}},\"city\":{\"edit\":{\"label\":\"City\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"City\",\"searchable\":true,\"sortable\":true}},\"contacts\":{\"edit\":{\"label\":\"Contacts\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"fulName\"},\"list\":{\"label\":\"Contacts\",\"searchable\":false,\"sortable\":false}},\"cuisine_types\":{\"edit\":{\"label\":\"Cuisine_types\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Cuisine_types\",\"searchable\":false,\"sortable\":false}},\"categories\":{\"edit\":{\"label\":\"Categories\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Categories\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"phoneNumber\",\"bankName\"],\"editRelations\":[\"contacts\",\"cuisine_types\",\"categories\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"phoneNumber\",\"size\":6}],[{\"name\":\"bankName\",\"size\":6},{\"name\":\"bankAddress\",\"size\":6}],[{\"name\":\"bankZip\",\"size\":6},{\"name\":\"bankCity\",\"size\":6}],[{\"name\":\"iban\",\"size\":6},{\"name\":\"address\",\"size\":6}],[{\"name\":\"zip\",\"size\":6},{\"name\":\"city\",\"size\":6}]]}}','object','',''),
	(21,'plugin_content_manager_configuration_content_types::strapi::role','{\"uid\":\"strapi::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"Code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"editRelations\":[\"users\",\"permissions\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6}]]}}','object','',''),
	(22,'plugin_content_manager_configuration_content_types::strapi::user','{\"uid\":\"strapi::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"Firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"Lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"RegistrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"RegistrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"IsActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"IsActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"Roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"PreferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreferedLanguage\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"editRelations\":[\"roles\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"preferedLanguage\",\"size\":6}]]}}','object','',''),
	(23,'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission','{\"uid\":\"plugins::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"type\",\"defaultSortBy\":\"type\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"controller\":{\"edit\":{\"label\":\"Controller\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Controller\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"enabled\":{\"edit\":{\"label\":\"Enabled\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Enabled\",\"searchable\":true,\"sortable\":true}},\"policy\":{\"edit\":{\"label\":\"Policy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Policy\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"type\",\"controller\",\"action\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"controller\",\"size\":6}],[{\"name\":\"action\",\"size\":6},{\"name\":\"enabled\",\"size\":4}],[{\"name\":\"policy\",\"size\":6}]]}}','object','',''),
	(24,'plugin_i18n_default_locale','\"en\"','string','',''),
	(25,'plugin_content_manager_configuration_content_types::plugins::users-permissions.user','{\"uid\":\"plugins::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"ConfirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ConfirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"Confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4}]]}}','object','',''),
	(26,'plugin_content_manager_configuration_content_types::strapi::permission','{\"uid\":\"strapi::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"Subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"Properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"Conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}]]}}','object','',''),
	(27,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}','object','',''),
	(28,'plugin_content_manager_configuration_content_types::plugins::upload.file','{\"uid\":\"plugins::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"AlternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"AlternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"Caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"Width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"Height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"Formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"Hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"Ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"Mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"Size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"Url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"PreviewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreviewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"Provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider_metadata\",\"searchable\":false,\"sortable\":false}},\"related\":{\"edit\":{\"label\":\"Related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Related\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"editRelations\":[\"related\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}]]}}','object','',''),
	(29,'plugin_content_manager_configuration_content_types::application::legal-forms.legal-forms','{\"uid\":\"application::legal-forms.legal-forms\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"companies\":{\"edit\":{\"label\":\"Companies\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Companies\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"companies\",\"created_at\"],\"editRelations\":[\"companies\"],\"edit\":[[{\"name\":\"name\",\"size\":6}]]}}','object','',''),
	(30,'plugin_content_manager_configuration_content_types::plugins::users-permissions.role','{\"uid\":\"plugins::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"type\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"editRelations\":[\"permissions\",\"users\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]}}','object','',''),
	(31,'plugin_content_manager_configuration_content_types::application::categories.categories','{\"uid\":\"application::categories.categories\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"company\":{\"edit\":{\"label\":\"Company\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Company\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"company\",\"created_at\"],\"editRelations\":[\"company\"],\"edit\":[[{\"name\":\"name\",\"size\":6}]]}}','object','',''),
	(32,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}','object','',''),
	(33,'plugin_content_manager_configuration_content_types::plugins::i18n.locale','{\"uid\":\"plugins::i18n.locale\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"Code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Code\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"created_at\"],\"editRelations\":[],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]}}','object','',''),
	(34,'core_admin_auth','{\"providers\":{\"autoRegister\":false,\"defaultRole\":null}}','object','','');

/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cuisine_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cuisine_types`;

CREATE TABLE `cuisine_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table i18n_locales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `i18n_locales`;

CREATE TABLE `i18n_locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i18n_locales_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `i18n_locales` WRITE;
/*!40000 ALTER TABLE `i18n_locales` DISABLE KEYS */;

INSERT INTO `i18n_locales` (`id`, `name`, `code`, `created_by`, `updated_by`, `created_at`, `updated_at`)
VALUES
	(1,'English (en)','en',NULL,NULL,'2021-11-22 11:52:01','2021-11-22 11:52:01');

/*!40000 ALTER TABLE `i18n_locales` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table legal_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `legal_forms`;

CREATE TABLE `legal_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table legal_forms__companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `legal_forms__companies`;

CREATE TABLE `legal_forms__companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `legal_form_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table strapi_administrator
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_administrator`;

CREATE TABLE `strapi_administrator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `registrationToken` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `preferedLanguage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_administrator_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table strapi_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_permission`;

CREATE TABLE `strapi_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `properties` longtext,
  `conditions` longtext,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `strapi_permission` WRITE;
/*!40000 ALTER TABLE `strapi_permission` DISABLE KEYS */;

INSERT INTO `strapi_permission` (`id`, `action`, `subject`, `properties`, `conditions`, `role`, `created_at`, `updated_at`)
VALUES
	(1,'plugins::content-manager.explorer.create','application::categories.categories','{\"fields\":[\"name\",\"company\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:03'),
	(2,'plugins::content-manager.explorer.create','application::contacts.contacts','{\"fields\":[\"fulName\",\"email\",\"phoneNumber\",\"isInvoice\",\"isPrimary\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:03'),
	(3,'plugins::content-manager.explorer.update','application::categories.categories','{\"fields\":[\"name\",\"company\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:03'),
	(4,'plugins::content-manager.explorer.update','application::companies.companies','{\"fields\":[\"name\",\"phoneNumber\",\"bankName\",\"bankAddress\",\"bankZip\",\"bankCity\",\"iban\",\"address\",\"zip\",\"city\",\"contacts\",\"cuisine_types\",\"categories\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:03'),
	(5,'plugins::content-manager.explorer.update','application::contacts.contacts','{\"fields\":[\"fulName\",\"email\",\"phoneNumber\",\"isInvoice\",\"isPrimary\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:03'),
	(6,'plugins::content-manager.explorer.update','application::cuisine-types.cuisine-types','{\"fields\":[\"name\",\"companies\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:03'),
	(7,'plugins::content-manager.explorer.update','application::legal-forms.legal-forms','{\"fields\":[\"name\",\"companies\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:04'),
	(8,'plugins::content-manager.explorer.create','application::companies.companies','{\"fields\":[\"name\",\"phoneNumber\",\"bankName\",\"bankAddress\",\"bankZip\",\"bankCity\",\"iban\",\"address\",\"zip\",\"city\",\"contacts\",\"cuisine_types\",\"categories\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:04'),
	(9,'plugins::content-manager.explorer.delete','application::categories.categories','{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(10,'plugins::content-manager.explorer.create','application::cuisine-types.cuisine-types','{\"fields\":[\"name\",\"companies\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:04'),
	(11,'plugins::content-manager.explorer.read','application::cuisine-types.cuisine-types','{\"fields\":[\"name\",\"companies\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:04'),
	(12,'plugins::content-manager.explorer.delete','application::companies.companies','{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(13,'plugins::content-manager.explorer.create','application::legal-forms.legal-forms','{\"fields\":[\"name\",\"companies\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:04'),
	(14,'plugins::content-manager.explorer.delete','application::contacts.contacts','{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(15,'plugins::content-manager.explorer.delete','application::cuisine-types.cuisine-types','{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(16,'plugins::content-manager.explorer.read','application::categories.categories','{\"fields\":[\"name\",\"company\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:04'),
	(17,'plugins::content-manager.explorer.delete','application::legal-forms.legal-forms','{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(18,'plugins::content-manager.explorer.publish','application::categories.categories','{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(19,'plugins::content-manager.explorer.publish','application::companies.companies','{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(20,'plugins::content-manager.explorer.publish','application::contacts.contacts','{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(21,'plugins::content-manager.explorer.publish','application::cuisine-types.cuisine-types','{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(22,'plugins::content-manager.explorer.publish','application::legal-forms.legal-forms','{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(23,'plugins::content-manager.explorer.read','application::companies.companies','{\"fields\":[\"name\",\"phoneNumber\",\"bankName\",\"bankAddress\",\"bankZip\",\"bankCity\",\"iban\",\"address\",\"zip\",\"city\",\"contacts\",\"cuisine_types\",\"categories\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:04'),
	(24,'plugins::content-manager.explorer.read','application::contacts.contacts','{\"fields\":[\"fulName\",\"email\",\"phoneNumber\",\"isInvoice\",\"isPrimary\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:04'),
	(25,'plugins::upload.read',NULL,'{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(26,'plugins::upload.assets.create',NULL,'{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(27,'plugins::upload.assets.update',NULL,'{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(28,'plugins::upload.assets.download',NULL,'{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(29,'plugins::content-manager.explorer.read','application::legal-forms.legal-forms','{\"fields\":[\"name\",\"companies\"]}','[]',2,'2021-11-22 11:52:03','2021-11-22 11:52:04'),
	(30,'plugins::upload.assets.copy-link',NULL,'{}','[]',2,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(31,'plugins::content-manager.explorer.create','application::categories.categories','{\"fields\":[\"name\",\"company\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(32,'plugins::content-manager.explorer.create','application::companies.companies','{\"fields\":[\"name\",\"phoneNumber\",\"bankName\",\"bankAddress\",\"bankZip\",\"bankCity\",\"iban\",\"address\",\"zip\",\"city\",\"contacts\",\"cuisine_types\",\"categories\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(33,'plugins::content-manager.explorer.create','application::contacts.contacts','{\"fields\":[\"fulName\",\"email\",\"phoneNumber\",\"isInvoice\",\"isPrimary\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(34,'plugins::content-manager.explorer.create','application::cuisine-types.cuisine-types','{\"fields\":[\"name\",\"companies\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(35,'plugins::content-manager.explorer.create','application::legal-forms.legal-forms','{\"fields\":[\"name\",\"companies\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(36,'plugins::content-manager.explorer.read','application::categories.categories','{\"fields\":[\"name\",\"company\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(37,'plugins::content-manager.explorer.read','application::companies.companies','{\"fields\":[\"name\",\"phoneNumber\",\"bankName\",\"bankAddress\",\"bankZip\",\"bankCity\",\"iban\",\"address\",\"zip\",\"city\",\"contacts\",\"cuisine_types\",\"categories\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(38,'plugins::content-manager.explorer.read','application::cuisine-types.cuisine-types','{\"fields\":[\"name\",\"companies\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(39,'plugins::content-manager.explorer.read','application::contacts.contacts','{\"fields\":[\"fulName\",\"email\",\"phoneNumber\",\"isInvoice\",\"isPrimary\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(40,'plugins::content-manager.explorer.read','application::legal-forms.legal-forms','{\"fields\":[\"name\",\"companies\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(41,'plugins::content-manager.explorer.update','application::categories.categories','{\"fields\":[\"name\",\"company\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(42,'plugins::content-manager.explorer.update','application::companies.companies','{\"fields\":[\"name\",\"phoneNumber\",\"bankName\",\"bankAddress\",\"bankZip\",\"bankCity\",\"iban\",\"address\",\"zip\",\"city\",\"contacts\",\"cuisine_types\",\"categories\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(43,'plugins::content-manager.explorer.update','application::contacts.contacts','{\"fields\":[\"fulName\",\"email\",\"phoneNumber\",\"isInvoice\",\"isPrimary\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(44,'plugins::content-manager.explorer.update','application::cuisine-types.cuisine-types','{\"fields\":[\"name\",\"companies\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(45,'plugins::content-manager.explorer.update','application::legal-forms.legal-forms','{\"fields\":[\"name\",\"companies\"]}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(46,'plugins::content-manager.explorer.delete','application::categories.categories','{}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(47,'plugins::content-manager.explorer.delete','application::companies.companies','{}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(48,'plugins::content-manager.explorer.delete','application::contacts.contacts','{}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(49,'plugins::content-manager.explorer.delete','application::cuisine-types.cuisine-types','{}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(50,'plugins::content-manager.explorer.delete','application::legal-forms.legal-forms','{}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(51,'plugins::upload.read',NULL,'{}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(52,'plugins::upload.assets.create',NULL,'{}','[]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(53,'plugins::upload.assets.update',NULL,'{}','[\"admin::is-creator\"]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(54,'plugins::upload.assets.download',NULL,'{}','[]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(55,'plugins::upload.assets.copy-link',NULL,'{}','[]',3,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(56,'plugins::content-manager.explorer.create','application::categories.categories','{\"fields\":[\"name\",\"company\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(57,'plugins::content-manager.explorer.create','application::companies.companies','{\"fields\":[\"name\",\"phoneNumber\",\"bankName\",\"bankAddress\",\"bankZip\",\"bankCity\",\"iban\",\"address\",\"zip\",\"city\",\"contacts\",\"cuisine_types\",\"categories\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(58,'plugins::content-manager.explorer.create','application::contacts.contacts','{\"fields\":[\"fulName\",\"email\",\"phoneNumber\",\"isInvoice\",\"isPrimary\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(59,'plugins::content-manager.explorer.create','application::cuisine-types.cuisine-types','{\"fields\":[\"name\",\"companies\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(60,'plugins::content-manager.explorer.create','application::legal-forms.legal-forms','{\"fields\":[\"name\",\"companies\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(61,'plugins::content-manager.explorer.create','plugins::users-permissions.user','{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(62,'plugins::content-manager.explorer.read','application::categories.categories','{\"fields\":[\"name\",\"company\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(63,'plugins::content-manager.explorer.read','application::companies.companies','{\"fields\":[\"name\",\"phoneNumber\",\"bankName\",\"bankAddress\",\"bankZip\",\"bankCity\",\"iban\",\"address\",\"zip\",\"city\",\"contacts\",\"cuisine_types\",\"categories\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(64,'plugins::content-manager.explorer.read','application::contacts.contacts','{\"fields\":[\"fulName\",\"email\",\"phoneNumber\",\"isInvoice\",\"isPrimary\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(65,'plugins::content-manager.explorer.read','application::cuisine-types.cuisine-types','{\"fields\":[\"name\",\"companies\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(66,'plugins::content-manager.explorer.read','application::legal-forms.legal-forms','{\"fields\":[\"name\",\"companies\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(67,'plugins::content-manager.explorer.read','plugins::users-permissions.user','{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(68,'plugins::content-manager.explorer.update','application::categories.categories','{\"fields\":[\"name\",\"company\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(69,'plugins::content-manager.explorer.update','application::companies.companies','{\"fields\":[\"name\",\"phoneNumber\",\"bankName\",\"bankAddress\",\"bankZip\",\"bankCity\",\"iban\",\"address\",\"zip\",\"city\",\"contacts\",\"cuisine_types\",\"categories\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(70,'plugins::content-manager.explorer.update','application::contacts.contacts','{\"fields\":[\"fulName\",\"email\",\"phoneNumber\",\"isInvoice\",\"isPrimary\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(71,'plugins::content-manager.explorer.update','application::cuisine-types.cuisine-types','{\"fields\":[\"name\",\"companies\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(72,'plugins::content-manager.explorer.update','application::legal-forms.legal-forms','{\"fields\":[\"name\",\"companies\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(73,'plugins::content-manager.explorer.update','plugins::users-permissions.user','{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(74,'plugins::content-manager.explorer.delete','application::categories.categories','{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(75,'plugins::content-manager.explorer.delete','application::companies.companies','{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(76,'plugins::content-manager.explorer.delete','application::contacts.contacts','{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(77,'plugins::content-manager.explorer.delete','application::cuisine-types.cuisine-types','{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(78,'plugins::content-manager.explorer.delete','application::legal-forms.legal-forms','{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(79,'plugins::content-manager.explorer.delete','plugins::users-permissions.user','{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(80,'plugins::content-manager.explorer.publish','application::categories.categories','{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(81,'plugins::content-manager.explorer.publish','application::companies.companies','{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(82,'plugins::content-manager.explorer.publish','application::contacts.contacts','{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(83,'plugins::content-manager.explorer.publish','application::cuisine-types.cuisine-types','{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(84,'plugins::content-manager.explorer.publish','application::legal-forms.legal-forms','{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(85,'plugins::content-type-builder.read',NULL,'{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(86,'plugins::email.settings.read',NULL,'{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(87,'plugins::upload.read',NULL,'{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(88,'plugins::upload.assets.create',NULL,'{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(89,'plugins::upload.assets.update',NULL,'{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(90,'plugins::upload.assets.download',NULL,'{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(91,'plugins::upload.assets.copy-link',NULL,'{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(92,'plugins::upload.settings.read',NULL,'{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(93,'plugins::i18n.locale.create',NULL,'{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(94,'plugins::i18n.locale.read',NULL,'{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(95,'plugins::i18n.locale.update',NULL,'{}','[]',1,'2021-11-22 11:52:04','2021-11-22 11:52:04'),
	(96,'plugins::i18n.locale.delete',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(97,'plugins::content-manager.single-types.configure-view',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(98,'plugins::content-manager.collection-types.configure-view',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(99,'plugins::content-manager.components.configure-layout',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(100,'plugins::users-permissions.roles.create',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(101,'plugins::users-permissions.roles.read',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(102,'plugins::users-permissions.roles.update',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(103,'plugins::users-permissions.roles.delete',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(104,'plugins::users-permissions.providers.read',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(105,'plugins::users-permissions.providers.update',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(106,'plugins::users-permissions.email-templates.read',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(107,'plugins::users-permissions.email-templates.update',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(108,'plugins::users-permissions.advanced-settings.read',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(109,'plugins::users-permissions.advanced-settings.update',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(110,'admin::marketplace.read',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(111,'admin::marketplace.plugins.install',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(112,'admin::marketplace.plugins.uninstall',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(113,'admin::webhooks.create',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(114,'admin::webhooks.read',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(115,'admin::webhooks.update',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(116,'admin::webhooks.delete',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(117,'admin::users.create',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(118,'admin::users.read',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(119,'admin::users.update',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(120,'admin::users.delete',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(121,'admin::roles.create',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(122,'admin::roles.read',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(123,'admin::roles.update',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05'),
	(124,'admin::roles.delete',NULL,'{}','[]',1,'2021-11-22 11:52:05','2021-11-22 11:52:05');

/*!40000 ALTER TABLE `strapi_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table strapi_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_role`;

CREATE TABLE `strapi_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_role_name_unique` (`name`),
  UNIQUE KEY `strapi_role_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `strapi_role` WRITE;
/*!40000 ALTER TABLE `strapi_role` DISABLE KEYS */;

INSERT INTO `strapi_role` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'Super Admin','strapi-super-admin','Super Admins can access and manage all features and settings.','2021-11-22 11:52:03','2021-11-22 11:52:03'),
	(2,'Editor','strapi-editor','Editors can manage and publish contents including those of other users.','2021-11-22 11:52:03','2021-11-22 11:52:03'),
	(3,'Author','strapi-author','Authors can manage the content they have created.','2021-11-22 11:52:03','2021-11-22 11:52:03');

/*!40000 ALTER TABLE `strapi_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table strapi_users_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_users_roles`;

CREATE TABLE `strapi_users_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table strapi_webhooks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_webhooks`;

CREATE TABLE `strapi_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext,
  `headers` longtext,
  `events` longtext,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table upload_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `upload_file`;

CREATE TABLE `upload_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alternativeText` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext,
  `hash` varchar(255) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `previewUrl` varchar(255) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `provider_metadata` longtext,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table upload_file_morph
# ------------------------------------------------------------

DROP TABLE IF EXISTS `upload_file_morph`;

CREATE TABLE `upload_file_morph` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext,
  `field` longtext,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table users-permissions_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users-permissions_permission`;

CREATE TABLE `users-permissions_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users-permissions_permission` WRITE;
/*!40000 ALTER TABLE `users-permissions_permission` DISABLE KEYS */;

INSERT INTO `users-permissions_permission` (`id`, `type`, `controller`, `action`, `enabled`, `policy`, `role`, `created_by`, `updated_by`)
VALUES
	(1,'application','categories','count',0,'',1,NULL,NULL),
	(2,'application','categories','count',0,'',2,NULL,NULL),
	(3,'application','categories','update',0,'',1,NULL,NULL),
	(4,'application','categories','update',0,'',2,NULL,NULL),
	(5,'application','categories','create',0,'',2,NULL,NULL),
	(6,'application','companies','count',0,'',1,NULL,NULL),
	(7,'application','categories','create',0,'',1,NULL,NULL),
	(8,'application','companies','count',0,'',2,NULL,NULL),
	(9,'application','categories','delete',0,'',2,NULL,NULL),
	(10,'application','companies','create',0,'',1,NULL,NULL),
	(11,'application','categories','delete',0,'',1,NULL,NULL),
	(12,'application','categories','find',0,'',1,NULL,NULL),
	(13,'application','companies','create',0,'',2,NULL,NULL),
	(14,'application','companies','delete',0,'',1,NULL,NULL),
	(15,'application','companies','delete',0,'',2,NULL,NULL),
	(16,'application','categories','findone',0,'',1,NULL,NULL),
	(17,'application','categories','find',0,'',2,NULL,NULL),
	(18,'application','categories','findone',0,'',2,NULL,NULL),
	(19,'application','companies','find',0,'',1,NULL,NULL),
	(20,'application','companies','find',0,'',2,NULL,NULL),
	(21,'application','companies','findone',0,'',1,NULL,NULL),
	(22,'application','companies','findone',0,'',2,NULL,NULL),
	(23,'application','companies','update',0,'',1,NULL,NULL),
	(24,'application','companies','update',0,'',2,NULL,NULL),
	(25,'application','contacts','count',0,'',1,NULL,NULL),
	(26,'application','contacts','count',0,'',2,NULL,NULL),
	(27,'application','contacts','create',0,'',1,NULL,NULL),
	(28,'application','contacts','create',0,'',2,NULL,NULL),
	(29,'application','contacts','delete',0,'',1,NULL,NULL),
	(30,'application','contacts','delete',0,'',2,NULL,NULL),
	(31,'application','contacts','find',0,'',1,NULL,NULL),
	(32,'application','contacts','find',0,'',2,NULL,NULL),
	(33,'application','contacts','findone',0,'',1,NULL,NULL),
	(34,'application','contacts','findone',0,'',2,NULL,NULL),
	(35,'application','contacts','update',0,'',1,NULL,NULL),
	(36,'application','contacts','update',0,'',2,NULL,NULL),
	(37,'application','cuisine-types','count',0,'',1,NULL,NULL),
	(38,'application','cuisine-types','count',0,'',2,NULL,NULL),
	(39,'application','cuisine-types','create',0,'',1,NULL,NULL),
	(40,'application','cuisine-types','create',0,'',2,NULL,NULL),
	(41,'application','cuisine-types','delete',0,'',1,NULL,NULL),
	(42,'application','cuisine-types','delete',0,'',2,NULL,NULL),
	(43,'application','cuisine-types','find',0,'',1,NULL,NULL),
	(44,'application','cuisine-types','find',0,'',2,NULL,NULL),
	(45,'application','cuisine-types','findone',0,'',1,NULL,NULL),
	(46,'application','cuisine-types','findone',0,'',2,NULL,NULL),
	(47,'application','cuisine-types','update',0,'',1,NULL,NULL),
	(48,'application','cuisine-types','update',0,'',2,NULL,NULL),
	(49,'application','legal-forms','count',0,'',1,NULL,NULL),
	(50,'application','legal-forms','count',0,'',2,NULL,NULL),
	(51,'application','legal-forms','create',0,'',1,NULL,NULL),
	(52,'application','legal-forms','create',0,'',2,NULL,NULL),
	(53,'application','legal-forms','delete',0,'',1,NULL,NULL),
	(54,'application','legal-forms','delete',0,'',2,NULL,NULL),
	(55,'application','legal-forms','find',0,'',1,NULL,NULL),
	(56,'application','legal-forms','find',0,'',2,NULL,NULL),
	(57,'application','legal-forms','findone',0,'',1,NULL,NULL),
	(58,'application','legal-forms','findone',0,'',2,NULL,NULL),
	(59,'application','legal-forms','update',0,'',1,NULL,NULL),
	(60,'application','legal-forms','update',0,'',2,NULL,NULL),
	(61,'content-manager','collection-types','bulkdelete',0,'',1,NULL,NULL),
	(62,'content-manager','collection-types','bulkdelete',0,'',2,NULL,NULL),
	(63,'content-manager','collection-types','create',0,'',1,NULL,NULL),
	(64,'content-manager','collection-types','create',0,'',2,NULL,NULL),
	(65,'content-manager','collection-types','delete',0,'',1,NULL,NULL),
	(66,'content-manager','collection-types','delete',0,'',2,NULL,NULL),
	(67,'content-manager','collection-types','find',0,'',1,NULL,NULL),
	(68,'content-manager','collection-types','find',0,'',2,NULL,NULL),
	(69,'content-manager','collection-types','findone',0,'',1,NULL,NULL),
	(70,'content-manager','collection-types','findone',0,'',2,NULL,NULL),
	(71,'content-manager','collection-types','previewmanyrelations',0,'',1,NULL,NULL),
	(72,'content-manager','collection-types','previewmanyrelations',0,'',2,NULL,NULL),
	(73,'content-manager','collection-types','publish',0,'',1,NULL,NULL),
	(74,'content-manager','collection-types','publish',0,'',2,NULL,NULL),
	(75,'content-manager','collection-types','unpublish',0,'',1,NULL,NULL),
	(76,'content-manager','collection-types','unpublish',0,'',2,NULL,NULL),
	(77,'content-manager','collection-types','update',0,'',1,NULL,NULL),
	(78,'content-manager','collection-types','update',0,'',2,NULL,NULL),
	(79,'content-manager','components','findcomponentconfiguration',0,'',1,NULL,NULL),
	(80,'content-manager','components','findcomponentconfiguration',0,'',2,NULL,NULL),
	(81,'content-manager','components','findcomponents',0,'',1,NULL,NULL),
	(82,'content-manager','components','findcomponents',0,'',2,NULL,NULL),
	(83,'content-manager','components','updatecomponentconfiguration',0,'',1,NULL,NULL),
	(84,'content-manager','components','updatecomponentconfiguration',0,'',2,NULL,NULL),
	(85,'content-manager','content-types','findcontenttypeconfiguration',0,'',1,NULL,NULL),
	(86,'content-manager','content-types','findcontenttypeconfiguration',0,'',2,NULL,NULL),
	(87,'content-manager','content-types','findcontenttypes',0,'',1,NULL,NULL),
	(88,'content-manager','content-types','findcontenttypes',0,'',2,NULL,NULL),
	(89,'content-manager','content-types','findcontenttypessettings',0,'',1,NULL,NULL),
	(90,'content-manager','content-types','findcontenttypessettings',0,'',2,NULL,NULL),
	(91,'content-manager','content-types','updatecontenttypeconfiguration',0,'',1,NULL,NULL),
	(92,'content-manager','content-types','updatecontenttypeconfiguration',0,'',2,NULL,NULL),
	(93,'content-manager','relations','find',0,'',1,NULL,NULL),
	(94,'content-manager','relations','find',0,'',2,NULL,NULL),
	(95,'content-manager','single-types','createorupdate',0,'',1,NULL,NULL),
	(96,'content-manager','single-types','createorupdate',0,'',2,NULL,NULL),
	(97,'content-manager','single-types','delete',0,'',1,NULL,NULL),
	(98,'content-manager','single-types','delete',0,'',2,NULL,NULL),
	(99,'content-manager','single-types','find',0,'',1,NULL,NULL),
	(100,'content-manager','single-types','find',0,'',2,NULL,NULL),
	(101,'content-manager','single-types','publish',0,'',1,NULL,NULL),
	(102,'content-manager','single-types','publish',0,'',2,NULL,NULL),
	(103,'content-manager','single-types','unpublish',0,'',1,NULL,NULL),
	(104,'content-manager','single-types','unpublish',0,'',2,NULL,NULL),
	(105,'content-manager','uid','checkuidavailability',0,'',1,NULL,NULL),
	(106,'content-manager','uid','checkuidavailability',0,'',2,NULL,NULL),
	(107,'content-manager','uid','generateuid',0,'',1,NULL,NULL),
	(108,'content-manager','uid','generateuid',0,'',2,NULL,NULL),
	(109,'content-type-builder','builder','getreservednames',0,'',1,NULL,NULL),
	(110,'content-type-builder','builder','getreservednames',0,'',2,NULL,NULL),
	(111,'content-type-builder','componentcategories','deletecategory',0,'',1,NULL,NULL),
	(112,'content-type-builder','componentcategories','deletecategory',0,'',2,NULL,NULL),
	(113,'content-type-builder','componentcategories','editcategory',0,'',1,NULL,NULL),
	(114,'content-type-builder','componentcategories','editcategory',0,'',2,NULL,NULL),
	(115,'content-type-builder','components','createcomponent',0,'',1,NULL,NULL),
	(116,'content-type-builder','components','createcomponent',0,'',2,NULL,NULL),
	(117,'content-type-builder','components','deletecomponent',0,'',1,NULL,NULL),
	(118,'content-type-builder','components','deletecomponent',0,'',2,NULL,NULL),
	(119,'content-type-builder','components','getcomponent',0,'',1,NULL,NULL),
	(120,'content-type-builder','components','getcomponent',0,'',2,NULL,NULL),
	(121,'content-type-builder','components','getcomponents',0,'',1,NULL,NULL),
	(122,'content-type-builder','components','getcomponents',0,'',2,NULL,NULL),
	(123,'content-type-builder','components','updatecomponent',0,'',1,NULL,NULL),
	(124,'content-type-builder','components','updatecomponent',0,'',2,NULL,NULL),
	(125,'content-type-builder','connections','getconnections',0,'',1,NULL,NULL),
	(126,'content-type-builder','connections','getconnections',0,'',2,NULL,NULL),
	(127,'content-type-builder','contenttypes','createcontenttype',0,'',1,NULL,NULL),
	(128,'content-type-builder','contenttypes','createcontenttype',0,'',2,NULL,NULL),
	(129,'content-type-builder','contenttypes','deletecontenttype',0,'',1,NULL,NULL),
	(130,'content-type-builder','contenttypes','deletecontenttype',0,'',2,NULL,NULL),
	(131,'content-type-builder','contenttypes','getcontenttype',0,'',1,NULL,NULL),
	(132,'content-type-builder','contenttypes','getcontenttype',0,'',2,NULL,NULL),
	(133,'content-type-builder','contenttypes','getcontenttypes',0,'',1,NULL,NULL),
	(134,'content-type-builder','contenttypes','getcontenttypes',0,'',2,NULL,NULL),
	(135,'content-type-builder','contenttypes','updatecontenttype',0,'',1,NULL,NULL),
	(136,'content-type-builder','contenttypes','updatecontenttype',0,'',2,NULL,NULL),
	(137,'email','email','getsettings',0,'',1,NULL,NULL),
	(138,'email','email','getsettings',0,'',2,NULL,NULL),
	(139,'email','email','send',0,'',1,NULL,NULL),
	(140,'email','email','send',0,'',2,NULL,NULL),
	(141,'email','email','test',0,'',1,NULL,NULL),
	(142,'email','email','test',0,'',2,NULL,NULL),
	(143,'i18n','content-types','getnonlocalizedattributes',0,'',1,NULL,NULL),
	(144,'i18n','content-types','getnonlocalizedattributes',0,'',2,NULL,NULL),
	(145,'i18n','iso-locales','listisolocales',0,'',1,NULL,NULL),
	(146,'i18n','iso-locales','listisolocales',0,'',2,NULL,NULL),
	(147,'i18n','locales','createlocale',0,'',1,NULL,NULL),
	(148,'i18n','locales','createlocale',0,'',2,NULL,NULL),
	(149,'i18n','locales','deletelocale',0,'',1,NULL,NULL),
	(150,'i18n','locales','deletelocale',0,'',2,NULL,NULL),
	(151,'i18n','locales','listlocales',0,'',1,NULL,NULL),
	(152,'i18n','locales','listlocales',0,'',2,NULL,NULL),
	(153,'i18n','locales','updatelocale',0,'',1,NULL,NULL),
	(154,'i18n','locales','updatelocale',0,'',2,NULL,NULL),
	(155,'upload','upload','count',0,'',1,NULL,NULL),
	(156,'upload','upload','count',0,'',2,NULL,NULL),
	(157,'upload','upload','destroy',0,'',1,NULL,NULL),
	(158,'upload','upload','destroy',0,'',2,NULL,NULL),
	(159,'upload','upload','find',0,'',1,NULL,NULL),
	(160,'upload','upload','find',0,'',2,NULL,NULL),
	(161,'upload','upload','findone',0,'',1,NULL,NULL),
	(162,'upload','upload','findone',0,'',2,NULL,NULL),
	(163,'upload','upload','getsettings',0,'',1,NULL,NULL),
	(164,'upload','upload','getsettings',0,'',2,NULL,NULL),
	(165,'upload','upload','search',0,'',1,NULL,NULL),
	(166,'upload','upload','search',0,'',2,NULL,NULL),
	(167,'upload','upload','updatesettings',0,'',1,NULL,NULL),
	(168,'upload','upload','updatesettings',0,'',2,NULL,NULL),
	(169,'upload','upload','upload',0,'',1,NULL,NULL),
	(170,'upload','upload','upload',0,'',2,NULL,NULL),
	(171,'users-permissions','auth','callback',0,'',1,NULL,NULL),
	(172,'users-permissions','auth','callback',1,'',2,NULL,NULL),
	(173,'users-permissions','auth','connect',1,'',1,NULL,NULL),
	(174,'users-permissions','auth','connect',1,'',2,NULL,NULL),
	(175,'users-permissions','auth','emailconfirmation',0,'',1,NULL,NULL),
	(176,'users-permissions','auth','emailconfirmation',1,'',2,NULL,NULL),
	(177,'users-permissions','auth','forgotpassword',0,'',1,NULL,NULL),
	(178,'users-permissions','auth','forgotpassword',1,'',2,NULL,NULL),
	(179,'users-permissions','auth','register',0,'',1,NULL,NULL),
	(180,'users-permissions','auth','register',1,'',2,NULL,NULL),
	(181,'users-permissions','auth','resetpassword',0,'',1,NULL,NULL),
	(182,'users-permissions','auth','resetpassword',1,'',2,NULL,NULL),
	(183,'users-permissions','auth','sendemailconfirmation',0,'',1,NULL,NULL),
	(184,'users-permissions','auth','sendemailconfirmation',0,'',2,NULL,NULL),
	(185,'users-permissions','user','count',0,'',1,NULL,NULL),
	(186,'users-permissions','user','count',0,'',2,NULL,NULL),
	(187,'users-permissions','user','create',0,'',1,NULL,NULL),
	(188,'users-permissions','user','create',0,'',2,NULL,NULL),
	(189,'users-permissions','user','destroy',0,'',1,NULL,NULL),
	(190,'users-permissions','user','destroy',0,'',2,NULL,NULL),
	(191,'users-permissions','user','destroyall',0,'',1,NULL,NULL),
	(192,'users-permissions','user','destroyall',0,'',2,NULL,NULL),
	(193,'users-permissions','user','find',0,'',1,NULL,NULL),
	(194,'users-permissions','user','find',0,'',2,NULL,NULL),
	(195,'users-permissions','user','findone',0,'',1,NULL,NULL),
	(196,'users-permissions','user','findone',0,'',2,NULL,NULL),
	(197,'users-permissions','user','me',1,'',1,NULL,NULL),
	(198,'users-permissions','user','me',1,'',2,NULL,NULL),
	(199,'users-permissions','user','update',0,'',1,NULL,NULL),
	(200,'users-permissions','user','update',0,'',2,NULL,NULL),
	(201,'users-permissions','userspermissions','createrole',0,'',1,NULL,NULL),
	(202,'users-permissions','userspermissions','createrole',0,'',2,NULL,NULL),
	(203,'users-permissions','userspermissions','deleterole',0,'',1,NULL,NULL),
	(204,'users-permissions','userspermissions','deleterole',0,'',2,NULL,NULL),
	(205,'users-permissions','userspermissions','getadvancedsettings',0,'',1,NULL,NULL),
	(206,'users-permissions','userspermissions','getadvancedsettings',0,'',2,NULL,NULL),
	(207,'users-permissions','userspermissions','getemailtemplate',0,'',1,NULL,NULL),
	(208,'users-permissions','userspermissions','getemailtemplate',0,'',2,NULL,NULL),
	(209,'users-permissions','userspermissions','getpermissions',0,'',1,NULL,NULL),
	(210,'users-permissions','userspermissions','getpermissions',0,'',2,NULL,NULL),
	(211,'users-permissions','userspermissions','getpolicies',0,'',1,NULL,NULL),
	(212,'users-permissions','userspermissions','getpolicies',0,'',2,NULL,NULL),
	(213,'users-permissions','userspermissions','getproviders',0,'',1,NULL,NULL),
	(214,'users-permissions','userspermissions','getproviders',0,'',2,NULL,NULL),
	(215,'users-permissions','userspermissions','getrole',0,'',1,NULL,NULL),
	(216,'users-permissions','userspermissions','getrole',0,'',2,NULL,NULL),
	(217,'users-permissions','userspermissions','getroles',0,'',1,NULL,NULL),
	(218,'users-permissions','userspermissions','getroles',0,'',2,NULL,NULL),
	(219,'users-permissions','userspermissions','getroutes',0,'',1,NULL,NULL),
	(220,'users-permissions','userspermissions','getroutes',0,'',2,NULL,NULL),
	(221,'users-permissions','userspermissions','index',0,'',1,NULL,NULL),
	(222,'users-permissions','userspermissions','index',0,'',2,NULL,NULL),
	(223,'users-permissions','userspermissions','searchusers',0,'',1,NULL,NULL),
	(224,'users-permissions','userspermissions','searchusers',0,'',2,NULL,NULL),
	(225,'users-permissions','userspermissions','updateadvancedsettings',0,'',1,NULL,NULL),
	(226,'users-permissions','userspermissions','updateadvancedsettings',0,'',2,NULL,NULL),
	(227,'users-permissions','userspermissions','updateemailtemplate',0,'',1,NULL,NULL),
	(228,'users-permissions','userspermissions','updateemailtemplate',0,'',2,NULL,NULL),
	(229,'users-permissions','userspermissions','updateproviders',0,'',1,NULL,NULL),
	(230,'users-permissions','userspermissions','updateproviders',0,'',2,NULL,NULL),
	(231,'users-permissions','userspermissions','updaterole',0,'',1,NULL,NULL),
	(232,'users-permissions','userspermissions','updaterole',0,'',2,NULL,NULL);

/*!40000 ALTER TABLE `users-permissions_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users-permissions_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users-permissions_role`;

CREATE TABLE `users-permissions_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_role_type_unique` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users-permissions_role` WRITE;
/*!40000 ALTER TABLE `users-permissions_role` DISABLE KEYS */;

INSERT INTO `users-permissions_role` (`id`, `name`, `description`, `type`, `created_by`, `updated_by`)
VALUES
	(1,'Authenticated','Default role given to authenticated user.','authenticated',NULL,NULL),
	(2,'Public','Default role given to unauthenticated user.','public',NULL,NULL);

/*!40000 ALTER TABLE `users-permissions_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users-permissions_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users-permissions_user`;

CREATE TABLE `users-permissions_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `confirmationToken` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_user_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
