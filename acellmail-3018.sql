-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.26-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for agentcrmem
CREATE DATABASE IF NOT EXISTS `acellemail-3018` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `acellemail-3018`;

-- Dumping structure for table agentcrmem.saas_admins
CREATE TABLE IF NOT EXISTS `saas_admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `contact_id` int(10) unsigned DEFAULT NULL,
  `admin_group_id` int(10) unsigned NOT NULL,
  `language_id` int(10) unsigned DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_scheme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admins_user_id_foreign` (`user_id`),
  KEY `admins_creator_id_foreign` (`creator_id`),
  KEY `admins_contact_id_foreign` (`contact_id`),
  KEY `admins_admin_group_id_foreign` (`admin_group_id`),
  KEY `admins_language_id_foreign` (`language_id`),
  CONSTRAINT `admins_admin_group_id_foreign` FOREIGN KEY (`admin_group_id`) REFERENCES `saas_admin_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admins_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `saas_contacts` (`id`),
  CONSTRAINT `admins_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `saas_users` (`id`),
  CONSTRAINT `admins_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `saas_languages` (`id`),
  CONSTRAINT `admins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `saas_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_admins: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_admins` DISABLE KEYS */;
INSERT INTO `saas_admins` (`id`, `uid`, `user_id`, `creator_id`, `contact_id`, `admin_group_id`, `language_id`, `first_name`, `last_name`, `image`, `timezone`, `status`, `color_scheme`, `created_at`, `updated_at`) VALUES
	(1, '5c18e0585c82e', 1, NULL, NULL, 1, 1, 'Sandeep', 'Miller', NULL, 'Pacific/Easter', 'active', NULL, '2017-01-01 00:00:00', '2017-01-01 00:00:00');
/*!40000 ALTER TABLE `saas_admins` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_admin_groups
CREATE TABLE IF NOT EXISTS `saas_admin_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci,
  `permissions` text COLLATE utf8_unicode_ci,
  `custom_order` int(11) DEFAULT '0',
  `creator_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_groups_creator_id_foreign` (`creator_id`),
  CONSTRAINT `admin_groups_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `saas_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_admin_groups: ~2 rows (approximately)
/*!40000 ALTER TABLE `saas_admin_groups` DISABLE KEYS */;
INSERT INTO `saas_admin_groups` (`id`, `name`, `options`, `permissions`, `custom_order`, `creator_id`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', '', '{"admin_group_read":"all","admin_group_create":"yes","admin_group_update":"all","admin_group_delete":"all","admin_read":"all","admin_create":"yes","admin_update":"all","admin_delete":"all","admin_login_as":"all","customer_read":"all","customer_create":"yes","customer_update":"all","customer_delete":"all","customer_login_as":"all","subscription_read":"all","subscription_create":"yes","subscription_update":"all","subscription_disable":"all","subscription_enable":"all","subscription_delete":"all","subscription_paid":"all","subscription_unpaid":"all","plan_read":"all","plan_create":"yes","plan_update":"all","plan_delete":"all","payment_method_read":"all","payment_method_create":"yes","payment_method_update":"all","payment_method_delete":"all","sending_server_read":"all","sending_server_create":"yes","sending_server_update":"all","sending_server_delete":"all","bounce_handler_read":"all","bounce_handler_create":"yes","bounce_handler_update":"all","bounce_handler_delete":"all","fbl_handler_read":"all","fbl_handler_create":"yes","fbl_handler_update":"all","fbl_handler_delete":"all","sending_domain_read":"all","sending_domain_create":"yes","sending_domain_update":"all","sending_domain_delete":"all","template_read":"all","template_create":"yes","template_update":"all","template_delete":"all","layout_read":"yes","layout_update":"yes","setting_general":"yes","setting_sending":"yes","setting_system_urls":"yes","setting_access_when_offline":"yes","setting_background_job":"yes","setting_upgrade_manager":"yes","language_read":"yes","language_create":"yes","language_update":"yes","language_delete":"yes","currency_read":"all","currency_create":"yes","currency_update":"all","currency_delete":"all","report_blacklist":"yes","report_tracking_log":"yes","report_bounce_log":"yes","report_feedback_log":"yes","report_open_log":"yes","report_click_log":"yes","report_unsubscribe_log":"yes"}', 1, NULL, '2017-03-06 19:33:12', '2017-04-09 07:31:41'),
	(2, 'Reseller', '', '{"admin_group_read":"no","admin_group_create":"no","admin_group_update":"no","admin_group_delete":"no","admin_read":"no","admin_create":"no","admin_update":"no","admin_delete":"no","admin_login_as":"no","customer_read":"own","customer_create":"yes","customer_update":"own","customer_delete":"own","customer_login_as":"own","subscription_read":"own","subscription_create":"yes","subscription_update":"no","subscription_disable":"own","subscription_enable":"own","subscription_delete":"own","subscription_paid":"no","subscription_unpaid":"no","plan_read":"all","plan_create":"no","plan_update":"no","plan_delete":"no","payment_method_read":"no","payment_method_create":"no","payment_method_update":"no","payment_method_delete":"no","sending_server_read":"no","sending_server_create":"no","sending_server_update":"no","sending_server_delete":"no","bounce_handler_read":"no","bounce_handler_create":"no","bounce_handler_update":"no","bounce_handler_delete":"no","fbl_handler_read":"no","fbl_handler_create":"no","fbl_handler_update":"no","fbl_handler_delete":"no","sending_domain_read":"no","sending_domain_create":"no","sending_domain_update":"no","sending_domain_delete":"no","template_read":"own","template_create":"yes","template_update":"own","template_delete":"own","layout_read":"no","layout_update":"no","setting_general":"no","setting_sending":"no","setting_system_urls":"no","setting_access_when_offline":"no","setting_background_job":"no","setting_upgrade_manager":"no","language_read":"no","language_create":"no","language_update":"no","language_delete":"no","currency_read":"no","currency_create":"no","currency_update":"no","currency_delete":"no","report_blacklist":"no","report_tracking_log":"no","report_bounce_log":"no","report_feedback_log":"no","report_open_log":"no","report_click_log":"no","report_unsubscribe_log":"no"}', 0, NULL, '2017-04-09 07:31:41', '2017-04-09 07:34:44');
/*!40000 ALTER TABLE `saas_admin_groups` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_automations
CREATE TABLE IF NOT EXISTS `saas_automations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `custom_order` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_mail_list_id` int(10) unsigned DEFAULT NULL,
  `cache` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `automations_customer_id_foreign` (`customer_id`),
  KEY `automations_default_mail_list_id_foreign` (`default_mail_list_id`),
  CONSTRAINT `automations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `saas_customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `automations_default_mail_list_id_foreign` FOREIGN KEY (`default_mail_list_id`) REFERENCES `saas_mail_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_automations: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_automations` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_automations` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_automations_lists_segments
CREATE TABLE IF NOT EXISTS `saas_automations_lists_segments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `automation_id` int(10) unsigned NOT NULL,
  `mail_list_id` int(10) unsigned NOT NULL,
  `segment_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `automations_lists_segments_automation_id_foreign` (`automation_id`),
  KEY `automations_lists_segments_mail_list_id_foreign` (`mail_list_id`),
  KEY `automations_lists_segments_segment_id_foreign` (`segment_id`),
  CONSTRAINT `automations_lists_segments_automation_id_foreign` FOREIGN KEY (`automation_id`) REFERENCES `saas_automations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `automations_lists_segments_mail_list_id_foreign` FOREIGN KEY (`mail_list_id`) REFERENCES `saas_mail_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `automations_lists_segments_segment_id_foreign` FOREIGN KEY (`segment_id`) REFERENCES `saas_segments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_automations_lists_segments: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_automations_lists_segments` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_automations_lists_segments` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_auto_campaigns
CREATE TABLE IF NOT EXISTS `saas_auto_campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auto_event_id` int(10) unsigned NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auto_campaigns_auto_event_id_foreign` (`auto_event_id`),
  KEY `auto_campaigns_campaign_id_foreign` (`campaign_id`),
  CONSTRAINT `auto_campaigns_auto_event_id_foreign` FOREIGN KEY (`auto_event_id`) REFERENCES `saas_auto_events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auto_campaigns_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `saas_campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_auto_campaigns: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_auto_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_auto_campaigns` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_auto_events
CREATE TABLE IF NOT EXISTS `saas_auto_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `automation_id` int(10) unsigned NOT NULL,
  `event_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `previous_event_id` int(10) unsigned DEFAULT NULL,
  `custom_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auto_events_automation_id_foreign` (`automation_id`),
  KEY `auto_events_previous_event_id_foreign` (`previous_event_id`),
  CONSTRAINT `auto_events_automation_id_foreign` FOREIGN KEY (`automation_id`) REFERENCES `saas_automations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auto_events_previous_event_id_foreign` FOREIGN KEY (`previous_event_id`) REFERENCES `saas_auto_events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_auto_events: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_auto_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_auto_events` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_auto_triggers
CREATE TABLE IF NOT EXISTS `saas_auto_triggers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auto_event_id` int(10) unsigned NOT NULL,
  `subscriber_id` int(10) unsigned DEFAULT NULL,
  `preceded_by` int(10) unsigned DEFAULT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auto_triggers_auto_event_id_foreign` (`auto_event_id`),
  KEY `auto_triggers_preceded_by_foreign` (`preceded_by`),
  KEY `auto_triggers_subscriber_id_foreign` (`subscriber_id`),
  CONSTRAINT `auto_triggers_auto_event_id_foreign` FOREIGN KEY (`auto_event_id`) REFERENCES `saas_auto_events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auto_triggers_preceded_by_foreign` FOREIGN KEY (`preceded_by`) REFERENCES `saas_auto_triggers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auto_triggers_subscriber_id_foreign` FOREIGN KEY (`subscriber_id`) REFERENCES `saas_subscribers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_auto_triggers: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_auto_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_auto_triggers` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_blacklists
CREATE TABLE IF NOT EXISTS `saas_blacklists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blacklists_admin_id_foreign` (`admin_id`),
  KEY `blacklists_customer_id_foreign` (`customer_id`),
  CONSTRAINT `blacklists_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `saas_admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blacklists_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `saas_customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_blacklists: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_blacklists` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_blacklists` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_bounce_handlers
CREATE TABLE IF NOT EXISTS `saas_bounce_handlers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `port` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `protocol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `encryption` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_order` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bounce_handlers_admin_id_foreign` (`admin_id`),
  CONSTRAINT `bounce_handlers_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `saas_admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_bounce_handlers: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_bounce_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_bounce_handlers` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_bounce_logs
CREATE TABLE IF NOT EXISTS `saas_bounce_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `runtime_message_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bounce_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `raw` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_bounce_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_bounce_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_bounce_logs` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_campaigns
CREATE TABLE IF NOT EXISTS `saas_campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci,
  `html` longtext COLLATE utf8_unicode_ci,
  `plain` longtext COLLATE utf8_unicode_ci,
  `from_email` text COLLATE utf8_unicode_ci,
  `from_name` text COLLATE utf8_unicode_ci,
  `reply_to` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign_dkim` tinyint(1) DEFAULT NULL,
  `track_open` tinyint(1) DEFAULT NULL,
  `track_click` tinyint(1) DEFAULT NULL,
  `resend` int(11) DEFAULT NULL,
  `custom_order` int(11) DEFAULT NULL,
  `run_at` timestamp NULL DEFAULT NULL,
  `delivery_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `template_source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_error` text COLLATE utf8_unicode_ci,
  `is_auto` tinyint(1) NOT NULL DEFAULT '0',
  `image` text COLLATE utf8_unicode_ci,
  `default_mail_list_id` int(10) unsigned DEFAULT NULL,
  `cache` text COLLATE utf8_unicode_ci,
  `tracking_domain_id` int(10) unsigned DEFAULT NULL,
  `use_default_sending_server_from_email` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `campaigns_customer_id_foreign` (`customer_id`),
  KEY `campaigns_default_mail_list_id_foreign` (`default_mail_list_id`),
  CONSTRAINT `campaigns_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `saas_customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `campaigns_default_mail_list_id_foreign` FOREIGN KEY (`default_mail_list_id`) REFERENCES `saas_mail_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_campaigns: ~6 rows (approximately)
/*!40000 ALTER TABLE `saas_campaigns` DISABLE KEYS */;
INSERT INTO `saas_campaigns` (`id`, `uid`, `customer_id`, `type`, `name`, `subject`, `html`, `plain`, `from_email`, `from_name`, `reply_to`, `status`, `sign_dkim`, `track_open`, `track_click`, `resend`, `custom_order`, `run_at`, `delivery_at`, `created_at`, `updated_at`, `template_source`, `last_error`, `is_auto`, `image`, `default_mail_list_id`, `cache`, `tracking_domain_id`, `use_default_sending_server_from_email`) VALUES
	(1, '5c20aaa012b43', 1, 'regular', 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, 'new', 1, 1, 1, NULL, 5, NULL, NULL, '2018-12-24 15:15:04', '2018-12-26 15:31:22', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
	(2, '5c20ab550ee2e', 1, 'regular', 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, 'new', 1, 1, 1, NULL, 4, NULL, NULL, '2018-12-24 15:18:05', '2018-12-26 15:31:22', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
	(3, '5c2212ba67980', 1, 'regular', 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, 'new', 1, 1, 1, NULL, 3, NULL, NULL, '2018-12-25 16:51:30', '2018-12-26 15:31:22', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
	(4, '5c22143eaa12b', 1, 'regular', 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, 'new', 1, 1, 1, NULL, 2, NULL, NULL, '2018-12-25 16:57:58', '2018-12-26 15:31:22', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
	(5, '5c2350e4ef659', 1, 'plain-text', 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, 'new', 1, 1, 1, NULL, 1, NULL, NULL, '2018-12-26 15:29:01', '2018-12-26 15:31:22', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
	(6, '5c23517262cc3', 1, 'plain-text', 'Untitled', NULL, NULL, NULL, NULL, NULL, NULL, 'new', 1, 1, 1, NULL, 0, NULL, NULL, '2018-12-26 15:31:22', '2018-12-26 15:31:22', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `saas_campaigns` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_campaigns_lists_segments
CREATE TABLE IF NOT EXISTS `saas_campaigns_lists_segments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(10) unsigned NOT NULL,
  `mail_list_id` int(10) unsigned NOT NULL,
  `segment_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaigns_lists_segments_campaign_id_foreign` (`campaign_id`),
  KEY `campaigns_lists_segments_mail_list_id_foreign` (`mail_list_id`),
  KEY `campaigns_lists_segments_segment_id_foreign` (`segment_id`),
  CONSTRAINT `campaigns_lists_segments_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `saas_campaigns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `campaigns_lists_segments_mail_list_id_foreign` FOREIGN KEY (`mail_list_id`) REFERENCES `saas_mail_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `campaigns_lists_segments_segment_id_foreign` FOREIGN KEY (`segment_id`) REFERENCES `saas_segments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_campaigns_lists_segments: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_campaigns_lists_segments` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_campaigns_lists_segments` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_campaign_links
CREATE TABLE IF NOT EXISTS `saas_campaign_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(10) unsigned NOT NULL,
  `link_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaign_links_campaign_id_foreign` (`campaign_id`),
  KEY `campaign_links_link_id_foreign` (`link_id`),
  CONSTRAINT `campaign_links_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `saas_campaigns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `campaign_links_link_id_foreign` FOREIGN KEY (`link_id`) REFERENCES `saas_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_campaign_links: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_campaign_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_campaign_links` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_click_logs
CREATE TABLE IF NOT EXISTS `saas_click_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `click_logs_message_id_foreign` (`message_id`),
  CONSTRAINT `click_logs_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `saas_tracking_logs` (`message_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_click_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_click_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_click_logs` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_contacts
CREATE TABLE IF NOT EXISTS `saas_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_number` text COLLATE utf8_unicode_ci,
  `billing_address` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `contacts_country_id_foreign` (`country_id`),
  CONSTRAINT `contacts_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `saas_countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_contacts: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_contacts` DISABLE KEYS */;
INSERT INTO `saas_contacts` (`id`, `uid`, `first_name`, `last_name`, `company`, `address_1`, `address_2`, `country_id`, `state`, `zip`, `phone`, `url`, `created_at`, `updated_at`, `email`, `city`, `tax_number`, `billing_address`) VALUES
	(1, '5c20ab3a36c44', NULL, NULL, 'dfgh', 'dfh', 'dhfg', 4, 'fgh', 'dh', 'dfh', 'http://localhost:8081/lists/create', '2018-12-24 15:17:38', '2018-12-24 15:17:38', 'jai@gmail.com', 'dgh', NULL, NULL),
	(2, '5c22091989705', NULL, NULL, 'dfg', 'dsfg', 'fdsg', 4, 'dsfg', 'fdsg', 'fdsg', 'http://localhost:8081/lists/create', '2018-12-25 16:10:25', '2018-12-25 16:10:25', 'dsfg@email.com', 'dsfg', NULL, NULL),
	(3, '5c235156d4c44', NULL, NULL, 'Gutro', 'Tihana', 'Tohana', 4, 'Tihana', '125120', '487484', 'http://localhost:8081', '2018-12-26 15:30:54', '2018-12-26 15:30:54', 'h@gmail.com', 'Tohana', NULL, NULL);
/*!40000 ALTER TABLE `saas_contacts` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_countries
CREATE TABLE IF NOT EXISTS `saas_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_countries: ~232 rows (approximately)
/*!40000 ALTER TABLE `saas_countries` DISABLE KEYS */;
INSERT INTO `saas_countries` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Afghanistan', 'AF', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(2, 'Albania', 'AL', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(3, 'Algeria', 'DZ', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(4, 'American Samoa', 'AS', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(5, 'Andorra', 'AD', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(6, 'Angola', 'AO', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(7, 'Anguilla', 'AI', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(8, 'Antigua', 'AG', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(9, 'Argentina', 'AR', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(10, 'Armenia', 'AM', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(11, 'Aruba', 'AW', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(12, 'Australia', 'AU', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(13, 'Austria', 'AT', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(14, 'Azerbaijan', 'AZ', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(15, 'Bahrain', 'BH', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(16, 'Bangladesh', 'BD', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(17, 'Barbados', 'BB', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(18, 'Belarus', 'BY', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(19, 'Belgium', 'BE', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(20, 'Belize', 'BZ', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(21, 'Benin', 'BJ', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(22, 'Bermuda', 'BM', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(23, 'Bhutan', 'BT', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(24, 'Bolivia', 'BO', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(25, 'Bosnia and Herzegovina', 'BA', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(26, 'Botswana', 'BW', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(27, 'Brazil', 'BR', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(28, 'British Indian Ocean Territory', 'IO', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(29, 'British Virgin Islands', 'VG', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(30, 'Brunei', 'BN', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(31, 'Bulgaria', 'BG', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(32, 'Burkina Faso', 'BF', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(33, 'Burma Myanmar', 'MM', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(34, 'Burundi', 'BI', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(35, 'Cambodia', 'KH', 'active', '2016-07-13 21:42:43', '2016-07-13 21:42:43'),
	(36, 'Cameroon', 'CM', 'active', '2016-07-13 21:42:44', '2016-07-13 21:42:44'),
	(37, 'Canada', 'CA', 'active', '2016-07-13 21:42:44', '2016-07-13 21:42:44'),
	(38, 'Cape Verde', 'CV', 'active', '2016-07-13 21:42:44', '2016-07-13 21:42:44'),
	(39, 'Cayman Islands', 'KY', 'active', '2016-07-13 21:42:44', '2016-07-13 21:42:44'),
	(40, 'Central African Republic', 'CF', 'active', '2016-07-13 21:42:44', '2016-07-13 21:42:44'),
	(41, 'Chad', 'TD', 'active', '2016-07-13 21:42:44', '2016-07-13 21:42:44'),
	(42, 'Chile', 'CL', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(43, 'China', 'CN', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(44, 'Colombia', 'CO', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(45, 'Comoros', 'KM', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(46, 'Cook Islands', 'CK', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(47, 'Costa Rica', 'CR', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(48, 'Côte d\'Ivoire', 'CI', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(49, 'Croatia', 'HR', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(50, 'Cuba', 'CU', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(51, 'Cyprus', 'CY', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(52, 'Czech Republic', 'CZ', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(53, 'Democratic Republic of Congo', 'CD', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(54, 'Denmark', 'DK', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(55, 'Djibouti', 'DJ', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(56, 'Dominica', 'DM', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(57, 'Dominican Republic', 'DO', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(58, 'Ecuador', 'EC', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(59, 'Egypt', 'EG', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(60, 'El Salvador', 'SV', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(61, 'Equatorial Guinea', 'GQ', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(62, 'Eritrea', 'ER', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(63, 'Estonia', 'EE', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(64, 'Ethiopia', 'ET', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(65, 'Falkland Islands', 'FK', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(66, 'Faroe Islands', 'FO', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(67, 'Federated States of Micronesia', 'FM', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(68, 'Fiji', 'FJ', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(69, 'Finland', 'FI', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(70, 'France', 'FR', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(71, 'French Guiana', 'GF', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(72, 'French Polynesia', 'PF', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(73, 'Gabon', 'GA', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(74, 'Georgia', 'GE', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(75, 'Germany', 'DE', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(76, 'Ghana', 'GH', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(77, 'Gibraltar', 'GI', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(78, 'Greece', 'GR', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(79, 'Greenland', 'GL', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(80, 'Grenada', 'GD', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(81, 'Guadeloupe', 'GP', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(82, 'Guam', 'GU', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(83, 'Guatemala', 'GT', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(84, 'Guinea', 'GN', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(85, 'Guinea-Bissau', 'GW', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(86, 'Guyana', 'GY', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(87, 'Haiti', 'HT', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(88, 'Honduras', 'HN', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(89, 'Hong Kong', 'HK', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(90, 'Hungary', 'HU', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(91, 'Iceland', 'IS', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(92, 'India', 'IN', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(93, 'Indonesia', 'ID', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(94, 'Iran', 'IR', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(95, 'Iraq', 'IQ', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(96, 'Ireland', 'IE', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(97, 'Israel', 'IL', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(98, 'Italy', 'IT', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(99, 'Jamaica', 'JM', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(100, 'Japan', 'JP', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(101, 'Jordan', 'JO', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(102, 'Kazakhstan', 'KZ', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(103, 'Kenya', 'KE', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(104, 'Kiribati', 'KI', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(105, 'Kosovo', 'XK', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(106, 'Kuwait', 'KW', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(107, 'Kyrgyzstan', 'KG', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(108, 'Laos', 'LA', 'active', '2016-07-13 21:42:45', '2016-07-13 21:42:45'),
	(109, 'Latvia', 'LV', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(110, 'Lebanon', 'LB', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(111, 'Lesotho', 'LS', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(112, 'Liberia', 'LR', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(113, 'Libya', 'LY', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(114, 'Liechtenstein', 'LI', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(115, 'Lithuania', 'LT', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(116, 'Luxembourg', 'LU', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(117, 'Macau', 'MO', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(118, 'Macedonia', 'MK', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(119, 'Madagascar', 'MG', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(120, 'Malawi', 'MW', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(121, 'Malaysia', 'MY', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(122, 'Maldives', 'MV', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(123, 'Mali', 'ML', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(124, 'Malta', 'MT', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(125, 'Marshall Islands', 'MH', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(126, 'Martinique', 'MQ', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(127, 'Mauritania', 'MR', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(128, 'Mauritius', 'MU', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(129, 'Mayotte', 'YT', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(130, 'Mexico', 'MX', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(131, 'Moldova', 'MD', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(132, 'Monaco', 'MC', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(133, 'Mongolia', 'MN', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(134, 'Montenegro', 'ME', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(135, 'Montserrat', 'MS', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(136, 'Morocco', 'MA', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(137, 'Mozambique', 'MZ', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(138, 'Namibia', 'NA', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(139, 'Nauru', 'NR', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(140, 'Nepal', 'NP', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(141, 'Netherlands', 'NL', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(142, 'Netherlands Antilles', 'AN', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(143, 'New Caledonia', 'NC', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(144, 'New Zealand', 'NZ', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(145, 'Nicaragua', 'NI', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(146, 'Niger', 'NE', 'active', '2016-07-13 21:42:46', '2016-07-13 21:42:46'),
	(147, 'Nigeria', 'NG', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(148, 'Niue', 'NU', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(149, 'Norfolk Island', 'NF', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(150, 'North Korea', 'KP', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(151, 'Northern Mariana Islands', 'MP', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(152, 'Norway', 'NO', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(153, 'Oman', 'OM', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(154, 'Pakistan', 'PK', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(155, 'Palau', 'PW', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(156, 'Palestine', 'PS', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(157, 'Panama', 'PA', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(158, 'Papua New Guinea', 'PG', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(159, 'Paraguay', 'PY', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(160, 'Peru', 'PE', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(161, 'Philippines', 'PH', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(162, 'Poland', 'PL', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(163, 'Portugal', 'PT', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(164, 'Puerto Rico', 'PR', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(165, 'Qatar', 'QA', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(166, 'Republic of the Congo', 'CG', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(167, 'Réunion', 'RE', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(168, 'Romania', 'RO', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(169, 'Russia', 'RU', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(170, 'Rwanda', 'RW', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(171, 'Saint Barthélemy', 'BL', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(172, 'Saint Helena', 'SH', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(173, 'Saint Kitts and Nevis', 'KN', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(174, 'Saint Martin', 'MF', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(175, 'Saint Pierre and Miquelon', 'PM', 'active', '2016-07-13 21:42:47', '2016-07-13 21:42:47'),
	(176, 'Saint Vincent and the Grenadines', 'VC', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(177, 'Samoa', 'WS', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(178, 'San Marino', 'SM', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(179, 'São Tomé and Príncipe', 'ST', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(180, 'Saudi Arabia', 'SA', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(181, 'Senegal', 'SN', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(182, 'Serbia', 'RS', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(183, 'Seychelles', 'SC', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(184, 'Sierra Leone', 'SL', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(185, 'Singapore', 'SG', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(186, 'Slovakia', 'SK', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(187, 'Slovenia', 'SI', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(188, 'Solomon Islands', 'SB', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(189, 'Somalia', 'SO', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(190, 'South Africa', 'ZA', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(191, 'South Korea', 'KR', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(192, 'Spain', 'ES', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(193, 'Sri Lanka', 'LK', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(194, 'St. Lucia', 'LC', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(195, 'Sudan', 'SD', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(196, 'Suriname', 'SR', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(197, 'Swaziland', 'SZ', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(198, 'Sweden', 'SE', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(199, 'Switzerland', 'CH', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(200, 'Syria', 'SY', 'active', '2016-07-13 21:42:48', '2016-07-13 21:42:48'),
	(201, 'Taiwan', 'TW', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(202, 'Tajikistan', 'TJ', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(203, 'Tanzania', 'TZ', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(204, 'Thailand', 'TH', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(205, 'The Bahamas', 'BS', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(206, 'The Gambia', 'GM', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(207, 'Timor-Leste', 'TL', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(208, 'Togo', 'TG', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(209, 'Tokelau', 'TK', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(210, 'Tonga', 'TO', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(211, 'Trinidad and Tobago', 'TT', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(212, 'Tunisia', 'TN', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(213, 'Turkey', 'TR', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(214, 'Turkmenistan', 'TM', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(215, 'Turks and Caicos Islands', 'TC', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(216, 'Tuvalu', 'TV', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(217, 'Uganda', 'UG', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(218, 'Ukraine', 'UA', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(219, 'United Arab Emirates', 'AE', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(220, 'United Kingdom', 'GB', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(221, 'United States', 'US', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(222, 'Uruguay', 'UY', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(223, 'US Virgin Islands', 'VI', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(224, 'Uzbekistan', 'UZ', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(225, 'Vanuatu', 'VU', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(226, 'Vatican City', 'VA', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(227, 'Venezuela', 'VE', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(228, 'Vietnam', 'VN', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(229, 'Wallis and Futuna', 'WF', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(230, 'Yemen', 'YE', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(231, 'Zambia', 'ZM', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49'),
	(232, 'Zimbabwe', 'ZW', 'active', '2016-07-13 21:42:49', '2016-07-13 21:42:49');
/*!40000 ALTER TABLE `saas_countries` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_currencies
CREATE TABLE IF NOT EXISTS `saas_currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currencies_admin_id_foreign` (`admin_id`),
  CONSTRAINT `currencies_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `saas_admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_currencies: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_currencies` DISABLE KEYS */;
INSERT INTO `saas_currencies` (`id`, `uid`, `admin_id`, `name`, `code`, `format`, `status`, `created_at`, `updated_at`) VALUES
	(1, '58bd48f91f10b', NULL, 'US Dollar', 'USD', '${PRICE}', 'active', '2017-03-06 11:33:12', '2017-03-06 11:33:12');
/*!40000 ALTER TABLE `saas_currencies` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_customers
CREATE TABLE IF NOT EXISTS `saas_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `contact_id` int(10) unsigned DEFAULT NULL,
  `language_id` int(10) unsigned DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_scheme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quota` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cache` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `customers_user_id_foreign` (`user_id`),
  KEY `customers_admin_id_foreign` (`admin_id`),
  KEY `customers_contact_id_foreign` (`contact_id`),
  KEY `customers_language_id_foreign` (`language_id`),
  CONSTRAINT `customers_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `saas_admins` (`id`),
  CONSTRAINT `customers_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `saas_contacts` (`id`),
  CONSTRAINT `customers_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `saas_languages` (`id`),
  CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `saas_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_customers: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_customers` DISABLE KEYS */;
INSERT INTO `saas_customers` (`id`, `uid`, `user_id`, `admin_id`, `contact_id`, `language_id`, `first_name`, `last_name`, `image`, `timezone`, `status`, `color_scheme`, `quota`, `created_at`, `updated_at`, `cache`) VALUES
	(1, '5c2071b311484', 2, 1, NULL, 1, 'sandeep', 'saini', NULL, 'Asia/Kolkata', 'active', NULL, NULL, '2018-12-24 11:12:11', '2018-12-24 11:12:11', NULL);
/*!40000 ALTER TABLE `saas_customers` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_customer_groups
CREATE TABLE IF NOT EXISTS `saas_customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `custom_order` int(11) NOT NULL DEFAULT '0',
  `admin_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_groups_admin_id_foreign` (`admin_id`),
  CONSTRAINT `customer_groups_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `saas_admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_customer_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_customer_groups` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_customer_group_sending_servers
CREATE TABLE IF NOT EXISTS `saas_customer_group_sending_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sending_server_id` int(11) NOT NULL,
  `customer_group_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fitness` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_customer_group_sending_servers: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_customer_group_sending_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_customer_group_sending_servers` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_email_verifications
CREATE TABLE IF NOT EXISTS `saas_email_verifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `result` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  `subscriber_id` int(10) unsigned NOT NULL,
  `email_verification_server_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_verifications_subscriber_id_foreign` (`subscriber_id`),
  KEY `email_verifications_email_verification_server_id_foreign` (`email_verification_server_id`),
  KEY `email_verifications_result_index` (`result`),
  CONSTRAINT `email_verifications_email_verification_server_id_foreign` FOREIGN KEY (`email_verification_server_id`) REFERENCES `saas_email_verification_servers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `email_verifications_subscriber_id_foreign` FOREIGN KEY (`subscriber_id`) REFERENCES `saas_subscribers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_email_verifications: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_email_verifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_email_verifications` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_email_verification_servers
CREATE TABLE IF NOT EXISTS `saas_email_verification_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_verification_servers_admin_id_foreign` (`admin_id`),
  KEY `email_verification_servers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `email_verification_servers_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `saas_admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `email_verification_servers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `saas_customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_email_verification_servers: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_email_verification_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_email_verification_servers` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_failed_jobs
CREATE TABLE IF NOT EXISTS `saas_failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_failed_jobs` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_feedback_logs
CREATE TABLE IF NOT EXISTS `saas_feedback_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `runtime_message_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `feedback_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `raw_feedback_content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_feedback_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_feedback_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_feedback_logs` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_feedback_loop_handlers
CREATE TABLE IF NOT EXISTS `saas_feedback_loop_handlers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `port` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `protocol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `encryption` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_loop_handlers_admin_id_foreign` (`admin_id`),
  CONSTRAINT `feedback_loop_handlers_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `saas_admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_feedback_loop_handlers: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_feedback_loop_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_feedback_loop_handlers` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_fields
CREATE TABLE IF NOT EXISTS `saas_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `mail_list_id` int(10) unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `custom_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fields_mail_list_id_foreign` (`mail_list_id`),
  CONSTRAINT `fields_mail_list_id_foreign` FOREIGN KEY (`mail_list_id`) REFERENCES `saas_mail_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_fields: ~8 rows (approximately)
/*!40000 ALTER TABLE `saas_fields` DISABLE KEYS */;
INSERT INTO `saas_fields` (`id`, `uid`, `mail_list_id`, `label`, `type`, `tag`, `default_value`, `visible`, `required`, `custom_order`, `created_at`, `updated_at`) VALUES
	(1, '5c20ab3a5e364', 1, 'Email', 'text', 'EMAIL', NULL, 1, 1, NULL, '2018-12-24 15:17:38', '2018-12-24 15:17:38'),
	(2, '5c20ab3a6a8a0', 1, 'First name', 'text', 'FIRST_NAME', NULL, 1, 0, NULL, '2018-12-24 15:17:38', '2018-12-24 15:17:38'),
	(3, '5c20ab3a72d08', 1, 'Last name', 'text', 'LAST_NAME', NULL, 1, 0, NULL, '2018-12-24 15:17:38', '2018-12-24 15:17:38'),
	(4, '5c220919cf1fb', 2, 'Email', 'text', 'EMAIL', NULL, 1, 1, NULL, '2018-12-25 16:10:25', '2018-12-25 16:10:25'),
	(5, '5c220919db081', 2, 'First name', 'text', 'FIRST_NAME', NULL, 1, 0, NULL, '2018-12-25 16:10:25', '2018-12-25 16:10:25'),
	(6, '5c220919e6143', 2, 'Last name', 'text', 'LAST_NAME', NULL, 1, 0, NULL, '2018-12-25 16:10:25', '2018-12-25 16:10:25'),
	(7, '5c2351573cfb6', 3, 'Email', 'text', 'EMAIL', NULL, 1, 1, NULL, '2018-12-26 15:30:55', '2018-12-26 15:30:55'),
	(8, '5c23515751acb', 3, 'First name', 'text', 'FIRST_NAME', NULL, 1, 0, NULL, '2018-12-26 15:30:55', '2018-12-26 15:30:55'),
	(9, '5c2351576b7d2', 3, 'Last name', 'text', 'LAST_NAME', NULL, 1, 0, NULL, '2018-12-26 15:30:55', '2018-12-26 15:30:55');
/*!40000 ALTER TABLE `saas_fields` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_field_options
CREATE TABLE IF NOT EXISTS `saas_field_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_options_field_id_foreign` (`field_id`),
  CONSTRAINT `field_options_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `saas_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_field_options: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_field_options` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_ip_locations
CREATE TABLE IF NOT EXISTS `saas_ip_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `region_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `region_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `metro_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `areacode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_locations_ip_address_index` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_ip_locations: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_ip_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_ip_locations` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_jobs
CREATE TABLE IF NOT EXISTS `saas_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_jobs: ~3 rows (approximately)
/*!40000 ALTER TABLE `saas_jobs` DISABLE KEYS */;
INSERT INTO `saas_jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
	(1, 'default', '{"displayName":"Acelle\\\\Jobs\\\\UpdateUserJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"data":{"commandName":"Acelle\\\\Jobs\\\\UpdateUserJob","command":"O:25:\\"Acelle\\\\Jobs\\\\UpdateUserJob\\":6:{s:11:\\"\\u0000*\\u0000customer\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:21:\\"Acelle\\\\Model\\\\Customer\\";s:2:\\"id\\";i:1;}s:12:\\"\\u0000*\\u0000systemJob\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:22:\\"Acelle\\\\Model\\\\SystemJob\\";s:2:\\"id\\";i:1;}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:6:\\"\\u0000*\\u0000job\\";N;}"}}', 0, NULL, 1545630161, 1545630161),
	(2, 'default', '{"displayName":"Acelle\\\\Jobs\\\\UpdateMailListJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"data":{"commandName":"Acelle\\\\Jobs\\\\UpdateMailListJob","command":"O:29:\\"Acelle\\\\Jobs\\\\UpdateMailListJob\\":6:{s:7:\\"\\u0000*\\u0000list\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:21:\\"Acelle\\\\Model\\\\MailList\\";s:2:\\"id\\";i:1;}s:12:\\"\\u0000*\\u0000systemJob\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:22:\\"Acelle\\\\Model\\\\SystemJob\\";s:2:\\"id\\";i:2;}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:6:\\"\\u0000*\\u0000job\\";N;}"}}', 0, NULL, 1545644859, 1545644859),
	(3, 'default', '{"displayName":"Acelle\\\\Jobs\\\\UpdateCampaignJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"data":{"commandName":"Acelle\\\\Jobs\\\\UpdateCampaignJob","command":"O:29:\\"Acelle\\\\Jobs\\\\UpdateCampaignJob\\":6:{s:11:\\"\\u0000*\\u0000campaign\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:21:\\"Acelle\\\\Model\\\\Campaign\\";s:2:\\"id\\";i:1;}s:12:\\"\\u0000*\\u0000systemJob\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:22:\\"Acelle\\\\Model\\\\SystemJob\\";s:2:\\"id\\";i:3;}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:6:\\"\\u0000*\\u0000job\\";N;}"}}', 0, NULL, 1545644959, 1545644959),
	(4, 'default', '{"displayName":"Acelle\\\\Jobs\\\\UpdateMailListJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"data":{"commandName":"Acelle\\\\Jobs\\\\UpdateMailListJob","command":"O:29:\\"Acelle\\\\Jobs\\\\UpdateMailListJob\\":6:{s:7:\\"\\u0000*\\u0000list\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:21:\\"Acelle\\\\Model\\\\MailList\\";s:2:\\"id\\";i:2;}s:12:\\"\\u0000*\\u0000systemJob\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:22:\\"Acelle\\\\Model\\\\SystemJob\\";s:2:\\"id\\";i:4;}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:6:\\"\\u0000*\\u0000job\\";N;}"}}', 0, NULL, 1545734426, 1545734426),
	(5, 'default', '{"displayName":"Acelle\\\\Jobs\\\\UpdateMailListJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"timeout":null,"data":{"commandName":"Acelle\\\\Jobs\\\\UpdateMailListJob","command":"O:29:\\"Acelle\\\\Jobs\\\\UpdateMailListJob\\":6:{s:7:\\"\\u0000*\\u0000list\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:21:\\"Acelle\\\\Model\\\\MailList\\";s:2:\\"id\\";i:3;}s:12:\\"\\u0000*\\u0000systemJob\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":2:{s:5:\\"class\\";s:22:\\"Acelle\\\\Model\\\\SystemJob\\";s:2:\\"id\\";i:5;}s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:6:\\"\\u0000*\\u0000job\\";N;}"}}', 0, NULL, 1545818456, 1545818456);
/*!40000 ALTER TABLE `saas_jobs` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_languages
CREATE TABLE IF NOT EXISTS `saas_languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_languages: ~4 rows (approximately)
/*!40000 ALTER TABLE `saas_languages` DISABLE KEYS */;
INSERT INTO `saas_languages` (`id`, `uid`, `name`, `code`, `region_code`, `status`, `created_at`, `updated_at`, `is_default`) VALUES
	(1, '5781b681c1b34', 'English', 'en', 'us', 'active', '2016-07-10 09:44:17', '2016-07-10 09:44:17', 1),
	(2, '581b52d8acdca', 'Spanish', 'es', 'es', 'active', '2016-07-10 09:44:17', '2016-07-10 09:44:17', 0),
	(3, '5c19d20383e43', 'Portuguese', 'pt', 'pt', 'active', '2018-12-19 05:07:15', '2018-12-19 05:07:15', 0),
	(4, '5c19d20c99f14', 'German', 'de', 'de', 'active', '2018-12-19 05:07:24', '2018-12-19 05:07:24', 0);
/*!40000 ALTER TABLE `saas_languages` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_layouts
CREATE TABLE IF NOT EXISTS `saas_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_layouts: ~13 rows (approximately)
/*!40000 ALTER TABLE `saas_layouts` DISABLE KEYS */;
INSERT INTO `saas_layouts` (`id`, `uid`, `alias`, `group_name`, `content`, `type`, `created_at`, `updated_at`, `subject`) VALUES
	(1, '57639eb9715cf', 'sign_up_form', 'Sign-up', '	<!-- Page container -->\r\n	<div class="page-container login-container" style="min-height:249px">\r\n\r\n		<!-- Page content -->\r\n		<div class="page-content">\r\n\r\n			<!-- Main content -->\r\n			<div class="content-wrapper">\r\n				<div class="row">\r\n					<div class="col-sm-2 col-md-3">\r\n						\r\n					</div>\r\n					<div class="col-sm-8 col-md-6">\r\n\r\n                    <!-- subscribe form -->\r\n				                  \r\n					<h2 class="text-semibold mt-40 text-white">{LIST_NAME}</h2>\r\n                        <div class="panel panel-body">						\r\n                                                \r\n                        <h4>Welcome to {CONTACT_NAME}</h4>\r\n                        <hr>\r\n                        {FIELDS}\r\n                        <br>\r\n                        {SUBSCRIBE_BUTTON}\r\n\r\n					</div>\r\n\r\n                    <!-- /subscribe form -->\r\n    \r\n						\r\n					</div>\r\n				</div>\r\n			</div>\r\n			<!-- /main content -->\r\n\r\n		</div>\r\n		<!-- /page content -->\r\n\r\n\r\n		<!-- Footer -->\r\n		<div class="footer text-white">\r\n			<span class="text-white">{CONTACT_NAME}</span>, <a href="{CONTACT_URL}" class="text-white" target="_blank">{CONTACT_URL}</a>			\r\n		</div>\r\n		<!-- /footer -->\r\n\r\n	</div>\r\n	<!-- /page container -->', 'page', '2016-06-19 00:54:49', '2016-06-19 00:54:49', 'Sign up'),
	(2, '5763c01613687', 'sign_up_thankyou_page', 'Sign-up', '<!-- Page container -->\r\n	<div class="page-container login-container" style="min-height:249px">\r\n\r\n		<!-- Page content -->\r\n		<div class="page-content">\r\n\r\n			<!-- Main content -->\r\n			<div class="content-wrapper">\r\n				<div class="row">\r\n					<div class="col-sm-2 col-md-3">\r\n						\r\n					</div>\r\n					<div class="col-sm-8 col-md-6">\r\n\r\n                    <!-- subscribe form -->\r\n				                  \r\n					<h2 class="text-semibold mt-40 text-white">{LIST_NAME}</h2>\r\n                        <div class="panel panel-body">						\r\n                                                \r\n                        <h4>Almost finished...</h4>\r\n                        <hr>\r\n						<p>We need to confirm your email address.</p>\r\n						<p>To complete the subscription process, please click the link in the email we just sent you.\r\n						</p>\r\n						--<br />\r\n						\r\n                        {CONTACT_NAME}\r\n\r\n					</div>\r\n\r\n                    <!-- /subscribe form -->\r\n    \r\n						\r\n					</div>\r\n				</div>\r\n			</div>\r\n			<!-- /main content -->\r\n\r\n		</div>\r\n		<!-- /page content -->\r\n\r\n\r\n		<!-- Footer -->\r\n		<div class="footer text-white">\r\n			<span class="text-white">{CONTACT_NAME}</span>, <a href="{CONTACT_URL}" class="text-white" target="_blank">{CONTACT_URL}</a>			\r\n		</div>\r\n		<!-- /footer -->\r\n\r\n	</div>\r\n	<!-- /page container -->', 'page', '2016-06-19 03:17:10', '2016-06-19 03:17:10', 'Thank you'),
	(3, '5763c3ef7bb8e', 'sign_up_confirmation_email', 'Sign-up', '<!-- Page container -->\r\n<div class="page-container login-container" style="min-height: 249px;"><!-- Page content -->\r\n<div class="page-content"><!-- Main content -->\r\n<div class="content-wrapper">\r\n<div class="row">\r\n<div class="col-sm-2 col-md-3"></div>\r\n<div class="col-sm-8 col-md-6"><!-- subscribe form -->\r\n<h2 class="text-semibold mt-40 text-white">{LIST_NAME}</h2>\r\n<div class="panel panel-body">\r\n<h4>Please Confirm Subscription</h4>\r\n<hr />Click the link below to confirm your subscription:<br /> {SUBSCRIBE_CONFIRM_URL}<hr />\r\n<p>If you received this email by mistake, simply delete it. You won\'t be subscribed if you don\'t click the confirmation link above.</p>\r\n<p>For questions about this list, please contact: <br /> <a href="mailto:{CONTACT_EMAIL}">{CONTACT_EMAIL}</a></p>\r\n</div>\r\n<!-- /subscribe form --></div>\r\n</div>\r\n</div>\r\n<!-- /main content --></div>\r\n<!-- /page content --> <!-- Footer -->\r\n<div class="footer text-white">&copy; 2016. <span class="text-white">{CONTACT_NAME}</span>, <a href="{CONTACT_URL}" class="text-white" target="_blank">{CONTACT_URL}</a></div>\r\n<!-- /footer --></div>\r\n<!-- /page container -->', 'email', '2016-06-19 03:33:35', '2016-06-30 03:55:55', 'Sign-up confirmation'),
	(4, '5763cab0459c8', 'sign_up_confirmation_thankyou', 'Sign-up', '<!-- Page container -->\r\n	<div class="page-container login-container" style="min-height:249px">\r\n\r\n		<!-- Page content -->\r\n		<div class="page-content">\r\n\r\n			<!-- Main content -->\r\n			<div class="content-wrapper">\r\n				<div class="row">\r\n					<div class="col-sm-2 col-md-3">\r\n						\r\n					</div>\r\n					<div class="col-sm-8 col-md-6">\r\n\r\n                    <!-- subscribe form -->\r\n				                  \r\n					<h2 class="text-semibold mt-40 text-white">{LIST_NAME}</h2>\r\n                        <div class="panel panel-body">						\r\n                                                \r\n                        <h4>Subscription Confirmed</h4>\r\n                        <hr>\r\n						<p>Your subscription to our list has been confirmed.\r\n</p>\r\n<p>Thank you for subscribing!</p>\r\n\r\n						\r\n                        <a href="{CONTACT_URL}" class="btn btn-info bg-teal-800">Continue to our website</a> or <a href="{UPDATE_PROFILE_URL}" class="btn btn-info bg-teal-800">Manage your preferences</a>\r\n\r\n					</div>\r\n\r\n                    <!-- /subscribe form -->\r\n    \r\n						\r\n					</div>\r\n				</div>\r\n			</div>\r\n			<!-- /main content -->\r\n\r\n		</div>\r\n		<!-- /page content -->\r\n\r\n\r\n		<!-- Footer -->\r\n		<div class="footer text-white">\r\n			<span class="text-white">{CONTACT_NAME}</span>, <a href="{CONTACT_URL}" class="text-white" target="_blank">{CONTACT_URL}</a>			\r\n		</div>\r\n		<!-- /footer -->\r\n\r\n	</div>\r\n	<!-- /page container -->', 'page', '2016-06-19 04:02:24', '2016-06-19 04:02:24', 'Thank you'),
	(5, '5764b3c8bcf4a', 'sign_up_welcome_email', 'Sign-up', '<!-- Page container -->\r\n<div class="page-container login-container" style="min-height: 249px;"><!-- Page content -->\r\n<div class="page-content"><!-- Main content -->\r\n<div class="content-wrapper">\r\n<div class="row">\r\n<div class="col-sm-2 col-md-3"></div>\r\n<div class="col-sm-8 col-md-6"><!-- subscribe form -->\r\n<h2 class="text-semibold mt-40 text-white">{LIST_NAME}</h2>\r\n<div class="panel panel-body">\r\n<h4>Your subscription to our list has been confirmed.</h4>\r\n<hr />\r\n<p>For your records, here is a copy of the information you submitted to us...</p>\r\n{SUBSCRIBER_SUMMARY}<hr />\r\n<p>If at any time you wish to stop receiving our emails, you can: <br /> <a href="{UNSUBSCRIBE_URL}" class="btn btn-info bg-teal-800">Unsubscribe here</a></p>\r\n<p>You may also contact us at: <br /> <a href="mailto:{CONTACT_EMAIL}">{CONTACT_EMAIL}</a></p>\r\n</div>\r\n<!-- /subscribe form --></div>\r\n</div>\r\n</div>\r\n<!-- /main content --></div>\r\n<!-- /page content --> <!-- Footer -->\r\n<div class="footer text-white">&copy; 2016. <span class="text-white">{CONTACT_NAME}</span>, <a href="{CONTACT_URL}" class="text-white" target="_blank">{CONTACT_URL}</a></div>\r\n<!-- /footer --></div>\r\n<!-- /page container -->', 'email', '2016-06-19 20:36:56', '2016-06-30 03:56:51', 'Welcome'),
	(6, '5764bac04f223', 'unsubscribe_form', 'Unsubscribe', '	<!-- Page container -->\r\n	<div class="page-container login-container" style="min-height:249px">\r\n\r\n		<!-- Page content -->\r\n		<div class="page-content">\r\n\r\n			<!-- Main content -->\r\n			<div class="content-wrapper">\r\n				<div class="row">\r\n					<div class="col-sm-2 col-md-3">\r\n						\r\n					</div>\r\n					<div class="col-sm-8 col-md-6">\r\n\r\n                    <!-- form -->\r\n				                  \r\n					<h2 class="text-semibold mt-40 text-white">{LIST_NAME}</h2>\r\n                        <div class="panel panel-body">						\r\n                                                \r\n                        <h4>Unsubscribe</h4>\r\n                        <hr>\r\n                        <p>Enter your email address to unsubscribe from {LIST_NAME}</p>\r\n                        \r\n                        \r\n\r\n{EMAIL_FIELD}\r\n\r\n<p>{UNSUBSCRIBE_BUTTON}</p>\r\n					</div>\r\n\r\n                    <!-- /form -->\r\n    \r\n						\r\n					</div>\r\n				</div>\r\n			</div>\r\n			<!-- /main content -->\r\n\r\n		</div>\r\n		<!-- /page content -->\r\n\r\n\r\n		<!-- Footer -->\r\n		<div class="footer text-white">\r\n			<span class="text-white">{CONTACT_NAME}</span>, <a href="{CONTACT_URL}" class="text-white" target="_blank">{CONTACT_URL}</a>			\r\n		</div>\r\n		<!-- /footer -->\r\n\r\n	</div>\r\n	<!-- /page container -->', 'page', '2016-06-19 21:06:40', '2016-06-19 21:06:40', 'Unsubscribe'),
	(7, '5764c2d612aea', 'unsubscribe_success_page', 'Unsubscribe', '	<!-- Page container -->\n	<div class="page-container login-container" style="min-height:249px">\n\n		<!-- Page content -->\n		<div class="page-content">\n\n			<!-- Main content -->\n			<div class="content-wrapper">\n				<div class="row">\n					<div class="col-sm-2 col-md-3">\n						\n					</div>\n					<div class="col-sm-8 col-md-6">\n\n                    <!-- form -->\n				                  \n					<h2 class="text-semibold mt-40 text-white">{LIST_NAME}</h2>\n                        <div class="panel panel-body">						\n                                                \n                        <h4>Unsubscribe Successful</h4>\n                        <hr>\n                        <p>You have been removed from {LIST_NAME}.</p>\n                        \n                        <br />\n					</div>\n\n                    <!-- /form -->\n    \n						\n					</div>\n				</div>\n			</div>\n			<!-- /main content -->\n\n		</div>\n		<!-- /page content -->\n\n\n		<!-- Footer -->\n		<div class="footer text-white">\n			<span class="text-white">{CONTACT_NAME}</span>, <a href="{CONTACT_URL}" class="text-white" target="_blank">{CONTACT_URL}</a>			\n		</div>\n		<!-- /footer -->\n\n	</div>\n	<!-- /page container -->', 'page', '2016-06-19 21:41:10', '2016-06-19 21:41:10', 'Unsubscribed'),
	(8, '5764c466641c7', 'unsubscribe_goodbye_email', 'Unsubscribe', '	<!-- Page container -->\n	<div class="page-container login-container" style="min-height:249px">\n\n		<!-- Page content -->\n		<div class="page-content">\n\n			<!-- Main content -->\n			<div class="content-wrapper">\n				<div class="row">\n					<div class="col-sm-2 col-md-3">\n						\n					</div>\n					<div class="col-sm-8 col-md-6">\n\n                    <!-- form -->\n				                  \n					<h2 class="text-semibold mt-40 text-white">{LIST_NAME}</h2>\n                        <div class="panel panel-body">						\n                                                \n                        <h4>We have removed your email address from our list.</h4>\n                        <hr>\n                        <p>We\'re sorry to see you go.</p>\n                        <p>Was this a mistake? Did you forward one of our emails to a friend, and they clicked the unsubscribe link not realizing they were in fact unsubscribing you from this list? If this was a mistake, you can re-subscribe at: <br />\n<a href="{SUBSCRIBE_URL}" class="btn btn-info bg-teal-800">Subscribe</a>\n</p>\n                        <br />\nFor questions or comments, please contact us at:<br />\n<a href="mailto:{CONTACT_EMAIL}">{CONTACT_EMAIL}</a>\n					</div>\n\n                    <!-- /form -->\n    \n						\n					</div>\n				</div>\n			</div>\n			<!-- /main content -->\n\n		</div>\n		<!-- /page content -->\n\n\n		<!-- Footer -->\n		<div class="footer text-white">\n			<span class="text-white">{CONTACT_NAME}</span>, <a href="{CONTACT_URL}" class="text-white" target="_blank">{CONTACT_URL}</a>			\n		</div>\n		<!-- /footer -->\n\n	</div>\n	<!-- /page container -->', 'email', '2016-06-19 21:47:50', '2016-06-19 21:47:50', 'Unsubscribed'),
	(9, '5764c710527b8', 'profile_update_email', 'Update profile', '	<!-- Page container -->\r\n	<div class="page-container login-container" style="min-height:249px">\r\n\r\n		<!-- Page content -->\r\n		<div class="page-content">\r\n\r\n			<!-- Main content -->\r\n			<div class="content-wrapper">\r\n				<div class="row">\r\n					<div class="col-sm-2 col-md-3">\r\n						\r\n					</div>\r\n					<div class="col-sm-8 col-md-6">\r\n\r\n                    <!-- form -->\r\n				                  \r\n					<h2 class="text-semibold mt-40 text-white">{LIST_NAME}</h2>\r\n                        <div class="panel panel-body">						\r\n                                                \r\n                        <p>We received a request to change your subscription preferences for List 1.</p>\r\n\r\n<p>If you made this request, and would like to change your preferences, use the link below</p>\r\n\r\n<p><a href="{UPDATE_PROFILE_URL}">Update your preferences</a></p>\r\n\r\n<p>If you did not make this request, it was probably submitted by someone else by mistake. You can ignore this email, and no changes will be made to your subscription preferences.</p>\r\n\r\n<p>\r\nFor questions about this list, please contact: <br />\r\n<a href="{CONTACT_EMAIL}">{CONTACT_EMAIL}</a>\r\n</p>\r\n					</div>\r\n\r\n                    <!-- /form -->\r\n    \r\n						\r\n					</div>\r\n				</div>\r\n			</div>\r\n			<!-- /main content -->\r\n\r\n		</div>\r\n		<!-- /page content -->\r\n\r\n\r\n		<!-- Footer -->\r\n		<div class="footer text-white">\r\n			<span class="text-white">{CONTACT_NAME}</span>, <a href="{CONTACT_URL}" class="text-white" target="_blank">{CONTACT_URL}</a>			\r\n		</div>\r\n		<!-- /footer -->\r\n\r\n	</div>\r\n	<!-- /page container -->', 'email', '2016-06-19 21:59:12', '2016-06-19 21:59:12', 'Update profile'),
	(10, '5764c87e6bad1', 'profile_update_form', 'Update profile', '	<!-- Page container -->\r\n	<div class="page-container login-container" style="min-height:249px">\r\n\r\n		<!-- Page content -->\r\n		<div class="page-content">\r\n\r\n			<!-- Main content -->\r\n			<div class="content-wrapper">\r\n				<div class="row">\r\n					<div class="col-sm-2 col-md-3">\r\n						\r\n					</div>\r\n					<div class="col-sm-8 col-md-6">\r\n\r\n                    <!-- form -->\r\n				                  \r\n					<h2 class="text-semibold mt-40 text-white">{LIST_NAME}</h2>\r\n                        <div class="panel panel-body">						\r\n<h4>Update your preferences</h4>\r\n<hr />\r\n                        {FIELDS}<br />\r\n{UPDATE_PROFILE_BUTTON} or <a class="btn btn-info bg-grey" href="{UNSUBSCRIBE_URL}">Unsubscribe</a>\r\n\r\n\r\n					</div>\r\n\r\n                    <!-- /form -->\r\n    \r\n						\r\n					</div>\r\n				</div>\r\n			</div>\r\n			<!-- /main content -->\r\n\r\n		</div>\r\n		<!-- /page content -->\r\n\r\n\r\n		<!-- Footer -->\r\n		<div class="footer text-white">\r\n			<span class="text-white">{CONTACT_NAME}</span>, <a href="{CONTACT_URL}" class="text-white" target="_blank">{CONTACT_URL}</a>			\r\n		</div>\r\n		<!-- /footer -->\r\n\r\n	</div>\r\n	<!-- /page container -->', 'page', '2016-06-19 22:05:18', '2016-06-19 22:05:18', 'Update profile'),
	(11, '5764c90505f1c', 'profile_update_success_page', 'Update profile', '<!-- Page container -->\r\n	<div class="page-container login-container" style="min-height:249px">\r\n\r\n		<!-- Page content -->\r\n		<div class="page-content">\r\n\r\n			<!-- Main content -->\r\n			<div class="content-wrapper">\r\n				<div class="row">\r\n					<div class="col-sm-2 col-md-3">\r\n						\r\n					</div>\r\n					<div class="col-sm-8 col-md-6">\r\n\r\n                    <!-- subscribe form -->\r\n				                  \r\n					<h2 class="text-semibold mt-40 text-white">{LIST_NAME}</h2>\r\n                        <div class="panel panel-body">						\r\n                                                \r\n                        <h4>Profile Updated</h4>\r\n                        <hr>\r\n						<p>Your profile information has been updated. For your records, here is a copy of the information you submitted to us...</p>\r\n\r\n{SUBSCRIBER_SUMMARY}\r\n\r\n\r\n\r\n\r\n<hr />\r\n<a class="btn btn-info bg-teal-800" href="{CONTACT_URL}">Return to our website</a>\r\n\r\n					</div>\r\n\r\n                    <!-- /subscribe form -->\r\n    \r\n						\r\n					</div>\r\n				</div>\r\n			</div>\r\n			<!-- /main content -->\r\n\r\n		</div>\r\n		<!-- /page content -->\r\n\r\n\r\n		<!-- Footer -->\r\n		<div class="footer text-white">\r\n			<span class="text-white">{CONTACT_NAME}</span>, <a href="{CONTACT_URL}" class="text-white" target="_blank">{CONTACT_URL}</a>			\r\n		</div>\r\n		<!-- /footer -->\r\n\r\n	</div>\r\n	<!-- /page container -->', 'page', '2016-06-19 22:07:33', '2016-06-19 22:07:33', 'Update profile'),
	(12, '5764c9812b0bc', 'profile_update_email_sent', 'Update profile', '	<!-- Page container -->\r\n	<div class="page-container login-container" style="min-height:249px">\r\n\r\n		<!-- Page content -->\r\n		<div class="page-content">\r\n\r\n			<!-- Main content -->\r\n			<div class="content-wrapper">\r\n				<div class="row">\r\n					<div class="col-sm-2 col-md-3">\r\n						\r\n					</div>\r\n					<div class="col-sm-8 col-md-6">\r\n\r\n                    <!-- form -->\r\n				                  \r\n					<h2 class="text-semibold mt-40 text-white">{LIST_NAME}</h2>\r\n                        <div class="panel panel-body">						\r\n<h4>Email sent</h4>          \r\n<hr />\r\n                        <p>For security, we\'ve sent an email to your inbox that contains a link to update your preferences.</p>\r\n--<br />\r\n{CONTACT_NAME}\r\n					</div>\r\n\r\n                    <!-- /form -->\r\n    \r\n						\r\n					</div>\r\n				</div>\r\n			</div>\r\n			<!-- /main content -->\r\n\r\n		</div>\r\n		<!-- /page content -->\r\n\r\n\r\n		<!-- Footer -->\r\n		<div class="footer text-white">\r\n			<span class="text-white">{CONTACT_NAME}</span>, <a href="{CONTACT_URL}" class="text-white" target="_blank">{CONTACT_URL}</a>			\r\n		</div>\r\n		<!-- /footer -->\r\n\r\n	</div>\r\n	<!-- /page container -->', 'page', '2016-06-19 21:59:11', '2016-06-19 22:09:37', 'Update profile'),
	(13, '58ac002f2e5c3', 'registration_confirmation_email', 'Subscription', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<h2>Hello {CUSTOMER_NAME}, welcome to Acelle Mail</h2>\r\n<div class="page-container login-container" style="min-height: 249px;">\r\n<div class="page-content">\r\n<div class="content-wrapper">\r\n<div class="row">\r\n<div class="col-sm-8 col-md-6">\r\n<div class="panel panel-body">\r\n<h4>Please Confirm&nbsp;Registration</h4>\r\n<hr />Click the link below to activate your account:<br /><a href="{ACTIVATION_URL}">{ACTIVATION_URL}</a><br /><hr />\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="footer text-white">\r\n<div class="footer text-muted">&copy; 2017. Acelle Email Marketing Application by <a class="" href="http://acellemail.com/" target="_blank">Acellemail.com</a></div>\r\n</div>\r\n<!-- /footer --></div>\r\n<!-- /page container -->\r\n<p>&nbsp;</p>\r\n</body>\r\n</html>', 'email', NULL, '2017-02-23 07:44:26', 'Registration confirmation');
/*!40000 ALTER TABLE `saas_layouts` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_links
CREATE TABLE IF NOT EXISTS `saas_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_links: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_links` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_logs
CREATE TABLE IF NOT EXISTS `saas_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logs_customer_id_foreign` (`customer_id`),
  CONSTRAINT `logs_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `saas_customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_logs: ~4 rows (approximately)
/*!40000 ALTER TABLE `saas_logs` DISABLE KEYS */;
INSERT INTO `saas_logs` (`id`, `customer_id`, `type`, `name`, `data`, `created_at`, `updated_at`) VALUES
	(1, 1, 'list', 'created', '{"id":1,"name":"Jai"}', '2018-12-24 15:17:39', '2018-12-24 15:17:39'),
	(2, 1, 'subscriber', 'created', '{"id":1,"email":"jai@gmail.com","list_id":1,"list_name":"Jai"}', '2018-12-24 15:18:57', '2018-12-24 15:18:57'),
	(3, 1, 'list', 'created', '{"id":2,"name":"ghf"}', '2018-12-25 16:10:26', '2018-12-25 16:10:26'),
	(4, 1, 'subscriber', 'created', '{"id":2,"email":"oop@gmail.com","list_id":2,"list_name":"ghf"}', '2018-12-25 16:53:33', '2018-12-25 16:53:33'),
	(5, 1, 'list', 'created', '{"id":3,"name":"Hunny"}', '2018-12-26 15:30:56', '2018-12-26 15:30:56');
/*!40000 ALTER TABLE `saas_logs` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_mail_lists
CREATE TABLE IF NOT EXISTS `saas_mail_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remind_message` text COLLATE utf8_unicode_ci,
  `email_subscribe` text COLLATE utf8_unicode_ci,
  `email_unsubscribe` text COLLATE utf8_unicode_ci,
  `email_daily` text COLLATE utf8_unicode_ci,
  `send_welcome_email` tinyint(1) NOT NULL DEFAULT '0',
  `unsubscribe_notification` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_order` int(11) NOT NULL DEFAULT '0',
  `subscribe_confirmation` tinyint(1) NOT NULL DEFAULT '1',
  `cache` text COLLATE utf8_unicode_ci,
  `all_sending_servers` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mail_lists_contact_id_foreign` (`contact_id`),
  KEY `mail_lists_customer_id_foreign` (`customer_id`),
  CONSTRAINT `mail_lists_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `saas_contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mail_lists_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `saas_customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_mail_lists: ~3 rows (approximately)
/*!40000 ALTER TABLE `saas_mail_lists` DISABLE KEYS */;
INSERT INTO `saas_mail_lists` (`id`, `uid`, `customer_id`, `contact_id`, `name`, `default_subject`, `from_email`, `from_name`, `remind_message`, `email_subscribe`, `email_unsubscribe`, `email_daily`, `send_welcome_email`, `unsubscribe_notification`, `status`, `created_at`, `updated_at`, `custom_order`, `subscribe_confirmation`, `cache`, `all_sending_servers`) VALUES
	(1, '5c20ab3a46cbf', 1, 1, 'Jai', 'jai@gmail.com', 'jai@gmail.com', 'Jai@gmail.com', NULL, '', '', NULL, 1, 1, NULL, '2018-12-24 15:17:38', '2018-12-26 15:30:54', 2, 1, NULL, 1),
	(2, '5c2209199a10f', 1, 2, 'ghf', 'sd', 'fgh@email.com', 'sdfg', NULL, '', '', NULL, 0, 1, NULL, '2018-12-25 16:10:25', '2018-12-26 15:30:54', 1, 1, NULL, 1),
	(3, '5c235156ec36e', 1, 3, 'Hunny', 'sfds', 'singla@gmail.com', 'Hunny', NULL, '', '', NULL, 1, 1, NULL, '2018-12-26 15:30:55', '2018-12-26 15:30:55', 0, 1, NULL, 1);
/*!40000 ALTER TABLE `saas_mail_lists` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_mail_lists_sending_servers
CREATE TABLE IF NOT EXISTS `saas_mail_lists_sending_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sending_server_id` int(10) unsigned NOT NULL,
  `mail_list_id` int(10) unsigned NOT NULL,
  `fitness` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_lists_sending_servers_sending_server_id_foreign` (`sending_server_id`),
  KEY `mail_lists_sending_servers_mail_list_id_foreign` (`mail_list_id`),
  CONSTRAINT `mail_lists_sending_servers_mail_list_id_foreign` FOREIGN KEY (`mail_list_id`) REFERENCES `saas_mail_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mail_lists_sending_servers_sending_server_id_foreign` FOREIGN KEY (`sending_server_id`) REFERENCES `saas_sending_servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_mail_lists_sending_servers: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_mail_lists_sending_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_mail_lists_sending_servers` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_migrations
CREATE TABLE IF NOT EXISTS `saas_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_migrations: ~135 rows (approximately)
/*!40000 ALTER TABLE `saas_migrations` DISABLE KEYS */;
INSERT INTO `saas_migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_06_09_172556_create_mail_lists_table', 1),
	(4, '2016_06_09_174024_create_contacts_table', 1),
	(5, '2016_06_09_174351_create_countries_table', 1),
	(6, '2016_06_10_041252_create_languages_table', 1),
	(7, '2016_06_10_174522_create_admin_groups_table', 1),
	(8, '2016_06_10_174523_create_admins_table', 1),
	(9, '2016_06_10_174527_create_customer_groups_table', 1),
	(10, '2016_06_10_174528_create_customers_table', 1),
	(11, '2016_06_10_174529_create_campaigns_table', 1),
	(12, '2016_06_11_073311_add_foreign_keys', 1),
	(13, '2016_06_11_182326_add_email_to_contact', 1),
	(14, '2016_06_11_182432_add_city_to_contact', 1),
	(15, '2016_06_12_030828_rename_mail_list_description_to_remind_message', 1),
	(16, '2016_06_12_152501_add_custom_order_to_mail_lists', 1),
	(17, '2016_06_13_045445_create_tracking_logs_table', 1),
	(18, '2016_06_14_025716_create_fields_table', 1),
	(19, '2016_06_14_164304_create_field_options_table', 1),
	(20, '2016_06_15_025158_create_subscribers_table', 1),
	(21, '2016_06_15_064031_create_subscriber_fields_table', 1),
	(22, '2016_06_16_034306_create_segments_table', 1),
	(23, '2016_06_16_062814_create_segment_conditions_table', 1),
	(24, '2016_06_16_133626_create_jobs_table', 1),
	(25, '2016_06_17_041253_create_layouts_table', 1),
	(26, '2016_06_17_042331_create_pages_table', 1),
	(27, '2016_06_19_145423_create_open_logs_table', 1),
	(28, '2016_06_19_145434_create_click_logs_table', 1),
	(29, '2016_06_19_145452_create_unsubscribe_logs_table', 1),
	(30, '2016_06_19_145506_create_feedback_logs_table', 1),
	(31, '2016_06_21_074950_create_templates_table', 1),
	(32, '2016_06_21_145755_add_segment_foreign_key_to_campaigns_table', 1),
	(33, '2016_06_28_094014_create_links_table', 1),
	(34, '2016_06_29_024509_create_bounce_handlers_table', 1),
	(35, '2016_06_29_041133_create_feedback_loop_handlers_table', 1),
	(36, '2016_07_01_150630_create_sending_servers_table', 1),
	(37, '2016_07_04_092555_create_sending_domains_table', 1),
	(38, '2016_07_05_020001_create_settings_table', 1),
	(39, '2016_07_05_073002_create_campaign_links_table', 1),
	(40, '2016_07_06_034536_add_user_foreign_key_to_users', 1),
	(41, '2016_07_06_145609_create_logs_table', 1),
	(42, '2016_07_07_034047_add_tracking_logs_foreign_keys', 1),
	(43, '2016_07_07_080813_create_bounce_logs_table', 1),
	(44, '2016_07_10_030645_create_ip_locations_table', 1),
	(45, '2016_07_12_031139_create_blacklists_table', 1),
	(46, '2016_09_08_163044_add_reason_column_for_blacklists', 1),
	(47, '2016_09_16_123651_create_customer_group_sending_servers_table', 1),
	(48, '2016_09_26_035705_create_currencies_table', 1),
	(49, '2016_09_26_035706_create_plans_table', 1),
	(50, '2016_09_27_035248_add_sending_servers_api_secret_key', 1),
	(51, '2016_10_05_151438_add_source_to_templates', 1),
	(52, '2016_10_06_131656_add_template_source_to_campaigns', 1),
	(53, '2016_10_21_032525_add_index_to_subscribers', 1),
	(54, '2016_10_24_014703_create_system_jobs_table', 1),
	(55, '2016_11_02_033302_change_system_jobs_table', 1),
	(56, '2016_11_02_033333_add_campaigns_last_error_field', 1),
	(57, '2016_11_02_094446_add_default_to_languages', 1),
	(58, '2016_11_06_045817_add_users_quota_column', 1),
	(59, '2016_11_18_020355_create_automations_table', 1),
	(60, '2016_11_21_121349_create_auto_events_table', 1),
	(61, '2016_11_23_103930_create_failed_jobs_table', 1),
	(62, '2016_12_01_123517_create_auto_campaigns_table', 1),
	(63, '2016_12_06_125512_add_is_auto_to_campaigns', 1),
	(64, '2016_12_15_023825_add_subscribe_confirmation_to_mail_lists', 1),
	(65, '2016_12_20_015411_add_index_to_ip_locations_ip_address', 1),
	(66, '2016_12_20_015536_add_index_to_open_logs_ip_address', 1),
	(67, '2016_12_27_104155_create_auto_trigger_table', 1),
	(68, '2016_12_28_095315_add_auto_trigger_id_to_tracking_logs', 1),
	(69, '2016_12_29_065658_add_status_to_auto_events', 1),
	(70, '2016_12_31_031017_add_image_to_campaigns', 1),
	(71, '2017_01_02_173918_add_subscription_type_column', 1),
	(72, '2017_01_11_114659_create_campaigns_lists_segments_table', 1),
	(73, '2017_01_11_174230_add_default_mail_list_id_to_campaigns', 1),
	(74, '2017_01_12_155942_delete_list_segmnet_cols_form_campaigns', 1),
	(75, '2017_01_12_160256_create_automations_lists_segments_table', 1),
	(76, '2017_01_12_161001_add_default_mail_list_id_to_automations', 1),
	(77, '2017_01_12_170519_delete_list_segment_cols_from_automations', 1),
	(78, '2017_01_22_175544_add_sending_servers_quota_column', 1),
	(79, '2017_01_24_092138_update_user_quota', 1),
	(80, '2017_02_17_071823_create_plans_sending_servers_table', 1),
	(81, '2017_02_18_130704_create_payment_methods_table', 1),
	(82, '2017_02_18_130705_create_subscriptions_table', 1),
	(83, '2017_02_22_082127_create_user_activations_table', 1),
	(84, '2017_02_22_082327_add_activated_to_users', 1),
	(85, '2017_02_24_162634_add_cache_column_for_campaigns', 1),
	(86, '2017_02_26_015102_create_payments_table', 1),
	(87, '2017_02_26_123202_add_cache_column_for_mail_lists', 1),
	(88, '2017_02_27_045021_add_cache_column_for_customers', 1),
	(89, '2017_03_01_162212_create_subscriptions_sending_servers_table', 1),
	(90, '2017_03_02_033500_create_mail_lists_sending_servers_table', 1),
	(91, '2017_03_02_035144_add_all_sending_servers_to_mail_lists', 1),
	(92, '2017_03_11_160853_add_email_to_bounce_handlers', 1),
	(93, '2017_03_17_012705_add_subject_to_layouts', 1),
	(94, '2017_03_17_012734_add_subject_to_pages', 1),
	(95, '2017_04_17_040000_create_email_verification_servers_table', 1),
	(96, '2017_04_17_043522_create_email_verifications_table', 1),
	(97, '2017_04_25_064529_create_plans_email_verification_servers_table', 1),
	(98, '2017_04_25_084200_create_subscriptions_email_verification_servers_table', 1),
	(99, '2017_04_28_112900_add_billing_info_to_contacts', 1),
	(100, '2017_04_29_092532_add_billing_information_to_payments', 1),
	(101, '2017_05_03_092307_change_segment_conditions_field_id_nullable', 1),
	(102, '2017_06_02_040458_patch_null_start_at_for_subscriptions', 1),
	(103, '2017_06_28_024636_add_automation_cache_column', 1),
	(104, '2017_06_30_104909_add_email_to_feedback_loop_handlers', 1),
	(105, '2017_07_12_020023_add_customer_amin_ids_to_blacklists', 1),
	(106, '2017_07_14_030750_add_portuguese', 1),
	(107, '2017_07_18_130505_add_tax_billing_required_to_plans', 1),
	(108, '2017_07_24_033211_create_sub_accounts_table', 1),
	(109, '2017_07_24_075433_update_plan_subscription_sending_server_option', 1),
	(110, '2017_07_28_043008_add_subscription_last_error', 1),
	(111, '2017_07_28_050000_add_subscriptions_sub_account_id', 1),
	(112, '2017_07_29_173114_add_tracking_logs_sub_account_id', 1),
	(113, '2017_08_02_023036_fix_automation_trigger_settings', 1),
	(114, '2017_08_11_093849_create_index_on_email_verifications_result', 1),
	(115, '2017_08_12_170910_add_index_for_subscribers_email', 1),
	(116, '2017_08_14_073948_insert_paddle_to_payment_methods', 1),
	(117, '2017_08_15_102115_add_segments_cache_column', 1),
	(118, '2017_10_03_184430_insert_payu_to_payment_methods', 1),
	(119, '2017_10_14_172620_add_german', 1),
	(120, '2017_10_30_034633_add_last_error_to_system_jobs_table', 1),
	(121, '2017_11_11_081308_add_paddle_plan_id_column', 1),
	(122, '2017_11_12_195224_add_column_data', 1),
	(123, '2018_05_29_032030_add_verification_fields_to_sending_domains_table', 1),
	(124, '2018_05_29_091718_add_tracking_domain_id_to_campaigns', 1),
	(125, '2018_05_30_161924_insert_url_root_setting', 1),
	(126, '2018_06_27_074852_add_outside_url_columns_to_pages', 1),
	(127, '2018_07_12_065620_add_default_from_email_to_sending_servers', 1),
	(128, '2018_07_12_080758_add_use_default_sending_server_from_email_to_campaigns', 1),
	(129, '2018_07_13_150351_update_sending_server_and_campaign_default_from_email', 1),
	(130, '2018_07_23_072940_add_verification_hostname_dkim_selector_to_sending_domains', 1),
	(131, '2018_07_31_173424_create_notifications_table', 1),
	(132, '2018_08_22_151656_change_jobs_datatable_for_laravel53', 1),
	(133, '2018_08_22_181154_change_system_jobs_data_field_make_it_nullable', 1),
	(134, '2018_08_31_151114_change_sending_domains_table', 1),
	(135, '2018_09_02_165941_update_nullable', 1);
/*!40000 ALTER TABLE `saas_migrations` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_notifications
CREATE TABLE IF NOT EXISTS `saas_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `level` text COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_admin_id_foreign` (`admin_id`),
  KEY `notifications_customer_id_foreign` (`customer_id`),
  CONSTRAINT `notifications_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `saas_admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `saas_customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_notifications: ~4 rows (approximately)
/*!40000 ALTER TABLE `saas_notifications` DISABLE KEYS */;
INSERT INTO `saas_notifications` (`id`, `uid`, `type`, `title`, `message`, `level`, `admin_id`, `customer_id`, `created_at`, `updated_at`) VALUES
	(6, '5c19f7abe59c3', 'Gutropolis\\Library\\Notification\\CronJob', 'CronJob', 'Application\'s CronJob has not been executed during the last 15 minutes. Last executed at #unknown', 'warning', NULL, NULL, '2018-12-19 07:47:55', '2018-12-19 07:47:55'),
	(7, '5c19f7ac1a3e5', 'Gutropolis\\Library\\Notification\\SystemUrl', 'Application URL', 'The current application URL (http://localhost:8000) does not match with the one stored in Gutropolis Mail\'s cache (http://localhost/acellemail/public). Please go to Admin > Setting > All Settings > System URL to verify and update your setting cache', 'warning', NULL, NULL, '2018-12-19 07:47:56', '2018-12-19 07:47:56'),
	(32, '5c25d1f578b30', 'Acelle\\Library\\Notification\\CronJob', 'CronJob', 'Application\'s CronJob has not been executed during the last 15 minutes. Last executed at #unknown', 'warning', NULL, NULL, '2018-12-28 13:04:13', '2018-12-28 13:04:13'),
	(33, '5c25d1f5b575a', 'Acelle\\Library\\Notification\\SystemUrl', 'Application URL', 'The current application URL (http://localhost:8081) does not match with the one stored in Acelle Mail\'s cache (http://localhost:8000). Please go to Admin > Setting > All Settings > System URL to verify and update your setting cache', 'warning', NULL, NULL, '2018-12-28 13:04:13', '2018-12-28 13:04:13');
/*!40000 ALTER TABLE `saas_notifications` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_open_logs
CREATE TABLE IF NOT EXISTS `saas_open_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `open_logs_message_id_foreign` (`message_id`),
  KEY `open_logs_ip_address_index` (`ip_address`),
  CONSTRAINT `open_logs_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `saas_tracking_logs` (`message_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_open_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_open_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_open_logs` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_pages
CREATE TABLE IF NOT EXISTS `saas_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `layout_id` int(10) unsigned NOT NULL,
  `mail_list_id` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `use_outside_url` tinyint(1) NOT NULL DEFAULT '0',
  `outside_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_mail_list_id_foreign` (`mail_list_id`),
  KEY `pages_layout_id_foreign` (`layout_id`),
  CONSTRAINT `pages_layout_id_foreign` FOREIGN KEY (`layout_id`) REFERENCES `saas_layouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pages_mail_list_id_foreign` FOREIGN KEY (`mail_list_id`) REFERENCES `saas_mail_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_pages: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_pages` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_password_resets
CREATE TABLE IF NOT EXISTS `saas_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_password_resets` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_payments
CREATE TABLE IF NOT EXISTS `saas_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` int(10) unsigned NOT NULL,
  `payment_method_id` int(10) unsigned DEFAULT NULL,
  `payment_method_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_subscription_id_foreign` (`subscription_id`),
  KEY `payments_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `saas_payment_methods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `saas_subscriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_payments: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_payments` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_payment_methods
CREATE TABLE IF NOT EXISTS `saas_payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_methods_admin_id_foreign` (`admin_id`),
  CONSTRAINT `payment_methods_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `saas_admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_payment_methods: ~7 rows (approximately)
/*!40000 ALTER TABLE `saas_payment_methods` DISABLE KEYS */;
INSERT INTO `saas_payment_methods` (`id`, `uid`, `admin_id`, `name`, `type`, `options`, `status`, `custom_order`, `created_at`, `updated_at`) VALUES
	(1, '5c19d20aa7964', NULL, 'Pay by Card (Paddle)', 'paddle_card', NULL, 'inactive', 5, '2017-08-14 00:00:00', '2017-08-14 00:00:00'),
	(2, '5c19d20c6dc01', NULL, 'PayU Money', 'payumoney', NULL, 'inactive', 6, '2017-10-02 00:00:00', '2017-10-02 00:00:00'),
	(3, '58bf6e250782f', NULL, 'Pay in Cash', 'cash', 'null', 'active', 0, '2017-03-08 02:36:21', '2017-03-08 02:56:29'),
	(4, '58bf724e9789b', NULL, 'Pay with PayPal', 'braintree_paypal', '{"environment":"production","merchantId":"","publicKey":"","privateKey":""}', 'inactive', 2, '2017-03-08 02:54:06', '2017-03-08 02:55:20'),
	(5, '58bf7298565d0', NULL, 'Pay by Credit Card', 'braintree_credit_card', '{"environment":"production","merchantId":"","publicKey":"","privateKey":""}', 'inactive', 3, '2017-03-08 02:55:20', '2017-03-08 02:56:37'),
	(6, '58f0a900c19d3', NULL, 'Pay by Credit Card', 'stripe_credit_card', '{"api_key":"pk_test_6pRNASCoBOKtIshFeQd4XMUh"}', 'inactive', 4, '2017-04-14 10:48:32', '2017-04-14 12:17:00'),
	(7, '581b52d8acdca', NULL, 'Pay with PayPal', 'paypal', NULL, 'inactive', 1, '2017-04-14 10:48:32', '2017-04-14 12:17:00');
/*!40000 ALTER TABLE `saas_payment_methods` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_plans
CREATE TABLE IF NOT EXISTS `saas_plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `frequency_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `frequency_unit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_order` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_billing_required` tinyint(1) NOT NULL DEFAULT '0',
  `paddle_plan_id` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `plans_admin_id_foreign` (`admin_id`),
  KEY `plans_currency_id_foreign` (`currency_id`),
  CONSTRAINT `plans_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `saas_admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `plans_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `saas_currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_plans: ~4 rows (approximately)
/*!40000 ALTER TABLE `saas_plans` DISABLE KEYS */;
INSERT INTO `saas_plans` (`id`, `uid`, `admin_id`, `currency_id`, `name`, `price`, `frequency_amount`, `frequency_unit`, `options`, `status`, `color`, `custom_order`, `is_default`, `created_at`, `updated_at`, `tax_billing_required`, `paddle_plan_id`) VALUES
	(1, '58bd48f91fcab', NULL, 1, 'Free', 0.00, '1', 'month', '{"email_max":"5000","list_max":"10","subscriber_max":"1000","subscriber_per_list_max":"-1","segment_per_list_max":"3","campaign_max":"20","automation_max":"10","unsubscribe_url_required":"yes","access_when_offline":"no","max_process":"1","max_size_upload_total":"500","max_file_size_upload":"5","sending_quota":"1000","sending_quota_time":"1","sending_quota_time_unit":"day","sending_server_option":"system","sending_servers_max":"-1","all_sending_servers":"yes","create_sending_domains":"no","sending_domains_max":"-1","list_import":"yes","list_export":"yes"}', 'active', '#008c6e', 1, 0, '2017-03-07 03:33:12', '2017-04-04 13:23:13', 0, NULL),
	(2, '58bd48f92088f', NULL, 1, 'Basic', 50.00, '1', 'month', '{"email_max":"100000","list_max":"50","subscriber_max":"50000","subscriber_per_list_max":"-1","segment_per_list_max":"3","campaign_max":"40","automation_max":"20","unsubscribe_url_required":"yes","access_when_offline":"no","max_size_upload_total":"10000","max_file_size_upload":"50","sending_quota":"10000","sending_quota_time":"1","sending_quota_time_unit":"day","max_process":"1","sending_server_option":"system","sending_servers_max":"-1","all_sending_servers":"yes","create_sending_domains":"no","sending_domains_max":"-1","list_import":"yes","list_export":"yes"}', 'active', '#1482a0', 2, 0, '2017-03-07 03:33:12', '2017-04-04 13:22:35', 0, NULL),
	(3, '58bd4b4d0d4c3', NULL, 1, 'Ultimate', 100.00, '1', 'month', '{"email_max":"1000000","list_max":"-1","subscriber_max":"-1","subscriber_per_list_max":"-1","segment_per_list_max":"3","campaign_max":"-1","automation_max":"-1","unsubscribe_url_required":"yes","access_when_offline":"no","max_size_upload_total":"50000","max_file_size_upload":"100","sending_quota":"-1","sending_quota_time":"-1","sending_quota_time_unit":"day","max_process":"1","sending_server_option":"own","sending_servers_max":"5","all_sending_servers":"yes","create_sending_domains":"yes","sending_domains_max":"-1","list_import":"yes","list_export":"yes"}', 'active', '#aa5064', 3, 0, '2017-03-07 03:43:09', '2017-04-04 13:22:35', 0, NULL),
	(4, '58e39e1b9e2df', NULL, 1, 'Default', 0.00, '-1', 'unlimited', '{"email_max":"-1","list_max":"-1","subscriber_max":"-1","subscriber_per_list_max":"-1","segment_per_list_max":"-1","campaign_max":"-1","automation_max":"-1","unsubscribe_url_required":"yes","access_when_offline":"no","max_process":"5","max_size_upload_total":"5000","max_file_size_upload":"500","sending_quota":"-1","sending_quota_time":"1","sending_quota_time_unit":"day","sending_server_option":"own","sending_servers_max":"-1","all_sending_servers":"yes","create_sending_domains":"yes","sending_domains_max":"-1","list_import":"yes","list_export":"yes"}', 'active', '#555', 0, 1, '2017-04-04 13:22:35', '2017-04-04 13:22:35', 0, NULL);
/*!40000 ALTER TABLE `saas_plans` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_plans_email_verification_servers
CREATE TABLE IF NOT EXISTS `saas_plans_email_verification_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `plan_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plans_email_verification_servers_server_id_foreign` (`server_id`),
  KEY `plans_email_verification_servers_plan_id_foreign` (`plan_id`),
  CONSTRAINT `plans_email_verification_servers_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `saas_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `plans_email_verification_servers_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `saas_email_verification_servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_plans_email_verification_servers: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_plans_email_verification_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_plans_email_verification_servers` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_plans_sending_servers
CREATE TABLE IF NOT EXISTS `saas_plans_sending_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sending_server_id` int(10) unsigned NOT NULL,
  `plan_id` int(10) unsigned NOT NULL,
  `fitness` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plans_sending_servers_sending_server_id_foreign` (`sending_server_id`),
  KEY `plans_sending_servers_plan_id_foreign` (`plan_id`),
  CONSTRAINT `plans_sending_servers_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `saas_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `plans_sending_servers_sending_server_id_foreign` FOREIGN KEY (`sending_server_id`) REFERENCES `saas_sending_servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_plans_sending_servers: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_plans_sending_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_plans_sending_servers` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_segments
CREATE TABLE IF NOT EXISTS `saas_segments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `mail_list_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `matching` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cache` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `segments_mail_list_id_foreign` (`mail_list_id`),
  CONSTRAINT `segments_mail_list_id_foreign` FOREIGN KEY (`mail_list_id`) REFERENCES `saas_mail_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_segments: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_segments` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_segments` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_segment_conditions
CREATE TABLE IF NOT EXISTS `saas_segment_conditions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `segment_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `operator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `segment_conditions_segment_id_foreign` (`segment_id`),
  KEY `segment_conditions_field_id_foreign` (`field_id`),
  CONSTRAINT `segment_conditions_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `saas_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `segment_conditions_segment_id_foreign` FOREIGN KEY (`segment_id`) REFERENCES `saas_segments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_segment_conditions: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_segment_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_segment_conditions` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_sending_domains
CREATE TABLE IF NOT EXISTS `saas_sending_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dkim_private` text COLLATE utf8_unicode_ci NOT NULL,
  `dkim_public` text COLLATE utf8_unicode_ci NOT NULL,
  `signing_enabled` tinyint(1) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verification_token` text COLLATE utf8_unicode_ci,
  `domain_verified` tinyint(1) NOT NULL DEFAULT '0',
  `dkim_verified` tinyint(1) NOT NULL DEFAULT '0',
  `spf_verified` tinyint(1) NOT NULL DEFAULT '0',
  `verification_hostname` text COLLATE utf8_unicode_ci,
  `dkim_selector` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `sending_domains_admin_id_foreign` (`admin_id`),
  KEY `sending_domains_customer_id_foreign` (`customer_id`),
  CONSTRAINT `sending_domains_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `saas_admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sending_domains_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `saas_customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_sending_domains: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_sending_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_sending_domains` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_sending_servers
CREATE TABLE IF NOT EXISTS `saas_sending_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `bounce_handler_id` int(10) unsigned DEFAULT NULL,
  `feedback_loop_handler_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aws_access_key_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aws_secret_access_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aws_region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smtp_port` int(11) DEFAULT NULL,
  `smtp_protocol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sendmail_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quota_value` int(11) NOT NULL,
  `quota_base` int(11) NOT NULL,
  `quota_unit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_secret_key` text COLLATE utf8_unicode_ci,
  `quota` blob,
  `default_from_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sending_servers_admin_id_foreign` (`admin_id`),
  KEY `sending_servers_customer_id_foreign` (`customer_id`),
  KEY `sending_servers_bounce_handler_id_foreign` (`bounce_handler_id`),
  KEY `sending_servers_feedback_loop_handler_id_foreign` (`feedback_loop_handler_id`),
  CONSTRAINT `sending_servers_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `saas_admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sending_servers_bounce_handler_id_foreign` FOREIGN KEY (`bounce_handler_id`) REFERENCES `saas_bounce_handlers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sending_servers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `saas_customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sending_servers_feedback_loop_handler_id_foreign` FOREIGN KEY (`feedback_loop_handler_id`) REFERENCES `saas_feedback_loop_handlers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_sending_servers: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_sending_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_sending_servers` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_settings
CREATE TABLE IF NOT EXISTS `saas_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_settings: ~13 rows (approximately)
/*!40000 ALTER TABLE `saas_settings` DISABLE KEYS */;
INSERT INTO `saas_settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'url_delivery_handler', 'http://localhost:8000/delivery/notify', '2017-01-01 00:00:00', '2018-12-24 11:13:54'),
	(2, 'url_unsubscribe', 'http://localhost:8000/campaigns/MESSAGE_ID/unsubscribe', '2017-01-01 00:00:00', '2018-12-24 11:13:54'),
	(3, 'url_open_track', 'http://localhost:8000/campaigns/MESSAGE_ID/open', '2017-01-01 00:00:00', '2018-12-24 11:13:54'),
	(4, 'url_web_view', 'http://localhost:8000/campaigns/MESSAGE_ID/web-view', '2017-01-01 00:00:00', '2018-12-24 11:13:54'),
	(5, 'url_click_track', 'http://localhost:8000/campaigns/MESSAGE_ID/click/URL', '2017-01-01 00:00:00', '2018-12-24 11:13:54'),
	(6, 'url_update_profile', 'http://localhost:8000/lists/LIST_UID/update-profile/SUBSCRIBER_UID/SECURE_CODE', '2017-01-01 00:00:00', '2018-12-24 11:13:54'),
	(7, 'site_name', 'AgentCRM Mailchimp', '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(8, 'site_keyword', 'AgentCRM email marketing', '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(9, 'site_description', 'php_imap.dll', '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(10, 'license', '', '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(11, 'license_type', '', '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
	(12, 'remote_job_token', 'NLJTyesuvqh5Wq2JhU66yWw78Q56rO8DyDttIFoTKk7nTmFwucillcJnTb49', '2018-12-18 17:26:12', '2018-12-18 17:26:12'),
	(13, 'url_root', 'http://localhost:8000', '2018-12-19 06:20:09', '2018-12-24 11:13:54');
/*!40000 ALTER TABLE `saas_settings` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_subscribers
CREATE TABLE IF NOT EXISTS `saas_subscribers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `mail_list_id` int(10) unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` text COLLATE utf8_unicode_ci,
  `ip` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subscription_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_mail_list_id_email_index` (`mail_list_id`,`email`),
  KEY `subscribers_email_index` (`email`),
  CONSTRAINT `subscribers_mail_list_id_foreign` FOREIGN KEY (`mail_list_id`) REFERENCES `saas_mail_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_subscribers: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_subscribers` DISABLE KEYS */;
INSERT INTO `saas_subscribers` (`id`, `uid`, `mail_list_id`, `email`, `status`, `from`, `ip`, `created_at`, `updated_at`, `subscription_type`) VALUES
	(1, '5c20ab88c850e', 1, 'jai@gmail.com', 'subscribed', NULL, NULL, '2018-12-24 15:18:56', '2018-12-24 15:18:56', NULL),
	(2, '5c2213357690a', 2, 'oop@gmail.com', 'subscribed', NULL, NULL, '2018-12-25 16:53:33', '2018-12-25 16:53:33', NULL);
/*!40000 ALTER TABLE `saas_subscribers` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_subscriber_fields
CREATE TABLE IF NOT EXISTS `saas_subscriber_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriber_fields_subscriber_id_foreign` (`subscriber_id`),
  KEY `subscriber_fields_field_id_foreign` (`field_id`),
  CONSTRAINT `subscriber_fields_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `saas_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscriber_fields_subscriber_id_foreign` FOREIGN KEY (`subscriber_id`) REFERENCES `saas_subscribers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_subscriber_fields: ~5 rows (approximately)
/*!40000 ALTER TABLE `saas_subscriber_fields` DISABLE KEYS */;
INSERT INTO `saas_subscriber_fields` (`id`, `subscriber_id`, `field_id`, `value`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'jai@gmail.com', '2018-12-24 15:18:56', '2018-12-24 15:18:56'),
	(2, 1, 2, 'jai', '2018-12-24 15:18:56', '2018-12-24 15:18:56'),
	(3, 1, 3, 'kumar', '2018-12-24 15:18:57', '2018-12-24 15:18:57'),
	(4, 2, 4, 'oop@gmail.com', '2018-12-25 16:53:33', '2018-12-25 16:53:33'),
	(5, 2, 5, 'sandf', '2018-12-25 16:53:33', '2018-12-25 16:53:33'),
	(6, 2, 6, 'sss', '2018-12-25 16:53:33', '2018-12-25 16:53:33');
/*!40000 ALTER TABLE `saas_subscriber_fields` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_subscriptions
CREATE TABLE IF NOT EXISTS `saas_subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `plan_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `payment_method_id` int(10) unsigned DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `currency_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `currency_format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plan_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plan_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `last_error` text COLLATE utf8_unicode_ci,
  `sub_account_id` int(10) unsigned DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `subscriptions_plan_id_foreign` (`plan_id`),
  KEY `subscriptions_customer_id_foreign` (`customer_id`),
  KEY `subscriptions_admin_id_foreign` (`admin_id`),
  KEY `subscriptions_payment_method_id_foreign` (`payment_method_id`),
  KEY `subscriptions_sub_account_id_foreign` (`sub_account_id`),
  CONSTRAINT `subscriptions_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `saas_admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `saas_customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `saas_payment_methods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `saas_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_sub_account_id_foreign` FOREIGN KEY (`sub_account_id`) REFERENCES `saas_sub_accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_subscriptions: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_subscriptions` DISABLE KEYS */;
INSERT INTO `saas_subscriptions` (`id`, `uid`, `plan_id`, `customer_id`, `admin_id`, `payment_method_id`, `options`, `price`, `currency_code`, `currency_format`, `plan_name`, `plan_color`, `status`, `paid`, `created_at`, `updated_at`, `start_at`, `end_at`, `last_error`, `sub_account_id`, `data`) VALUES
	(1, '5c20aa85e711d', 1, 1, 1, NULL, '{"email_max":"5000","list_max":"10","subscriber_max":"1000","subscriber_per_list_max":"-1","segment_per_list_max":"3","campaign_max":"20","automation_max":"10","sending_quota":"1000","sending_quota_time":"1","sending_quota_time_unit":"day","max_process":"1","all_sending_servers":"yes","max_size_upload_total":"500","max_file_size_upload":"5","unsubscribe_url_required":"yes","access_when_offline":"no","create_sending_domains":"no","sending_servers_max":"-1","sending_domains_max":"-1","all_email_verification_servers":"yes","create_email_verification_servers":"no","email_verification_servers_max":"-1","list_import":"yes","list_export":"yes","all_sending_server_types":"yes","sending_server_types":{"amazon-smtp":"yes","amazon-api":"yes","sendgrid-smtp":"yes","sendgrid-api":"yes","mailgun-api":"yes","mailgun-smtp":"yes","elasticemail-api":"yes","elasticemail-smtp":"yes","sparkpost-api":"yes","sparkpost-smtp":"yes","smtp":"yes","sendmail":"yes","php-mail":"yes"},"sending_server_option":"system","sending_server_subaccount_uid":null,"api_access":"yes"}', 0.00, 'USD', '${PRICE}', 'Free', '#008c6e', 'active', 0, '2018-12-24 15:14:37', '2018-12-24 15:14:37', '2018-12-24 10:30:00', '2019-01-23 10:30:00', NULL, NULL, NULL);
/*!40000 ALTER TABLE `saas_subscriptions` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_subscriptions_email_verification_servers
CREATE TABLE IF NOT EXISTS `saas_subscriptions_email_verification_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `subscription_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_email_verification_servers_server_id_foreign` (`server_id`),
  KEY `subscriptions_email_verification_servers_subscription_id_foreign` (`subscription_id`),
  CONSTRAINT `subscriptions_email_verification_servers_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `saas_email_verification_servers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_email_verification_servers_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `saas_subscriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_subscriptions_email_verification_servers: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_subscriptions_email_verification_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_subscriptions_email_verification_servers` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_subscriptions_sending_servers
CREATE TABLE IF NOT EXISTS `saas_subscriptions_sending_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sending_server_id` int(10) unsigned NOT NULL,
  `subscription_id` int(10) unsigned NOT NULL,
  `fitness` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_sending_servers_sending_server_id_foreign` (`sending_server_id`),
  KEY `subscriptions_sending_servers_subscription_id_foreign` (`subscription_id`),
  CONSTRAINT `subscriptions_sending_servers_sending_server_id_foreign` FOREIGN KEY (`sending_server_id`) REFERENCES `saas_sending_servers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_sending_servers_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `saas_subscriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_subscriptions_sending_servers: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_subscriptions_sending_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_subscriptions_sending_servers` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_sub_accounts
CREATE TABLE IF NOT EXISTS `saas_sub_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `sending_server_id` int(10) unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_key_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_accounts_customer_id_foreign` (`customer_id`),
  KEY `sub_accounts_sending_server_id_foreign` (`sending_server_id`),
  CONSTRAINT `sub_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `saas_customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub_accounts_sending_server_id_foreign` FOREIGN KEY (`sending_server_id`) REFERENCES `saas_sending_servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_sub_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_sub_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_sub_accounts` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_system_jobs
CREATE TABLE IF NOT EXISTS `saas_system_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `job_id` int(11) DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_system_jobs: ~3 rows (approximately)
/*!40000 ALTER TABLE `saas_system_jobs` DISABLE KEYS */;
INSERT INTO `saas_system_jobs` (`id`, `name`, `status`, `data`, `job_id`, `start_at`, `end_at`, `created_at`, `updated_at`, `last_error`) VALUES
	(1, 'Acelle\\Jobs\\UpdateUserJob', 'new', '1', NULL, NULL, NULL, '2018-12-24 11:12:41', '2018-12-24 11:12:41', NULL),
	(2, 'Acelle\\Jobs\\UpdateMailListJob', 'new', '1', NULL, NULL, NULL, '2018-12-24 15:17:38', '2018-12-24 15:17:38', NULL),
	(3, 'Acelle\\Jobs\\UpdateCampaignJob', 'new', '1', NULL, NULL, NULL, '2018-12-24 15:19:19', '2018-12-24 15:19:19', NULL),
	(4, 'Acelle\\Jobs\\UpdateMailListJob', 'new', '2', NULL, NULL, NULL, '2018-12-25 16:10:26', '2018-12-25 16:10:26', NULL),
	(5, 'Acelle\\Jobs\\UpdateMailListJob', 'new', '3', NULL, NULL, NULL, '2018-12-26 15:30:55', '2018-12-26 15:30:55', NULL);
/*!40000 ALTER TABLE `saas_system_jobs` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_templates
CREATE TABLE IF NOT EXISTS `saas_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `image` text COLLATE utf8_unicode_ci,
  `custom_order` int(11) DEFAULT NULL,
  `shared` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `templates_customer_id_foreign` (`customer_id`),
  KEY `templates_admin_id_foreign` (`admin_id`),
  CONSTRAINT `templates_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `saas_admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `templates_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `saas_customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_templates: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_templates` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_tracking_logs
CREATE TABLE IF NOT EXISTS `saas_tracking_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `runtime_message_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `sending_server_id` int(10) unsigned NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `subscriber_id` int(10) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `error` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auto_trigger_id` int(10) unsigned DEFAULT NULL,
  `sub_account_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tracking_logs_runtime_message_id_unique` (`runtime_message_id`),
  UNIQUE KEY `tracking_logs_message_id_unique` (`message_id`),
  KEY `tracking_logs_customer_id_foreign` (`customer_id`),
  KEY `tracking_logs_sending_server_id_foreign` (`sending_server_id`),
  KEY `tracking_logs_campaign_id_foreign` (`campaign_id`),
  KEY `tracking_logs_subscriber_id_foreign` (`subscriber_id`),
  KEY `tracking_logs_auto_trigger_id_foreign` (`auto_trigger_id`),
  KEY `tracking_logs_sub_account_id_foreign` (`sub_account_id`),
  CONSTRAINT `tracking_logs_auto_trigger_id_foreign` FOREIGN KEY (`auto_trigger_id`) REFERENCES `saas_auto_triggers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tracking_logs_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `saas_campaigns` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tracking_logs_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `saas_customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tracking_logs_sending_server_id_foreign` FOREIGN KEY (`sending_server_id`) REFERENCES `saas_sending_servers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tracking_logs_sub_account_id_foreign` FOREIGN KEY (`sub_account_id`) REFERENCES `saas_sub_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tracking_logs_subscriber_id_foreign` FOREIGN KEY (`subscriber_id`) REFERENCES `saas_subscribers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_tracking_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_tracking_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_tracking_logs` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_unsubscribe_logs
CREATE TABLE IF NOT EXISTS `saas_unsubscribe_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unsubscribe_logs_message_id_foreign` (`message_id`),
  CONSTRAINT `unsubscribe_logs_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `saas_tracking_logs` (`message_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_unsubscribe_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_unsubscribe_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_unsubscribe_logs` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_users
CREATE TABLE IF NOT EXISTS `saas_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `api_token` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quota` blob,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_api_token_unique` (`api_token`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_creator_id_foreign` (`creator_id`),
  CONSTRAINT `users_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `saas_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_users: ~2 rows (approximately)
/*!40000 ALTER TABLE `saas_users` DISABLE KEYS */;
INSERT INTO `saas_users` (`id`, `uid`, `api_token`, `creator_id`, `email`, `password`, `remember_token`, `status`, `created_at`, `updated_at`, `quota`, `activated`) VALUES
	(1, '5c18e057df5ea', 'STrGFSo7fm6BoG85ZYqCATWO2MzBYTx5ORLebddJlIh4CEzVoOf76lOiG8sq', NULL, 'gutropolis@gmail.com', '$2y$10$/dyKSwVsQtoELqkelj4ne.4dWTAcku4KbgdBuf0CCE0sBpVeIK7U6', 'zHrGMbVm5Piv9ZQ99EEcLGN9Xp0bGrXUqTntgnmMmyNf6l6eVVaRpTVVpJUG', 'active', '2017-01-01 00:00:00', '2017-01-01 00:00:00', NULL, 1),
	(2, '5c2071b308012', 'P1bnMo4lQnKCd27k2xtWTMtvuM3WHE0hItzdzbG85Tu0OwzlMOe4kNkEtGw0', NULL, 'singla.nikhil4@outlook.com', '$2y$10$/B9siCO1q6ikDpvRAMWrsOmg5KpeEV95aam2hk6QBSApuCCS8X1be', 'RvcfPmUjYZpnprOZSSB5puv5u37gLNyKXVTDFj18eXFLxs5zUcFSBNVOkaC1', NULL, '2018-12-24 11:12:11', '2018-12-24 11:12:11', NULL, 1);
/*!40000 ALTER TABLE `saas_users` ENABLE KEYS */;

-- Dumping structure for table agentcrmem.saas_user_activations
CREATE TABLE IF NOT EXISTS `saas_user_activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_activations_user_id_foreign` (`user_id`),
  KEY `user_activations_token_index` (`token`),
  CONSTRAINT `user_activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `saas_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table agentcrmem.saas_user_activations: ~0 rows (approximately)
/*!40000 ALTER TABLE `saas_user_activations` DISABLE KEYS */;
/*!40000 ALTER TABLE `saas_user_activations` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
