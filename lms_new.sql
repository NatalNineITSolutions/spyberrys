-- -------------------------------------------------------------
-- TablePlus 6.1.2(568)
--
-- https://tableplus.com/
--
-- Database: lms_new
-- Generation Time: 2024-08-19 04:49:16.8710
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `abandoned_cart_rule_histories`;
CREATE TABLE `abandoned_cart_rule_histories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `cart_rule_id` int unsigned DEFAULT NULL,
  `rule_action` enum('send_reminder','send_coupon') COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('auto','manual') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'auto',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `abandoned_cart_rule_specification_items`;
CREATE TABLE `abandoned_cart_rule_specification_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `abandoned_cart_rule_id` int unsigned NOT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `instructor_id` int unsigned DEFAULT NULL,
  `seller_id` int unsigned DEFAULT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abandoned_cart_rule_id_foreign` (`abandoned_cart_rule_id`),
  KEY `abandoned_cart_rule_specification_items_category_id_foreign` (`category_id`),
  KEY `abandoned_cart_rule_specification_items_instructor_id_foreign` (`instructor_id`),
  KEY `abandoned_cart_rule_specification_items_seller_id_foreign` (`seller_id`),
  KEY `abandoned_cart_rule_specification_items_webinar_id_foreign` (`webinar_id`),
  KEY `abandoned_cart_rule_specification_items_product_id_foreign` (`product_id`),
  KEY `abandoned_cart_rule_specification_items_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `abandoned_cart_rule_id_foreign` FOREIGN KEY (`abandoned_cart_rule_id`) REFERENCES `abandoned_cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_specification_items_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_specification_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_specification_items_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_specification_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_specification_items_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_specification_items_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `abandoned_cart_rule_translations`;
CREATE TABLE `abandoned_cart_rule_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `abandoned_cart_rule_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abandoned_cart_rule_id_trans` (`abandoned_cart_rule_id`),
  KEY `abandoned_cart_rule_translations_locale_index` (`locale`),
  CONSTRAINT `abandoned_cart_rule_id_trans` FOREIGN KEY (`abandoned_cart_rule_id`) REFERENCES `abandoned_cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `abandoned_cart_rule_users_groups`;
CREATE TABLE `abandoned_cart_rule_users_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `abandoned_cart_rule_id` int unsigned NOT NULL,
  `group_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abandoned_cart_rule_id` (`abandoned_cart_rule_id`),
  KEY `abandoned_cart_rule_users_groups_group_id_foreign` (`group_id`),
  KEY `abandoned_cart_rule_users_groups_user_id_foreign` (`user_id`),
  CONSTRAINT `abandoned_cart_rule_id` FOREIGN KEY (`abandoned_cart_rule_id`) REFERENCES `abandoned_cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_users_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abandoned_cart_rule_users_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `abandoned_cart_rules`;
CREATE TABLE `abandoned_cart_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `target_type` enum('all','courses','store_products','bundles','meetings') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'all',
  `target` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `action` enum('send_reminder','send_coupon') COLLATE utf8mb4_general_ci NOT NULL,
  `discount_id` int unsigned DEFAULT NULL,
  `action_cycle` int unsigned NOT NULL,
  `repeat_action` tinyint(1) NOT NULL DEFAULT '0',
  `repeat_action_count` int unsigned DEFAULT NULL,
  `minimum_cart_amount` double(15,2) unsigned DEFAULT NULL,
  `maximum_cart_amount` double(15,2) unsigned DEFAULT NULL,
  `start_at` bigint unsigned DEFAULT NULL,
  `end_at` bigint unsigned DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abandoned_cart_rules_discount_id_foreign` (`discount_id`),
  CONSTRAINT `abandoned_cart_rules_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `accounting`;
CREATE TABLE `accounting` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `creator_id` int DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `meeting_time_id` int unsigned DEFAULT NULL,
  `subscribe_id` int unsigned DEFAULT NULL,
  `promotion_id` int unsigned DEFAULT NULL,
  `registration_package_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `installment_payment_id` int unsigned DEFAULT NULL,
  `installment_order_id` int unsigned DEFAULT NULL COMMENT 'This field is filled in the seller''s financial document to find the installment order',
  `gift_id` int unsigned DEFAULT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `tax` tinyint(1) NOT NULL DEFAULT '0',
  `amount` decimal(13,2) DEFAULT NULL,
  `type` enum('addiction','deduction') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_account` enum('income','asset','subscribe','promotion','registration_package','installment_payment') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_type` enum('automatic','manual') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'automatic',
  `referred_user_id` int unsigned DEFAULT NULL,
  `is_affiliate_amount` tinyint(1) NOT NULL DEFAULT '0',
  `is_affiliate_commission` tinyint(1) NOT NULL DEFAULT '0',
  `is_registration_bonus` tinyint(1) NOT NULL DEFAULT '0',
  `is_cashback` tinyint(1) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `webinar_id` (`webinar_id`) USING BTREE,
  KEY `meeting_time_id` (`meeting_time_id`) USING BTREE,
  KEY `subscribe_id` (`subscribe_id`) USING BTREE,
  KEY `promotion_id` (`promotion_id`) USING BTREE,
  KEY `accounting_installment_payment_id_foreign` (`installment_payment_id`),
  CONSTRAINT `accounting_installment_payment_id_foreign` FOREIGN KEY (`installment_payment_id`) REFERENCES `installment_order_payments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=837 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `advertising_banners`;
CREATE TABLE `advertising_banners` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` enum('home1','home2','course','course_sidebar','product_show','bundle','bundle_sidebar') COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int unsigned NOT NULL DEFAULT '12',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `advertising_banners_translations`;
CREATE TABLE `advertising_banners_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `advertising_banner_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `advertising_banners_translations_advertising_banner_id_foreign` (`advertising_banner_id`),
  KEY `advertising_banners_translations_locale_index` (`locale`),
  CONSTRAINT `advertising_banners_translations_advertising_banner_id_foreign` FOREIGN KEY (`advertising_banner_id`) REFERENCES `advertising_banners` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `affiliates`;
CREATE TABLE `affiliates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_user_id` int unsigned NOT NULL,
  `referred_user_id` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `affiliates_affiliate_user_id_foreign` (`affiliate_user_id`),
  KEY `affiliates_referred_user_id_foreign` (`referred_user_id`),
  CONSTRAINT `affiliates_affiliate_user_id_foreign` FOREIGN KEY (`affiliate_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `affiliates_referred_user_id_foreign` FOREIGN KEY (`referred_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `affiliates_codes`;
CREATE TABLE `affiliates_codes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `affiliates_codes_code_unique` (`code`),
  KEY `affiliates_codes_user_id_foreign` (`user_id`),
  CONSTRAINT `affiliates_codes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `agora_history`;
CREATE TABLE `agora_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int unsigned NOT NULL,
  `start_at` int unsigned NOT NULL,
  `end_at` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agora_history_session_id_foreign` (`session_id`),
  CONSTRAINT `agora_history_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `ai_content_template_translations`;
CREATE TABLE `ai_content_template_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ai_content_template_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prompt` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `ai_content_template_id_trans` (`ai_content_template_id`),
  KEY `ai_content_template_translations_locale_index` (`locale`),
  CONSTRAINT `ai_content_template_id_trans` FOREIGN KEY (`ai_content_template_id`) REFERENCES `ai_content_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `ai_content_templates`;
CREATE TABLE `ai_content_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('text','image') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_length` tinyint(1) NOT NULL DEFAULT '0',
  `length` int unsigned DEFAULT NULL,
  `image_size` enum('256','512','1024') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `ai_contents`;
CREATE TABLE `ai_contents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `service_type` enum('text','image') COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_id` int unsigned DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prompt` text COLLATE utf8mb4_unicode_ci,
  `result` text COLLATE utf8mb4_unicode_ci,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ai_contents_user_id_foreign` (`user_id`),
  KEY `ai_contents_service_id_foreign` (`service_id`),
  CONSTRAINT `ai_contents_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `ai_content_templates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ai_contents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `badge_translations`;
CREATE TABLE `badge_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `badge_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `badge_translations_badge_id_foreign` (`badge_id`),
  KEY `badge_translations_locale_index` (`locale`),
  CONSTRAINT `badge_translations_badge_id_foreign` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `badges`;
CREATE TABLE `badges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('register_date','course_count','course_rate','sale_count','support_rate','product_sale_count','make_topic','send_post_in_topic','instructor_blog') COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `badges_type_index` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `become_instructors`;
CREATE TABLE `become_instructors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `role` enum('teacher','organization') COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_id` int unsigned DEFAULT NULL,
  `certificate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','accept','reject') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `become_instructors_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `become_instructors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `author_id` int unsigned NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visit_count` int unsigned DEFAULT '0',
  `enable_comment` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('pending','publish') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `blog_category_id_foreign` (`category_id`) USING BTREE,
  KEY `slug` (`slug`) USING BTREE,
  CONSTRAINT `blog_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `blog_categories`;
CREATE TABLE `blog_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `blog_category_translations`;
CREATE TABLE `blog_category_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `blog_category_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_category_translations_blog_category_id_foreign` (`blog_category_id`),
  KEY `blog_category_translations_locale_index` (`locale`),
  CONSTRAINT `blog_category_translations_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `blog_translations`;
CREATE TABLE `blog_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_translations_blog_id_locale_unique` (`blog_id`,`locale`),
  KEY `blog_translations_locale_index` (`locale`),
  CONSTRAINT `blog_translations_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `bundle_filter_option`;
CREATE TABLE `bundle_filter_option` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bundle_id` int unsigned NOT NULL,
  `filter_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bundle_filter_option_bundle_id_foreign` (`bundle_id`),
  KEY `bundle_filter_option_filter_option_id_foreign` (`filter_option_id`),
  CONSTRAINT `bundle_filter_option_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundle_filter_option_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `bundle_translations`;
CREATE TABLE `bundle_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bundle_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `bundle_translations_bundle_id_foreign` (`bundle_id`),
  KEY `bundle_translations_locale_index` (`locale`),
  CONSTRAINT `bundle_translations_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `bundle_webinars`;
CREATE TABLE `bundle_webinars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `bundle_id` int unsigned NOT NULL,
  `webinar_id` int unsigned NOT NULL,
  `order` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bundle_webinars_bundle_id_foreign` (`bundle_id`),
  KEY `bundle_webinars_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `bundle_webinars_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundle_webinars_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `bundles`;
CREATE TABLE `bundles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `teacher_id` int unsigned NOT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_demo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_demo_source` enum('upload','youtube','vimeo','external_link','secure_host') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  `certificate` tinyint(1) NOT NULL DEFAULT '0',
  `access_days` int unsigned DEFAULT NULL COMMENT 'Number of days to access the bundle',
  `message_for_reviewer` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','pending','is_draft','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  `updated_at` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bundles_creator_id_foreign` (`creator_id`),
  KEY `bundles_teacher_id_foreign` (`teacher_id`),
  KEY `bundles_category_id_foreign` (`category_id`),
  KEY `bundles_slug_index` (`slug`),
  CONSTRAINT `bundles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundles_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundles_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `product_order_id` int unsigned DEFAULT NULL,
  `reserve_meeting_id` int unsigned DEFAULT NULL,
  `subscribe_id` int unsigned DEFAULT NULL,
  `promotion_id` int unsigned DEFAULT NULL,
  `gift_id` int unsigned DEFAULT NULL,
  `ticket_id` int unsigned DEFAULT NULL,
  `special_offer_id` int unsigned DEFAULT NULL,
  `product_discount_id` int unsigned DEFAULT NULL,
  `installment_payment_id` int unsigned DEFAULT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cart_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `cart_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `cart_ticket_id_foreign` (`ticket_id`) USING BTREE,
  KEY `cart_reserve_meeting_id_foreign` (`reserve_meeting_id`) USING BTREE,
  KEY `cart_subscribe_id_foreign` (`subscribe_id`) USING BTREE,
  KEY `cart_promotion_id_foreign` (`promotion_id`) USING BTREE,
  KEY `cart_special_offer_id_foreign` (`special_offer_id`),
  KEY `cart_product_order_id_foreign` (`product_order_id`),
  KEY `cart_product_discount_id_foreign` (`product_discount_id`),
  KEY `cart_bundle_id_foreign` (`bundle_id`),
  KEY `cart_installment_payment_id_foreign` (`installment_payment_id`),
  KEY `cart_gift_id_foreign` (`gift_id`),
  CONSTRAINT `cart_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_gift_id_foreign` FOREIGN KEY (`gift_id`) REFERENCES `gifts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_installment_payment_id_foreign` FOREIGN KEY (`installment_payment_id`) REFERENCES `installment_order_payments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_product_discount_id_foreign` FOREIGN KEY (`product_discount_id`) REFERENCES `product_discounts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cart_product_order_id_foreign` FOREIGN KEY (`product_order_id`) REFERENCES `product_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_reserve_meeting_id_foreign` FOREIGN KEY (`reserve_meeting_id`) REFERENCES `reserve_meetings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_special_offer_id_foreign` FOREIGN KEY (`special_offer_id`) REFERENCES `special_offers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `cart_discount_translations`;
CREATE TABLE `cart_discount_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cart_discount_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `subtitle` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_discount_translations_cart_discount_id_foreign` (`cart_discount_id`),
  KEY `cart_discount_translations_locale_index` (`locale`),
  CONSTRAINT `cart_discount_translations_cart_discount_id_foreign` FOREIGN KEY (`cart_discount_id`) REFERENCES `cart_discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `cart_discounts`;
CREATE TABLE `cart_discounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int unsigned NOT NULL,
  `show_only_on_empty_cart` tinyint(1) NOT NULL DEFAULT '0',
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_discounts_discount_id_foreign` (`discount_id`),
  CONSTRAINT `cart_discounts_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `cashback_rule_specification_items`;
CREATE TABLE `cashback_rule_specification_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cashback_rule_id` int unsigned NOT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `instructor_id` int unsigned DEFAULT NULL,
  `seller_id` int unsigned DEFAULT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `subscribe_id` int unsigned DEFAULT NULL,
  `registration_package_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cashback_rule_specification_items_cashback_rule_id_foreign` (`cashback_rule_id`),
  KEY `cashback_rule_specification_items_category_id_foreign` (`category_id`),
  KEY `cashback_rule_specification_items_instructor_id_foreign` (`instructor_id`),
  KEY `cashback_rule_specification_items_seller_id_foreign` (`seller_id`),
  KEY `cashback_rule_specification_items_webinar_id_foreign` (`webinar_id`),
  KEY `cashback_rule_specification_items_product_id_foreign` (`product_id`),
  KEY `cashback_rule_specification_items_bundle_id_foreign` (`bundle_id`),
  KEY `cashback_rule_specification_items_subscribe_id_foreign` (`subscribe_id`),
  KEY `rules_registration_package_id` (`registration_package_id`),
  CONSTRAINT `cashback_rule_specification_items_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_specification_items_cashback_rule_id_foreign` FOREIGN KEY (`cashback_rule_id`) REFERENCES `cashback_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_specification_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_specification_items_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_specification_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_specification_items_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_specification_items_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_specification_items_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rules_registration_package_id` FOREIGN KEY (`registration_package_id`) REFERENCES `registration_packages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cashback_rule_translations`;
CREATE TABLE `cashback_rule_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cashback_rule_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cashback_rule_translations_cashback_rule_id_foreign` (`cashback_rule_id`),
  KEY `cashback_rule_translations_locale_index` (`locale`),
  CONSTRAINT `cashback_rule_translations_cashback_rule_id_foreign` FOREIGN KEY (`cashback_rule_id`) REFERENCES `cashback_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cashback_rule_users_groups`;
CREATE TABLE `cashback_rule_users_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cashback_rule_id` int unsigned NOT NULL,
  `group_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cashback_rule_users_groups_cashback_rule_id_foreign` (`cashback_rule_id`),
  KEY `cashback_rule_users_groups_group_id_foreign` (`group_id`),
  KEY `cashback_rule_users_groups_user_id_foreign` (`user_id`),
  CONSTRAINT `cashback_rule_users_groups_cashback_rule_id_foreign` FOREIGN KEY (`cashback_rule_id`) REFERENCES `cashback_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_users_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cashback_rule_users_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cashback_rules`;
CREATE TABLE `cashback_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `target_type` enum('all','courses','store_products','bundles','meetings','registration_packages','subscription_packages','recharge_wallet') COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` bigint unsigned DEFAULT NULL,
  `end_date` bigint unsigned DEFAULT NULL,
  `amount` double(15,2) DEFAULT NULL,
  `amount_type` enum('fixed_amount','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apply_cashback_per_item` tinyint(1) NOT NULL DEFAULT '0',
  `max_amount` double(15,2) DEFAULT NULL,
  `min_amount` double(15,2) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `category_translations`;
CREATE TABLE `category_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `category_translations_category_id_foreign` (`category_id`) USING BTREE,
  KEY `category_translations_locale_index` (`locale`) USING BTREE,
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `certificate_template_translations`;
CREATE TABLE `certificate_template_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `certificate_template_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `rtl` tinyint DEFAULT NULL,
  `elements` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `certificate_template_id` (`certificate_template_id`),
  KEY `certificate_template_translations_locale_index` (`locale`),
  CONSTRAINT `certificate_template_id` FOREIGN KEY (`certificate_template_id`) REFERENCES `certificates_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `certificates`;
CREATE TABLE `certificates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int unsigned DEFAULT NULL,
  `quiz_result_id` int unsigned DEFAULT NULL,
  `student_id` int unsigned NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `user_grade` int unsigned DEFAULT NULL,
  `type` enum('quiz','course','bundle') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `certificates_quiz_id_foreign` (`quiz_id`) USING BTREE,
  KEY `certificates_quiz_result_id_foreign` (`quiz_result_id`) USING BTREE,
  KEY `certificates_student_id_foreign` (`student_id`) USING BTREE,
  KEY `certificates_webinar_id_foreign` (`webinar_id`),
  KEY `certificates_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `certificates_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_quiz_result_id_foreign` FOREIGN KEY (`quiz_result_id`) REFERENCES `quizzes_results` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `certificates_templates`;
CREATE TABLE `certificates_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('quiz','course','bundle') COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_x` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `position_y` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `font_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `text_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('draft','publish') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int NOT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `review_id` int unsigned DEFAULT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `upcoming_course_id` int unsigned DEFAULT NULL,
  `blog_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `product_review_id` int unsigned DEFAULT NULL,
  `reply_id` int unsigned DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `report` tinyint(1) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int NOT NULL,
  `viewed_at` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `comments_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `comments_user_id_foreign` (`user_id`) USING BTREE,
  KEY `comments_review_id_foreign` (`review_id`) USING BTREE,
  KEY `comments_reply_id_foreign` (`reply_id`) USING BTREE,
  KEY `comments_product_id_foreign` (`product_id`),
  KEY `comments_bundle_id_foreign` (`bundle_id`),
  KEY `blog_id` (`blog_id`),
  KEY `comments_upcoming_course_id_foreign` (`upcoming_course_id`),
  CONSTRAINT `comments_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_reply_id_foreign` FOREIGN KEY (`reply_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `webinar_reviews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `comments_reports`;
CREATE TABLE `comments_reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `blog_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `comment_id` int unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `comments_reports_comment_id_foreign` (`comment_id`) USING BTREE,
  KEY `comments_reports_product_id_foreign` (`product_id`),
  CONSTRAINT `comments_reports_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_reports_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','replied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `content_delete_requests`;
CREATE TABLE `content_delete_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `targetable_id` int unsigned NOT NULL,
  `targetable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_published_date` bigint unsigned DEFAULT NULL,
  `customers_count` int unsigned DEFAULT NULL,
  `sales` decimal(15,2) DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_delete_requests_user_id_foreign` (`user_id`),
  CONSTRAINT `content_delete_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `course_forum_answers`;
CREATE TABLE `course_forum_answers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT '0',
  `resolved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_forum_answers_user_id_foreign` (`user_id`),
  KEY `course_forum_answers_forum_id_foreign` (`forum_id`),
  CONSTRAINT `course_forum_answers_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `course_forums` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_forum_answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `course_forums`;
CREATE TABLE `course_forums` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attach` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_forums_webinar_id_foreign` (`webinar_id`),
  KEY `course_forums_user_id_foreign` (`user_id`),
  CONSTRAINT `course_forums_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_forums_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `course_learning`;
CREATE TABLE `course_learning` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `text_lesson_id` int unsigned DEFAULT NULL,
  `file_id` int unsigned DEFAULT NULL,
  `session_id` int unsigned DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_learning_user_id_foreign` (`user_id`),
  KEY `course_learning_text_lesson_id_foreign` (`text_lesson_id`),
  KEY `course_learning_file_id_foreign` (`file_id`),
  KEY `course_learning_session_id_foreign` (`session_id`),
  CONSTRAINT `course_learning_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_learning_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_learning_text_lesson_id_foreign` FOREIGN KEY (`text_lesson_id`) REFERENCES `text_lessons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_learning_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `course_learning_last_views`;
CREATE TABLE `course_learning_last_views` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `webinar_id` int unsigned NOT NULL,
  `item_id` int unsigned NOT NULL,
  `item_type` enum('file','session','text_lesson','assignment','quiz') COLLATE utf8mb4_general_ci NOT NULL,
  `visited_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_learning_last_views_user_id_foreign` (`user_id`),
  KEY `course_learning_last_views_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `course_learning_last_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_learning_last_views_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `course_noticeboard_status`;
CREATE TABLE `course_noticeboard_status` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `noticeboard_id` int unsigned NOT NULL,
  `seen_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_noticeboard_status_noticeboard_id_foreign` (`noticeboard_id`),
  CONSTRAINT `course_noticeboard_status_noticeboard_id_foreign` FOREIGN KEY (`noticeboard_id`) REFERENCES `course_noticeboards` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `course_noticeboards`;
CREATE TABLE `course_noticeboards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `webinar_id` int unsigned NOT NULL,
  `color` enum('warning','danger','neutral','info','success') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_noticeboards_creator_id_foreign` (`creator_id`),
  KEY `course_noticeboards_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `course_noticeboards_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_noticeboards_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `course_personal_notes`;
CREATE TABLE `course_personal_notes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `course_id` int unsigned NOT NULL,
  `targetable_id` int unsigned NOT NULL,
  `targetable_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `note` text COLLATE utf8mb4_general_ci,
  `attachment` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_personal_notes_user_id_foreign` (`user_id`),
  KEY `course_personal_notes_course_id_foreign` (`course_id`),
  CONSTRAINT `course_personal_notes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_personal_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_position` enum('left','right','left_with_space','right_with_space') COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_separator` enum('dot','comma') COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_decimal` int unsigned DEFAULT NULL,
  `exchange_rate` double(15,2) DEFAULT NULL,
  `order` int unsigned DEFAULT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `delete_account_requests`;
CREATE TABLE `delete_account_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `delete_account_requests_user_id_foreign` (`user_id`),
  CONSTRAINT `delete_account_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `discount_bundles`;
CREATE TABLE `discount_bundles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int unsigned NOT NULL,
  `bundle_id` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_bundles_discount_id_foreign` (`discount_id`),
  KEY `discount_bundles_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `discount_bundles_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discount_bundles_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `discount_categories`;
CREATE TABLE `discount_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_categories_discount_id_foreign` (`discount_id`),
  KEY `discount_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `discount_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discount_categories_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `discount_courses`;
CREATE TABLE `discount_courses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int unsigned NOT NULL,
  `course_id` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_courses_discount_id_foreign` (`discount_id`),
  KEY `discount_courses_course_id_foreign` (`course_id`),
  CONSTRAINT `discount_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discount_courses_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `discount_groups`;
CREATE TABLE `discount_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_groups_discount_id_foreign` (`discount_id`),
  KEY `discount_groups_group_id_foreign` (`group_id`),
  CONSTRAINT `discount_groups_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discount_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `discount_users`;
CREATE TABLE `discount_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `discount_users_discount_id_foreign` (`discount_id`) USING BTREE,
  KEY `discount_users_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `discount_users_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discount_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `discounts`;
CREATE TABLE `discounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `discount_type` enum('percentage','fixed_amount') COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` enum('all','course','category','meeting','product','bundle') COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent` int unsigned DEFAULT NULL,
  `amount` int unsigned DEFAULT NULL,
  `max_amount` int unsigned DEFAULT NULL,
  `minimum_order` int unsigned DEFAULT NULL,
  `count` int NOT NULL DEFAULT '1',
  `user_type` enum('all_users','special_users') COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type` enum('all','physical','virtual') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `for_first_purchase` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('active','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `expired_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `discounts_code_unique` (`code`),
  KEY `discounts_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `discounts_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `faq_translations`;
CREATE TABLE `faq_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `faq_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faq_translations_faq_id_foreign` (`faq_id`),
  KEY `faq_translations_locale_index` (`locale`),
  CONSTRAINT `faq_translations_faq_id_foreign` FOREIGN KEY (`faq_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `upcoming_course_id` int unsigned DEFAULT NULL,
  `order` int unsigned DEFAULT NULL,
  `created_at` int unsigned DEFAULT NULL,
  `updated_at` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `faqs_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `faqs_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `faqs_bundle_id_foreign` (`bundle_id`),
  KEY `faqs_upcoming_course_id_foreign` (`upcoming_course_id`),
  CONSTRAINT `faqs_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `faqs_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `faqs_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `faqs_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `upcoming_course_id` int unsigned DEFAULT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `favorites_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `favorites_user_id_foreign` (`user_id`) USING BTREE,
  KEY `favorites_bundle_id_foreign` (`bundle_id`),
  KEY `favorites_upcoming_course_id_foreign` (`upcoming_course_id`),
  CONSTRAINT `favorites_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `feature_webinar_translations`;
CREATE TABLE `feature_webinar_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `feature_webinar_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `feature_webinar_translations_feature_webinar_id_foreign` (`feature_webinar_id`),
  KEY `feature_webinar_translations_locale_index` (`locale`),
  CONSTRAINT `feature_webinar_translations_feature_webinar_id_foreign` FOREIGN KEY (`feature_webinar_id`) REFERENCES `feature_webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `feature_webinars`;
CREATE TABLE `feature_webinars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int unsigned NOT NULL,
  `page` enum('categories','home','home_categories') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('publish','pending') COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `feature_webinars_webinar_id_index` (`webinar_id`) USING BTREE,
  CONSTRAINT `feature_webinars_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `file_translations`;
CREATE TABLE `file_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `file_translations_file_id_foreign` (`file_id`),
  KEY `file_translations_locale_index` (`locale`),
  CONSTRAINT `file_translations_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `webinar_id` int unsigned NOT NULL,
  `chapter_id` int unsigned DEFAULT NULL,
  `accessibility` enum('free','paid') COLLATE utf8mb4_unicode_ci NOT NULL,
  `downloadable` tinyint(1) DEFAULT '0',
  `storage` enum('upload','youtube','vimeo','external_link','google_drive','dropbox','iframe','s3','upload_archive','secure_host') COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `volume` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secure_host_upload_type` enum('direct','manual') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interactive_type` enum('adobe_captivate','i_spring','custom') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interactive_file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interactive_file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_previous_parts` tinyint(1) NOT NULL DEFAULT '0',
  `access_after_day` int unsigned DEFAULT NULL,
  `online_viewer` tinyint(1) NOT NULL DEFAULT '0',
  `order` int unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` int NOT NULL,
  `updated_at` int DEFAULT NULL,
  `deleted_at` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `files_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `files_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `files_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `files_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `filter_option_translations`;
CREATE TABLE `filter_option_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filter_option_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filter_option_translations_filter_option_id_foreign` (`filter_option_id`),
  KEY `filter_option_translations_locale_index` (`locale`),
  CONSTRAINT `filter_option_translations_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `filter_options`;
CREATE TABLE `filter_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int unsigned NOT NULL,
  `order` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `filter_options_filter_id_foreign` (`filter_id`) USING BTREE,
  CONSTRAINT `filter_options_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `filter_translations`;
CREATE TABLE `filter_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filter_translations_filter_id_foreign` (`filter_id`),
  KEY `filter_translations_locale_index` (`locale`),
  CONSTRAINT `filter_translations_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `filters`;
CREATE TABLE `filters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `filters_category_id_foreign` (`category_id`) USING BTREE,
  CONSTRAINT `filters_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1848 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `floating_bar_translations`;
CREATE TABLE `floating_bar_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `floating_bar_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `btn_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `floating_bar_translations_floating_bar_id_foreign` (`floating_bar_id`),
  KEY `floating_bar_translations_locale_index` (`locale`),
  CONSTRAINT `floating_bar_translations_floating_bar_id_foreign` FOREIGN KEY (`floating_bar_id`) REFERENCES `floating_bars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `floating_bars`;
CREATE TABLE `floating_bars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `start_at` bigint DEFAULT NULL,
  `end_at` bigint DEFAULT NULL,
  `title_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bar_height` int DEFAULT NULL,
  `position` enum('top','bottom') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fixed` tinyint(1) NOT NULL DEFAULT '0',
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `follows`;
CREATE TABLE `follows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `follower` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `status` enum('requested','accepted','rejected') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `follows_follower_foreign` (`follower`) USING BTREE,
  KEY `follows_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `follows_follower_foreign` FOREIGN KEY (`follower`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `follows_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `form_field_option_translations`;
CREATE TABLE `form_field_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `form_field_option_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_field_option_id_trans` (`form_field_option_id`),
  KEY `form_field_option_translations_locale_index` (`locale`),
  CONSTRAINT `form_field_option_id_trans` FOREIGN KEY (`form_field_option_id`) REFERENCES `form_field_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `form_field_options`;
CREATE TABLE `form_field_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `form_field_id` int unsigned NOT NULL,
  `order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_field_options_form_field_id_foreign` (`form_field_id`),
  CONSTRAINT `form_field_options_form_field_id_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `form_field_translations`;
CREATE TABLE `form_field_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `form_field_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_field_translations_form_field_id_foreign` (`form_field_id`),
  KEY `form_field_translations_locale_index` (`locale`),
  CONSTRAINT `form_field_translations_form_field_id_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `form_fields`;
CREATE TABLE `form_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int unsigned NOT NULL,
  `type` enum('input','number','upload','date_picker','toggle','textarea','dropdown','checkbox','radio') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `form_fields_form_id_foreign` (`form_id`),
  CONSTRAINT `form_fields_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `form_roles_users_groups`;
CREATE TABLE `form_roles_users_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int unsigned NOT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `group_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_roles_users_groups_form_id_foreign` (`form_id`),
  KEY `form_roles_users_groups_role_id_foreign` (`role_id`),
  KEY `form_roles_users_groups_user_id_foreign` (`user_id`),
  KEY `form_roles_users_groups_group_id_foreign` (`group_id`),
  CONSTRAINT `form_roles_users_groups_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `form_roles_users_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `form_roles_users_groups_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `form_roles_users_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `form_submission_items`;
CREATE TABLE `form_submission_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` int unsigned NOT NULL,
  `form_field_id` int unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `form_submission_items_submission_id_foreign` (`submission_id`),
  KEY `form_submission_items_form_field_id_foreign` (`form_field_id`),
  CONSTRAINT `form_submission_items_form_field_id_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `form_submission_items_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `form_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `form_submissions`;
CREATE TABLE `form_submissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `form_id` int unsigned NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_submissions_user_id_foreign` (`user_id`),
  KEY `form_submissions_form_id_foreign` (`form_id`),
  CONSTRAINT `form_submissions_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `form_submissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `form_translations`;
CREATE TABLE `form_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `welcome_message_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `welcome_message_description` text COLLATE utf8mb4_unicode_ci,
  `tank_you_message_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tank_you_message_description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `form_translations_form_id_foreign` (`form_id`),
  KEY `form_translations_locale_index` (`locale`),
  CONSTRAINT `form_translations_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `forms`;
CREATE TABLE `forms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_login` tinyint(1) NOT NULL DEFAULT '0',
  `enable_resubmission` tinyint(1) NOT NULL DEFAULT '0',
  `enable_welcome_message` tinyint(1) NOT NULL DEFAULT '0',
  `enable_tank_you_message` tinyint(1) NOT NULL DEFAULT '0',
  `welcome_message_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tank_you_message_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` bigint unsigned DEFAULT NULL,
  `end_date` bigint unsigned DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `forms_url_unique` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `forum_featured_topics`;
CREATE TABLE `forum_featured_topics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int unsigned NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_featured_topics_topic_id_foreign` (`topic_id`),
  CONSTRAINT `forum_featured_topics_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `forum_recommended_topic_items`;
CREATE TABLE `forum_recommended_topic_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `recommended_topic_id` int unsigned NOT NULL,
  `topic_id` int unsigned NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_recommended_topic_items_recommended_topic_id_foreign` (`recommended_topic_id`),
  KEY `forum_recommended_topic_items_topic_id_foreign` (`topic_id`),
  CONSTRAINT `forum_recommended_topic_items_recommended_topic_id_foreign` FOREIGN KEY (`recommended_topic_id`) REFERENCES `forum_recommended_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_recommended_topic_items_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `forum_recommended_topics`;
CREATE TABLE `forum_recommended_topics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `forum_topic_attachments`;
CREATE TABLE `forum_topic_attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `topic_id` int unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_attachments_topic_id_foreign` (`topic_id`),
  KEY `forum_topic_attachments_creator_id_foreign` (`creator_id`),
  CONSTRAINT `forum_topic_attachments_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_attachments_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `forum_topic_bookmarks`;
CREATE TABLE `forum_topic_bookmarks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `topic_id` int unsigned NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_bookmarks_user_id_foreign` (`user_id`),
  KEY `forum_topic_bookmarks_topic_id_foreign` (`topic_id`),
  CONSTRAINT `forum_topic_bookmarks_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `forum_topic_likes`;
CREATE TABLE `forum_topic_likes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `topic_id` int unsigned DEFAULT NULL,
  `topic_post_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_likes_user_id_foreign` (`user_id`),
  KEY `forum_topic_likes_topic_id_foreign` (`topic_id`),
  KEY `forum_topic_likes_topic_post_id_foreign` (`topic_post_id`),
  CONSTRAINT `forum_topic_likes_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_likes_topic_post_id_foreign` FOREIGN KEY (`topic_post_id`) REFERENCES `forum_topic_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `forum_topic_posts`;
CREATE TABLE `forum_topic_posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `topic_id` int unsigned NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attach` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_posts_user_id_foreign` (`user_id`),
  KEY `forum_topic_posts_topic_id_foreign` (`topic_id`),
  KEY `forum_topic_posts_parent_id_foreign` (`parent_id`),
  CONSTRAINT `forum_topic_posts_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `forum_topic_posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `forum_topic_posts_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `forum_topic_reports`;
CREATE TABLE `forum_topic_reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `topic_id` int unsigned DEFAULT NULL,
  `topic_post_id` int unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_topic_reports_user_id_foreign` (`user_id`),
  KEY `forum_topic_reports_topic_id_foreign` (`topic_id`),
  KEY `forum_topic_reports_topic_post_id_foreign` (`topic_post_id`),
  CONSTRAINT `forum_topic_reports_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `forum_topics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_reports_topic_post_id_foreign` FOREIGN KEY (`topic_post_id`) REFERENCES `forum_topic_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topic_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `forum_topics`;
CREATE TABLE `forum_topics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `forum_id` int unsigned NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT '0',
  `close` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `forum_topics_slug_unique` (`slug`),
  KEY `forum_topics_creator_id_foreign` (`creator_id`),
  KEY `forum_topics_forum_id_foreign` (`forum_id`),
  CONSTRAINT `forum_topics_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forum_topics_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `forum_translations`;
CREATE TABLE `forum_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `forum_translations_forum_id_foreign` (`forum_id`),
  KEY `forum_translations_locale_index` (`locale`),
  CONSTRAINT `forum_translations_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `forums`;
CREATE TABLE `forums` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `group_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('disabled','active') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `close` tinyint(1) NOT NULL DEFAULT '0',
  `order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `forums_slug_unique` (`slug`),
  KEY `forums_role_id_foreign` (`role_id`),
  KEY `forums_group_id_foreign` (`group_id`),
  CONSTRAINT `forums_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forums_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `gifts`;
CREATE TABLE `gifts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` bigint unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `viewed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'for show modal in recipient user panel',
  `status` enum('active','pending','cancel') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gifts_user_id_foreign` (`user_id`),
  KEY `gifts_webinar_id_foreign` (`webinar_id`),
  KEY `gifts_bundle_id_foreign` (`bundle_id`),
  KEY `gifts_product_id_foreign` (`product_id`),
  CONSTRAINT `gifts_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gifts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gifts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gifts_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `group_users`;
CREATE TABLE `group_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `group_users_group_id_foreign` (`group_id`) USING BTREE,
  KEY `group_users_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `group_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `groups_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `groups_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `groups_registration_packages`;
CREATE TABLE `groups_registration_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int unsigned NOT NULL,
  `instructors_count` int DEFAULT NULL,
  `students_count` int DEFAULT NULL,
  `courses_capacity` int DEFAULT NULL,
  `courses_count` int DEFAULT NULL,
  `meeting_count` int DEFAULT NULL,
  `status` enum('disabled','active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_registration_packages_group_id_foreign` (`group_id`),
  CONSTRAINT `groups_registration_packages_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `home_page_statistic_translations`;
CREATE TABLE `home_page_statistic_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `home_page_statistic_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_page_statistic_id` (`home_page_statistic_id`),
  KEY `home_page_statistic_translations_locale_index` (`locale`),
  CONSTRAINT `home_page_statistic_id` FOREIGN KEY (`home_page_statistic_id`) REFERENCES `home_page_statistics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `home_page_statistics`;
CREATE TABLE `home_page_statistics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int unsigned NOT NULL,
  `order` int unsigned DEFAULT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `home_sections`;
CREATE TABLE `home_sections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` enum('featured_classes','latest_bundles','latest_classes','best_rates','trend_categories','full_advertising_banner','best_sellers','discount_classes','free_classes','store_products','testimonials','subscribes','find_instructors','reward_program','become_instructor','forum_section','video_or_image_section','instructors','half_advertising_banner','organizations','blog','upcoming_courses') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_sections_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `installment_order_attachments`;
CREATE TABLE `installment_order_attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `installment_order_id` int unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_order_id_attachment` (`installment_order_id`),
  CONSTRAINT `installment_order_id_attachment` FOREIGN KEY (`installment_order_id`) REFERENCES `installment_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `installment_order_payments`;
CREATE TABLE `installment_order_payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `installment_order_id` int unsigned NOT NULL,
  `sale_id` int unsigned DEFAULT NULL,
  `type` enum('upfront','step') COLLATE utf8mb4_unicode_ci NOT NULL,
  `selected_installment_step_id` int unsigned DEFAULT NULL,
  `amount` double(15,2) NOT NULL,
  `status` enum('paying','paid','canceled','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'paying',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_order_id` (`installment_order_id`),
  KEY `installment_order_payments_sale_id_foreign` (`sale_id`),
  KEY `installment_order_payments_selected_installment_step_id_foreign` (`selected_installment_step_id`),
  CONSTRAINT `installment_order_id` FOREIGN KEY (`installment_order_id`) REFERENCES `installment_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_order_payments_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_order_payments_selected_installment_step_id_foreign` FOREIGN KEY (`selected_installment_step_id`) REFERENCES `selected_installment_steps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `installment_orders`;
CREATE TABLE `installment_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `installment_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `subscribe_id` int unsigned DEFAULT NULL,
  `registration_package_id` int unsigned DEFAULT NULL,
  `product_order_id` int unsigned DEFAULT NULL,
  `item_price` double(15,2) NOT NULL DEFAULT '0.00',
  `status` enum('paying','open','rejected','pending_verification','canceled','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'paying',
  `created_at` bigint unsigned NOT NULL,
  `refund_at` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_orders_installment_id_foreign` (`installment_id`),
  KEY `installment_orders_user_id_foreign` (`user_id`),
  KEY `installment_orders_webinar_id_foreign` (`webinar_id`),
  KEY `installment_orders_product_id_foreign` (`product_id`),
  KEY `installment_orders_bundle_id_foreign` (`bundle_id`),
  KEY `installment_orders_subscribe_id_foreign` (`subscribe_id`),
  KEY `installment_orders_registration_package_id_foreign` (`registration_package_id`),
  KEY `installment_product_order_id` (`product_order_id`),
  CONSTRAINT `installment_orders_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_orders_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_orders_registration_package_id_foreign` FOREIGN KEY (`registration_package_id`) REFERENCES `registration_packages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_orders_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_orders_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_product_order_id` FOREIGN KEY (`product_order_id`) REFERENCES `product_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `installment_reminders`;
CREATE TABLE `installment_reminders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `installment_order_id` int unsigned NOT NULL,
  `installment_step_id` int unsigned NOT NULL,
  `type` enum('before_due','due','after_due') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_reminders_user_id_foreign` (`user_id`),
  CONSTRAINT `installment_reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `installment_specification_items`;
CREATE TABLE `installment_specification_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `installment_id` int unsigned NOT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `instructor_id` int unsigned DEFAULT NULL,
  `seller_id` int unsigned DEFAULT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `subscribe_id` int unsigned DEFAULT NULL,
  `registration_package_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_specification_items_installment_id_foreign` (`installment_id`),
  KEY `installment_specification_items_category_id_foreign` (`category_id`),
  KEY `installment_specification_items_instructor_id_foreign` (`instructor_id`),
  KEY `installment_specification_items_seller_id_foreign` (`seller_id`),
  KEY `installment_specification_items_webinar_id_foreign` (`webinar_id`),
  KEY `installment_specification_items_product_id_foreign` (`product_id`),
  KEY `installment_specification_items_bundle_id_foreign` (`bundle_id`),
  KEY `installment_specification_items_subscribe_id_foreign` (`subscribe_id`),
  KEY `installment_specification_items_registration_package_id_foreign` (`registration_package_id`),
  CONSTRAINT `installment_specification_items_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_registration_package_id_foreign` FOREIGN KEY (`registration_package_id`) REFERENCES `registration_packages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_specification_items_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `installment_step_translations`;
CREATE TABLE `installment_step_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `installment_step_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_step_translations_installment_step_id_foreign` (`installment_step_id`),
  KEY `installment_step_translations_locale_index` (`locale`),
  CONSTRAINT `installment_step_translations_installment_step_id_foreign` FOREIGN KEY (`installment_step_id`) REFERENCES `installment_steps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `installment_steps`;
CREATE TABLE `installment_steps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `installment_id` int unsigned NOT NULL,
  `deadline` int unsigned DEFAULT NULL,
  `amount` double(15,2) DEFAULT NULL,
  `amount_type` enum('fixed_amount','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_steps_installment_id_foreign` (`installment_id`),
  CONSTRAINT `installment_steps_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `installment_translations`;
CREATE TABLE `installment_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `installment_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `verification_description` text COLLATE utf8mb4_unicode_ci,
  `verification_banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_translations_installment_id_foreign` (`installment_id`),
  KEY `installment_translations_locale_index` (`locale`),
  CONSTRAINT `installment_translations_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `installment_user_groups`;
CREATE TABLE `installment_user_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `installment_id` int unsigned NOT NULL,
  `group_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `installment_user_groups_installment_id_foreign` (`installment_id`),
  KEY `installment_user_groups_group_id_foreign` (`group_id`),
  CONSTRAINT `installment_user_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installment_user_groups_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `installments`;
CREATE TABLE `installments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `target_type` enum('all','courses','store_products','bundles','meetings','registration_packages','subscription_packages') COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int unsigned DEFAULT NULL,
  `start_date` bigint unsigned DEFAULT NULL,
  `end_date` bigint unsigned DEFAULT NULL,
  `verification` tinyint(1) NOT NULL DEFAULT '0',
  `request_uploads` tinyint(1) NOT NULL DEFAULT '0',
  `bypass_verification_for_verified_users` tinyint(1) NOT NULL DEFAULT '0',
  `upfront` double(15,2) DEFAULT NULL,
  `upfront_type` enum('fixed_amount','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `ip_restrictions`;
CREATE TABLE `ip_restrictions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('full_ip','ip_range','country') COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'full ip or ip range or country name',
  `reason` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `jazzcash_transactions`;
CREATE TABLE `jazzcash_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `txn_ref_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Order data fields and values',
  `request` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Jazzcash request data fields and values',
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Jazzcash response data fields and values',
  `status` enum('pending','error','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `meeting_times`;
CREATE TABLE `meeting_times` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int unsigned NOT NULL,
  `meeting_type` enum('all','in_person','online') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `day_label` enum('saturday','sunday','monday','tuesday','wednesday','thursday','friday') COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `meeting_times_meeting_id_foreign` (`meeting_id`) USING BTREE,
  CONSTRAINT `meeting_times_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `meetings`;
CREATE TABLE `meetings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `amount` double(15,2) unsigned DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `in_person` tinyint(1) NOT NULL DEFAULT '0',
  `in_person_amount` double(15,2) DEFAULT NULL,
  `group_meeting` tinyint(1) NOT NULL DEFAULT '0',
  `online_group_min_student` int DEFAULT NULL,
  `online_group_max_student` int DEFAULT NULL,
  `online_group_amount` double(15,2) DEFAULT NULL,
  `in_person_group_min_student` int DEFAULT NULL,
  `in_person_group_max_student` int DEFAULT NULL,
  `in_person_group_amount` double(15,2) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT '0',
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `meetings_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `meetings_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=575 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `navbar_button_translations`;
CREATE TABLE `navbar_button_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `navbar_button_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `navbar_button_translations_navbar_button_id_foreign` (`navbar_button_id`),
  KEY `navbar_button_translations_locale_index` (`locale`),
  CONSTRAINT `navbar_button_translations_navbar_button_id_foreign` FOREIGN KEY (`navbar_button_id`) REFERENCES `navbar_buttons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `navbar_buttons`;
CREATE TABLE `navbar_buttons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned DEFAULT NULL,
  `for_guest` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `navbar_buttons_role_id_foreign` (`role_id`),
  CONSTRAINT `navbar_buttons_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE `newsletters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `newsletters_history`;
CREATE TABLE `newsletters_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_method` enum('send_to_all','send_to_bcc','send_to_excel') COLLATE utf8mb4_unicode_ci NOT NULL,
  `bcc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_count` int DEFAULT NULL,
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `noticeboards`;
CREATE TABLE `noticeboards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `organ_id` int unsigned DEFAULT NULL,
  `instructor_id` int unsigned DEFAULT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `type` enum('all','organizations','students','instructors','students_and_instructors') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `noticeboards_organ_id_foreign` (`organ_id`),
  KEY `noticeboards_user_id_foreign` (`user_id`),
  KEY `noticeboards_instructor_id_foreign` (`instructor_id`),
  KEY `noticeboards_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `noticeboards_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `noticeboards_organ_id_foreign` FOREIGN KEY (`organ_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `noticeboards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `noticeboards_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `noticeboards_status`;
CREATE TABLE `noticeboards_status` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `noticeboard_id` int unsigned NOT NULL,
  `seen_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `noticeboards_status_noticeboard_id_foreign` (`noticeboard_id`),
  CONSTRAINT `noticeboards_status_noticeboard_id_foreign` FOREIGN KEY (`noticeboard_id`) REFERENCES `noticeboards` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `notification_templates`;
CREATE TABLE `notification_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `sender_id` int unsigned DEFAULT NULL,
  `group_id` int unsigned DEFAULT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` enum('system','admin') COLLATE utf8mb4_unicode_ci DEFAULT 'system',
  `type` enum('single','all_users','students','instructors','organizations','group','course_students') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `notifications_user_id_foreign` (`user_id`) USING BTREE,
  KEY `notifications_group_id_foreign` (`group_id`) USING BTREE,
  KEY `webinar_id` (`webinar_id`),
  CONSTRAINT `notifications_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `notifications_status`;
CREATE TABLE `notifications_status` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `notification_id` int unsigned NOT NULL,
  `seen_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `notifications_status_notification_id_foreign` (`notification_id`) USING BTREE,
  CONSTRAINT `notifications_status_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `offline_bank_specification_translations`;
CREATE TABLE `offline_bank_specification_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `offline_bank_specification_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offline_bank_specification_id` (`offline_bank_specification_id`),
  KEY `locale` (`locale`) USING BTREE,
  CONSTRAINT `offline_bank_specification_id` FOREIGN KEY (`offline_bank_specification_id`) REFERENCES `offline_bank_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `offline_bank_specifications`;
CREATE TABLE `offline_bank_specifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `offline_bank_id` int unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offline_bank_specifications_offline_bank_id_foreign` (`offline_bank_id`),
  CONSTRAINT `offline_bank_specifications_offline_bank_id_foreign` FOREIGN KEY (`offline_bank_id`) REFERENCES `offline_banks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `offline_bank_translations`;
CREATE TABLE `offline_bank_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `offline_bank_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offline_bank_translations_offline_bank_id_foreign` (`offline_bank_id`),
  KEY `offline_bank_translations_locale_index` (`locale`),
  CONSTRAINT `offline_bank_translations_offline_bank_id_foreign` FOREIGN KEY (`offline_bank_id`) REFERENCES `offline_banks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `offline_banks`;
CREATE TABLE `offline_banks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `offline_payments`;
CREATE TABLE `offline_payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `amount` int NOT NULL,
  `offline_bank_id` int unsigned DEFAULT NULL,
  `reference_number` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('waiting','approved','reject') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_date` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `offline_payments_user_id_foreign` (`user_id`) USING BTREE,
  KEY `offline_payments_offline_bank_id_foreign` (`offline_bank_id`),
  CONSTRAINT `offline_payments_offline_bank_id_foreign` FOREIGN KEY (`offline_bank_id`) REFERENCES `offline_banks` (`id`) ON DELETE SET NULL,
  CONSTRAINT `offline_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `subscribe_id` int unsigned DEFAULT NULL,
  `promotion_id` int unsigned DEFAULT NULL,
  `gift_id` int unsigned DEFAULT NULL,
  `registration_package_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `product_order_id` int unsigned DEFAULT NULL,
  `installment_payment_id` int unsigned DEFAULT NULL,
  `reserve_meeting_id` int unsigned DEFAULT NULL,
  `ticket_id` int unsigned DEFAULT NULL,
  `discount_id` int DEFAULT NULL,
  `become_instructor_id` int unsigned DEFAULT NULL,
  `amount` double(15,2) unsigned DEFAULT NULL,
  `tax` int unsigned DEFAULT NULL,
  `tax_price` double(15,2) unsigned DEFAULT NULL,
  `commission` int unsigned DEFAULT NULL,
  `commission_price` double(15,2) unsigned DEFAULT NULL,
  `discount` double(15,2) unsigned DEFAULT NULL,
  `total_amount` double(15,2) unsigned DEFAULT NULL,
  `product_delivery_fee` double(15,2) unsigned DEFAULT NULL,
  `created_at` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_items_order_id_foreign` (`order_id`) USING BTREE,
  KEY `order_items_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `order_items_ticket_id_foreign` (`ticket_id`) USING BTREE,
  KEY `order_items_reserve_meeting_id_foreign` (`reserve_meeting_id`) USING BTREE,
  KEY `order_items_subscribe_id_foreign` (`subscribe_id`) USING BTREE,
  KEY `order_items_promotion_id_foreign` (`promotion_id`) USING BTREE,
  KEY `order_items_gift_id_foreign` (`gift_id`),
  CONSTRAINT `order_items_gift_id_foreign` FOREIGN KEY (`gift_id`) REFERENCES `gifts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=711 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `status` enum('pending','paying','paid','fail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('credit','payment_channel') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_charge_account` tinyint(1) NOT NULL DEFAULT '0',
  `amount` double(15,2) unsigned NOT NULL,
  `tax` decimal(13,2) unsigned DEFAULT NULL,
  `total_discount` decimal(13,2) unsigned DEFAULT NULL,
  `total_amount` decimal(13,2) unsigned DEFAULT NULL,
  `product_delivery_fee` decimal(13,2) unsigned DEFAULT NULL,
  `reference_id` text COLLATE utf8mb4_unicode_ci,
  `payment_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `orders_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=713 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `page_translations`;
CREATE TABLE `page_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_translations_page_id_foreign` (`page_id`),
  KEY `page_translations_locale_index` (`locale`),
  CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `robot` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('publish','draft') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_link_unique` (`link`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `payku_payments`;
CREATE TABLE `payku_payments` (
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `media` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_4_digits` int unsigned DEFAULT NULL,
  `installments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_parameters` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_date` datetime DEFAULT NULL,
  UNIQUE KEY `payku_payments_transaction_id_unique` (`transaction_id`),
  CONSTRAINT `payku_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `payku_transactions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `payku_transactions`;
CREATE TABLE `payku_transactions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `amount` int unsigned DEFAULT NULL,
  `notified_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `payku_transactions_id_unique` (`id`),
  UNIQUE KEY `payku_transactions_order_unique` (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `payment_channels`;
CREATE TABLE `payment_channels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credentials` text COLLATE utf8mb4_unicode_ci,
  `currencies` text COLLATE utf8mb4_unicode_ci,
  `created_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `payouts`;
CREATE TABLE `payouts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `user_selected_bank_id` int unsigned NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `status` enum('waiting','done','reject') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `payouts_user_id_foreign` (`user_id`) USING BTREE,
  KEY `payout_user_selected_bank_id` (`user_selected_bank_id`) USING BTREE,
  CONSTRAINT `payout_user_selected_bank_id` FOREIGN KEY (`user_selected_bank_id`) REFERENCES `user_selected_banks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `payu_transactions`;
CREATE TABLE `payu_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `paid_for_id` bigint unsigned DEFAULT NULL,
  `paid_for_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','failed','successful','invalid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `verified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `payu_transactions_transaction_id_unique` (`transaction_id`) USING BTREE,
  KEY `payu_transactions_status_index` (`status`) USING BTREE,
  KEY `payu_transactions_verified_at_index` (`verified_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned DEFAULT NULL,
  `section_id` int unsigned DEFAULT NULL,
  `allow` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `permissions_role_id_index` (`role_id`) USING BTREE,
  KEY `permissions_section_id_index` (`section_id`) USING BTREE,
  CONSTRAINT `permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permissions_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `prerequisites`;
CREATE TABLE `prerequisites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int unsigned NOT NULL,
  `prerequisite_id` int unsigned NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `order` int unsigned DEFAULT NULL,
  `created_at` int NOT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `prerequisites_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `prerequisite_id` (`prerequisite_id`),
  CONSTRAINT `prerequisite_id` FOREIGN KEY (`prerequisite_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `prerequisites_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `product_badge_contents`;
CREATE TABLE `product_badge_contents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_badge_id` int unsigned NOT NULL,
  `targetable_id` int unsigned NOT NULL,
  `targetable_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_badge_contents_product_badge_id_foreign` (`product_badge_id`),
  CONSTRAINT `product_badge_contents_product_badge_id_foreign` FOREIGN KEY (`product_badge_id`) REFERENCES `product_badges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `product_badge_translations`;
CREATE TABLE `product_badge_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_badge_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_badge_translations_product_badge_id_foreign` (`product_badge_id`),
  KEY `product_badge_translations_locale_index` (`locale`),
  CONSTRAINT `product_badge_translations_product_badge_id_foreign` FOREIGN KEY (`product_badge_id`) REFERENCES `product_badges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `product_badges`;
CREATE TABLE `product_badges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `background` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `start_at` bigint unsigned DEFAULT NULL,
  `end_at` bigint unsigned DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_category_translations`;
CREATE TABLE `product_category_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_category_id` (`product_category_id`),
  KEY `product_category_translations_locale_index` (`locale`),
  CONSTRAINT `product_category_id` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_discounts`;
CREATE TABLE `product_discounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percent` int unsigned NOT NULL,
  `count` int unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` int unsigned NOT NULL,
  `end_date` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_discounts_creator_id_foreign` (`creator_id`),
  KEY `product_discounts_product_id_foreign` (`product_id`),
  CONSTRAINT `product_discounts_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_discounts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_faq_translations`;
CREATE TABLE `product_faq_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_faq_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_faq_id` (`product_faq_id`),
  KEY `product_faq_translations_locale_index` (`locale`),
  CONSTRAINT `product_faq_id` FOREIGN KEY (`product_faq_id`) REFERENCES `product_faqs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_faqs`;
CREATE TABLE `product_faqs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `order` int unsigned DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_faqs_product_id_foreign` (`product_id`),
  KEY `product_faqs_creator_id_foreign` (`creator_id`),
  CONSTRAINT `product_faqs_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_faqs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_file_translations`;
CREATE TABLE `product_file_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_file_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_file_id` (`product_file_id`),
  KEY `product_file_translations_locale_index` (`locale`),
  CONSTRAINT `product_file_id` FOREIGN KEY (`product_file_id`) REFERENCES `product_files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_files`;
CREATE TABLE `product_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_viewer` tinyint(1) NOT NULL DEFAULT '0',
  `order` int unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_product_id` (`product_id`),
  KEY `file_creator_id` (`creator_id`),
  CONSTRAINT `file_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `file_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_filter_option_translations`;
CREATE TABLE `product_filter_option_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_filter_option_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_filter_option_id` (`product_filter_option_id`),
  KEY `product_filter_option_translations_locale_index` (`locale`),
  CONSTRAINT `product_filter_option_id` FOREIGN KEY (`product_filter_option_id`) REFERENCES `product_filter_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_filter_options`;
CREATE TABLE `product_filter_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int unsigned NOT NULL,
  `order` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_filter_options_filter_id_foreign` (`filter_id`),
  CONSTRAINT `product_filter_options_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `product_filters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_filter_translations`;
CREATE TABLE `product_filter_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_filter_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_filter_id` (`product_filter_id`),
  KEY `product_filter_translations_locale_index` (`locale`),
  CONSTRAINT `product_filter_id` FOREIGN KEY (`product_filter_id`) REFERENCES `product_filters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_filters`;
CREATE TABLE `product_filters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_filters_category_id_foreign` (`category_id`),
  CONSTRAINT `product_filters_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_media`;
CREATE TABLE `product_media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `type` enum('thumbnail','image','video') COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int unsigned DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_product_id` (`product_id`),
  KEY `media_creator_id` (`creator_id`),
  CONSTRAINT `media_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `media_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_orders`;
CREATE TABLE `product_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `seller_id` int unsigned NOT NULL,
  `buyer_id` int unsigned DEFAULT NULL,
  `sale_id` int unsigned DEFAULT NULL,
  `installment_order_id` int unsigned DEFAULT NULL,
  `gift_id` int unsigned DEFAULT NULL,
  `specifications` text COLLATE utf8mb4_unicode_ci,
  `quantity` int unsigned NOT NULL,
  `discount_id` int unsigned DEFAULT NULL,
  `message_to_seller` text COLLATE utf8mb4_unicode_ci,
  `tracking_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','waiting_delivery','shipped','success','canceled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_orders_installment_order_id_foreign` (`installment_order_id`),
  KEY `product_orders_gift_id_foreign` (`gift_id`),
  CONSTRAINT `product_orders_gift_id_foreign` FOREIGN KEY (`gift_id`) REFERENCES `gifts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_orders_installment_order_id_foreign` FOREIGN KEY (`installment_order_id`) REFERENCES `installment_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE `product_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `creator_id` int unsigned NOT NULL,
  `product_quality` int unsigned NOT NULL,
  `purchase_worth` int unsigned NOT NULL,
  `delivery_quality` int unsigned NOT NULL,
  `seller_quality` int unsigned NOT NULL,
  `rates` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` int unsigned NOT NULL,
  `status` enum('pending','active') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_creator_id_foreign` (`creator_id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_selected_filter_options`;
CREATE TABLE `product_selected_filter_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `filter_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_selected_filter_options_product_id_foreign` (`product_id`),
  KEY `product_selected_filter_options_filter_option_id_foreign` (`filter_option_id`),
  CONSTRAINT `product_selected_filter_options_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `product_filter_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_selected_filter_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_selected_specification_multi_values`;
CREATE TABLE `product_selected_specification_multi_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `selected_specification_id` int unsigned NOT NULL,
  `specification_multi_value_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selected_specification_id` (`selected_specification_id`),
  KEY `specification_multi_value_id` (`specification_multi_value_id`),
  CONSTRAINT `selected_specification_id` FOREIGN KEY (`selected_specification_id`) REFERENCES `product_selected_specifications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `specification_multi_value_id` FOREIGN KEY (`specification_multi_value_id`) REFERENCES `product_specification_multi_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_selected_specification_translations`;
CREATE TABLE `product_selected_specification_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_selected_specification_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_selected_specification_id_translations` (`product_selected_specification_id`),
  KEY `product_selected_specification_translations_locale_index` (`locale`),
  CONSTRAINT `product_selected_specification_id_translations` FOREIGN KEY (`product_selected_specification_id`) REFERENCES `product_selected_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_selected_specifications`;
CREATE TABLE `product_selected_specifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `product_specification_id` int unsigned NOT NULL,
  `type` enum('textarea','multi_value') COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_selection` tinyint(1) NOT NULL DEFAULT '0',
  `order` int unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_selected_specifications_creator_id_foreign` (`creator_id`),
  KEY `product_selected_specifications_product_id_foreign` (`product_id`),
  KEY `product_selected_specifications_product_specification_id_foreign` (`product_specification_id`),
  CONSTRAINT `product_selected_specifications_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_selected_specifications_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_selected_specifications_product_specification_id_foreign` FOREIGN KEY (`product_specification_id`) REFERENCES `product_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_specification_categories`;
CREATE TABLE `product_specification_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `specification_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_specification_categories_specification_id_foreign` (`specification_id`),
  KEY `product_specification_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_specification_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_specification_categories_specification_id_foreign` FOREIGN KEY (`specification_id`) REFERENCES `product_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_specification_multi_value_translations`;
CREATE TABLE `product_specification_multi_value_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_specification_multi_value_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_specification_multi_value_id` (`product_specification_multi_value_id`),
  KEY `product_specification_multi_value_translations_locale_index` (`locale`),
  CONSTRAINT `product_specification_multi_value_id` FOREIGN KEY (`product_specification_multi_value_id`) REFERENCES `product_specification_multi_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_specification_multi_values`;
CREATE TABLE `product_specification_multi_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `specification_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_specification_multi_values_specification_id_foreign` (`specification_id`),
  CONSTRAINT `product_specification_multi_values_specification_id_foreign` FOREIGN KEY (`specification_id`) REFERENCES `product_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_specification_translations`;
CREATE TABLE `product_specification_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_specification_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_specification_id` (`product_specification_id`),
  KEY `product_specification_translations_locale_index` (`locale`),
  CONSTRAINT `product_specification_id` FOREIGN KEY (`product_specification_id`) REFERENCES `product_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_specifications`;
CREATE TABLE `product_specifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `input_type` enum('textarea','multi_value') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `product_translations`;
CREATE TABLE `product_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `product_translations_locale_index` (`locale`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `type` enum('virtual','physical') COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `price` double(15,2) unsigned DEFAULT NULL,
  `point` bigint unsigned DEFAULT NULL,
  `unlimited_inventory` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` tinyint(1) NOT NULL DEFAULT '0',
  `inventory` int unsigned DEFAULT NULL,
  `inventory_warning` int unsigned DEFAULT NULL,
  `inventory_updated_at` bigint unsigned DEFAULT NULL,
  `delivery_fee` double(15,2) unsigned DEFAULT NULL,
  `delivery_estimated_time` int unsigned DEFAULT NULL,
  `message_for_reviewer` text COLLATE utf8mb4_unicode_ci,
  `tax` int unsigned DEFAULT NULL,
  `commission_type` enum('percent','fixed_amount') COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission` int unsigned DEFAULT NULL,
  `status` enum('active','pending','draft','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` bigint unsigned NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_creator_id_foreign` (`creator_id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_type_index` (`type`),
  KEY `products_slug_index` (`slug`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `promotion_translations`;
CREATE TABLE `promotion_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `promotion_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promotion_translations_promotion_id_foreign` (`promotion_id`),
  KEY `promotion_translations_locale_index` (`locale`),
  CONSTRAINT `promotion_translations_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `promotions`;
CREATE TABLE `promotions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `days` int unsigned NOT NULL,
  `price` double(15,2) unsigned NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `purchase_notification_histories`;
CREATE TABLE `purchase_notification_histories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `purchase_notification_id` int unsigned NOT NULL,
  `display_type` enum('overall','per_session') COLLATE utf8mb4_general_ci NOT NULL,
  `count_view` int unsigned NOT NULL DEFAULT '0',
  `session_ended` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Get True After the user login, we update all the per_session records',
  PRIMARY KEY (`id`),
  KEY `purchase_notification_id_history` (`purchase_notification_id`),
  KEY `purchase_notification_histories_user_id_foreign` (`user_id`),
  CONSTRAINT `purchase_notification_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_notification_id_history` FOREIGN KEY (`purchase_notification_id`) REFERENCES `purchase_notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `purchase_notification_roles_groups_contents`;
CREATE TABLE `purchase_notification_roles_groups_contents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `purchase_notification_id` int unsigned NOT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `group_id` int unsigned DEFAULT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_notification_id_role_group` (`purchase_notification_id`),
  KEY `purchase_notification_roles_groups_contents_role_id_foreign` (`role_id`),
  KEY `purchase_notification_roles_groups_contents_group_id_foreign` (`group_id`),
  KEY `purchase_notification_roles_groups_contents_webinar_id_foreign` (`webinar_id`),
  KEY `purchase_notification_roles_groups_contents_bundle_id_foreign` (`bundle_id`),
  KEY `purchase_notification_roles_groups_contents_product_id_foreign` (`product_id`),
  CONSTRAINT `purchase_notification_id_role_group` FOREIGN KEY (`purchase_notification_id`) REFERENCES `purchase_notifications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_notification_roles_groups_contents_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_notification_roles_groups_contents_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_notification_roles_groups_contents_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_notification_roles_groups_contents_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_notification_roles_groups_contents_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `purchase_notification_translations`;
CREATE TABLE `purchase_notification_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `purchase_notification_id` int unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `popup_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `popup_subtitle` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `users` text COLLATE utf8mb4_general_ci NOT NULL,
  `times` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_notification_id_trans` (`purchase_notification_id`),
  KEY `purchase_notification_translations_locale_index` (`locale`),
  CONSTRAINT `purchase_notification_id_trans` FOREIGN KEY (`purchase_notification_id`) REFERENCES `purchase_notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `purchase_notifications`;
CREATE TABLE `purchase_notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `start_at` bigint DEFAULT NULL,
  `end_at` bigint DEFAULT NULL,
  `popup_duration` int unsigned DEFAULT NULL,
  `popup_delay` int unsigned DEFAULT NULL,
  `maximum_purchase_amount` int unsigned DEFAULT NULL,
  `maximum_community_age` int unsigned DEFAULT NULL,
  `display_type` enum('overall','per_session') COLLATE utf8mb4_general_ci NOT NULL,
  `display_time` int unsigned DEFAULT NULL,
  `display_for_logged_out_users` tinyint(1) NOT NULL DEFAULT '0',
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE `purchases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `purchases_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `purchases_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchases_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `quiz_question_translations`;
CREATE TABLE `quiz_question_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quizzes_question_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `quiz_question_translations_quiz_question_id_foreign` (`quizzes_question_id`),
  KEY `quiz_question_translations_locale_index` (`locale`),
  CONSTRAINT `quiz_question_translations_quiz_question_id_foreign` FOREIGN KEY (`quizzes_question_id`) REFERENCES `quizzes_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `quiz_translations`;
CREATE TABLE `quiz_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_translations_quiz_id_foreign` (`quiz_id`),
  KEY `quiz_translations_locale_index` (`locale`),
  CONSTRAINT `quiz_translations_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `quizzes`;
CREATE TABLE `quizzes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int unsigned DEFAULT NULL,
  `creator_id` int unsigned NOT NULL,
  `chapter_id` int unsigned DEFAULT NULL,
  `time` int DEFAULT '0',
  `attempt` int DEFAULT NULL,
  `pass_mark` int NOT NULL,
  `certificate` tinyint(1) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_mark` int unsigned DEFAULT NULL,
  `display_limited_questions` tinyint(1) NOT NULL DEFAULT '0',
  `display_number_of_questions` int unsigned DEFAULT NULL,
  `display_questions_randomly` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_days` int unsigned DEFAULT NULL,
  `created_at` int NOT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quizzes_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `quizzes_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `quizzes_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `quizzes_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `quizzes_questions`;
CREATE TABLE `quizzes_questions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int unsigned NOT NULL,
  `creator_id` int unsigned NOT NULL,
  `grade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('multiple','descriptive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `video` text COLLATE utf8mb4_unicode_ci,
  `order` int unsigned DEFAULT NULL,
  `created_at` int NOT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quizzes_questions_quiz_id_foreign` (`quiz_id`) USING BTREE,
  KEY `quizzes_questions_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `quizzes_questions_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `quizzes_questions_answer_translations`;
CREATE TABLE `quizzes_questions_answer_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quizzes_questions_answer_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `quizzes_questions_answer_id` (`quizzes_questions_answer_id`),
  KEY `quizzes_questions_answer_translations_locale_index` (`locale`),
  CONSTRAINT `quizzes_questions_answer_id` FOREIGN KEY (`quizzes_questions_answer_id`) REFERENCES `quizzes_questions_answers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `quizzes_questions_answers`;
CREATE TABLE `quizzes_questions_answers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `question_id` int unsigned NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int NOT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quizzes_questions_answers_question_id_foreign` (`question_id`) USING BTREE,
  KEY `quizzes_questions_answers_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `quizzes_questions_answers_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_questions_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `quizzes_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `quizzes_results`;
CREATE TABLE `quizzes_results` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `results` text COLLATE utf8mb4_unicode_ci,
  `user_grade` int DEFAULT NULL,
  `status` enum('passed','failed','waiting') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `quizzes_results_quiz_id_foreign` (`quiz_id`) USING BTREE,
  KEY `quizzes_results_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `quizzes_results_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `creator_id` int unsigned NOT NULL,
  `rate` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `rating_user_id_foreign` (`user_id`) USING BTREE,
  KEY `rating_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `rating_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `rating_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rating_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rating_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned DEFAULT NULL,
  `province_id` int unsigned DEFAULT NULL,
  `city_id` int unsigned DEFAULT NULL,
  `geo_center` point DEFAULT NULL,
  `type` enum('country','province','city','district') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `regions_country_id_foreign` (`country_id`),
  KEY `regions_province_id_foreign` (`province_id`),
  KEY `regions_city_id_foreign` (`city_id`),
  CONSTRAINT `regions_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `regions_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `regions_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `registration_packages`;
CREATE TABLE `registration_packages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `days` int unsigned NOT NULL,
  `price` double(15,2) unsigned NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('instructors','organizations') COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructors_count` int DEFAULT NULL,
  `students_count` int DEFAULT NULL,
  `courses_capacity` int DEFAULT NULL,
  `courses_count` int DEFAULT NULL,
  `meeting_count` int DEFAULT NULL,
  `product_count` int unsigned DEFAULT NULL,
  `ai_content_access` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('disabled','active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `registration_packages_role_index` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `registration_packages_translations`;
CREATE TABLE `registration_packages_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `registration_package_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `registration_package` (`registration_package_id`),
  KEY `registration_packages_translations_locale_index` (`locale`),
  CONSTRAINT `registration_package` FOREIGN KEY (`registration_package_id`) REFERENCES `registration_packages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `related_courses`;
CREATE TABLE `related_courses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned DEFAULT NULL,
  `targetable_id` int unsigned NOT NULL,
  `targetable_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `course_id` int unsigned NOT NULL,
  `order` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `related_courses_creator_id_foreign` (`creator_id`),
  KEY `related_courses_course_id_foreign` (`course_id`),
  CONSTRAINT `related_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `related_courses_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `reserve_meetings`;
CREATE TABLE `reserve_meetings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int DEFAULT NULL,
  `sale_id` int unsigned DEFAULT NULL,
  `meeting_time_id` int unsigned NOT NULL,
  `day` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int unsigned NOT NULL,
  `start_at` bigint unsigned NOT NULL,
  `end_at` bigint unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `paid_amount` decimal(13,2) NOT NULL,
  `meeting_type` enum('in_person','online') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'online',
  `student_count` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','open','finished','canceled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int NOT NULL,
  `locked_at` int DEFAULT NULL,
  `reserved_at` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `reserve_meetings_meeting_time_id_foreign` (`meeting_time_id`) USING BTREE,
  KEY `reserve_meetings_user_id_foreign` (`user_id`) USING BTREE,
  KEY `reserve_meetings_sale_id_foreign` (`sale_id`),
  CONSTRAINT `reserve_meetings_meeting_time_id_foreign` FOREIGN KEY (`meeting_time_id`) REFERENCES `meeting_times` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reserve_meetings_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reserve_meetings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `rewards`;
CREATE TABLE `rewards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('account_charge','create_classes','buy','pass_the_quiz','certificate','comment','register','review_courses','instructor_meeting_reserve','student_meeting_reserve','newsletters','badge','referral','learning_progress_100','charge_wallet','buy_store_product','pass_assignment','send_post_in_topic','make_topic','create_blog_by_instructor','comment_for_instructor_blog') COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int unsigned DEFAULT NULL,
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','disabled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `rewards_accounting`;
CREATE TABLE `rewards_accounting` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `item_id` int unsigned DEFAULT NULL,
  `type` enum('account_charge','create_classes','buy','pass_the_quiz','certificate','comment','register','review_courses','instructor_meeting_reserve','student_meeting_reserve','newsletters','badge','referral','learning_progress_100','charge_wallet','withdraw','buy_store_product','pass_assignment','send_post_in_topic','make_topic','create_blog_by_instructor','comment_for_instructor_blog') COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int unsigned NOT NULL,
  `status` enum('addiction','deduction') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rewards_accounting_user_id_foreign` (`user_id`),
  CONSTRAINT `rewards_accounting_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_count` int unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` int unsigned DEFAULT NULL,
  `buyer_id` int unsigned NOT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `meeting_id` int unsigned DEFAULT NULL,
  `meeting_time_id` int unsigned DEFAULT NULL,
  `subscribe_id` int unsigned DEFAULT NULL,
  `ticket_id` int unsigned DEFAULT NULL,
  `promotion_id` int unsigned DEFAULT NULL,
  `product_order_id` int unsigned DEFAULT NULL,
  `registration_package_id` int unsigned DEFAULT NULL,
  `installment_payment_id` int unsigned DEFAULT NULL,
  `gift_id` int unsigned DEFAULT NULL,
  `payment_method` enum('credit','payment_channel','subscribe') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('webinar','meeting','subscribe','promotion','registration_package','product','bundle','installment_payment','gift') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(13,2) unsigned NOT NULL,
  `tax` decimal(13,2) unsigned DEFAULT NULL,
  `commission` decimal(13,2) unsigned DEFAULT NULL,
  `discount` decimal(13,2) unsigned DEFAULT NULL,
  `total_amount` decimal(13,2) unsigned DEFAULT NULL,
  `product_delivery_fee` decimal(13,2) unsigned DEFAULT NULL,
  `manual_added` tinyint(1) NOT NULL DEFAULT '0',
  `access_to_purchased_item` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` int unsigned NOT NULL,
  `refund_at` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sales_order_id_foreign` (`order_id`) USING BTREE,
  KEY `sales_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `sales_meeting_id_foreign` (`meeting_id`) USING BTREE,
  KEY `sales_ticket_id_foreign` (`ticket_id`) USING BTREE,
  KEY `sales_buyer_id_foreign` (`buyer_id`) USING BTREE,
  KEY `sales_seller_id_foreign` (`seller_id`) USING BTREE,
  KEY `sales_promotion_id_foreign` (`promotion_id`) USING BTREE,
  KEY `sales_installment_payment_id_foreign` (`installment_payment_id`),
  CONSTRAINT `sales_installment_payment_id_foreign` FOREIGN KEY (`installment_payment_id`) REFERENCES `installment_order_payments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `sales_log`;
CREATE TABLE `sales_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int unsigned NOT NULL,
  `viewed_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_status_sale_id_foreign` (`sale_id`),
  CONSTRAINT `sales_status_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_group_id` int unsigned DEFAULT NULL,
  `caption` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('admin','panel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100304 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `selected_installment_steps`;
CREATE TABLE `selected_installment_steps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `selected_installment_id` int unsigned NOT NULL,
  `installment_step_id` int unsigned NOT NULL,
  `deadline` int unsigned DEFAULT NULL,
  `amount` double(15,2) DEFAULT NULL,
  `amount_type` enum('fixed_amount','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `selected_installment_steps_selected_installment_id_foreign` (`selected_installment_id`),
  KEY `selected_installment_steps_installment_step_id_foreign` (`installment_step_id`),
  CONSTRAINT `selected_installment_steps_installment_step_id_foreign` FOREIGN KEY (`installment_step_id`) REFERENCES `installment_steps` (`id`) ON DELETE CASCADE,
  CONSTRAINT `selected_installment_steps_selected_installment_id_foreign` FOREIGN KEY (`selected_installment_id`) REFERENCES `selected_installments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `selected_installments`;
CREATE TABLE `selected_installments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `installment_id` int unsigned NOT NULL,
  `installment_order_id` int unsigned NOT NULL,
  `start_date` bigint unsigned DEFAULT NULL,
  `end_date` bigint unsigned DEFAULT NULL,
  `upfront` double(15,2) DEFAULT NULL,
  `upfront_type` enum('fixed_amount','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selected_installments_user_id_foreign` (`user_id`),
  KEY `selected_installments_installment_id_foreign` (`installment_id`),
  KEY `selected_installments_installment_order_id_foreign` (`installment_order_id`),
  CONSTRAINT `selected_installments_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `installments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `selected_installments_installment_order_id_foreign` FOREIGN KEY (`installment_order_id`) REFERENCES `installment_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `selected_installments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `session_reminds`;
CREATE TABLE `session_reminds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session_reminds_session_id_foreign` (`session_id`),
  KEY `session_reminds_user_id_foreign` (`user_id`),
  CONSTRAINT `session_reminds_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `session_reminds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `session_translations`;
CREATE TABLE `session_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `session_translations_session_id_foreign` (`session_id`),
  KEY `session_translations_locale_index` (`locale`),
  CONSTRAINT `session_translations_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `chapter_id` int unsigned DEFAULT NULL,
  `reserve_meeting_id` int unsigned DEFAULT NULL,
  `date` int NOT NULL,
  `duration` int NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_time_to_join` int unsigned DEFAULT NULL COMMENT 'Specifies that the user can see the join button up to a few minutes after the start time of the webinar.',
  `zoom_start_link` text COLLATE utf8mb4_unicode_ci,
  `zoom_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_api` enum('local','big_blue_button','zoom','agora','jitsi','google_meet') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `api_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moderator_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agora_settings` text COLLATE utf8mb4_unicode_ci,
  `check_previous_parts` tinyint(1) NOT NULL DEFAULT '0',
  `access_after_day` int unsigned DEFAULT NULL,
  `order` int unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` int NOT NULL,
  `updated_at` int DEFAULT NULL,
  `deleted_at` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sessions_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `sessions_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `sessions_chapter_id_foreign` (`chapter_id`),
  KEY `sessions_reserve_meeting_id_foreign` (`reserve_meeting_id`),
  CONSTRAINT `sessions_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sessions_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sessions_reserve_meeting_id_foreign` FOREIGN KEY (`reserve_meeting_id`) REFERENCES `reserve_meetings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sessions_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `setting_translations`;
CREATE TABLE `setting_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `setting_translations_setting_id_foreign` (`setting_id`),
  KEY `setting_translations_locale_index` (`locale`),
  CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page` enum('general','financial','personalization','notifications','seo','customization','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `special_offers`;
CREATE TABLE `special_offers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `subscribe_id` int unsigned DEFAULT NULL,
  `registration_package_id` int unsigned DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percent` int unsigned NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  `from_date` int unsigned NOT NULL,
  `to_date` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `special_offers_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `special_offers_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `special_offers_bundle_id_foreign` (`bundle_id`),
  KEY `special_offers_subscribe_id_foreign` (`subscribe_id`),
  KEY `special_offers_registration_package_id_foreign` (`registration_package_id`),
  CONSTRAINT `special_offers_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `special_offers_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `special_offers_registration_package_id_foreign` FOREIGN KEY (`registration_package_id`) REFERENCES `registration_packages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `special_offers_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `special_offers_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `subscribe_reminds`;
CREATE TABLE `subscribe_reminds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `subscribe_id` int unsigned NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribe_reminds_subscribe_id_foreign` (`subscribe_id`),
  KEY `subscribe_reminds_user_id_foreign` (`user_id`),
  CONSTRAINT `subscribe_reminds_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_reminds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `subscribe_translations`;
CREATE TABLE `subscribe_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscribe_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribe_translations_subscribe_id_foreign` (`subscribe_id`),
  KEY `subscribe_translations_locale_index` (`locale`),
  CONSTRAINT `subscribe_translations_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `subscribe_uses`;
CREATE TABLE `subscribe_uses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `subscribe_id` int unsigned NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `sale_id` int unsigned NOT NULL,
  `installment_order_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `subscribe_uses_user_id_foreign` (`user_id`) USING BTREE,
  KEY `subscribe_uses_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `subscribe_uses_subscribe_id_foreign` (`subscribe_id`) USING BTREE,
  KEY `subscribe_uses_sale_id_foreign` (`sale_id`) USING BTREE,
  KEY `subscribe_uses_bundle_id_foreign` (`bundle_id`),
  KEY `subscribe_uses_installment_order_id_foreign` (`installment_order_id`),
  CONSTRAINT `subscribe_uses_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_uses_installment_order_id_foreign` FOREIGN KEY (`installment_order_id`) REFERENCES `installment_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_uses_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_uses_subscribe_id_foreign` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_uses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribe_uses_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `subscribes`;
CREATE TABLE `subscribes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usable_count` int unsigned NOT NULL,
  `days` int unsigned NOT NULL,
  `price` double(15,2) unsigned NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT '0',
  `infinite_use` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `support_conversations`;
CREATE TABLE `support_conversations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `support_id` int unsigned NOT NULL,
  `supporter_id` int unsigned DEFAULT NULL,
  `sender_id` int unsigned DEFAULT NULL,
  `attach` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `support_conversations_support_id_foreign` (`support_id`) USING BTREE,
  KEY `support_conversations_sender_id_foreign` (`sender_id`) USING BTREE,
  KEY `support_conversations_supporter_id_foreign` (`supporter_id`) USING BTREE,
  CONSTRAINT `support_conversations_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `support_conversations_support_id_foreign` FOREIGN KEY (`support_id`) REFERENCES `supports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `support_department_translations`;
CREATE TABLE `support_department_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `support_department_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `support_department_id` (`support_department_id`),
  KEY `support_department_translations_locale_index` (`locale`),
  CONSTRAINT `support_department_id` FOREIGN KEY (`support_department_id`) REFERENCES `support_departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `support_departments`;
CREATE TABLE `support_departments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `supports`;
CREATE TABLE `supports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `department_id` int unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('open','close','replied','supporter_replied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` int unsigned DEFAULT NULL,
  `updated_at` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `supports_user_id_foreign` (`user_id`) USING BTREE,
  KEY `supports_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `supports_department_id_foreign` (`department_id`) USING BTREE,
  CONSTRAINT `supports_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `support_departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `supports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `supports_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `upcoming_course_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tags_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `tags_bundle_id_foreign` (`bundle_id`),
  KEY `tags_upcoming_course_id_foreign` (`upcoming_course_id`),
  CONSTRAINT `tags_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6700 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `testimonial_translations`;
CREATE TABLE `testimonial_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `testimonial_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_bio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testimonial_translations_testimonial_id_foreign` (`testimonial_id`),
  KEY `testimonial_translations_locale_index` (`locale`),
  CONSTRAINT `testimonial_translations_testimonial_id_foreign` FOREIGN KEY (`testimonial_id`) REFERENCES `testimonials` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE `testimonials` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` enum('active','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disable',
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `text_lesson_translations`;
CREATE TABLE `text_lesson_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `text_lesson_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `text_lesson_id` (`text_lesson_id`),
  KEY `text_lesson_translations_locale_index` (`locale`),
  CONSTRAINT `text_lesson_id` FOREIGN KEY (`text_lesson_id`) REFERENCES `text_lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `text_lessons`;
CREATE TABLE `text_lessons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `webinar_id` int unsigned NOT NULL,
  `chapter_id` int unsigned DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `study_time` int unsigned DEFAULT NULL,
  `accessibility` enum('free','paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `check_previous_parts` tinyint(1) NOT NULL DEFAULT '0',
  `access_after_day` int unsigned DEFAULT NULL,
  `order` int unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` int unsigned NOT NULL,
  `updated_at` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `text_lessons_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `text_lessons_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `text_lessons_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `text_lessons_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `text_lessons_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `text_lessons_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `text_lessons_attachments`;
CREATE TABLE `text_lessons_attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `text_lesson_id` int unsigned NOT NULL,
  `file_id` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `text_lessons_attachments_text_lesson_id_foreign` (`text_lesson_id`) USING BTREE,
  KEY `text_lessons_attachments_file_id_foreign` (`file_id`) USING BTREE,
  CONSTRAINT `text_lessons_attachments_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `text_lessons_attachments_text_lesson_id_foreign` FOREIGN KEY (`text_lesson_id`) REFERENCES `text_lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `ticket_translations`;
CREATE TABLE `ticket_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_translations_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_translations_locale_index` (`locale`),
  CONSTRAINT `ticket_translations_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `ticket_users`;
CREATE TABLE `ticket_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ticket_users_ticket_id_foreign` (`ticket_id`) USING BTREE,
  KEY `ticket_users_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `ticket_users_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `start_date` int unsigned DEFAULT NULL,
  `end_date` int unsigned DEFAULT NULL,
  `discount` int NOT NULL,
  `capacity` int DEFAULT NULL,
  `order` int unsigned DEFAULT NULL,
  `created_at` int NOT NULL,
  `updated_at` int DEFAULT NULL,
  `deleted_at` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tickets_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `tickets_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `tickets_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `tickets_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tickets_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tickets_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `trend_categories`;
CREATE TABLE `trend_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `trend_categories_category_id_index` (`category_id`) USING BTREE,
  CONSTRAINT `trend_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `upcoming_course_filter_option`;
CREATE TABLE `upcoming_course_filter_option` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `upcoming_course_id` int unsigned NOT NULL,
  `filter_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `upcoming_course_filter_option_upcoming_course_id_foreign` (`upcoming_course_id`),
  KEY `upcoming_course_filter_option_filter_option_id_foreign` (`filter_option_id`),
  CONSTRAINT `upcoming_course_filter_option_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upcoming_course_filter_option_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `upcoming_course_followers`;
CREATE TABLE `upcoming_course_followers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `upcoming_course_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `upcoming_course_followers_upcoming_course_id_foreign` (`upcoming_course_id`),
  KEY `upcoming_course_followers_user_id_foreign` (`user_id`),
  CONSTRAINT `upcoming_course_followers_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upcoming_course_followers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `upcoming_course_reports`;
CREATE TABLE `upcoming_course_reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `upcoming_course_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `upcoming_course_reports_upcoming_course_id_foreign` (`upcoming_course_id`),
  KEY `upcoming_course_reports_user_id_foreign` (`user_id`),
  CONSTRAINT `upcoming_course_reports_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upcoming_course_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `upcoming_course_translations`;
CREATE TABLE `upcoming_course_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `upcoming_course_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `upcoming_course_translations_upcoming_course_id_foreign` (`upcoming_course_id`),
  KEY `upcoming_course_translations_locale_index` (`locale`),
  CONSTRAINT `upcoming_course_translations_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `upcoming_courses`;
CREATE TABLE `upcoming_courses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `teacher_id` int unsigned NOT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `webinar_id` int unsigned DEFAULT NULL COMMENT 'when assigned a course',
  `type` enum('webinar','course','text_lesson') COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_demo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_demo_source` enum('upload','youtube','vimeo','external_link','secure_host') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_date` bigint unsigned DEFAULT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `points` int unsigned DEFAULT NULL,
  `capacity` int unsigned DEFAULT NULL,
  `price` double(15,2) DEFAULT NULL,
  `duration` int unsigned DEFAULT NULL,
  `sections` int unsigned DEFAULT NULL,
  `parts` int unsigned DEFAULT NULL,
  `course_progress` int unsigned DEFAULT NULL,
  `support` tinyint(1) NOT NULL DEFAULT '0',
  `certificate` tinyint(1) NOT NULL DEFAULT '0',
  `include_quizzes` tinyint(1) NOT NULL DEFAULT '0',
  `downloadable` tinyint(1) NOT NULL DEFAULT '0',
  `forum` tinyint(1) NOT NULL DEFAULT '0',
  `message_for_reviewer` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','pending','is_draft','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'is_draft',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upcoming_courses_slug_unique` (`slug`),
  KEY `upcoming_courses_creator_id_foreign` (`creator_id`),
  KEY `upcoming_courses_teacher_id_foreign` (`teacher_id`),
  KEY `upcoming_courses_category_id_foreign` (`category_id`),
  KEY `upcoming_courses_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `upcoming_courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upcoming_courses_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upcoming_courses_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upcoming_courses_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_bank_specification_translations`;
CREATE TABLE `user_bank_specification_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_bank_specification_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_bank_specification_id` (`user_bank_specification_id`),
  KEY `user_bank_specification_translations_locale_index` (`locale`),
  CONSTRAINT `user_bank_specification_id` FOREIGN KEY (`user_bank_specification_id`) REFERENCES `user_bank_specifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_bank_specifications`;
CREATE TABLE `user_bank_specifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_bank_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_bank_specifications_user_bank_id_foreign` (`user_bank_id`),
  CONSTRAINT `user_bank_specifications_user_bank_id_foreign` FOREIGN KEY (`user_bank_id`) REFERENCES `user_banks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_bank_translations`;
CREATE TABLE `user_bank_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_bank_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_bank_translations_user_bank_id_foreign` (`user_bank_id`),
  KEY `user_bank_translations_locale_index` (`locale`),
  CONSTRAINT `user_bank_translations_user_bank_id_foreign` FOREIGN KEY (`user_bank_id`) REFERENCES `user_banks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_banks`;
CREATE TABLE `user_banks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_commissions`;
CREATE TABLE `user_commissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `user_group_id` int unsigned DEFAULT NULL,
  `source` enum('courses','bundles','virtual_products','physical_products','meetings') COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('percent','fixed_amount') COLLATE utf8mb4_general_ci NOT NULL,
  `value` double(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_commissions_user_id_foreign` (`user_id`),
  KEY `user_commissions_user_group_id_foreign` (`user_group_id`),
  CONSTRAINT `user_commissions_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_commissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `user_firebase_sessions`;
CREATE TABLE `user_firebase_sessions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `token` text COLLATE utf8mb4_general_ci NOT NULL,
  `fcm_token` text COLLATE utf8mb4_general_ci,
  `ip` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_firebase_sessions_user_id_foreign` (`user_id`),
  CONSTRAINT `user_firebase_sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `user_form_fields`;
CREATE TABLE `user_form_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `become_instructor_id` int unsigned DEFAULT NULL,
  `form_field_id` int unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_form_fields_user_id_foreign` (`user_id`),
  KEY `user_form_fields_become_instructor_id_foreign` (`become_instructor_id`),
  KEY `user_form_fields_form_field_id_foreign` (`form_field_id`),
  CONSTRAINT `user_form_fields_become_instructor_id_foreign` FOREIGN KEY (`become_instructor_id`) REFERENCES `become_instructors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_form_fields_form_field_id_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_form_fields_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_login_histories`;
CREATE TABLE `user_login_histories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `browser` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `device` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `os` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `location` point DEFAULT NULL,
  `session_id` text COLLATE utf8mb4_general_ci NOT NULL,
  `session_start_at` bigint unsigned DEFAULT NULL,
  `session_end_at` bigint unsigned DEFAULT NULL,
  `end_session_type` enum('default','by_admin','by_user') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_login_histories_user_id_foreign` (`user_id`),
  CONSTRAINT `user_login_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `user_selected_bank_specifications`;
CREATE TABLE `user_selected_bank_specifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_selected_bank_id` int unsigned NOT NULL,
  `user_bank_specification_id` int unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_selected_bank_id_specifications` (`user_selected_bank_id`),
  KEY `user_bank_specification_id_specifications` (`user_bank_specification_id`),
  CONSTRAINT `user_bank_specification_id_specifications` FOREIGN KEY (`user_bank_specification_id`) REFERENCES `user_bank_specifications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_selected_bank_id_specifications` FOREIGN KEY (`user_selected_bank_id`) REFERENCES `user_selected_banks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_selected_banks`;
CREATE TABLE `user_selected_banks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `user_bank_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_selected_banks_user_bank_id_foreign` (`user_bank_id`),
  KEY `user_selected_banks_user_id_foreign` (`user_id`),
  CONSTRAINT `user_selected_banks_user_bank_id_foreign` FOREIGN KEY (`user_bank_id`) REFERENCES `user_banks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_selected_banks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int unsigned NOT NULL,
  `organ_id` int DEFAULT NULL,
  `mobile` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logged_count` int unsigned NOT NULL DEFAULT '0',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `financial_approval` tinyint(1) NOT NULL DEFAULT '0',
  `installment_approval` tinyint(1) DEFAULT '0',
  `enable_installments` tinyint(1) DEFAULT '1',
  `disable_cashback` tinyint(1) DEFAULT '0',
  `enable_registration_bonus` tinyint(1) NOT NULL DEFAULT '0',
  `registration_bonus_amount` double(15,2) DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_settings` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int unsigned DEFAULT NULL,
  `province_id` int unsigned DEFAULT NULL,
  `city_id` int unsigned DEFAULT NULL,
  `district_id` int unsigned DEFAULT NULL,
  `location` point DEFAULT NULL,
  `level_of_training` bit(3) DEFAULT NULL,
  `meeting_type` enum('all','in_person','online') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `status` enum('active','pending','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `access_content` tinyint(1) NOT NULL DEFAULT '1',
  `enable_ai_content` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `public_message` tinyint(1) NOT NULL DEFAULT '0',
  `identity_scan` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliate` tinyint(1) NOT NULL DEFAULT '1',
  `can_create_store` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Despite disabling the store feature in the settings, we can enable this feature for that user through the edit page of a user and turning on the store toggle.',
  `ban` tinyint(1) NOT NULL DEFAULT '0',
  `ban_start_at` int unsigned DEFAULT NULL,
  `ban_end_at` int unsigned DEFAULT NULL,
  `offline` tinyint(1) NOT NULL DEFAULT '0',
  `offline_message` text COLLATE utf8mb4_unicode_ci,
  `created_at` int NOT NULL,
  `updated_at` int DEFAULT NULL,
  `deleted_at` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `users_mobile_unique` (`mobile`) USING BTREE,
  KEY `users_country_id_foreign` (`country_id`),
  KEY `users_province_id_foreign` (`province_id`),
  KEY `users_city_id_foreign` (`city_id`),
  KEY `users_district_id_foreign` (`district_id`),
  CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `regions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `regions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `regions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `regions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `users_badges`;
CREATE TABLE `users_badges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `badge_id` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `users_badges_user_id_foreign` (`user_id`) USING BTREE,
  KEY `users_badges_badge_id_foreign` (`badge_id`) USING BTREE,
  CONSTRAINT `users_badges_badge_id_foreign` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_badges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `users_cookie_security`;
CREATE TABLE `users_cookie_security` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `type` enum('all','customize') COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_cookie_security_user_id_foreign` (`user_id`),
  CONSTRAINT `users_cookie_security_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users_manual_purchase`;
CREATE TABLE `users_manual_purchase` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `webinar_id` int unsigned NOT NULL,
  `access` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users_metas`;
CREATE TABLE `users_metas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_metas_user_id_foreign` (`user_id`),
  CONSTRAINT `users_metas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users_occupations`;
CREATE TABLE `users_occupations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `users_occupations_user_id_foreign` (`user_id`) USING BTREE,
  KEY `users_occupations_category_id_foreign` (`category_id`) USING BTREE,
  CONSTRAINT `users_occupations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_occupations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1071 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `users_registration_packages`;
CREATE TABLE `users_registration_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `instructors_count` int DEFAULT NULL,
  `students_count` int DEFAULT NULL,
  `courses_capacity` int DEFAULT NULL,
  `courses_count` int DEFAULT NULL,
  `meeting_count` int DEFAULT NULL,
  `status` enum('disabled','active') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_registration_packages_user_id_foreign` (`user_id`),
  CONSTRAINT `users_registration_packages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users_zoom_api`;
CREATE TABLE `users_zoom_api` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `jwt_token` text COLLATE utf8mb4_unicode_ci,
  `api_key` text COLLATE utf8mb4_unicode_ci,
  `api_secret` text COLLATE utf8mb4_unicode_ci,
  `account_id` text COLLATE utf8mb4_unicode_ci,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_zoom_api_user_id_foreign` (`user_id`),
  CONSTRAINT `users_zoom_api_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `verifications`;
CREATE TABLE `verifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `mobile` char(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified_at` int unsigned DEFAULT NULL,
  `expired_at` int unsigned DEFAULT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `verifications_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `waitlists`;
CREATE TABLE `waitlists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `waitlists_webinar_id_foreign` (`webinar_id`),
  KEY `waitlists_user_id_foreign` (`user_id`),
  CONSTRAINT `waitlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `waitlists_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `webinar_assignment_attachments`;
CREATE TABLE `webinar_assignment_attachments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `assignment_id` int unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attach` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignment_attachments_assignment_id_foreign` (`assignment_id`),
  CONSTRAINT `webinar_assignment_attachments_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `webinar_assignments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `webinar_assignment_history`;
CREATE TABLE `webinar_assignment_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `instructor_id` int unsigned NOT NULL,
  `student_id` int unsigned NOT NULL,
  `assignment_id` int unsigned NOT NULL,
  `grade` int unsigned DEFAULT NULL,
  `status` enum('pending','passed','not_passed','not_submitted') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignment_history_instructor_id_foreign` (`instructor_id`),
  KEY `webinar_assignment_history_student_id_foreign` (`student_id`),
  KEY `webinar_assignment_history_assignment_id_foreign` (`assignment_id`),
  CONSTRAINT `webinar_assignment_history_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `webinar_assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_assignment_history_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_assignment_history_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `webinar_assignment_history_messages`;
CREATE TABLE `webinar_assignment_history_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `assignment_history_id` int unsigned NOT NULL,
  `sender_id` int unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignment_history_id` (`assignment_history_id`),
  CONSTRAINT `webinar_assignment_history_id` FOREIGN KEY (`assignment_history_id`) REFERENCES `webinar_assignment_history` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `webinar_assignment_translations`;
CREATE TABLE `webinar_assignment_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `webinar_assignment_id` int unsigned NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignment_id_translate_foreign` (`webinar_assignment_id`),
  KEY `webinar_assignment_translations_locale_index` (`locale`),
  CONSTRAINT `webinar_assignment_id_translate_foreign` FOREIGN KEY (`webinar_assignment_id`) REFERENCES `webinar_assignments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `webinar_assignments`;
CREATE TABLE `webinar_assignments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `webinar_id` int unsigned NOT NULL,
  `chapter_id` int unsigned NOT NULL,
  `grade` int unsigned DEFAULT NULL,
  `pass_grade` int unsigned DEFAULT NULL,
  `deadline` int unsigned DEFAULT NULL,
  `attempts` int unsigned DEFAULT NULL,
  `check_previous_parts` tinyint(1) NOT NULL DEFAULT '0',
  `access_after_day` int unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_assignments_creator_id_foreign` (`creator_id`),
  KEY `webinar_assignments_webinar_id_foreign` (`webinar_id`),
  KEY `webinar_assignments_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `webinar_assignments_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_assignments_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_assignments_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `webinar_chapter_items`;
CREATE TABLE `webinar_chapter_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `chapter_id` int unsigned NOT NULL,
  `item_id` int unsigned NOT NULL,
  `type` enum('file','session','text_lesson','quiz','assignment') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int unsigned DEFAULT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_chapter_items_chapter_id_foreign` (`chapter_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_chapter_items_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `webinar_chapter_translations`;
CREATE TABLE `webinar_chapter_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `webinar_chapter_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_chapter_id` (`webinar_chapter_id`),
  KEY `webinar_chapter_translations_locale_index` (`locale`),
  CONSTRAINT `webinar_chapter_id` FOREIGN KEY (`webinar_chapter_id`) REFERENCES `webinar_chapters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `webinar_chapters`;
CREATE TABLE `webinar_chapters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `webinar_id` int unsigned NOT NULL,
  `order` int unsigned DEFAULT NULL,
  `check_all_contents_pass` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_chapters_user_id_foreign` (`user_id`),
  KEY `webinar_chapters_webinar_id_foreign` (`webinar_id`),
  CONSTRAINT `webinar_chapters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_chapters_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `webinar_extra_description_translations`;
CREATE TABLE `webinar_extra_description_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `webinar_extra_description_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_extra_description_id_foreign` (`webinar_extra_description_id`),
  KEY `webinar_extra_description_translations_locale_index` (`locale`),
  CONSTRAINT `webinar_extra_description_id_foreign` FOREIGN KEY (`webinar_extra_description_id`) REFERENCES `webinar_extra_descriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `webinar_extra_descriptions`;
CREATE TABLE `webinar_extra_descriptions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `upcoming_course_id` int unsigned DEFAULT NULL,
  `type` enum('learning_materials','company_logos','requirements') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int unsigned DEFAULT NULL,
  `created_at` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webinar_extra_descriptions_creator_id_foreign` (`creator_id`),
  KEY `webinar_extra_descriptions_webinar_id_foreign` (`webinar_id`),
  KEY `webinar_extra_descriptions_upcoming_course_id_foreign` (`upcoming_course_id`),
  CONSTRAINT `webinar_extra_descriptions_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_extra_descriptions_upcoming_course_id_foreign` FOREIGN KEY (`upcoming_course_id`) REFERENCES `upcoming_courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_extra_descriptions_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `webinar_filter_option`;
CREATE TABLE `webinar_filter_option` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int unsigned NOT NULL,
  `filter_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `webinar_filter_option_filter_option_id_foreign` (`filter_option_id`) USING BTREE,
  KEY `webinar_filter_option_webinar_id_foreign` (`webinar_id`) USING BTREE,
  CONSTRAINT `webinar_filter_option_filter_option_id_foreign` FOREIGN KEY (`filter_option_id`) REFERENCES `filter_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_filter_option_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11718 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `webinar_partner_teacher`;
CREATE TABLE `webinar_partner_teacher` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int unsigned NOT NULL,
  `teacher_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `webinar_partner_teacher_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `webinar_partner_teacher_teacher_id_foreign` (`teacher_id`) USING BTREE,
  CONSTRAINT `webinar_partner_teacher_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_partner_teacher_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `webinar_reports`;
CREATE TABLE `webinar_reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `webinar_id` int unsigned NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `webinar_reports_webinar_id_foreign` (`webinar_id`) USING BTREE,
  CONSTRAINT `webinar_reports_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `webinar_reviews`;
CREATE TABLE `webinar_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int unsigned NOT NULL,
  `webinar_id` int unsigned DEFAULT NULL,
  `bundle_id` int unsigned DEFAULT NULL,
  `content_quality` int unsigned NOT NULL,
  `instructor_skills` int unsigned NOT NULL,
  `purchase_worth` int unsigned NOT NULL,
  `support_quality` int unsigned NOT NULL,
  `rates` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` int unsigned NOT NULL,
  `status` enum('pending','active') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `webinar_reviews_webinar_id_foreign` (`webinar_id`) USING BTREE,
  KEY `webinar_reviews_creator_id_foreign` (`creator_id`) USING BTREE,
  KEY `webinar_reviews_bundle_id_foreign` (`bundle_id`),
  CONSTRAINT `webinar_reviews_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_reviews_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinar_reviews_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `webinar_translations`;
CREATE TABLE `webinar_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `webinar_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `webinar_translations_webinar_id_foreign` (`webinar_id`),
  KEY `webinar_translations_locale_index` (`locale`),
  CONSTRAINT `webinar_translations_webinar_id_foreign` FOREIGN KEY (`webinar_id`) REFERENCES `webinars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `webinars`;
CREATE TABLE `webinars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` int unsigned NOT NULL,
  `creator_id` int unsigned NOT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `type` enum('webinar','course','text_lesson') COLLATE utf8mb4_unicode_ci NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` int DEFAULT NULL,
  `duration` int unsigned DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_demo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_demo_source` enum('upload','youtube','vimeo','external_link','secure_host') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int unsigned DEFAULT NULL,
  `sales_count_number` int unsigned DEFAULT NULL,
  `price` double(15,2) unsigned DEFAULT NULL,
  `organization_price` double(15,2) unsigned DEFAULT NULL,
  `support` tinyint(1) DEFAULT '0',
  `certificate` tinyint(1) NOT NULL DEFAULT '0',
  `downloadable` tinyint(1) DEFAULT '0',
  `partner_instructor` tinyint(1) DEFAULT '0',
  `subscribe` tinyint(1) DEFAULT '0',
  `forum` tinyint(1) NOT NULL DEFAULT '0',
  `enable_waitlist` tinyint(1) NOT NULL DEFAULT '0',
  `access_days` int unsigned DEFAULT NULL COMMENT 'Number of days to access the course',
  `points` int DEFAULT NULL,
  `message_for_reviewer` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','pending','is_draft','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int NOT NULL,
  `updated_at` int DEFAULT NULL,
  `deleted_at` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `webinars_slug_unique` (`slug`) USING BTREE,
  KEY `webinars_teacher_id_foreign` (`teacher_id`) USING BTREE,
  KEY `webinars_category_id_foreign` (`category_id`) USING BTREE,
  KEY `webinars_slug_index` (`slug`) USING BTREE,
  KEY `webinars_creator_id_foreign` (`creator_id`) USING BTREE,
  CONSTRAINT `webinars_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinars_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `webinars_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2024 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `ai_content_template_translations` (`id`, `ai_content_template_id`, `locale`, `title`, `prompt`) VALUES
(1, 1, 'en', 'Course Title', 'Generate a text with the [keyword] subject in [language] language with less than [length] word for a course title.'),
(2, 2, 'en', 'Course Short Description', 'Generate a text with the [keyword] subject in the [language] language with less than [length] words.'),
(3, 3, 'en', 'Course Long Description', 'Generate a text with the [keyword] subject in the [language] language with less than [length] words.'),
(4, 4, 'en', 'Blog Title', 'Generate a text with the [keyword] subject in the [language] language with less than [length] words for a blog title.'),
(5, 5, 'en', 'Blog Short Description', 'Generate a text with the [keyword] subject in the [language] language with less than [length] words for a blog short description.'),
(6, 6, 'en', 'Blog Long Description', 'Generate a text with the [keyword] subject in the [language] language with less than [length] words for a blog description.'),
(7, 7, 'en', 'Genrate Image', 'Generate an image with the [keyword] subject.'),
(8, 8, 'en', 'Course SEO Description', 'Generate a text with the [keyword] subject in the [language] language with less than [length] words for a course SEO description.'),
(9, 9, 'en', 'Blog SEO Description', 'Generate a text with the [keyword] subject in the [language] language with less than [length] words for a blog SEO description.'),
(10, 10, 'en', 'Upcoming Course Description', 'Generate a text with the [keyword] subject in the [language] language with less than [length] words for an upcoming course.'),
(11, 11, 'en', 'Quiz Question', 'Generate a question with the [keyword] subject in the [language] language with less than [length] words.'),
(12, 12, 'en', 'Generate FAQ', 'Generate a faq with the [keyword] subject in the [keyword] language.'),
(13, 13, 'en', 'Course Requirements', 'Generate requirements for a course with [keyword] subject in [language].'),
(14, 14, 'en', 'Form Description', 'Generate a text with the [keyword] subject in the [language] language with less than [length] words for a form description.'),
(15, 15, 'en', 'Course Advertising Description', 'Generate a text with the [keyword] subject in [language] with less than [length] words for a course advertising description.'),
(16, 16, 'en', '\"About Us\" Page Description', 'Generate a text with the [keyword] subject in [language] with less than [length] words for the \"About Us\" page description.'),
(17, 17, 'en', 'Generate Notice', 'Generate a text with the [keyword] subject in [language] with less than [length] words for notice.'),
(18, 18, 'en', 'Store Product Title', 'Generate a text with the [keyword] subject in [language] language with less than [length] word for a product title.'),
(19, 19, 'en', 'Store Product Description', 'Generate a text with the [keyword] subject in the [language] language with less than [length] words for a store product description.'),
(20, 20, 'en', 'Store Product SEO Description', 'Generate a text with the [keyword] subject in the [language] language with less than [length] words for a store product  SEO description.');

INSERT INTO `ai_content_templates` (`id`, `type`, `enable_length`, `length`, `image_size`, `enable`, `created_at`) VALUES
(1, 'text', 1, 5, NULL, 1, 1694939030),
(2, 'text', 1, 40, NULL, 1, 1694940999),
(3, 'text', 1, 300, NULL, 1, 1694941070),
(4, 'text', 1, 5, NULL, 1, 1694941199),
(5, 'text', 1, 100, NULL, 1, 1694941500),
(6, 'text', 1, 300, NULL, 1, 1694941560),
(7, 'image', 0, NULL, '512', 1, 1694942113),
(8, 'text', 1, 160, NULL, 1, 1694942972),
(9, 'text', 1, 160, NULL, 1, 1694970677),
(10, 'text', 1, 300, NULL, 1, 1694970808),
(11, 'text', 1, 150, NULL, 1, 1694971282),
(12, 'text', 0, NULL, NULL, 1, 1694994114),
(13, 'text', 0, NULL, NULL, 1, 1694994456),
(14, 'text', 1, 200, NULL, 1, 1694994762),
(15, 'text', 1, 200, NULL, 1, 1694995011),
(16, 'text', 1, 300, NULL, 1, 1694995299),
(17, 'text', 1, 100, NULL, 1, 1694995502),
(18, 'text', 1, 5, NULL, 1, 1695024064),
(19, 'text', 1, 300, NULL, 1, 1695024166),
(20, 'text', 1, 160, NULL, 1, 1695024265);

INSERT INTO `cart` (`id`, `creator_id`, `webinar_id`, `bundle_id`, `product_order_id`, `reserve_meeting_id`, `subscribe_id`, `promotion_id`, `gift_id`, `ticket_id`, `special_offer_id`, `product_discount_id`, `installment_payment_id`, `created_at`) VALUES
(212, 1047, NULL, NULL, NULL, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1721328477);

INSERT INTO `cashback_rule_translations` (`id`, `cashback_rule_id`, `locale`, `title`) VALUES
(5, 5, 'en', 'Christmas Cashback');

INSERT INTO `cashback_rules` (`id`, `target_type`, `target`, `start_date`, `end_date`, `amount`, `amount_type`, `apply_cashback_per_item`, `max_amount`, `min_amount`, `enable`, `created_at`) VALUES
(5, 'all', NULL, 1672610400, NULL, 10.00, 'percent', 0, NULL, NULL, 0, 1678921892);

INSERT INTO `categories` (`id`, `slug`, `parent_id`, `icon`, `order`) VALUES
(612, 'sample-category', NULL, '/store/1/default_images/categories_icons/anchor.png', 1);

INSERT INTO `category_translations` (`id`, `category_id`, `locale`, `title`) VALUES
(1, 612, 'en', 'Sample Category');

INSERT INTO `course_learning_last_views` (`id`, `user_id`, `webinar_id`, `item_id`, `item_type`, `visited_at`) VALUES
(1, 1, 1, 1, 'file', 1721321511),
(2, 1016, 1, 97, 'file', 1721327728),
(3, 1047, 1, 97, 'file', 1721493615);

INSERT INTO `currencies` (`id`, `currency`, `currency_position`, `currency_separator`, `currency_decimal`, `exchange_rate`, `order`, `created_at`) VALUES
(4, 'EUR', 'left', 'dot', 2, 0.93, 1, 1678868603),
(6, 'INR', 'left', 'dot', 2, 82.52, 2, 1678869222);

INSERT INTO `discount_users` (`id`, `discount_id`, `user_id`, `created_at`) VALUES
(11, 26, 1047, 1721328606);

INSERT INTO `discounts` (`id`, `creator_id`, `title`, `subtitle`, `discount_type`, `source`, `code`, `percent`, `amount`, `max_amount`, `minimum_order`, `count`, `user_type`, `product_type`, `for_first_purchase`, `status`, `expired_at`, `created_at`) VALUES
(26, 1, 'new', NULL, 'fixed_amount', 'all', 'new', 0, 700, NULL, 4, 1, 'special_users', 'all', 0, 'active', 1722052800, 1721328553);

INSERT INTO `file_translations` (`id`, `file_id`, `locale`, `title`, `description`) VALUES
(1, 1, 'en', 'Sample Video', 'The Lorem ipum filling text is used by graphic designers, programmers and printers with the aim of occupying the spaces of a website, an advertising product or an editorial production whose final text is not yet ready.'),
(65, 96, 'en', 'ss', NULL),
(66, 97, 'en', 'new', NULL);

INSERT INTO `files` (`id`, `creator_id`, `webinar_id`, `chapter_id`, `accessibility`, `downloadable`, `storage`, `file`, `volume`, `file_type`, `secure_host_upload_type`, `interactive_type`, `interactive_file_name`, `interactive_file_path`, `check_previous_parts`, `access_after_day`, `online_viewer`, `order`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1016, 1, 1, 'paid', 0, 'secure_host', 'https://iframe.mediadelivery.net/embed/271122/735c9596-f2c2-47d9-9c21-46773d56deb9?token=$2y$10$ff57TiQBxwdVEWQiOIf2neoQPekSBmydH39PpgK24a76xyGc65a0i', '0.2', 'video', 'direct', NULL, NULL, NULL, 0, NULL, 0, NULL, 'active', 1656669519, 1721326183, NULL),
(96, 1016, 1, 1, 'free', 0, 's3', '/jebin/store/1016/itD6LHdxgKIJF7aKNO1sgL3CcAGYtbGbpAjGY3xo.mp4', '0.2', 'video', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 'active', 1721323682, NULL, NULL),
(97, 1016, 1, 1, 'free', 0, 'secure_host', 'https://iframe.mediadelivery.net/embed/271122/963b0bf0-db4c-4a08-8370-b9cb66b91492?token=$2y$10$glMw.0qcjS/2OEye4gHKxOf/K3UgvCDEYK5GVANPQUFdIOTFZnTpm', '0.2', 'video', 'direct', NULL, NULL, NULL, 0, NULL, 0, NULL, 'active', 1721325888, 1721327696, NULL);

INSERT INTO `floating_bar_translations` (`id`, `floating_bar_id`, `locale`, `title`, `description`, `btn_text`) VALUES
(3, 2, 'en', 'New Years Day Celebration', 'Get all courses with 50 to 70% off without any limitation', 'View Courses');

INSERT INTO `floating_bars` (`id`, `start_at`, `end_at`, `title_color`, `description_color`, `icon`, `background_color`, `background_image`, `btn_url`, `btn_color`, `btn_text_color`, `bar_height`, `position`, `fixed`, `enable`) VALUES
(2, 1678456800, 1755727200, '#2d2d2d', '#b3b3b3', '/store/1/topnav_icon.svg', '#1f3b64', '/store/1/topnav_background.jpg', '/classes?discount=on', '#feb702', '#ffffff', 70, 'top', 1, 0);

INSERT INTO `home_page_statistic_translations` (`id`, `home_page_statistic_id`, `locale`, `title`, `description`) VALUES
(2, 2, 'en', 'Skillful Instructors', 'Start learning from experienced instructors.'),
(3, 3, 'en', 'Video Courses', 'Learn without any geographical & time limitations.'),
(4, 4, 'en', 'Live Classes', 'Improve your skills using live knowledge flow.'),
(5, 5, 'en', 'Happy Students', 'are available to help you by their knowledge');

INSERT INTO `home_page_statistics` (`id`, `icon`, `color`, `count`, `order`, `created_at`) VALUES
(2, '/store/1/default_images/trend_categories_icons/chess.png', '#c95d63', 20, 1, 1675870234),
(3, '/store/1/default_images/trend_categories_icons/palette.png', '#496ddb', 12, 4, 1675870276),
(4, '/store/1/default_images/trend_categories_icons/connection.png', '#717ec3', 16, 3, 1675870320),
(5, '/store/1/default_images/trend_categories_icons/family.png', '#ae8799', 78, 2, 1675870418);

INSERT INTO `home_sections` (`id`, `name`, `order`) VALUES
(1, 'latest_classes', 1);

INSERT INTO `ip_restrictions` (`id`, `type`, `value`, `reason`, `created_at`) VALUES
(1, 'full_ip', '139.10.13.206', 'Spammer', 1709534805),
(3, 'country', 'CK', 'Testing Country Restriction', 1709534952);

INSERT INTO `meeting_times` (`id`, `meeting_id`, `meeting_type`, `day_label`, `time`, `description`, `created_at`) VALUES
(174, 36, 'all', 'friday', '12:00AM-12:08PM', NULL, 1721326947);

INSERT INTO `meetings` (`id`, `creator_id`, `amount`, `discount`, `in_person`, `in_person_amount`, `group_meeting`, `online_group_min_student`, `online_group_max_student`, `online_group_amount`, `in_person_group_min_student`, `in_person_group_max_student`, `in_person_group_amount`, `disabled`, `created_at`) VALUES
(36, 1016, 1.00, NULL, 0, NULL, 1, 1, 30, 1.00, NULL, NULL, NULL, 0, 1721326905);

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_08_09_145553_create_roles_table', 1),
(4, '2020_08_09_145834_create_sections_table', 1),
(5, '2020_08_09_145926_create_permissions_table', 1),
(6, '2020_08_24_163003_create_webinars_table', 1),
(7, '2020_08_24_164823_create_webinar_partner_teacher_table', 1),
(8, '2020_08_24_165658_create_tags_table', 1),
(9, '2020_08_24_165835_create_webinar_tag_table', 1),
(10, '2020_08_24_171611_create_categories_table', 1),
(11, '2020_08_29_052437_create_filters_table', 1),
(12, '2020_08_29_052900_create_filter_options_table', 1),
(13, '2020_08_29_054455_add_category_id_in_webinar_table', 1),
(14, '2020_09_01_174741_add_seo_description_and_start_end_time_in_webinar_table', 1),
(15, '2020_09_02_180508_create_webinar_filter_option_table', 1),
(16, '2020_09_02_193923_create_tickets_table', 1),
(17, '2020_09_02_210447_create_sessions_table', 1),
(18, '2020_09_02_212642_create_files_table', 1),
(19, '2020_09_03_175543_create_faqs_table', 1),
(20, '2020_09_08_175539_delete_webinar_tag_and_update_tag_table', 1),
(21, '2020_09_09_154522_create_quizzes_table', 1),
(22, '2020_09_09_174646_create_quizzes_questions_table', 1),
(23, '2020_09_09_182726_create_quizzes_questions_answers_table', 1),
(24, '2020_09_14_160028_create_prerequisites_table', 1),
(25, '2020_09_14_183235_nullable_item_id_in_quizzes_table', 1),
(26, '2020_09_14_190110_create_webinar_quizzes_table', 1),
(27, '2020_09_16_163835_create_quizzes_results_table', 1),
(28, '2020_09_24_102115_add_total_mark_in_quize_table', 1),
(29, '2020_09_24_132242_create_comment_table', 1),
(30, '2020_09_24_132639_create_favorites_table', 1),
(31, '2020_09_26_181200_create_certificate_table', 1),
(32, '2020_09_26_181444_create_certificates_templates_table', 1),
(33, '2020_09_30_170451_add_slug_in_webinars_table', 1),
(34, '2020_09_30_191202_create_purchases_table', 1),
(35, '2020_10_02_063828_create_rating_table', 1),
(36, '2020_10_02_094723_edit_table_and_add_foreign_key', 1),
(37, '2020_10_08_055408_add_reviwes_table', 1),
(38, '2020_10_08_084100_edit_status_comments_table', 1),
(39, '2020_10_08_121041_create_meetings_table', 2),
(40, '2020_10_08_121621_create_meeting_times_table', 2),
(41, '2020_10_08_121848_create_meeting_requests_table', 2),
(42, '2020_10_15_172913_add_about_and_head_line_in_users_table', 2),
(43, '2020_10_15_173645_create_follow_table', 2),
(46, '2020_10_17_100606_create_badges_table', 3),
(47, '2020_10_08_121848_create_reserve_meetings_table', 4),
(48, '2020_10_20_193013_update_users_table', 5),
(50, '2020_10_18_220323_convert_creatore_user_id_to_creator_id', 7),
(51, '2020_10_22_153502_create_cart_table', 7),
(52, '2020_10_22_154636_create_orders_table', 7),
(53, '2020_10_22_155930_create_order_items_table', 7),
(54, '2020_10_23_204203_create_sales_table', 7),
(55, '2020_10_23_211459_create_accounting_table', 7),
(56, '2020_10_23_213515_create_discounts_table', 7),
(57, '2020_10_23_213934_create_discount_users_table', 7),
(58, '2020_10_23_235444_create_ticket_users_table', 7),
(59, '2020_10_25_172331_create_groups_table', 7),
(60, '2020_10_25_172523_create_group_users_table', 7),
(62, '2020_11_02_202754_edit_email_in_users_table', 8),
(63, '2020_11_03_200314_edit_some_tables', 9),
(64, '2020_11_06_193300_create_settings_table', 10),
(67, '2020_11_09_202533_create_feature_webinars_table', 11),
(68, '2020_11_10_193459_edit_webinars_table', 12),
(69, '2020_11_11_203344_create_trend_categories_table', 13),
(72, '2020_11_11_222833_create_blog_categories_table', 14),
(75, '2020_11_11_231204_create_blog_table', 15),
(76, '2020_10_25_223247_add_sub_title_tickets_table', 16),
(77, '2020_10_28_001340_add_count_in_discount_users_table', 16),
(78, '2020_10_28_221509_create_payment_channels_table', 16),
(79, '2020_11_01_120909_change_class_name_enum_payment_channels_table', 16),
(80, '2020_11_07_233948_add_some_raw_in_order_items__table', 16),
(81, '2020_11_10_061350_add_discount_id_in_order_items_table', 16),
(82, '2020_11_10_071651_decimal_orders_order_items_sales_table', 16),
(83, '2020_11_11_193138_change_reference_id_type_in_orders_tabel', 16),
(84, '2020_11_11_222413_change_meeting_id_to_meeting_time_id_in_order_items_table', 16),
(85, '2020_11_11_225421_add_locked_at_and_reserved_at_and_change_request_time_to_day_in_reserve_meetings_table', 17),
(86, '2020_11_12_000116_add_type_in_orders_table', 17),
(87, '2020_11_12_001912_change_meeting_id_to_meeting_time_id_in_accounting_table', 17),
(88, '2020_11_12_133009_decimal_paid_amount_in_reserve_meetings_table', 17),
(91, '2020_11_12_170109_add_blog_id_to_comments_table', 18),
(98, '2020_11_14_201228_add_bio_and_ban_to_users_table', 20),
(99, '2020_11_14_224447_create_users_badges_table', 21),
(100, '2020_11_14_233319_create_payout_request_table', 22),
(101, '2020_11_15_010622_change_byer_id_and_add_seller_id_in_sales_table', 22),
(102, '2020_11_16_195009_create_supports_table', 22),
(103, '2020_11_16_201814_create_support_departments_table', 22),
(107, '2020_11_16_202254_create_supports_table', 23),
(109, '2020_11_17_192744_create_support_conversations_table', 24),
(110, '2020_11_17_072348_create_offline_payments_table', 25),
(111, '2020_11_19_191943_add_replied_status_to_comments_table', 25),
(114, '2020_11_20_215748_create_subscribes_table', 26),
(115, '2020_11_21_185519_create_notification_templates_table', 27),
(116, '2020_11_22_210832_create_promotions_table', 28),
(118, '2020_11_23_194153_add_status_column_to_discounts_table', 29),
(119, '2020_11_23_213532_create_users_occupations_table', 30),
(120, '2020_11_30_220855_change_amount_in_payouts_table', 31),
(121, '2020_11_30_231334_add_pay_date_in_offline_payments_table', 31),
(122, '2020_11_30_233018_add_charge_enum_in_type_in_orders_table', 31),
(123, '2020_12_01_193948_create_testimonials_table', 32),
(124, '2020_12_02_202043_edit_and_add_types_to_webinars_table', 33),
(128, '2020_12_04_204048_add_column_creator_id_to_some_tables', 34),
(129, '2020_12_05_205320_create_text_lessons_table', 35),
(130, '2020_12_05_210052_create_text_lessons_attachments_table', 36),
(131, '2020_12_06_215701_add_order_column_to_webinar_items_tables', 37),
(132, '2020_12_11_114844_add_column_storage_to_files_table', 38),
(133, '2020_12_07_211009_add_subscribe_id_in_order_items_table', 39),
(134, '2020_12_07_211657_nullable_payment_method_in_orders_table', 39),
(135, '2020_12_07_212306_add_subscribe_enum__type_in_orders_table', 39),
(136, '2020_12_07_223237_changes_in_sales_table', 39),
(137, '2020_12_07_224925_add_subscribe_id_in_accounting_table', 39),
(138, '2020_12_07_230200_create_subscribe_uses_table', 39),
(139, '2020_12_11_123209_add_subscribe_type_account_in_accounting_table', 39),
(140, '2020_12_11_132819_add_sale_id_in_subscribe_use_in_subscribe_uses_table', 39),
(141, '2020_12_11_135824_add_subscribe_payment_method_in_sales_table', 39),
(143, '2020_12_13_205751_create_advertising_banners_table', 41),
(145, '2020_12_14_204251_create_become_instructors_table', 42),
(146, '2020_11_12_232207_create_reports_table', 43),
(147, '2020_11_12_232207_create_comments_reports_table', 44),
(148, '2020_12_17_210822_create_webinar_reports_table', 45),
(150, '2020_12_18_181551_create_notifications_table', 46),
(151, '2020_12_18_195833_create_notifications_status_table', 47),
(152, '2020_12_19_195152_add_status_column_to_payment_channels_table', 48),
(154, '2020_12_20_231434_create_contacts_table', 49),
(155, '2020_12_21_210345_edit_quizzes_table', 50),
(156, '2020_12_24_221715_add_column_to_users_table', 50),
(157, '2020_12_24_084728_create_special_offers_table', 51),
(158, '2020_12_25_204545_add_promotion_enum_type_in_orders_table', 51),
(159, '2020_12_25_205139_add_promotion_id_in_order_items_table', 51),
(160, '2020_12_25_205811_add_promotion_id_in_accounting_table', 51),
(161, '2020_12_25_210341_add_promotion_id_in_sales_table', 51),
(162, '2020_12_25_212453_add_promotion_type_account_enum_in_accounting_table', 51),
(163, '2020_12_25_231005_add_promotion_type_enum_in_sales_table', 51),
(166, '2020_12_29_192943_add_column_reply_to_contacts_table', 53),
(167, '2020_12_30_225001_create_payu_transactions_table', 54),
(168, '2021_01_06_202649_edit_column_password_from_users_table', 55),
(169, '2021_01_08_134022_add_api_column_to_sessions_table', 56),
(170, '2021_01_10_215540_add_column_store_type_to_accounting', 57),
(173, '2021_01_13_214145_edit_carts_table', 58),
(174, '2021_01_13_230725_delete_column_type_from_orders_table', 59),
(175, '2021_01_20_214653_add_discount_column_to_reserve_meetings_table', 60),
(177, '2021_01_27_193915_add_foreign_key_to_support_conversations_table', 61),
(178, '2021_02_02_203821_add_viewed_at_column_to_comments_table', 62),
(180, '2021_02_12_134504_add_financial_approval_column_to_users_table', 64),
(181, '2021_02_12_131916_create_verifications_table', 65),
(182, '2021_02_15_221518_add_certificate_to_users_table', 66),
(183, '2021_02_16_194103_add_cloumn_private_to_webinars_table', 66),
(184, '2021_02_18_213601_edit_rates_column_webinar_reviews_table', 67),
(188, '2021_02_27_212131_create_noticeboards_table', 68),
(189, '2021_02_27_213940_create_noticeboards_status_table', 68),
(191, '2021_02_28_195025_edit_groups_table', 69),
(192, '2021_03_06_205221_create_newsletters_table', 70),
(193, '2021_03_12_105526_add_is_main_column_to_roles_table', 71),
(194, '2021_03_12_202441_add_description_column_to_feature_webinars_table', 72),
(195, '2021_03_18_130248_edit_status_column_from_supports_table', 73),
(196, '2021_03_19_113306_add_column_order_to_categories_table', 74),
(197, '2021_03_19_115939_add_column_order_to_filter_options_table', 75),
(199, '2021_03_24_100005_edit_discounts_table', 76),
(200, '2021_03_27_204551_create_sales_status_table', 77),
(202, '2021_03_28_182558_add_column_page_to_settings_table', 78),
(206, '2021_03_31_195835_add_new_status_in_reserve_meetings_table', 79),
(207, '2020_12_12_204705_create_course_learning_table', 80),
(208, '2021_04_19_195452_add_meta_description_column_to_blog_table', 81),
(209, '2021_04_21_200131_add_icon_column_to_categories_table', 82),
(210, '2021_04_21_203746_add_is_popular_column_to_subscribes_table', 83),
(211, '2021_04_25_203955_add_is_charge_account_column_to_order_items', 84),
(212, '2021_04_25_203955_add_is_charge_account_column_to_orders', 85),
(213, '2021_05_13_111720_add_moderator_secret_column_to_sessions_table', 86),
(214, '2021_05_13_123920_add_zoom_id_column_to_sessions_table', 87),
(215, '2021_05_14_182848_create_session_reminds_table', 88),
(217, '2021_05_25_193743_create_users_zoom_api_table', 89),
(218, '2021_05_25_205716_add_new_column_to_sessions_table', 90),
(219, '2021_05_27_095128_add_user_id_to_newsletters_table', 91),
(220, '2020_12_27_192459_create_pages_table', 92),
(221, '2021_07_03_222439_add_special_offer_id_to_cart_table', 93),
(222, '2021_09_02_101422_add_payment_data_to_orders_table', 94),
(223, '2021_09_02_110519_add_sender_id_to_notifications_table', 95),
(224, '2021_09_06_113524_create_webinar_chapters_table', 96),
(228, '2021_09_06_114459_add_chapter_id_to_files_table', 97),
(229, '2021_09_06_114532_add_chapter_id_to_text_lessons_table', 97),
(230, '2021_09_06_114547_add_chapter_id_to_sessions_table', 97),
(231, '2021_09_13_134659_add_chapter_id_to_quizzes_table', 98),
(234, '2021_09_14_122505_create_affiliates_table', 100),
(235, '2021_09_14_122117_create_affiliates_codes_table', 101),
(239, '2021_09_14_142927_add_affiliate_column_to_users_table', 105),
(241, '2021_09_14_142302_add_affiliate_column_to_accounting_table', 106),
(244, '2021_09_18_155914_create_blog_translations_table', 107),
(246, '2021_09_19_190400_create_page_translations_table', 108),
(248, '2021_09_19_203526_create_setting_translations_table', 109),
(250, '2021_09_20_140241_create_advertising_banners_translations_table', 110),
(252, '2021_09_20_175518_create_category_translations_table', 111),
(255, '2021_09_20_184724_create_filter_translations_table', 112),
(256, '2021_09_20_185132_create_filter_option_translations_table', 112),
(258, '2021_09_21_160650_create_subscribe_translations_table', 113),
(260, '2021_09_21_162922_create_promotion_translations_table', 114),
(262, '2021_09_21_164954_create_testimonial_translations_table', 115),
(264, '2021_09_21_182251_create_feature_webinar_translations_table', 116),
(266, '2021_09_21_184239_create_certificate_template_translations_table', 117),
(268, '2021_09_21_195731_create_support_department_translations_table', 118),
(270, '2021_09_21_201512_create_badge_translations_table', 119),
(272, '2021_09_22_120723_create_webinar_translations_table', 120),
(274, '2021_09_22_135518_create_ticket_translations_table', 121),
(276, '2021_09_22_144342_create_webinar_chapter_translations_table', 122),
(278, '2021_09_22_162502_create_session_translations_table', 123),
(280, '2021_09_22_172309_create_file_translations_table', 124),
(282, '2021_09_22_173500_create_faq_translations_table', 125),
(284, '2021_09_23_094903_create_text_lesson_translations_table', 126),
(286, '2021_09_27_194537_create_quiz_translations_table', 127),
(288, '2021_09_28_112529_create_quiz_question_translations_table', 128),
(290, '2021_09_28_122513_create_quizzes_questions_answer_translations_table', 129),
(291, '2021_12_03_103010_add_agora_session_api_to_sessions_table', 130),
(292, '2021_12_03_103558_add_agora_to_sessions_table', 131),
(293, '2021_12_03_114009_create_agora_history_table', 132),
(295, '2021_12_04_183524_create_regions_table', 133),
(298, '2021_12_25_151304_add_new_column_to_meetings_table', 135),
(299, '2021_12_26_142304_add_new_column_to_meeting_times_table', 136),
(302, '2022_01_01_162247_add_new_column_to_reserve_meetings_table', 137),
(305, '2022_01_02_142927_create_rewards_table', 138),
(307, '2022_01_03_153517_create_rewards_accounting_table', 139),
(308, '2022_01_04_161756_add_score_column_to_badges_table', 140),
(309, '2022_01_04_165147_add_points_column_to_webinars_table', 141),
(312, '2022_01_08_154504_edit_storage_column_and_add_new_value_to_files_table', 142),
(313, '2022_01_11_162839_add_timezone_column_to_users_table', 143),
(314, '2022_01_12_142238_add_timezone_column_to_webinars_table', 144),
(315, '2022_01_15_131828_create_registration_packages_table', 145),
(319, '2022_01_15_203133_edit_columns_in_accounting_table', 146),
(320, '2022_01_16_102825_edit_columns_in_order_items_table', 147),
(321, '2022_01_17_152605_add_registration_package_id_to_sales_table', 148),
(322, '2022_01_18_103414_create_users_registration_packages_table', 149),
(323, '2022_01_18_113331_create_groups_registration_packages_table', 150),
(325, '2022_01_20_110119_add_become_instructor_id_column_to_order_items_table', 152),
(326, '2022_01_18_160228_add_column_role_to_become_instructors_table', 153),
(327, '2022_01_26_080434_add_reserve_date_columns_to_reserve_meetings_table', 154),
(328, '2022_01_28_094259_edit_column_in_discounts_table', 155),
(329, '2022_01_28_094515_create_discount_courses_table', 155),
(330, '2022_01_28_094527_create_discount_groups_table', 155),
(331, '2022_01_31_093231_add_column_description_to_meeting_times_table', 156),
(332, '2022_01_31_093306_add_column_description_to_reserve_meetings_table', 156),
(334, '2022_02_01_092922_create_newsletters_history_table', 157),
(335, '2022_02_01_104529_create_discount_categories_table', 158),
(337, '2022_02_02_092820_add_attachment_column_to_offline_payments_table', 159),
(339, '2022_02_02_184235_add_column_video_demo_source_to_webinars_table', 160),
(340, '2021_12_05_193333_add_new_column_to_users_table', 161),
(341, '2022_02_27_072819_add_forign_key_for_region_to_users_table', 162),
(347, '2022_03_05_123830_create_product_categories_table', 163),
(348, '2022_03_05_125138_create_product_filters_table', 163),
(350, '2022_03_06_091528_create_product_filter_options_table', 163),
(351, '2022_03_07_081257_create_product_specifications_table', 164),
(353, '2022_03_07_081808_create_product_specification_categories_table', 165),
(357, '2022_03_05_125434_create_products_table', 166),
(358, '2022_03_07_093128_create_product_discounts_table', 166),
(362, '2022_03_08_101832_create_product_media_table', 167),
(363, '2022_03_09_054031_create_product_selected_filter_options_table', 168),
(364, '2022_03_09_083337_create_product_specification_meta_table', 169),
(369, '2022_03_09_084108_create_product_selected_specifications_table', 170),
(370, '2022_03_09_140558_create_product_faqs_table', 171),
(374, '2022_03_11_180436_create_product_reviews_table', 174),
(375, '2022_03_11_182715_add_product_id_to_comments_reports_table', 175),
(376, '2022_03_08_094452_create_product_files_table', 176),
(377, '2022_03_11_180746_add_product_id_to_comments_table', 177),
(378, '2022_03_12_102233_add_new_position_to_advertising_banners_table', 178),
(383, '2022_03_13_072108_add_product_id_to_sales_table', 179),
(385, '2022_03_13_081212_create_product_orders_table', 180),
(386, '2022_03_19_171559_create_product_selected_specification_translations_table', 181),
(387, '2022_03_21_161055_add_create_store_column_to_users_table', 182),
(388, '2022_03_26_065509_add_new_type_to_rewards_table', 183),
(389, '2022_03_28_051949_add_product_count_column_to_registration_packages_table', 184),
(391, '2022_03_28_054322_add_product_type_column_to_discounts_table', 185),
(392, '2022_03_28_062248_edit_type_column_of_rewards_accounting_table', 186),
(393, '2022_03_28_083906_edit_type_column_to_badges_table', 187),
(394, '2022_04_02_051515_create_webinar_chapter_items_table', 188),
(395, '2022_04_02_085059_remove_type_column_from_webinar_chapters_table', 189),
(396, '2022_04_02_131352_add_check_sequence_content_fields_to_contents_tables', 190),
(399, '2022_04_04_075541_add_assignment_type_to_webinar_chapter_items_table', 192),
(400, '2022_04_04_071203_create_webinar_assignments_table', 193),
(401, '2022_04_04_071303_create_webinar_assignment_attachments_table', 193),
(405, '2022_04_05_053308_create_webinar_assignment_history_table', 194),
(406, '2022_04_05_060030_create_webinar_assignment_history_messages_table', 194),
(407, '2022_04_06_121240_add_new_type_passed_assignment_to_rewards_table', 195),
(408, '2022_04_09_064609_add_access_content_column_to_users_table', 196),
(409, '2022_04_10_073822_create_bundles_table', 197),
(410, '2022_04_10_092348_create_bundle_filter_option_table', 198),
(413, '2022_04_10_130733_create_bundle_webinars_table', 200),
(421, '2022_04_10_093457_add_bundle_id_to_needle_tables', 201),
(422, '2022_04_12_153052_add_access_time_to_webinars_table', 202),
(423, '2022_04_13_053947_create_course_noticeboards_table', 203),
(424, '2022_04_13_054536_create_course_noticeboard_status_table', 203),
(425, '2022_04_13_130155_add_column_forum_to_webinars_table', 204),
(427, '2022_04_14_060606_create_course_forums_table', 205),
(428, '2022_04_14_063316_create_course_forum_answers_table', 206),
(447, '2022_04_21_133513_add_new_type_in_rewards_table', 216),
(448, '2022_04_21_135212_add_new_type_in_badges_table', 217),
(449, '2022_04_24_081637_add_new_type_instructor_blog_in_rewards_table', 218),
(450, '2022_04_24_082515_add_new_type_instructor_blog_in_badges_table', 219),
(452, '2022_04_25_043945_create_users_cookie_security_table', 220),
(453, '2022_04_25_143142_add_organization_price__column_to_webinars_table', 221),
(454, '2022_04_25_165256_add_image_and_video_to_quizzes_questions_table', 222),
(456, '2022_04_26_060018_edit_certificates_templates_table', 223),
(458, '2022_04_26_082017_edit_certificates_table', 224),
(459, '2022_04_26_155421_create_subscribe_reminds_table', 225),
(460, '2022_04_26_163428_add_instructor_id_to_noticeboards_table', 226),
(461, '2022_04_27_133655_add_unlimited_download_to_subscribes_table', 227),
(462, '2022_04_27_133655_add_infinite_use_to_subscribes_table', 228),
(463, '2022_04_27_140844_add_extra_time_to_join_to_sessions_table', 229),
(464, '2022_04_28_052318_create_webinar_extra_description_table', 230),
(466, '2022_05_09_125820_create_navbar_buttons_table', 232),
(467, '2021_06_07_000000_create_payku_transactions_table', 233),
(468, '2021_06_07_000001_create_payku_payments_table', 233),
(469, '2021_11_30_122831_create_jazzcash_transactions_table', 233),
(470, '2021_12_15_000000_add_new_columns_to_tables', 233),
(471, '2022_05_23_081324_create_product_specification_multi_values_table', 234),
(472, '2022_05_23_091527_create_product_selected_specification_multi_values_table', 235),
(475, '2022_05_23_151601_add_product_delivery_fee_column_to_sales_table', 236),
(476, '2022_04_18_103856_create_forums_table', 237),
(477, '2022_04_18_152201_create_forum_topics_table', 237),
(478, '2022_04_18_152845_create_forum_topic_attachments_table', 237),
(479, '2022_04_19_071911_create_forum_topic_posts_table', 237),
(480, '2022_04_19_123745_create_forum_topic_reports_table', 237),
(481, '2022_04_19_135314_create_forum_topic_bookmarks_table', 237),
(482, '2022_04_19_152929_create_forum_topic_likes_table', 237),
(483, '2022_04_20_152756_create_forum_featured_topics_table', 237),
(484, '2022_04_21_054043_create_forum_recommended_topics_table', 237),
(485, '2022_04_21_054815_create_forum_recommended_topic_items_table', 237),
(486, '2022_05_26_085212_change_some_column_varchar_to_text', 238),
(487, '2022_05_27_142612_add_avarat_settings_to_users_table', 239),
(489, '2022_05_01_151107_add_manual_added_column_to_sales_table', 240),
(490, '2022_05_29_162315_create_delete_account_requests_table', 241),
(491, '2020_10_20_211927_create_users_metas_table', 242),
(492, '2022_05_31_133347_add_certificate_column_to_webinars_table', 243),
(494, '2022_05_31_165839_add_online_viewer_column_to_files_table', 244),
(495, '2022_06_08_071712_create_home_sections_table', 245),
(496, '2022_10_14_074434_add_reserve_meeting_id_to_sessions_table', 246),
(497, '2022_12_25_082946_add_logged_count_column_to_users_table', 247),
(498, '2022_12_26_064214_add_new_column_to_quizzes_table', 247),
(499, '2022_12_27_064800_add_column_url_to_categories_table', 247),
(500, '2023_01_02_085731_create_upcoming_courses_table', 248),
(501, '2023_01_09_065436_create_installments_table', 249),
(502, '2023_01_14_144421_create_installment_orders_table', 250),
(503, '2023_01_18_064141_create_floating_bars_table', 251),
(504, '2023_01_18_145605_create_cashback_rules_table', 252),
(505, '2023_01_21_075422_add_column_to_accounting_table', 253),
(506, '2023_01_24_141128_create_currencies_table', 254),
(507, '2023_01_25_090622_add_currency_column_to_users', 254),
(508, '2023_01_25_104531_edit_price_column_tables', 254),
(509, '2023_01_25_145647_add_column_to_payment_channels_table', 254),
(510, '2023_01_29_074044_create_installment_reminders_table', 255),
(511, '2023_02_06_135446_add_new_columns_to_special_offers_table', 256),
(512, '2023_02_07_141617_create_discount_bundles_table', 257),
(513, '2023_02_07_152101_add_new_columns_to_users_zoom_api_table', 258),
(514, '2023_02_08_140023_create_home_page_statistics_table', 259),
(515, '2023_02_11_135759_add_enable_waitlist_column_to_webinars_table', 260),
(516, '2023_02_11_144743_create_waitlists_table', 261),
(518, '2023_02_13_134648_create_offline_banks_table', 262),
(520, '2023_02_14_144003_create_user_banks_table', 263),
(523, '2023_02_15_140227_create_test_table', 264),
(524, '2023_02_15_151458_add_new_storage_to_files_table', 265),
(528, '2023_02_20_141047_create_gifts_table', 266),
(529, '2023_02_27_065823_add_enable_registration_bonus_to_users_table', 267),
(530, '2023_03_05_075231_add_installment_order_id_to_accounting_table', 267),
(531, '2023_03_08_095345_edit_payouts_table', 268),
(532, '2023_03_10_143238_edit_column_in_quizzes_table', 269),
(533, '2023_03_12_110714_edit_column_in_order_items_table', 270),
(534, '2023_03_13_120634_edit_price_column_in_promotions_table', 271),
(535, '2023_03_13_135747_add_price_column_to_installment_orders_table', 271),
(536, '2023_05_02_150757_create_selected_installments_table', 272),
(537, '2023_06_09_072812_create_forms_table', 273),
(538, '2023_06_09_084907_create_form_fields_table', 273),
(539, '2023_06_11_123736_create_form_submissions_table', 273),
(540, '2023_06_13_115235_create_user_form_fields_table', 273),
(541, '2019_08_19_000000_create_failed_jobs_table', 274),
(542, '2019_12_14_000001_create_personal_access_tokens_table', 274),
(543, '2023_08_13_145531_create_ai_content_templates_table', 274),
(544, '2023_08_17_065609_create_ai_contents_table', 274),
(545, '2023_09_12_102852_add_ai_content_limitation_column_to_users_table', 275),
(546, '2023_09_12_103623_add_ai_content_access_column_to_registration_packages_table', 275),
(547, '2023_08_22_141556_add_sales_count_column_to_webinars_table', 276),
(548, '2023_08_27_144854_create_related_courses_table', 276),
(549, '2023_09_02_152318_create_purchase_notifications_table', 276),
(550, '2023_09_13_164842_create_course_personal_notes_table', 276),
(551, '2023_09_18_172303_create_content_delete_requests_table', 276),
(552, '2023_09_19_155014_create_user_logs_table', 276),
(553, '2023_09_23_141534_create_ip_restrictions_table', 276),
(554, '2023_09_25_142632_create_product_badges_table', 276),
(555, '2023_09_30_141640_create_cart_discounts_table', 276),
(556, '2023_10_01_144952_create_abandoned_cart_rules_table', 276),
(557, '2023_10_17_154000_edit_files_table', 276),
(558, '2023_10_18_160122_create_blog_category_translations_table', 276),
(559, '2023_10_19_151449_edit_sections_table', 276),
(560, '2023_11_21_135049_create_course_learning_last_view_table', 276),
(561, '2023_12_24_124451_edit_certificate_template_translations_table', 276),
(562, '2023_12_24_124532_edit_certificate_template_translations_table', 276),
(563, '2024_02_04_142556_create_abandoned_cart_rule_users_groups_table', 276),
(564, '2024_02_04_143742_create_abandoned_cart_rule_specification_items_table', 276),
(565, '2024_02_19_141912_create_abandoned_cart_rule_histories_table', 276),
(566, '2024_02_28_436872_add_credentials_column_to_payment_channels_table', 276),
(567, '2024_02_28_469813_remove_settings_column_from_payment_channels_table', 276),
(568, '2023_07_11_165937_create_user_firebase_sessions', 277),
(569, '2024_04_24_085747_add_new_column_to_course_learning_last_views_table', 277),
(570, '2024_05_06_141610_create_user_commissions_table', 277),
(571, '2024_05_06_142505_remove_commission_column_from_tables', 277),
(572, '2024_05_11_122847_add_new_source_for_video_demo', 277),
(573, '2024_05_19_131041_add_certificate_column_to_bundles_table', 277),
(574, '2024_05_19_133542_add_bundle_to_certificates_table', 277);

INSERT INTO `notification_templates` (`id`, `title`, `template`) VALUES
(2, 'New badge awarded', '<p>You received [u.b.title]&nbsp;badge</p>'),
(3, 'User group change', '<p>Your user group changed to [u.g.title]</p>'),
(4, 'Course created', '<p>You created a new course&nbsp;with title [c.title]</p>'),
(5, 'Course approve', '<p>Your course with title [c.title] approved</p>'),
(6, 'Course rejection', '<p>Your course with title [c.title] rejected</p>'),
(7, 'New comment', '<p>[u.name] left a new comment for [c.title] course</p>'),
(8, 'New support message', '<p>[u.name] sent a new support message for [c.title]&nbsp;course</p>'),
(9, 'Support message replied', '<p>New reply in [c.title] course support message&nbsp;</p>'),
(10, 'New support for admin', '<p>New support ticket received with title [s.t.title]</p>'),
(11, 'Support ticket replied for admin', '<p>New reply in support ticket with title&nbsp;[s.t.title]</p>'),
(12, 'New financial document', '<p>&nbsp;New financial document submitted for [c.title] with type [f.d.type] with amount [amount]</p>'),
(13, 'Payout request', '<p>New payout request submitted with amount [payout.amount]</p>'),
(14, 'Payout processed', 'Your payout request with amount [payout.amount]&nbsp;&nbsp;proceed to [payout.account]'),
(15, 'New sales', '<p>Congratulations! New sale for [c.title]</p>'),
(16, 'New purchase', '<p>Congratulations! New purchase for [c.title]</p>'),
(17, 'Rating (Feedback)', '<p>New [rate.count] star feedback submitted for [c.title] by [student.name]</p>'),
(18, 'Offline payment request', '<p>The offline payment request with the amount [amount] submitted. It is under review and you will get informed by email.</p>'),
(19, 'Offline payment approved', '<p>Offline payment request with amount [amount]&nbsp;approved</p>'),
(20, 'Offline payment rejected', '<p>Offline payment request with amount [amount]&nbsp;rejected</p>'),
(21, 'New subscription plan', '<p>[s.p.name] subscription plan activated by [u.name]</p>'),
(22, 'New meeting', '<p>New meeting booked by [u.name] for [time.date] at [amount]</p>'),
(23, 'New meeting link', '<p>[instructor.name] defined the meeting link and you can join the meeting on [time.date] using the following link: [link]</p>'),
(24, 'Meeting reminder', '<p>You have a meeting on [time.date] please remember to join it on time.</p>'),
(25, 'Meeting finished', '<p>Your meeting finished with the following information</p><p>Instructor: [instructor.name]</p><p>Student: [student.name]</p><p>Meeting time: [time.date]</p>'),
(26, 'New contact message', '<p>New contact message received from [u.name] with title [c.u.title]</p><p><br></p>'),
(27, 'Live class reminder', '<p>Your live class session of the [c.title] will be conducted on [time.date]&nbsp;</p>'),
(28, 'Promotion plan', '<p>[p.p.name] promotion plan activated for [c.title] course</p>'),
(29, 'Promotion plan for admin', '<p>[p.p.name] promotion plan request submitted for [c.title]</p>'),
(30, 'Certificate achieved', '<p>You achieved a certificate for [c.title] course</p>'),
(31, 'Waiting quiz (Instructor)', '<p>[student.name] is waiting for [q.title] quiz result of the [c.title] course. Please review the quiz and submit the grade.</p>'),
(32, 'Waiting quiz result', '<p>Your [q.title] quiz of the [c.title] course rated by the instructor, and your quiz status is [q.result]</p>'),
(33, 'Product new sale', '<p>New sale for [p.title] product</p>'),
(34, 'Product new purchase', '<p>New purchase for [p.title] product</p>'),
(35, 'Product new comment', '<p>[u.name] left a new comment for [p.title] product</p>'),
(36, 'Product tracking code', '<p>[u.name] submitted tracking code for [p.title]</p>'),
(37, 'Product rating (Feedback)', '<p>[u.name] submitted a new [rate.count] stars rating for [p.title] product</p>'),
(38, 'Product received', '<p>[u.name] received [p.title] product.</p>'),
(39, 'Product out of stock', '<p>Your product [p.title] is out of stock</p>'),
(40, 'Assignment submission (Instructor)', '<p>[student.name] submitted an assignment for [c.title] course</p>'),
(41, 'Instructor message in assignment', '<p>[instructor.name] sent a message for [c.title] assignment</p>'),
(42, 'Assignment grade', '<p>Your assignment of [c.title] rated by [instructor.name] . Your grade is [assignment_grade]</p>'),
(43, 'User access to content', '<p>Your access to content is enabled.</p>'),
(44, 'Send post in topic', '<p>[u.name] sent a post in your topic with title [topic_title]&nbsp;</p>'),
(45, 'Blog post published (Instructor)', '<p>Your blog post with title [blog_title] published.</p>'),
(46, 'New comment for blog post (Instructor)', '<p>[u.name] leaft a new comment for your blog with title [blog_title]</p>'),
(47, 'Meeting reminder', '<p>You have a meeting on [time.date] with [instructor.name]</p>'),
(48, 'Subscription expiry reminder', '<p>Your subscription expires on [time.date]&nbsp;</p>'),
(49, 'Course forum new question', '<p>[u.name] registered a question in the [c.title]&nbsp;course forum.</p>'),
(50, 'New answer in course forum', '<p>[u.name] submitted an answer in the [c.title]&nbsp;course forum.</p>'),
(52, 'You received a gift', '<p>[u.name]&nbsp;sent you [gift_title] which is a [gift_type]&nbsp;as a gift with the following message: [gift_message]</p>'),
(53, 'Gift submitted successfully', '<p>Your gift request for [u.name]&nbsp;submitted successfully on [time.date]&nbsp;and the [gift_title] which is a [gift_type]&nbsp;at [amount]&nbsp;will be sent to the recipient on [time.date.2]&nbsp;with the following message: [gift_message]</p>'),
(54, 'Gift sent to recipient', '<p>We sent the gift request that you submitted on [time.date]&nbsp;for [u.name]. We sent [gift_title]&nbsp;which is a [gift_type]&nbsp;to the recipient with the following message on [time.date] . [gift_message]</p>'),
(55, 'Gift request submitted (Admin)', '<p>[u.name.2] submitted a gift request for [gift_title]&nbsp;which is a [gift_type]&nbsp;for [u.name]&nbsp;on [time.date]&nbsp;at [amount]&nbsp;and it will be sent to the recipient on [time.date.2]</p>'),
(56, 'Gift sent to recipient (Admin)', '<p>The system sent a [gift_title]&nbsp;which is a [gift_type]&nbsp;to [u.name]&nbsp;on [time.date.2]&nbsp;successfully. [u.name.2]&nbsp;submitted this request on [time.date]&nbsp;at [amount].</p>'),
(57, 'You have an upcoming installment', '<p>You have an installment for [installment_title] at [amount]&nbsp;on due date [time.date]</p>'),
(58, 'You have an unpaid installment', '<p>You have an installment for [installment_title]&nbsp;at [amount]&nbsp;for today. Please pay it as soon as possible.</p>'),
(59, 'You have an overdue installment', '<p>You have an overdue installment for [installment_title]&nbsp;at [amount]&nbsp;on due date [time.date].</p>'),
(60, 'Installment verification request approved', '<p>Your verification request for [installment_title]&nbsp;approved.</p>'),
(61, 'Installment verification request rejected', '<p>Your verification request for [installment_title]&nbsp;rejected.</p>'),
(62, 'Installment paid successfully', '<p>You paid [amount]&nbsp;for [installment_title]&nbsp;with due date [time.date]&nbsp;successfully.</p>'),
(63, 'Installment paid successfully (Admin)', '<p>[u.name] paid [amount]&nbsp;for [installment_title]&nbsp;with the due date [time.date]&nbsp;successfully.</p>'),
(64, 'Installment upfront amount paid', '<p>You paid [amount] as upfront for&nbsp;[installment_title].</p>'),
(65, 'Installment verification request submitted', '<p>We received your verification request for [installment_title]&nbsp;on [time.date]&nbsp;and the result will be informed to you soon.</p>'),
(66, 'Installment verification request submitted (Admin)', '<p>[u.name] submitted a verification request for [installment_title]&nbsp;on [time.date].</p>'),
(67, 'Installment request submitted', '<p>Your installment for [installment_title]&nbsp;at [amount]&nbsp;submitted successfully.</p>'),
(68, 'Installment request submitted (Admin)', '<p>[u.name] submitted an installment request for [installment_title]&nbsp;at [amount].</p>'),
(69, 'New upcoming course submitted', '<p>Your upcoming course [item_title]&nbsp;submitted successfully.</p>'),
(70, 'New upcoming course submitted (Admin)', '<p>[u.name] submitted an upcoming course with title [item_title].</p>'),
(71, 'Upcoming course approved', '<p>Your upcoming course [item_title]&nbsp;approved.</p>'),
(72, 'Upcoming course rejected', '<p>Your upcoming course [item_title] rejected.</p>'),
(73, 'Your upcoming course published', '<p>Your upcoming course [item_title]&nbsp;published.</p>'),
(74, 'Your upcoming course followed', '<p>[u.name] followed your upcoming course [item_title]</p>'),
(75, 'Upcoming course published and is accessible', '<p>The upcoming course [item_title] published now and you can check it.</p>'),
(76, 'You got cashback!', '<p>You got [amount]&nbsp;as cashback and this amount added to your account.</p>'),
(77, 'User got cashback (Admin)', '<p>[u.name] got [amount] as cashback and this amount charged to their account.</p>'),
(78, 'Bundle submitted successfully', '<p>Your bundle with the title [item_title]&nbsp;submitted successfully.</p>'),
(79, 'Bundle submitted (Admin)', '<p>[u.name] submitted a bundle with the title [item_title].</p>'),
(80, 'Bundle published successfully', '<p>Your bundle with title [item_title]&nbsp;published successfully.</p>'),
(81, 'Bundle rejected', '<p>Your bundle with title [item_title]&nbsp;rejected.</p>'),
(82, 'New review for your bundle', '<p>[u.name] submitted a [rate.count] star rating for your bundle [item_title].</p>'),
(83, 'You got registration bonus', '<p>You got [amount]&nbsp;as registration bonus.</p>'),
(84, 'Registration bonus unlocked', '<p>Your registration bonus [amount]&nbsp;unlocked. Happy with spending...</p>'),
(85, 'Registration bonus unlocked (Admin)', '<p>The registration bonus [amount] unlocked for [u.name].</p>'),
(86, 'SaaS package activated successfully', '<p>[item_title] activated for you until [time.date].</p>'),
(87, 'SaaS package activated (Admin)', '<p>[u.name] activated [item_title]&nbsp;registration plan until [time.date].</p>'),
(88, 'Your contact message submitted', '<p>We received your contact message with the subject [c.u.title]&nbsp;on [time.date].</p>'),
(89, 'New contact message received', '<p>New contact message received from [u.name] with subject [c.u.title] with message [c.u.message]</p>'),
(90, 'You submitted to waitlist', '<p>You submitted to [c.title]&nbsp;waitlist.</p>'),
(91, 'User submitted in waitlist', '<p>[u.name] submitted to [c.title]&nbsp;waitlist.</p>'),
(92, 'New user registered with your affiliate code', '<p>[u.name] registered with your affiliate code on [time.date].</p>'),
(93, 'New quiz added to course', '<p>New quiz with the title [q.title]&nbsp;added to the course [c.title].</p>'),
(94, 'New reward point', '<p>You collected [points]&nbsp;for [item_title]&nbsp;on [time.date]</p>'),
(95, 'New notice', '<p>You got a new notice with title [c.title]&nbsp;on [time.date]</p>'),
(96, 'New course notice', '<p>You got a new course notice for [c.title]&nbsp;with title [item_title]</p>'),
(97, 'Your user role changed', '<p>Your user role changed to [u.role]</p>'),
(98, 'New user group', '<p>You added to [u.g.title] user group.</p>'),
(99, 'Become instructor/organization request approved', '<p>Your become instructor/organization request is approved.</p>'),
(100, 'Become instructor/organization request rejected', '<p>Your instructor/organization request rejected</p>'),
(101, 'New question in course forum', '<p>[u.name] posted a new question in [c.title] forum.</p>'),
(102, 'New answer in course forum', '<p>[u.name] posted a new answer in [c.title] forum.</p>'),
(103, 'Live meeting created', '<p>[instructor.name] started a new live meeting. Please login to your account and join it now...</p>'),
(104, 'New user registered', '<p>[u.name] registered on the platform on [time.date]&nbsp;as [u.role]</p>'),
(105, 'New instructor/organization request', '<p>[u.name] submitted a user role change request on [time.date]</p>'),
(106, 'New course enrollment', '<p>[u.name] enrolled in [c.title]&nbsp;on [time.date]&nbsp;at [amount]</p>'),
(107, 'New forum topic', '<p>[u.name] created a new topic with title [topic_title]&nbsp;in [forum_title]&nbsp;forum.</p>'),
(108, 'New report', '<p>[u.name] reported a content for revising.</p>'),
(109, 'New item created', '<p>[u.name] created a new item with title [item_title]</p>'),
(110, 'New store order', '<p>New store order received from [u.name]&nbsp;at [amount]</p>'),
(111, 'Subscription plan activated', '<p>[u.name] purchased [s.p.name]&nbsp;at [amount]</p>'),
(112, 'Content review request', '<p>[u.name] sent a review request for [item_title]</p>'),
(113, 'New user blog post', '<p>[u.name] submitted a blog article with title [blog_title]</p>'),
(114, 'New item review (Rating)', '<p>[u.name] submitted a new rate for [item_title]</p>'),
(115, 'New organization user', '<p>[organization.name] submitted [u.name]&nbsp;as new [u.role]</p>'),
(116, 'User wallet charge', '<p>[u.name] charged their wallet for [amount]</p>'),
(117, 'New payout request', '<p>[u.name] submitted a new payout request at [amount]</p>'),
(118, 'New offline payment request', '<p>[u.name] submitted a new offline payment request at [amount]</p>'),
(119, 'Content access approval', '<p>Your content access request approved. You can access all courses now...</p>'),
(120, 'Form submission by user', '<p>[u.name] submitted form [form_title]</p>'),
(121, 'Cart reminder', '<div>We\'re excited to invite you to complete your purchase with us! Enjoy exclusive benefits and offers by finalizing your order now.</div>'),
(122, 'Complete your purchase today with discount!', '<div>Here\'s an exclusive [discount_amount] discount coupon to encourage you to finalize your purchase with us. Discount Code : [discount_code]</div>');

INSERT INTO `notifications` (`id`, `user_id`, `sender_id`, `group_id`, `webinar_id`, `title`, `message`, `sender`, `type`, `created_at`) VALUES
(1, 1016, NULL, NULL, NULL, 'Course created', '<p>you create new course&nbsp;with Title Sample Course</p>', 'system', 'single', 1656669533),
(2, 1016, NULL, NULL, NULL, 'Course approve', '<p>your course with title Sample Course approved</p>', 'system', 'single', 1656669564),
(2232, 1, NULL, NULL, NULL, 'New user registered', '<p>akhil jinu registered on the platform on 18 Jul 2024 12:53&nbsp;as Student</p>', 'system', 'single', 1721321580),
(2233, 1, NULL, NULL, NULL, 'New user registered', '<p>akhil jinu registered on the platform on 18 Jul 2024 12:53&nbsp;as Student</p>', 'system', 'single', 1721321616),
(2234, 1016, NULL, NULL, NULL, 'Course created', '<p>You created a new course&nbsp;with title Sample Course</p>', 'system', 'single', 1721322574),
(2235, 1016, NULL, NULL, NULL, 'Course created', '<p>You created a new course&nbsp;with title Sample Course</p>', 'system', 'single', 1721322598),
(2236, 1016, NULL, NULL, NULL, 'Course created', '<p>You created a new course&nbsp;with title Sample Course</p>', 'system', 'single', 1721326107),
(2237, 1, NULL, NULL, NULL, 'Content review request', '<p>Ricardo dave sent a review request for Sample Course</p>', 'system', 'single', 1721326107),
(2238, 1016, NULL, NULL, NULL, 'Course created', '<p>You created a new course&nbsp;with title Sample Course</p>', 'system', 'single', 1721326194),
(2239, 1, NULL, NULL, NULL, 'Content review request', '<p>Ricardo dave sent a review request for Sample Course</p>', 'system', 'single', 1721326194),
(2240, 1, NULL, NULL, NULL, 'New item created', '<p>Ricardo dave created a new item with title New</p>', 'system', 'single', 1721326810),
(2241, 1, NULL, NULL, NULL, 'New user registered', '<p>T.P.Akhil Jinu registered on the platform on 19 Jul 2024 12:07 am&nbsp;as Student</p>', 'system', 'single', 1721327877),
(2242, 1, NULL, NULL, NULL, 'New course enrollment', '<p>akhil jinu enrolled in Sample Course&nbsp;on 18 Jul 2024 02:51 pm&nbsp;at Free</p>', 'system', 'single', 1721328706);

INSERT INTO `offline_bank_specification_translations` (`id`, `offline_bank_specification_id`, `locale`, `name`) VALUES
(20, 17, 'en', 'Card ID'),
(21, 18, 'en', 'Account ID'),
(22, 19, 'en', 'IBAN'),
(23, 20, 'en', 'Account Holder'),
(24, 21, 'en', 'IBAN'),
(25, 22, 'en', 'Card Number'),
(26, 23, 'en', 'Card Number'),
(27, 24, 'en', 'Account ID'),
(28, 25, 'en', 'IBAN');

INSERT INTO `offline_bank_specifications` (`id`, `offline_bank_id`, `value`) VALUES
(17, 6, '2578-4910-3682-6288'),
(18, 6, '38152294372'),
(19, 6, 'QA66QUWW934528129454345775226'),
(20, 7, 'Rocket LMS'),
(21, 7, 'NL37ABNA2423554788'),
(22, 7, '5012-4518-1772-8911'),
(23, 8, '6282-4518-1237-7641'),
(24, 8, '56238341127'),
(25, 8, 'IN37ABNA2422193788');

INSERT INTO `offline_bank_translations` (`id`, `offline_bank_id`, `locale`, `title`) VALUES
(7, 6, 'en', 'Qatar National Bank'),
(8, 7, 'en', 'JPMorgan'),
(9, 8, 'en', 'State Bank of India');

INSERT INTO `offline_banks` (`id`, `logo`, `created_at`) VALUES
(6, '/store/1/default_images/offline_payments/Qatar National Bank.png', 1678951755),
(7, '/store/1/default_images/offline_payments/jpmorgan.png', 1679089716),
(8, '/store/1/default_images/offline_payments/State Bank of India.png', 1679090036);

INSERT INTO `order_items` (`id`, `user_id`, `order_id`, `webinar_id`, `bundle_id`, `subscribe_id`, `promotion_id`, `gift_id`, `registration_package_id`, `product_id`, `product_order_id`, `installment_payment_id`, `reserve_meeting_id`, `ticket_id`, `discount_id`, `become_instructor_id`, `amount`, `tax`, `tax_price`, `commission`, `commission_price`, `discount`, `total_amount`, `product_delivery_fee`, `created_at`) VALUES
(708, 1047, 710, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, 26, NULL, 364.00, 10, 36.40, 30, 109.20, 364.00, 36.40, 0.00, 1721328618),
(709, 1047, 711, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, 26, NULL, 364.00, 10, 36.40, 30, 109.20, 364.00, 36.40, 0.00, 1721328640),
(710, 1047, 712, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, 26, NULL, 364.00, 10, 36.40, 30, 109.20, 364.00, 36.40, 0.00, 1721328650);

INSERT INTO `orders` (`id`, `user_id`, `status`, `payment_method`, `is_charge_account`, `amount`, `tax`, `total_discount`, `total_amount`, `product_delivery_fee`, `reference_id`, `payment_data`, `created_at`) VALUES
(710, 1047, 'pending', NULL, 0, 364.00, 36.40, 364.00, 36.40, 0.00, NULL, NULL, 1721328618),
(711, 1047, 'pending', NULL, 0, 364.00, 36.40, 364.00, 36.40, 0.00, NULL, NULL, 1721328640),
(712, 1047, 'pending', 'payment_channel', 0, 364.00, 36.40, 364.00, 36.40, 0.00, NULL, NULL, 1721328650);

INSERT INTO `pages` (`id`, `link`, `name`, `robot`, `status`, `created_at`) VALUES
(3, '/about', 'About', 1, 'publish', 1609088468),
(5, '/terms', 'Terms & rules', 1, 'publish', 1646409295),
(6, '/reward_points_system', 'Reward Points System', 1, 'publish', 1646398467);

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('av18981848@gmail.com', 'cYTtJLR86NoxZ0whf465XoQa98hhxAxx2Q7t3zeaeTJRYoUMQwqqzb4rgqP2', '2021-02-20 21:35:13');

INSERT INTO `payment_channels` (`id`, `title`, `class_name`, `status`, `image`, `credentials`, `currencies`, `created_at`) VALUES
(19, 'Paypal', 'Paypal', 'active', '/store/1/default_images/payment gateways/paypal.png', NULL, '[\"USD\",\"EUR\"]', '1654755044'),
(23, 'Payu', 'Payu', 'active', '/store/1/default_images/payment gateways/payu.png', NULL, '[\"USD\",\"EUR\",\"INR\"]', '1654755044'),
(24, 'Razorpay', 'Razorpay', 'active', '/store/1/default_images/payment gateways/razorpay.png', NULL, '[\"USD\",\"EUR\"]', '1654755044');

INSERT INTO `permissions` (`id`, `role_id`, `section_id`, `allow`) VALUES
(17455, 3, 100001, 1),
(17456, 3, 100002, 1),
(17457, 3, 100003, 1),
(17458, 3, 100004, 1),
(17459, 3, 100005, 1),
(17460, 3, 100010, 1),
(17461, 3, 100011, 1),
(17462, 3, 100012, 1),
(17463, 3, 100013, 1),
(17464, 3, 100014, 1),
(17465, 3, 100020, 1),
(17466, 3, 100021, 1),
(17467, 3, 100022, 1),
(17468, 3, 100023, 1),
(17469, 3, 100024, 1),
(17470, 3, 100025, 1),
(17471, 3, 100026, 1),
(17472, 3, 100027, 1),
(17473, 3, 100028, 1),
(17474, 3, 100029, 1),
(17475, 3, 100030, 1),
(17476, 3, 100031, 1),
(17477, 3, 100032, 1),
(17478, 3, 100033, 1),
(17479, 3, 100034, 1),
(17480, 3, 100035, 1),
(17481, 3, 100040, 1),
(17482, 3, 100041, 1),
(17483, 3, 100042, 1),
(17484, 3, 100043, 1),
(17485, 3, 100044, 1),
(17486, 3, 100045, 1),
(17487, 3, 100050, 1),
(17488, 3, 100051, 1),
(17489, 3, 100052, 1),
(17490, 3, 100053, 1),
(17491, 3, 100054, 1),
(17492, 3, 100055, 1),
(17493, 3, 100060, 1),
(17494, 3, 100061, 1),
(17495, 3, 100062, 1),
(17496, 3, 100063, 1),
(17497, 3, 100070, 1),
(17498, 3, 100071, 1),
(17499, 3, 100072, 1),
(17500, 3, 100073, 1),
(17501, 3, 100080, 1),
(17502, 3, 100081, 1),
(17503, 3, 100082, 1),
(17504, 3, 100083, 1),
(17505, 3, 100084, 1),
(17506, 3, 100085, 1),
(17507, 3, 100086, 1),
(17508, 3, 100090, 1),
(17509, 3, 100091, 1),
(17510, 3, 100092, 1),
(17511, 3, 100093, 1),
(17512, 3, 100100, 1),
(17513, 3, 100101, 1),
(17514, 3, 100102, 1),
(17515, 3, 100103, 1),
(17516, 3, 100104, 1),
(17517, 3, 100105, 1),
(17518, 3, 100106, 1),
(17519, 3, 100107, 1),
(17520, 3, 100120, 1),
(17521, 3, 100121, 1),
(17522, 3, 100122, 1),
(17523, 3, 100123, 1),
(17524, 3, 100124, 1),
(17525, 3, 100125, 1),
(17526, 3, 100126, 1),
(17527, 3, 100127, 1),
(17528, 3, 100140, 1),
(17529, 3, 100141, 1),
(17530, 3, 100142, 1),
(17531, 3, 100143, 1),
(17532, 3, 100160, 1),
(17533, 3, 100161, 1),
(17534, 3, 100162, 1),
(17535, 3, 100163, 1),
(17536, 3, 100164, 1),
(17537, 3, 100165, 1),
(17538, 3, 100166, 1),
(17539, 3, 100167, 1),
(17540, 3, 100180, 1),
(17541, 3, 100181, 1),
(17542, 3, 100182, 1),
(17543, 3, 100183, 1),
(17544, 3, 100184, 1),
(17545, 3, 100200, 1),
(17546, 3, 100201, 1),
(17547, 3, 100202, 1),
(17548, 3, 100203, 1),
(17549, 3, 100204, 1),
(17550, 3, 100220, 1),
(17551, 3, 100221, 1),
(17552, 3, 100222, 1),
(17553, 3, 100223, 1),
(17554, 3, 100224, 1),
(17555, 3, 100225, 1),
(17556, 3, 100240, 1),
(17557, 3, 100241, 1),
(17558, 3, 100260, 1),
(17559, 3, 100261, 1),
(17560, 3, 100280, 1),
(17561, 3, 100281, 1),
(17562, 3, 100300, 1),
(17563, 3, 100301, 1),
(17564, 3, 100302, 1),
(17565, 3, 100303, 1),
(17566, 1, 100001, 1),
(17567, 1, 100002, 1),
(17568, 1, 100003, 1),
(17569, 1, 100004, 1),
(17570, 1, 100005, 1),
(17571, 1, 100010, 1),
(17572, 1, 100011, 1),
(17573, 1, 100012, 1),
(17574, 1, 100013, 1),
(17575, 1, 100014, 1),
(17576, 1, 100020, 1),
(17577, 1, 100021, 1),
(17578, 1, 100022, 1),
(17579, 1, 100023, 1),
(17580, 1, 100024, 1),
(17581, 1, 100025, 1),
(17582, 1, 100026, 1),
(17583, 1, 100027, 1),
(17584, 1, 100028, 1),
(17585, 1, 100029, 1),
(17586, 1, 100030, 1),
(17587, 1, 100031, 1),
(17588, 1, 100032, 1),
(17589, 1, 100033, 1),
(17590, 1, 100034, 1),
(17591, 1, 100035, 1),
(17592, 1, 100040, 1),
(17593, 1, 100041, 1),
(17594, 1, 100042, 1),
(17595, 1, 100043, 1),
(17596, 1, 100044, 1),
(17597, 1, 100045, 1),
(17598, 1, 100050, 1),
(17599, 1, 100051, 1),
(17600, 1, 100052, 1),
(17601, 1, 100053, 1),
(17602, 1, 100054, 1),
(17603, 1, 100055, 1),
(17604, 1, 100060, 1),
(17605, 1, 100061, 1),
(17606, 1, 100062, 1),
(17607, 1, 100063, 1),
(17608, 1, 100070, 1),
(17609, 1, 100071, 1),
(17610, 1, 100072, 1),
(17611, 1, 100073, 1),
(17612, 1, 100080, 1),
(17613, 1, 100081, 1),
(17614, 1, 100082, 1),
(17615, 1, 100083, 1),
(17616, 1, 100084, 1),
(17617, 1, 100085, 1),
(17618, 1, 100086, 1),
(17619, 1, 100090, 1),
(17620, 1, 100091, 1),
(17621, 1, 100092, 1),
(17622, 1, 100093, 1),
(17623, 1, 100100, 1),
(17624, 1, 100101, 1),
(17625, 1, 100102, 1),
(17626, 1, 100103, 1),
(17627, 1, 100104, 1),
(17628, 1, 100105, 1),
(17629, 1, 100106, 1),
(17630, 1, 100107, 1),
(17631, 1, 100120, 1),
(17632, 1, 100121, 1),
(17633, 1, 100122, 1),
(17634, 1, 100123, 1),
(17635, 1, 100124, 1),
(17636, 1, 100125, 1),
(17637, 1, 100126, 1),
(17638, 1, 100127, 1),
(17639, 1, 100140, 1),
(17640, 1, 100141, 1),
(17641, 1, 100142, 1),
(17642, 1, 100143, 1),
(17643, 1, 100160, 1),
(17644, 1, 100161, 1),
(17645, 1, 100162, 1),
(17646, 1, 100163, 1),
(17647, 1, 100164, 1),
(17648, 1, 100165, 1),
(17649, 1, 100166, 1),
(17650, 1, 100167, 1),
(17651, 1, 100180, 1),
(17652, 1, 100181, 1),
(17653, 1, 100182, 1),
(17654, 1, 100183, 1),
(17655, 1, 100184, 1),
(17656, 1, 100200, 1),
(17657, 1, 100201, 1),
(17658, 1, 100202, 1),
(17659, 1, 100203, 1),
(17660, 1, 100204, 1),
(17661, 1, 100220, 1),
(17662, 1, 100221, 1),
(17663, 1, 100222, 1),
(17664, 1, 100223, 1),
(17665, 1, 100224, 1),
(17666, 1, 100225, 1),
(17667, 1, 100240, 1),
(17668, 1, 100241, 1),
(17669, 1, 100260, 1),
(17670, 1, 100261, 1),
(17671, 1, 100280, 1),
(17672, 1, 100281, 1),
(17673, 1, 100300, 1),
(17674, 1, 100301, 1),
(17675, 1, 100302, 1),
(17676, 1, 100303, 1),
(17677, 6, 1, 1),
(17678, 6, 2, 1),
(17679, 6, 3, 1),
(17680, 6, 4, 1),
(17681, 6, 5, 1),
(17682, 6, 6, 1),
(17683, 6, 7, 1),
(17684, 6, 8, 1),
(17685, 6, 9, 1),
(17686, 6, 10, 1),
(17687, 6, 11, 1),
(17688, 6, 12, 1),
(17689, 6, 13, 1),
(17690, 6, 14, 1),
(17691, 6, 15, 1),
(17692, 6, 16, 1),
(17693, 6, 17, 1),
(17694, 6, 700, 1),
(17695, 6, 701, 1),
(17696, 6, 702, 1),
(17697, 6, 703, 1),
(17698, 6, 704, 1),
(17699, 6, 705, 1),
(17700, 6, 706, 1),
(17701, 6, 707, 1),
(17702, 6, 708, 1),
(17703, 4, 100001, 1),
(17704, 4, 100002, 1),
(17705, 4, 100003, 1),
(17706, 4, 100004, 1),
(17707, 4, 100005, 1),
(17708, 4, 100010, 1),
(17709, 4, 100011, 1),
(17710, 4, 100012, 1),
(17711, 4, 100013, 1),
(17712, 4, 100014, 1),
(17713, 4, 100020, 1),
(17714, 4, 100021, 1),
(17715, 4, 100022, 1),
(17716, 4, 100023, 1),
(17717, 4, 100024, 1),
(17718, 4, 100025, 1),
(17719, 4, 100026, 1),
(17720, 4, 100027, 1),
(17721, 4, 100028, 1),
(17722, 4, 100029, 1),
(17723, 4, 100030, 1),
(17724, 4, 100031, 1),
(17725, 4, 100032, 1),
(17726, 4, 100033, 1),
(17727, 4, 100034, 1),
(17728, 4, 100035, 1),
(17729, 4, 100040, 1),
(17730, 4, 100041, 1),
(17731, 4, 100042, 1),
(17732, 4, 100043, 1),
(17733, 4, 100044, 1),
(17734, 4, 100045, 1),
(17735, 4, 100050, 1),
(17736, 4, 100051, 1),
(17737, 4, 100052, 1),
(17738, 4, 100053, 1),
(17739, 4, 100054, 1),
(17740, 4, 100055, 1),
(17741, 4, 100060, 1),
(17742, 4, 100061, 1),
(17743, 4, 100062, 1),
(17744, 4, 100063, 1),
(17745, 4, 100070, 1),
(17746, 4, 100071, 1),
(17747, 4, 100072, 1),
(17748, 4, 100073, 1),
(17749, 4, 100080, 1),
(17750, 4, 100081, 1),
(17751, 4, 100082, 1),
(17752, 4, 100083, 1),
(17753, 4, 100084, 1),
(17754, 4, 100085, 1),
(17755, 4, 100086, 1),
(17756, 4, 100090, 1),
(17757, 4, 100091, 1),
(17758, 4, 100092, 1),
(17759, 4, 100093, 1),
(17760, 4, 100100, 1),
(17761, 4, 100101, 1),
(17762, 4, 100102, 1),
(17763, 4, 100103, 1),
(17764, 4, 100104, 1),
(17765, 4, 100105, 1),
(17766, 4, 100106, 1),
(17767, 4, 100107, 1),
(17768, 4, 100120, 1),
(17769, 4, 100121, 1),
(17770, 4, 100122, 1),
(17771, 4, 100123, 1),
(17772, 4, 100124, 1),
(17773, 4, 100125, 1),
(17774, 4, 100126, 1),
(17775, 4, 100127, 1),
(17776, 4, 100140, 1),
(17777, 4, 100141, 1),
(17778, 4, 100142, 1),
(17779, 4, 100143, 1),
(17780, 4, 100160, 1),
(17781, 4, 100161, 1),
(17782, 4, 100162, 1),
(17783, 4, 100163, 1),
(17784, 4, 100164, 1),
(17785, 4, 100165, 1),
(17786, 4, 100166, 1),
(17787, 4, 100167, 1),
(17788, 4, 100180, 1),
(17789, 4, 100181, 1),
(17790, 4, 100182, 1),
(17791, 4, 100183, 1),
(17792, 4, 100184, 1),
(17793, 4, 100200, 1),
(17794, 4, 100201, 1),
(17795, 4, 100202, 1),
(17796, 4, 100203, 1),
(17797, 4, 100204, 1),
(17798, 4, 100220, 1),
(17799, 4, 100221, 1),
(17800, 4, 100222, 1),
(17801, 4, 100223, 1),
(17802, 4, 100224, 1),
(17803, 4, 100225, 1),
(17804, 4, 100240, 1),
(17805, 4, 100241, 1),
(17806, 4, 100260, 1),
(17807, 4, 100261, 1),
(17808, 4, 100280, 1),
(17809, 4, 100281, 1),
(17810, 4, 100300, 1),
(17811, 4, 100301, 1),
(17812, 4, 100302, 1),
(17813, 4, 100303, 1),
(17814, 2, 1, 1),
(17815, 2, 2, 1),
(17816, 2, 3, 1),
(17817, 2, 4, 1),
(17818, 2, 5, 1),
(17819, 2, 6, 1),
(17820, 2, 7, 1),
(17821, 2, 8, 1),
(17822, 2, 9, 1),
(17823, 2, 10, 1),
(17824, 2, 11, 1),
(17825, 2, 12, 1),
(17826, 2, 13, 1),
(17827, 2, 14, 1),
(17828, 2, 15, 1),
(17829, 2, 16, 1),
(17830, 2, 17, 1),
(17831, 2, 25, 1),
(17832, 2, 26, 1),
(17833, 2, 50, 1),
(17834, 2, 51, 1),
(17835, 2, 52, 1),
(17836, 2, 53, 1),
(17837, 2, 54, 1),
(17838, 2, 100, 1),
(17839, 2, 101, 1),
(17840, 2, 102, 1),
(17841, 2, 103, 1),
(17842, 2, 104, 1),
(17843, 2, 105, 1),
(17844, 2, 106, 1),
(17845, 2, 107, 1),
(17846, 2, 108, 1),
(17847, 2, 109, 1),
(17848, 2, 110, 1),
(17849, 2, 111, 1),
(17850, 2, 112, 1),
(17851, 2, 113, 1),
(17852, 2, 114, 1),
(17853, 2, 115, 1),
(17854, 2, 116, 1),
(17855, 2, 117, 1),
(17856, 2, 150, 1),
(17857, 2, 151, 1),
(17858, 2, 152, 1),
(17859, 2, 153, 1),
(17860, 2, 154, 1),
(17861, 2, 155, 1),
(17862, 2, 156, 1),
(17863, 2, 157, 1),
(17864, 2, 158, 1),
(17865, 2, 159, 1),
(17866, 2, 160, 1),
(17867, 2, 161, 1),
(17868, 2, 162, 1),
(17869, 2, 163, 1),
(17870, 2, 164, 1),
(17871, 2, 165, 1),
(17872, 2, 166, 1),
(17873, 2, 167, 1),
(17874, 2, 200, 1),
(17875, 2, 201, 1),
(17876, 2, 202, 1),
(17877, 2, 203, 1),
(17878, 2, 204, 1),
(17879, 2, 205, 1),
(17880, 2, 206, 1),
(17881, 2, 207, 1),
(17882, 2, 208, 1),
(17883, 2, 250, 1),
(17884, 2, 251, 1),
(17885, 2, 252, 1),
(17886, 2, 253, 1),
(17887, 2, 254, 1),
(17888, 2, 300, 1),
(17889, 2, 301, 1),
(17890, 2, 302, 1),
(17891, 2, 303, 1),
(17892, 2, 304, 1),
(17893, 2, 350, 1),
(17894, 2, 351, 1),
(17895, 2, 352, 1),
(17896, 2, 353, 1),
(17897, 2, 354, 1),
(17898, 2, 355, 1),
(17899, 2, 356, 1),
(17900, 2, 357, 1),
(17901, 2, 400, 1),
(17902, 2, 401, 1),
(17903, 2, 402, 1),
(17904, 2, 403, 1),
(17905, 2, 404, 1),
(17906, 2, 405, 1),
(17907, 2, 450, 1),
(17908, 2, 451, 1),
(17909, 2, 452, 1),
(17910, 2, 453, 1),
(17911, 2, 454, 1),
(17912, 2, 455, 1),
(17913, 2, 456, 1),
(17914, 2, 457, 1),
(17915, 2, 458, 1),
(17916, 2, 459, 1),
(17917, 2, 460, 1),
(17918, 2, 461, 1),
(17919, 2, 500, 1),
(17920, 2, 501, 1),
(17921, 2, 502, 1),
(17922, 2, 503, 1),
(17923, 2, 504, 1),
(17924, 2, 505, 1),
(17925, 2, 550, 1),
(17926, 2, 551, 1),
(17927, 2, 552, 1),
(17928, 2, 553, 1),
(17929, 2, 554, 1),
(17930, 2, 555, 1),
(17931, 2, 600, 1),
(17932, 2, 601, 1),
(17933, 2, 602, 1),
(17934, 2, 603, 1),
(17935, 2, 650, 1),
(17936, 2, 651, 1),
(17937, 2, 652, 1),
(17938, 2, 653, 1),
(17939, 2, 654, 1),
(17940, 2, 655, 1),
(17941, 2, 656, 1),
(17942, 2, 657, 1),
(17943, 2, 658, 1),
(17944, 2, 700, 1),
(17945, 2, 701, 1),
(17946, 2, 702, 1),
(17947, 2, 703, 1),
(17948, 2, 704, 1),
(17949, 2, 705, 1),
(17950, 2, 706, 1),
(17951, 2, 707, 1),
(17952, 2, 708, 1),
(17953, 2, 750, 1),
(17954, 2, 751, 1);

INSERT INTO `permissions` (`id`, `role_id`, `section_id`, `allow`) VALUES
(17955, 2, 752, 1),
(17956, 2, 753, 1),
(17957, 2, 754, 1),
(17958, 2, 800, 1),
(17959, 2, 801, 1),
(17960, 2, 802, 1),
(17961, 2, 803, 1),
(17962, 2, 850, 1),
(17963, 2, 851, 1),
(17964, 2, 852, 1),
(17965, 2, 853, 1),
(17966, 2, 854, 1),
(17967, 2, 900, 1),
(17968, 2, 901, 1),
(17969, 2, 902, 1),
(17970, 2, 903, 1),
(17971, 2, 904, 1),
(17972, 2, 950, 1),
(17973, 2, 951, 1),
(17974, 2, 952, 1),
(17975, 2, 953, 1),
(17976, 2, 954, 1),
(17977, 2, 955, 1),
(17978, 2, 956, 1),
(17979, 2, 957, 1),
(17980, 2, 958, 1),
(17981, 2, 959, 1),
(17982, 2, 1000, 1),
(17983, 2, 1001, 1),
(17984, 2, 1002, 1),
(17985, 2, 1003, 1),
(17986, 2, 1004, 1),
(17987, 2, 1050, 1),
(17988, 2, 1051, 1),
(17989, 2, 1052, 1),
(17990, 2, 1053, 1),
(17991, 2, 1054, 1),
(17992, 2, 1055, 1),
(17993, 2, 1056, 1),
(17994, 2, 1057, 1),
(17995, 2, 1058, 1),
(17996, 2, 1059, 1),
(17997, 2, 1060, 1),
(17998, 2, 1075, 1),
(17999, 2, 1076, 1),
(18000, 2, 1077, 1),
(18001, 2, 1078, 1),
(18002, 2, 1079, 1),
(18003, 2, 1080, 1),
(18004, 2, 1081, 1),
(18005, 2, 1082, 1),
(18006, 2, 1083, 1),
(18007, 2, 1100, 1),
(18008, 2, 1101, 1),
(18009, 2, 1102, 1),
(18010, 2, 1103, 1),
(18011, 2, 1104, 1),
(18012, 2, 1150, 1),
(18013, 2, 1151, 1),
(18014, 2, 1152, 1),
(18015, 2, 1153, 1),
(18016, 2, 1154, 1),
(18017, 2, 1200, 1),
(18018, 2, 1201, 1),
(18019, 2, 1202, 1),
(18020, 2, 1203, 1),
(18021, 2, 1204, 1),
(18022, 2, 1230, 1),
(18023, 2, 1231, 1),
(18024, 2, 1232, 1),
(18025, 2, 1233, 1),
(18026, 2, 1234, 1),
(18027, 2, 1235, 1),
(18028, 2, 1250, 1),
(18029, 2, 1251, 1),
(18030, 2, 1252, 1),
(18031, 2, 1253, 1),
(18032, 2, 1300, 1),
(18033, 2, 1301, 1),
(18034, 2, 1302, 1),
(18035, 2, 1303, 1),
(18036, 2, 1304, 1),
(18037, 2, 1305, 1),
(18038, 2, 1350, 1),
(18039, 2, 1351, 1),
(18040, 2, 1352, 1),
(18041, 2, 1353, 1),
(18042, 2, 1354, 1),
(18043, 2, 1355, 1),
(18044, 2, 1400, 1),
(18045, 2, 1401, 1),
(18046, 2, 1402, 1),
(18047, 2, 1403, 1),
(18048, 2, 1404, 1),
(18049, 2, 1405, 1),
(18050, 2, 1406, 1),
(18051, 2, 1407, 1),
(18052, 2, 1408, 1),
(18053, 2, 1409, 1),
(18054, 2, 1450, 1),
(18055, 2, 1451, 1),
(18056, 2, 1452, 1),
(18057, 2, 1453, 1),
(18058, 2, 1454, 1),
(18059, 2, 1455, 1),
(18060, 2, 1456, 1),
(18061, 2, 1457, 1),
(18062, 2, 1500, 1),
(18063, 2, 1501, 1),
(18064, 2, 1502, 1),
(18065, 2, 1503, 1),
(18066, 2, 1504, 1),
(18067, 2, 1550, 1),
(18068, 2, 1551, 1),
(18069, 2, 1552, 1),
(18070, 2, 1553, 1),
(18071, 2, 1554, 1),
(18072, 2, 1600, 1),
(18073, 2, 1601, 1),
(18074, 2, 1602, 1),
(18075, 2, 1603, 1),
(18076, 2, 1604, 1),
(18077, 2, 1605, 1),
(18078, 2, 1650, 1),
(18079, 2, 1651, 1),
(18080, 2, 1652, 1),
(18081, 2, 1675, 1),
(18082, 2, 1676, 1),
(18083, 2, 1677, 1),
(18084, 2, 1678, 1),
(18085, 2, 1725, 1),
(18086, 2, 1726, 1),
(18087, 2, 1727, 1),
(18088, 2, 1728, 1),
(18089, 2, 1729, 1),
(18090, 2, 1730, 1),
(18091, 2, 1731, 1),
(18092, 2, 1732, 1),
(18093, 2, 1750, 1),
(18094, 2, 1751, 1),
(18095, 2, 1752, 1),
(18096, 2, 1753, 1),
(18097, 2, 1754, 1),
(18098, 2, 1775, 1),
(18099, 2, 1776, 1),
(18100, 2, 1777, 1),
(18101, 2, 1778, 1),
(18102, 2, 1779, 1),
(18103, 2, 1780, 1),
(18104, 2, 1781, 1),
(18105, 2, 1800, 1),
(18106, 2, 1801, 1),
(18107, 2, 1802, 1),
(18108, 2, 1803, 1),
(18109, 2, 1804, 1),
(18110, 2, 1805, 1),
(18111, 2, 1806, 1),
(18112, 2, 1807, 1),
(18113, 2, 1808, 1),
(18114, 2, 1809, 1),
(18115, 2, 1810, 1),
(18116, 2, 1811, 1),
(18117, 2, 1812, 1),
(18118, 2, 1813, 1),
(18119, 2, 1814, 1),
(18120, 2, 1815, 1),
(18121, 2, 1816, 1),
(18122, 2, 1817, 1),
(18123, 2, 1818, 1),
(18124, 2, 1819, 1),
(18125, 2, 1820, 1),
(18126, 2, 1821, 1),
(18127, 2, 1822, 1),
(18128, 2, 1823, 1),
(18129, 2, 1824, 1),
(18130, 2, 1825, 1),
(18131, 2, 1826, 1),
(18132, 2, 1827, 1),
(18133, 2, 1828, 1),
(18134, 2, 1829, 1),
(18135, 2, 1830, 1),
(18136, 2, 1831, 1),
(18137, 2, 1832, 1),
(18138, 2, 1833, 1),
(18139, 2, 1834, 1),
(18140, 2, 1835, 1),
(18141, 2, 1836, 1),
(18142, 2, 1837, 1),
(18143, 2, 1838, 1),
(18144, 2, 1850, 1),
(18145, 2, 1851, 1),
(18146, 2, 1852, 1),
(18147, 2, 1853, 1),
(18148, 2, 1875, 1),
(18149, 2, 1876, 1),
(18150, 2, 1877, 1),
(18151, 2, 1900, 1),
(18152, 2, 1901, 1),
(18153, 2, 1902, 1),
(18154, 2, 1903, 1),
(18155, 2, 1904, 1),
(18156, 2, 1905, 1),
(18157, 2, 1925, 1),
(18158, 2, 1926, 1),
(18159, 2, 1927, 1),
(18160, 2, 1928, 1),
(18161, 2, 1929, 1),
(18162, 2, 1930, 1),
(18163, 2, 1931, 1),
(18164, 2, 1932, 1),
(18165, 2, 1933, 1),
(18166, 2, 1934, 1),
(18167, 2, 1950, 1),
(18168, 2, 1951, 1),
(18169, 2, 1952, 1),
(18170, 2, 1953, 1),
(18171, 2, 1954, 1),
(18172, 2, 1975, 1),
(18173, 2, 1976, 1),
(18174, 2, 1977, 1),
(18175, 2, 1978, 1),
(18176, 2, 1979, 1),
(18177, 2, 2000, 1),
(18178, 2, 2001, 1),
(18179, 2, 2015, 1),
(18180, 2, 2016, 1),
(18181, 2, 2017, 1),
(18182, 2, 2018, 1),
(18183, 2, 2019, 1),
(18184, 2, 2020, 1),
(18185, 2, 2021, 1),
(18186, 2, 2030, 1),
(18187, 2, 2031, 1),
(18188, 2, 2032, 1),
(18189, 2, 2050, 1),
(18190, 2, 2051, 1),
(18191, 2, 2052, 1),
(18192, 2, 2053, 1),
(18193, 2, 2054, 1),
(18194, 2, 2055, 1),
(18195, 2, 2070, 1),
(18196, 2, 2071, 1),
(18197, 2, 2072, 1),
(18198, 2, 2073, 1),
(18199, 2, 2074, 1),
(18200, 2, 2075, 1),
(18201, 2, 2076, 1),
(18202, 2, 2077, 1),
(18203, 2, 2078, 1),
(18204, 2, 2079, 1),
(18205, 2, 2080, 1),
(18206, 2, 2081, 1),
(18207, 2, 2090, 1),
(18208, 2, 2091, 1),
(18209, 2, 2092, 1),
(18210, 2, 2093, 1),
(18211, 2, 3000, 1),
(18212, 2, 3001, 1),
(18213, 2, 3010, 1),
(18214, 2, 3011, 1),
(18215, 2, 3012, 1),
(18216, 2, 3013, 1),
(18217, 2, 3020, 1),
(18218, 2, 3021, 1),
(18219, 2, 3022, 1),
(18220, 2, 3023, 1),
(18221, 2, 3024, 1),
(18222, 2, 3025, 1),
(18223, 2, 3030, 1),
(18224, 2, 3031, 1),
(18225, 2, 3032, 1),
(18226, 2, 3033, 1),
(18227, 2, 3034, 1),
(18228, 2, 3035, 1),
(18229, 2, 3040, 1),
(18230, 2, 3041, 1),
(18231, 2, 3042, 1),
(18232, 2, 3043, 1),
(18233, 2, 3044, 1),
(18234, 2, 3045, 1),
(18235, 2, 3046, 1),
(18236, 2, 3050, 1),
(18237, 2, 3051, 1),
(18238, 2, 3052, 1),
(18239, 2, 3053, 1),
(18240, 2, 3054, 1),
(18241, 2, 3055, 1),
(18242, 2, 3056, 1),
(18243, 2, 3060, 1),
(18244, 2, 3061, 1),
(18245, 2, 3062, 1),
(18246, 2, 3063, 1),
(18247, 2, 3064, 1),
(18248, 2, 3070, 1),
(18249, 2, 3071, 1),
(18250, 2, 3072, 1),
(18251, 2, 3080, 1),
(18252, 2, 3081, 1),
(18253, 2, 3082, 1),
(18254, 2, 3083, 1),
(18255, 2, 3084, 1),
(18256, 2, 3090, 1),
(18257, 2, 3091, 1),
(18258, 2, 3092, 1),
(18259, 2, 3093, 1),
(18260, 2, 3100, 1),
(18261, 2, 3101, 1),
(18262, 2, 3102, 1),
(18263, 2, 3103, 1),
(18264, 2, 3104, 1),
(18265, 2, 3110, 1),
(18266, 2, 3111, 1),
(18267, 2, 3120, 1),
(18268, 2, 3121, 1),
(18269, 2, 3122, 1),
(18270, 2, 3123, 1),
(18271, 2, 3130, 1),
(18272, 2, 3131, 1);

INSERT INTO `reserve_meetings` (`id`, `meeting_id`, `sale_id`, `meeting_time_id`, `day`, `date`, `start_at`, `end_at`, `user_id`, `paid_amount`, `meeting_type`, `student_count`, `discount`, `link`, `password`, `description`, `status`, `created_at`, `locked_at`, `reserved_at`) VALUES
(74, 36, NULL, 174, '2024-07-19', 1721347200, 1721361600, 1721405280, 1047, 364.00, 'online', 30, NULL, NULL, NULL, NULL, 'pending', 1721328477, NULL, NULL);

INSERT INTO `rewards` (`id`, `type`, `score`, `condition`, `status`, `created_at`) VALUES
(3, 'charge_wallet', 50, '150', 'active', 1641205067),
(4, 'account_charge', 50, '100', 'active', 1641369989),
(5, 'badge', NULL, NULL, 'active', 1641300755),
(6, 'create_classes', 50, NULL, 'active', 1641369921),
(7, 'buy', 50, '10', 'active', 1641369938),
(8, 'pass_the_quiz', 50, NULL, 'active', 1641369947),
(9, 'certificate', 30, NULL, 'active', 1641369955),
(10, 'comment', 5, NULL, 'active', 1641369968),
(11, 'register', 5, NULL, 'active', 1641370008),
(12, 'review_courses', 15, NULL, 'active', 1641370016),
(13, 'instructor_meeting_reserve', 30, NULL, 'active', 1641370026),
(14, 'student_meeting_reserve', 30, NULL, 'active', 1641370036),
(15, 'newsletters', 10, NULL, 'active', 1641370050),
(16, 'referral', 5, NULL, 'active', 1641370059),
(18, 'learning_progress_100', 20, NULL, 'active', 1641372957),
(19, 'buy_store_product', 50, '26', 'active', 1648277874),
(20, 'pass_assignment', 50, NULL, 'active', 1649247227),
(21, 'make_topic', 1, NULL, 'active', 1650548269),
(22, 'send_post_in_topic', 1, NULL, 'active', 1650548278),
(23, 'create_blog_by_instructor', 5, NULL, 'active', 1650788324),
(24, 'comment_for_instructor_blog', 3, NULL, 'active', 1650788336);

INSERT INTO `rewards_accounting` (`id`, `user_id`, `item_id`, `type`, `score`, `status`, `created_at`) VALUES
(1, 1016, 1, 'create_classes', 50, 'addiction', 1656669565);

INSERT INTO `roles` (`id`, `name`, `caption`, `users_count`, `is_admin`, `created_at`) VALUES
(1, 'user', 'Student role', 0, 0, 1604418504),
(2, 'admin', 'Admin role', 0, 1, 1604418504),
(3, 'organization', 'Organization role', 0, 0, 1604418504),
(4, 'teacher', 'Instructor role', 0, 0, 1604418504),
(6, 'education', 'Author', 0, 1, 1613370817);

INSERT INTO `sales` (`id`, `seller_id`, `buyer_id`, `order_id`, `webinar_id`, `bundle_id`, `meeting_id`, `meeting_time_id`, `subscribe_id`, `ticket_id`, `promotion_id`, `product_order_id`, `registration_package_id`, `installment_payment_id`, `gift_id`, `payment_method`, `type`, `amount`, `tax`, `commission`, `discount`, `total_amount`, `product_delivery_fee`, `manual_added`, `access_to_purchased_item`, `created_at`, `refund_at`) VALUES
(283, 1016, 1047, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'credit', 'webinar', 0.00, NULL, NULL, NULL, 0.00, NULL, 0, 1, 1721328706, NULL);

INSERT INTO `sales_log` (`id`, `sale_id`, `viewed_at`) VALUES
(139, 283, 1721497831);

INSERT INTO `sections` (`id`, `name`, `section_group_id`, `caption`, `type`) VALUES
(1, 'admin_general_dashboard', NULL, 'General Dashboard', 'admin'),
(2, 'admin_general_dashboard_show', 1, 'General Dashboard page', 'admin'),
(3, 'admin_general_dashboard_quick_access_links', 1, 'Quick access links in General Dashboard', 'admin'),
(4, 'admin_general_dashboard_daily_sales_statistics', 1, 'Daily Sales Type Statistics Section', 'admin'),
(5, 'admin_general_dashboard_income_statistics', 1, 'Income Statistics Section', 'admin'),
(6, 'admin_general_dashboard_total_sales_statistics', 1, 'Total Sales Statistics Section', 'admin'),
(7, 'admin_general_dashboard_new_sales', 1, 'New Sales Section', 'admin'),
(8, 'admin_general_dashboard_new_comments', 1, 'New Comments Section', 'admin'),
(9, 'admin_general_dashboard_new_tickets', 1, 'New Tickets Section', 'admin'),
(10, 'admin_general_dashboard_new_reviews', 1, 'New Reviews Section', 'admin'),
(11, 'admin_general_dashboard_sales_statistics_chart', 1, 'Sales Statistics Chart', 'admin'),
(12, 'admin_general_dashboard_recent_comments', 1, 'Recent comments Section', 'admin'),
(13, 'admin_general_dashboard_recent_tickets', 1, 'Recent tickets Section', 'admin'),
(14, 'admin_general_dashboard_recent_webinars', 1, 'Recent webinars Section', 'admin'),
(15, 'admin_general_dashboard_recent_courses', 1, 'Recent courses Section', 'admin'),
(16, 'admin_general_dashboard_users_statistics_chart', 1, 'Users Statistics Chart', 'admin'),
(17, 'admin_clear_cache', 1, 'Clear cache', 'admin'),
(25, 'admin_marketing_dashboard', NULL, 'Marketing Dashboard', 'admin'),
(26, 'admin_marketing_dashboard_show', 25, 'Marketing Dashboard page', 'admin'),
(50, 'admin_roles', NULL, 'Roles', 'admin'),
(51, 'admin_roles_list', 50, 'Roles List', 'admin'),
(52, 'admin_roles_create', 50, 'Roles Create', 'admin'),
(53, 'admin_roles_edit', 50, 'Roles Edit', 'admin'),
(54, 'admin_roles_delete', 50, 'Roles Delete', 'admin'),
(100, 'admin_users', NULL, 'Users', 'admin'),
(101, 'admin_staffs_list', 100, 'Staffs list', 'admin'),
(102, 'admin_users_list', 100, 'Students list', 'admin'),
(103, 'admin_instructors_list', 100, 'Instructors list', 'admin'),
(104, 'admin_organizations_list', 100, 'Organizations list', 'admin'),
(105, 'admin_users_create', 100, 'Users Create', 'admin'),
(106, 'admin_users_edit', 100, 'Users Edit', 'admin'),
(107, 'admin_users_delete', 100, 'Users Delete', 'admin'),
(108, 'admin_users_export_excel', 100, 'List Export excel', 'admin'),
(109, 'admin_users_badges', 100, 'Users Badges', 'admin'),
(110, 'admin_users_badges_edit', 100, 'Badges edit', 'admin'),
(111, 'admin_users_badges_delete', 100, 'Badges delete', 'admin'),
(112, 'admin_users_impersonate', 100, 'users impersonate (login by users)', 'admin'),
(113, 'admin_become_instructors_list', 100, 'Lists of requests for become instructors', 'admin'),
(114, 'admin_become_instructors_reject', 100, 'Reject requests for become instructors', 'admin'),
(115, 'admin_become_instructors_delete', 100, 'Delete requests for become instructors', 'admin'),
(116, 'admin_update_user_registration_package', 100, 'Edit user registration package', 'admin'),
(117, 'admin_update_user_meeting_settings', 100, 'Edit user meeting settings', 'admin'),
(118, 'admin_update_user_role_in_edit_page', 100, 'Update User role in edit page', 'admin'),
(150, 'admin_webinars', NULL, 'Webinars', 'admin'),
(151, 'admin_webinars_list', 150, 'Webinars List', 'admin'),
(152, 'admin_webinars_create', 150, 'Webinars Create', 'admin'),
(153, 'admin_webinars_edit', 150, 'Webinars Edit', 'admin'),
(154, 'admin_webinars_delete', 150, 'Webinars Delete', 'admin'),
(155, 'admin_webinars_export_excel', 150, 'Export excel webinars list', 'admin'),
(156, 'admin_feature_webinars', 150, 'Feature webinars list', 'admin'),
(157, 'admin_feature_webinars_create', 150, 'create feature webinar', 'admin'),
(158, 'admin_feature_webinars_export_excel', 150, 'Feature webinar export excel', 'admin'),
(159, 'admin_webinar_students_lists', 150, 'Webinar students Lists', 'admin'),
(160, 'admin_webinar_students_delete', 150, 'Webinar students delete', 'admin'),
(161, 'admin_webinar_notification_to_students', 150, 'Send notification to course students', 'admin'),
(162, 'admin_webinar_statistics', 150, 'Course statistics', 'admin'),
(163, 'admin_agora_history_list', 150, 'Agora history lists', 'admin'),
(164, 'admin_agora_history_export', 150, 'Agora history export', 'admin'),
(165, 'admin_course_question_forum_list', 150, 'Forum Question Lists', 'admin'),
(166, 'admin_course_question_forum_answers', 150, 'Forum Answers Lists', 'admin'),
(167, 'admin_course_personal_notes', 150, 'Course Personal Notes', 'admin'),
(200, 'admin_categories', NULL, 'Categories', 'admin'),
(201, 'admin_categories_list', 200, 'Categories List', 'admin'),
(202, 'admin_categories_create', 200, 'Categories Create', 'admin'),
(203, 'admin_categories_edit', 200, 'Categories Edit', 'admin'),
(204, 'admin_categories_delete', 200, 'Categories Delete', 'admin'),
(205, 'admin_trending_categories', 200, 'Trends Categories List', 'admin'),
(206, 'admin_create_trending_categories', 200, 'Create Trend Categories', 'admin'),
(207, 'admin_edit_trending_categories', 200, 'Edit Trend Categories', 'admin'),
(208, 'admin_delete_trending_categories', 200, 'Delete Trend Categories', 'admin'),
(250, 'admin_tags', NULL, 'Tags', 'admin'),
(251, 'admin_tags_list', 250, 'Tags List', 'admin'),
(252, 'admin_tags_create', 250, 'Tags Create', 'admin'),
(253, 'admin_tags_edit', 250, 'Tags Edit', 'admin'),
(254, 'admin_tags_delete', 250, 'Tags Delete', 'admin'),
(300, 'admin_filters', NULL, 'Filters', 'admin'),
(301, 'admin_filters_list', 300, 'Filters List', 'admin'),
(302, 'admin_filters_create', 300, 'Filters Create', 'admin'),
(303, 'admin_filters_edit', 300, 'Filters Edit', 'admin'),
(304, 'admin_filters_delete', 300, 'Filters Delete', 'admin'),
(350, 'admin_quizzes', NULL, 'Quizzes', 'admin'),
(351, 'admin_quizzes_list', 350, 'Quizzes List', 'admin'),
(352, 'admin_quizzes_create', 350, 'Create Quiz', 'admin'),
(353, 'admin_quizzes_edit', 350, 'Edit Quiz', 'admin'),
(354, 'admin_quizzes_delete', 350, 'Delete Quiz', 'admin'),
(355, 'admin_quizzes_results', 350, 'Quizzes results', 'admin'),
(356, 'admin_quizzes_results_delete', 350, 'Quizzes results delete', 'admin'),
(357, 'admin_quizzes_lists_excel', 350, 'Quizzes export excel', 'admin'),
(400, 'admin_quiz_result', NULL, 'Quiz Result', 'admin'),
(401, 'admin_quiz_result_list', 400, 'Quiz Result List', 'admin'),
(402, 'admin_quiz_result_create', 400, 'Quiz Result Create', 'admin'),
(403, 'admin_quiz_result_edit', 400, 'Quiz Result Edit', 'admin'),
(404, 'admin_quiz_result_delete', 400, 'Quiz Result Delete', 'admin'),
(405, 'admin_quiz_result_export_excel', 400, 'quiz result export excel', 'admin'),
(450, 'admin_certificate', NULL, 'Certificate', 'admin'),
(451, 'admin_certificate_list', 450, 'Certificate List', 'admin'),
(452, 'admin_certificate_create', 450, 'Certificate Create', 'admin'),
(453, 'admin_certificate_edit', 450, 'Certificate Edit', 'admin'),
(454, 'admin_certificate_delete', 450, 'Certificate Delete', 'admin'),
(455, 'admin_certificate_template_list', 450, 'Certificate template lists', 'admin'),
(456, 'admin_certificate_template_create', 450, 'Certificate template create', 'admin'),
(457, 'admin_certificate_template_edit', 450, 'Certificate template edit', 'admin'),
(458, 'admin_certificate_template_delete', 450, 'Certificate template delete', 'admin'),
(459, 'admin_certificate_export_excel', 450, 'Certificates export excel', 'admin'),
(460, 'admin_course_certificate_list', 450, 'Course Competition Certificates', 'admin'),
(461, 'admin_certificate_settings', 450, 'Settings', 'admin'),
(500, 'admin_discount_codes', NULL, 'Discount codes', 'admin'),
(501, 'admin_discount_codes_list', 500, 'Discount codes list', 'admin'),
(502, 'admin_discount_codes_create', 500, 'Discount codes create', 'admin'),
(503, 'admin_discount_codes_edit', 500, 'Discount codes edit', 'admin'),
(504, 'admin_discount_codes_delete', 500, 'Discount codes delete', 'admin'),
(505, 'admin_discount_codes_export', 500, 'Discount codes export excel', 'admin'),
(550, 'admin_group', NULL, 'Groups', 'admin'),
(551, 'admin_group_list', 550, 'Groups List', 'admin'),
(552, 'admin_group_create', 550, 'Groups Create', 'admin'),
(553, 'admin_group_edit', 550, 'Groups Edit', 'admin'),
(554, 'admin_group_delete', 550, 'Groups Delete', 'admin'),
(555, 'admin_update_group_registration_package', 550, 'Update group registration package', 'admin'),
(600, 'admin_payment_channel', NULL, 'Payment Channels', 'admin'),
(601, 'admin_payment_channel_list', 600, 'Payment Channels List', 'admin'),
(602, 'admin_payment_channel_toggle_status', 600, 'active or inactive channel', 'admin'),
(603, 'admin_payment_channel_edit', 600, 'Payment Channels Edit', 'admin'),
(650, 'admin_settings', NULL, 'settings', 'admin'),
(651, 'admin_settings_general', 650, 'General settings', 'admin'),
(652, 'admin_settings_financial', 650, 'Financial settings', 'admin'),
(653, 'admin_settings_personalization', 650, 'Personalization settings', 'admin'),
(654, 'admin_settings_notifications', 650, 'Notifications settings', 'admin'),
(655, 'admin_settings_seo', 650, 'Seo settings', 'admin'),
(656, 'admin_settings_customization', 650, 'Customization settings', 'admin'),
(657, 'admin_settings_update_app', 650, 'Update App settings', 'admin'),
(658, 'admin_settings_home_sections', 650, 'Home sections settings', 'admin'),
(700, 'admin_blog', NULL, 'Blog', 'admin'),
(701, 'admin_blog_lists', 700, 'Blog lists', 'admin'),
(702, 'admin_blog_create', 700, 'Blog create', 'admin'),
(703, 'admin_blog_edit', 700, 'Blog edit', 'admin'),
(704, 'admin_blog_delete', 700, 'Blog delete', 'admin'),
(705, 'admin_blog_categories', 700, 'Blog categories list', 'admin'),
(706, 'admin_blog_categories_create', 700, 'Blog categories create', 'admin'),
(707, 'admin_blog_categories_edit', 700, 'Blog categories edit', 'admin'),
(708, 'admin_blog_categories_delete', 700, 'Blog categories delete', 'admin'),
(750, 'admin_sales', NULL, 'Sales', 'admin'),
(751, 'admin_sales_list', 750, 'Sales List', 'admin'),
(752, 'admin_sales_refund', 750, 'Sales Refund', 'admin'),
(753, 'admin_sales_invoice', 750, 'Sales invoice', 'admin'),
(754, 'admin_sales_export', 750, 'Sales Export Excel', 'admin'),
(800, 'admin_documents', NULL, 'Balances', 'admin'),
(801, 'admin_documents_list', 800, 'Balances List', 'admin'),
(802, 'admin_documents_create', 800, 'Balances Create', 'admin'),
(803, 'admin_documents_print', 800, 'Balances print', 'admin'),
(850, 'admin_payouts', NULL, 'Payout', 'admin'),
(851, 'admin_payouts_list', 850, 'Payout List', 'admin'),
(852, 'admin_payouts_reject', 850, 'Payout Reject', 'admin'),
(853, 'admin_payouts_payout', 850, 'Payout accept', 'admin'),
(854, 'admin_payouts_export_excel', 850, 'Payout export excel', 'admin'),
(900, 'admin_offline_payments', NULL, 'Offline Payments', 'admin'),
(901, 'admin_offline_payments_list', 900, 'Offline Payments List', 'admin'),
(902, 'admin_offline_payments_reject', 900, 'Offline Payments Reject', 'admin'),
(903, 'admin_offline_payments_approved', 900, 'Offline Payments Approved', 'admin'),
(904, 'admin_offline_payments_export_excel', 900, 'Offline Payments export excel', 'admin'),
(950, 'admin_supports', NULL, 'Supports', 'admin'),
(951, 'admin_supports_list', 950, 'Supports List', 'admin'),
(952, 'admin_support_send', 950, 'Send Support', 'admin'),
(953, 'admin_supports_reply', 950, 'Supports reply', 'admin'),
(954, 'admin_supports_delete', 950, 'Supports delete', 'admin'),
(955, 'admin_support_departments', 950, 'Support departments lists', 'admin'),
(956, 'admin_support_department_create', 950, 'Create support department', 'admin'),
(957, 'admin_support_departments_edit', 950, 'Edit support departments', 'admin'),
(958, 'admin_support_departments_delete', 950, 'Delete support department', 'admin'),
(959, 'admin_support_course_conversations', 950, 'Course conversations', 'admin'),
(1000, 'admin_subscribe', NULL, 'Subscribes', 'admin'),
(1001, 'admin_subscribe_list', 1000, 'Subscribes list', 'admin'),
(1002, 'admin_subscribe_create', 1000, 'Subscribes create', 'admin'),
(1003, 'admin_subscribe_edit', 1000, 'Subscribes edit', 'admin'),
(1004, 'admin_subscribe_delete', 1000, 'Subscribes delete', 'admin'),
(1050, 'admin_notifications', NULL, 'Notifications', 'admin'),
(1051, 'admin_notifications_list', 1050, 'Notifications list', 'admin'),
(1052, 'admin_notifications_send', 1050, 'Send Notifications', 'admin'),
(1053, 'admin_notifications_edit', 1050, 'Edit and details Notifications', 'admin'),
(1054, 'admin_notifications_delete', 1050, 'Delete Notifications', 'admin'),
(1055, 'admin_notifications_markAllRead', 1050, 'Mark All Read Notifications', 'admin'),
(1056, 'admin_notifications_templates', 1050, 'Notifications templates', 'admin'),
(1057, 'admin_notifications_template_create', 1050, 'Create notification template', 'admin'),
(1058, 'admin_notifications_template_edit', 1050, 'Edit notification template', 'admin'),
(1059, 'admin_notifications_template_delete', 1050, 'Delete notification template', 'admin'),
(1060, 'admin_notifications_posted_list', 1050, 'Notifications Posted list', 'admin'),
(1075, 'admin_noticeboards', NULL, 'Noticeboards', 'admin'),
(1076, 'admin_noticeboards_list', 1075, 'Noticeboards list', 'admin'),
(1077, 'admin_noticeboards_send', 1075, 'Send Noticeboards', 'admin'),
(1078, 'admin_noticeboards_edit', 1075, 'Edit Noticeboards', 'admin'),
(1079, 'admin_noticeboards_delete', 1075, 'Delete Noticeboards', 'admin'),
(1080, 'admin_course_noticeboards_list', 1075, 'Course Noticeboards list', 'admin'),
(1081, 'admin_course_noticeboards_send', 1075, 'Send Course Noticeboards', 'admin'),
(1082, 'admin_course_noticeboards_edit', 1075, 'Edit Course Noticeboards', 'admin'),
(1083, 'admin_course_noticeboards_delete', 1075, 'Delete Course Noticeboards', 'admin'),
(1100, 'admin_promotion', NULL, 'Promotions', 'admin'),
(1101, 'admin_promotion_list', 1100, 'Promotions list', 'admin'),
(1102, 'admin_promotion_create', 1100, 'Promotion create', 'admin'),
(1103, 'admin_promotion_edit', 1100, 'Promotion edit', 'admin'),
(1104, 'admin_promotion_delete', 1100, 'Promotion delete', 'admin'),
(1150, 'admin_testimonials', NULL, 'testimonials', 'admin'),
(1151, 'admin_testimonials_list', 1150, 'testimonials list', 'admin'),
(1152, 'admin_testimonials_create', 1150, 'testimonials create', 'admin'),
(1153, 'admin_testimonials_edit', 1150, 'testimonials edit', 'admin'),
(1154, 'admin_testimonials_delete', 1150, 'testimonials delete', 'admin'),
(1200, 'admin_advertising', NULL, 'advertising', 'admin'),
(1201, 'admin_advertising_banners', 1200, 'advertising banners list', 'admin'),
(1202, 'admin_advertising_banners_create', 1200, 'create advertising banner', 'admin'),
(1203, 'admin_advertising_banners_edit', 1200, 'edit advertising banner', 'admin'),
(1204, 'admin_advertising_banners_delete', 1200, 'delete advertising banner', 'admin'),
(1230, 'admin_newsletters', NULL, 'Newsletters', 'admin'),
(1231, 'admin_newsletters_lists', 1230, 'Newsletters lists', 'admin'),
(1232, 'admin_newsletters_send', 1230, 'Send Newsletters', 'admin'),
(1233, 'admin_newsletters_history', 1230, 'Newsletters histories', 'admin'),
(1234, 'admin_newsletters_delete', 1230, 'Delete newsletters item', 'admin'),
(1235, 'admin_newsletters_export_excel', 1230, 'Export excel newsletters item', 'admin'),
(1250, 'admin_contacts', NULL, 'Contacts', 'admin'),
(1251, 'admin_contacts_lists', 1250, 'Contacts lists', 'admin'),
(1252, 'admin_contacts_reply', 1250, 'Contacts reply', 'admin'),
(1253, 'admin_contacts_delete', 1250, 'Contacts delete', 'admin'),
(1300, 'admin_product_discount', NULL, 'product discount', 'admin'),
(1301, 'admin_product_discount_list', 1300, 'product discount list', 'admin'),
(1302, 'admin_product_discount_create', 1300, 'create product discount', 'admin'),
(1303, 'admin_product_discount_edit', 1300, 'edit product discount', 'admin'),
(1304, 'admin_product_discount_delete', 1300, 'delete product discount', 'admin'),
(1305, 'admin_product_discount_export', 1300, 'delete product export excel', 'admin'),
(1350, 'admin_pages', NULL, 'pages', 'admin'),
(1351, 'admin_pages_list', 1350, 'pages list', 'admin'),
(1352, 'admin_pages_create', 1350, 'pages create', 'admin'),
(1353, 'admin_pages_edit', 1350, 'pages edit', 'admin'),
(1354, 'admin_pages_toggle', 1350, 'pages toggle publish/draft', 'admin'),
(1355, 'admin_pages_delete', 1350, 'pages delete', 'admin'),
(1400, 'admin_comments', NULL, 'Comments', 'admin'),
(1401, 'admin_comments_edit', 1400, 'Comments edit', 'admin'),
(1402, 'admin_comments_reply', 1400, 'Comments reply', 'admin'),
(1403, 'admin_comments_delete', 1400, 'Comments delete', 'admin'),
(1404, 'admin_comments_status', 1400, 'Comments status (active or pending)', 'admin'),
(1405, 'admin_comments_reports', 1400, 'Reports', 'admin'),
(1406, 'admin_webinar_comments', 1400, 'Classes comments', 'admin'),
(1407, 'admin_blog_comments', 1400, 'Blog comments', 'admin'),
(1408, 'admin_product_comments', 1400, 'Product comments', 'admin'),
(1409, 'admin_bundle_comments', 1400, 'Bundle comments', 'admin'),
(1450, 'admin_reports', NULL, 'Reports', 'admin'),
(1451, 'admin_webinar_reports', 1450, 'Classes reports', 'admin'),
(1452, 'admin_webinar_comments_reports', 1450, 'Classes Comments reports', 'admin'),
(1453, 'admin_webinar_reports_delete', 1450, 'Classes reports delete', 'admin'),
(1454, 'admin_blog_comments_reports', 1450, 'Blog Comments reports', 'admin'),
(1455, 'admin_report_reasons', 1450, 'Reports reasons', 'admin'),
(1456, 'admin_product_comments_reports', 1450, 'Products Comments reports', 'admin'),
(1457, 'admin_forum_topic_post_reports', 1450, 'Forum Topic Posts Reports', 'admin'),
(1500, 'admin_additional_pages', NULL, 'Additional Pages', 'admin'),
(1501, 'admin_additional_pages_404', 1500, '404 error page settings', 'admin'),
(1502, 'admin_additional_pages_contact_us', 1500, 'Contact page settings', 'admin'),
(1503, 'admin_additional_pages_footer', 1500, 'Footer settings', 'admin'),
(1504, 'admin_additional_pages_navbar_links', 1500, 'Top Navbar links settings', 'admin'),
(1550, 'admin_appointments', NULL, 'Appointments', 'admin'),
(1551, 'admin_appointments_lists', 1550, 'Appointments lists', 'admin'),
(1552, 'admin_appointments_join', 1550, 'Appointments join', 'admin'),
(1553, 'admin_appointments_send_reminder', 1550, 'Appointments send reminder', 'admin'),
(1554, 'admin_appointments_cancel', 1550, 'Appointments cancel', 'admin'),
(1600, 'admin_reviews', NULL, 'Reviews', 'admin'),
(1601, 'admin_reviews_lists', 1600, 'Reviews lists', 'admin'),
(1602, 'admin_reviews_status_toggle', 1600, 'Reviews status toggle (publish or hidden)', 'admin'),
(1603, 'admin_reviews_detail_show', 1600, 'Review details page', 'admin'),
(1604, 'admin_reviews_reply', 1600, 'Review reply', 'admin'),
(1605, 'admin_reviews_delete', 1600, 'Review delete', 'admin'),
(1650, 'admin_consultants', NULL, 'Consultants', 'admin'),
(1651, 'admin_consultants_lists', 1650, 'Consultants lists', 'admin'),
(1652, 'admin_consultants_export_excel', 1650, 'Consultants export excel', 'admin'),
(1675, 'admin_referrals', NULL, 'Referrals', 'admin'),
(1676, 'admin_referrals_history', 1675, 'Referrals History', 'admin'),
(1677, 'admin_referrals_users', 1675, 'Referrals users', 'admin'),
(1678, 'admin_referrals_export', 1675, 'Export Referrals', 'admin'),
(1725, 'admin_regions', NULL, 'Regions', 'admin'),
(1726, 'admin_regions_countries', 1725, 'countries lists', 'admin'),
(1727, 'admin_regions_provinces', 1725, 'provinces lists', 'admin'),
(1728, 'admin_regions_cities', 1725, 'cities lists', 'admin'),
(1729, 'admin_regions_districts', 1725, 'districts lists', 'admin'),
(1730, 'admin_regions_create', 1725, 'create item', 'admin'),
(1731, 'admin_regions_edit', 1725, 'edit item', 'admin'),
(1732, 'admin_regions_delete', 1725, 'delete item', 'admin'),
(1750, 'admin_rewards', NULL, 'Rewards', 'admin'),
(1751, 'admin_rewards_history', 1750, 'Rewards history', 'admin'),
(1752, 'admin_rewards_settings', 1750, 'Rewards settings', 'admin'),
(1753, 'admin_rewards_items', 1750, 'Rewards items', 'admin'),
(1754, 'admin_rewards_item_delete', 1750, 'Reward item delete', 'admin'),
(1775, 'admin_registration_packages', NULL, 'Registration packages', 'admin'),
(1776, 'admin_registration_packages_lists', 1775, 'packages lists', 'admin'),
(1777, 'admin_registration_packages_new', 1775, 'New package', 'admin'),
(1778, 'admin_registration_packages_edit', 1775, 'Edit package', 'admin'),
(1779, 'admin_registration_packages_delete', 1775, 'Delete package', 'admin'),
(1780, 'admin_registration_packages_reports', 1775, 'Reports', 'admin'),
(1781, 'admin_registration_packages_settings', 1775, 'Settings', 'admin'),
(1800, 'admin_store', NULL, 'Store', 'admin'),
(1801, 'admin_store_products', 1800, 'Products lists', 'admin'),
(1802, 'admin_store_new_product', 1800, 'Create New Product', 'admin'),
(1803, 'admin_store_edit_product', 1800, 'Edit Product', 'admin'),
(1804, 'admin_store_delete_product', 1800, 'Delete Product', 'admin'),
(1805, 'admin_store_export_products', 1800, 'Export excel Products', 'admin'),
(1806, 'admin_store_categories_list', 1800, 'Store Categories Lists', 'admin'),
(1807, 'admin_store_categories_create', 1800, 'Create Store Category', 'admin'),
(1808, 'admin_store_categories_edit', 1800, 'Edit Store Category', 'admin'),
(1809, 'admin_store_categories_delete', 1800, 'Delete Store Category', 'admin'),
(1810, 'admin_store_filters_list', 1800, 'Store Filters Lists', 'admin'),
(1811, 'admin_store_filters_create', 1800, 'Create Store Filter', 'admin'),
(1812, 'admin_store_filters_edit', 1800, 'Edit Store Filter', 'admin'),
(1813, 'admin_store_filters_delete', 1800, 'Delete Store Filter', 'admin'),
(1814, 'admin_store_specifications', 1800, 'Store Specifications', 'admin'),
(1815, 'admin_store_specifications_create', 1800, 'Create New Store Specification', 'admin'),
(1816, 'admin_store_specifications_edit', 1800, 'Edit Store Specification', 'admin'),
(1817, 'admin_store_specifications_delete', 1800, 'Delete Store Specification', 'admin'),
(1818, 'admin_store_discounts', 1800, 'Store Discounts Lists', 'admin'),
(1819, 'admin_store_discounts_create', 1800, 'Create New Store discount', 'admin'),
(1820, 'admin_store_discounts_edit', 1800, 'Edit Store discount', 'admin'),
(1821, 'admin_store_discounts_delete', 1800, 'Delete Store discount', 'admin'),
(1822, 'admin_store_products_orders', 1800, 'Products Orders', 'admin'),
(1823, 'admin_store_products_orders_refund', 1800, 'Products Orders Refund', 'admin'),
(1824, 'admin_store_products_orders_invoice', 1800, 'Products Orders View Invoice', 'admin'),
(1825, 'admin_store_products_orders_export', 1800, 'Products Orders Export Excel', 'admin'),
(1826, 'admin_store_products_orders_tracking_code', 1800, 'Products Orders Tracking code', 'admin'),
(1827, 'admin_store_products_reviews', 1800, 'Reviews lists', 'admin'),
(1828, 'admin_store_products_reviews_status_toggle', 1800, 'Reviews status toggle (publish or hidden)', 'admin'),
(1829, 'admin_store_products_reviews_detail_show', 1800, 'Review details page', 'admin'),
(1830, 'admin_store_products_reviews_delete', 1800, 'Review delete', 'admin'),
(1831, 'admin_store_settings', 1800, 'Store settings', 'admin'),
(1832, 'admin_store_in_house_products', 1800, 'In-house products', 'admin'),
(1833, 'admin_store_in_house_orders', 1800, 'In-house Products Orders', 'admin'),
(1834, 'admin_store_products_sellers', 1800, 'Products Sellers', 'admin'),
(1835, 'admin_store_in_house_products_delete', 1800, 'In-house Products Delete', 'admin'),
(1836, 'admin_store_in_house_products_export', 1800, 'In-house Products Export Excel', 'admin'),
(1837, 'admin_store_in_house_orders', 1800, 'In-house Products Orders', 'admin'),
(1838, 'admin_store_products_sellers', 1800, 'Products Sellers', 'admin'),
(1850, 'admin_webinar_assignments', NULL, 'Webinar assignments', 'admin'),
(1851, 'admin_webinar_assignments_lists', 1850, 'Assignments lists', 'admin'),
(1852, 'admin_webinar_assignments_students', 1850, 'Assignment students', 'admin'),
(1853, 'admin_webinar_assignments_conversations', 1850, 'Assignment students conversations', 'admin'),
(1875, 'admin_users_not_access_content', NULL, 'Users do not have access to the content', 'admin'),
(1876, 'admin_users_not_access_content_lists', 1875, 'Users lists', 'admin'),
(1877, 'admin_users_not_access_content_toggle', 1875, 'Toggle active/inactive users to view content', 'admin'),
(1900, 'admin_bundles', NULL, 'Bundles', 'admin'),
(1901, 'admin_bundles_list', 1900, 'Bundles Lists', 'admin'),
(1902, 'admin_bundles_create', 1900, 'Create new Bundle', 'admin'),
(1903, 'admin_bundles_edit', 1900, 'Edit bundle', 'admin'),
(1904, 'admin_bundles_delete', 1900, 'Delete bundle', 'admin'),
(1905, 'admin_bundles_export_excel', 1900, 'Export excel', 'admin'),
(1925, 'admin_forum', NULL, 'Forums', 'admin'),
(1926, 'admin_forum_list', 1925, 'Forums Lists', 'admin'),
(1927, 'admin_forum_create', 1925, 'Forums create', 'admin'),
(1928, 'admin_forum_edit', 1925, 'Forums edit', 'admin'),
(1929, 'admin_forum_delete', 1925, 'Forums delete', 'admin'),
(1930, 'admin_forum_topics_lists', 1925, 'Forums topics lists', 'admin'),
(1931, 'admin_forum_topics_create', 1925, 'Forums topics create', 'admin'),
(1932, 'admin_forum_topics_delete', 1925, 'Forums topics delete', 'admin'),
(1933, 'admin_forum_topics_posts', 1925, 'Forums topic posts', 'admin'),
(1934, 'admin_forum_topics_create_posts', 1925, 'Forums topic store posts', 'admin'),
(1950, 'admin_featured_topics', NULL, 'Featured topics', 'admin'),
(1951, 'admin_featured_topics_list', 1950, 'Featured topics Lists', 'admin'),
(1952, 'admin_featured_topics_create', 1950, 'Featured topics create', 'admin'),
(1953, 'admin_featured_topics_edit', 1950, 'Featured topics edit', 'admin'),
(1954, 'admin_featured_topics_delete', 1950, 'Featured topics delete', 'admin'),
(1975, 'admin_recommended_topics', NULL, 'Recommended topics', 'admin'),
(1976, 'admin_recommended_topics_list', 1975, 'Recommended topics Lists', 'admin'),
(1977, 'admin_recommended_topics_create', 1975, 'Recommended topics create', 'admin'),
(1978, 'admin_recommended_topics_edit', 1975, 'Recommended topics edit', 'admin'),
(1979, 'admin_recommended_topics_delete', 1975, 'Recommended topics delete', 'admin'),
(2000, 'admin_advertising_modal', NULL, 'Advertising modal', 'admin'),
(2001, 'admin_advertising_modal_config', 2000, 'Set Advertising modal', 'admin'),
(2015, 'admin_enrollment', NULL, 'Enrollment', 'admin'),
(2016, 'admin_enrollment_history', 2015, 'Enrollment History', 'admin'),
(2017, 'admin_enrollment_add_student_to_items', 2015, 'Enrollment Add Student To Items', 'admin'),
(2018, 'admin_enrollment_block_access', 2015, 'Enrollment Block Access', 'admin'),
(2019, 'admin_enrollment_enable_access', 2015, 'Enrollment Enable Access', 'admin'),
(2020, 'admin_enrollment_export', 2015, 'Enrollment Export History', 'admin'),
(2021, 'admin_enrollment_export', 2015, 'Enrollment Export History', 'admin'),
(2030, 'admin_delete_account_requests', NULL, 'Delete Account Requests', 'admin'),
(2031, 'admin_delete_account_requests_lists', 2030, 'Delete Account Requests Lists', 'admin'),
(2032, 'admin_delete_account_requests_confirm', 2030, 'Delete Account Requests Confirm', 'admin'),
(2050, 'admin_upcoming_courses', NULL, 'Upcoming Course', 'admin'),
(2051, 'admin_upcoming_courses_list', 2050, 'Lists', 'admin'),
(2052, 'admin_upcoming_courses_create', 2050, 'Create', 'admin'),
(2053, 'admin_upcoming_courses_edit', 2050, 'Edit and Update', 'admin'),
(2054, 'admin_upcoming_courses_delete', 2050, 'Delete', 'admin'),
(2055, 'admin_upcoming_courses_followers', 2050, 'Followers', 'admin'),
(2070, 'admin_installments', NULL, 'Installments', 'admin'),
(2071, 'admin_installments_list', 2070, 'Lists', 'admin'),
(2072, 'admin_installments_create', 2070, 'Create', 'admin'),
(2073, 'admin_installments_edit', 2070, 'Edit and Update', 'admin'),
(2074, 'admin_installments_delete', 2070, 'Delete', 'admin'),
(2075, 'admin_installments_settings', 2070, 'Settings', 'admin'),
(2076, 'admin_installments_purchases', 2070, 'Purchases', 'admin'),
(2077, 'admin_installments_overdue_lists', 2070, 'Overdue Installments', 'admin'),
(2078, 'admin_installments_overdue_history', 2070, 'Overdue History', 'admin'),
(2079, 'admin_installments_verification_requests', 2070, 'Verification Requests', 'admin'),
(2080, 'admin_installments_verified_users', 2070, 'Verified Users', 'admin'),
(2081, 'admin_installments_orders', 2070, 'Approve/Reject/Refund Requests', 'admin'),
(2090, 'admin_registration_bonus', NULL, 'Registration Bonus', 'admin'),
(2091, 'admin_registration_bonus_history', 2090, 'History', 'admin'),
(2092, 'admin_registration_bonus_settings', 2090, 'Settings', 'admin'),
(2093, 'admin_registration_bonus_export_excel', 2090, 'Export Excel', 'admin'),
(3000, 'admin_floating_bar', NULL, 'Top/Bottom Floating Bar', 'admin'),
(3001, 'admin_floating_bar_create', 3000, 'Create/Edit', 'admin'),
(3010, 'admin_cashback', NULL, 'Cashback', 'admin'),
(3011, 'admin_cashback_rules', 3010, 'Rules', 'admin'),
(3012, 'admin_cashback_transactions', 3010, 'Transactions', 'admin'),
(3013, 'admin_cashback_history', 3010, 'History', 'admin'),
(3020, 'admin_waitlists', NULL, 'Waitlists', 'admin'),
(3021, 'admin_waitlists_lists', 3020, 'Lists', 'admin'),
(3022, 'admin_waitlists_users', 3020, 'Joined Users', 'admin'),
(3023, 'admin_waitlists_exports', 3020, 'Export excel lists', 'admin'),
(3024, 'admin_waitlists_clear_list', 3020, 'Clear lists', 'admin'),
(3025, 'admin_waitlists_disable', 3020, 'Disable', 'admin'),
(3030, 'admin_gift', NULL, 'Gifts', 'admin'),
(3031, 'admin_gift_history', 3030, 'History', 'admin'),
(3032, 'admin_gift_send_reminder', 3030, 'Send Reminder', 'admin'),
(3033, 'admin_gift_cancel', 3030, 'Cancel', 'admin'),
(3034, 'admin_gift_settings', 3030, 'Settings', 'admin'),
(3035, 'admin_gift_export', 3030, 'Export Excel', 'admin'),
(3040, 'admin_forms', NULL, 'Forms', 'admin'),
(3041, 'admin_forms_lists', 3040, 'Lists', 'admin'),
(3042, 'admin_forms_create', 3040, 'Create', 'admin'),
(3043, 'admin_forms_edit', 3040, 'Edit', 'admin'),
(3044, 'admin_forms_delete', 3040, 'Delete', 'admin'),
(3045, 'admin_forms_export', 3040, 'Export', 'admin'),
(3046, 'admin_forms_submissions', 3040, 'Submissions', 'admin'),
(3050, 'admin_ai_contents', NULL, 'AI Contents', 'admin'),
(3051, 'admin_ai_contents_lists', 3050, 'Generated Contents Lists', 'admin'),
(3052, 'admin_ai_contents_templates_lists', 3050, 'Template Lists', 'admin'),
(3053, 'admin_ai_contents_templates_create', 3050, 'Template Create', 'admin'),
(3054, 'admin_ai_contents_templates_edit', 3050, 'Template Edit', 'admin'),
(3055, 'admin_ai_contents_templates_delete', 3050, 'Template Delete', 'admin'),
(3056, 'admin_ai_contents_settings', 3050, 'Settings', 'admin'),
(3060, 'admin_purchase_notifications', NULL, 'Purchase Notifications', 'admin'),
(3061, 'admin_purchase_notifications_lists', 3060, 'Lists', 'admin'),
(3062, 'admin_purchase_notifications_create', 3060, 'Create', 'admin'),
(3063, 'admin_purchase_notifications_edit', 3060, 'Edit', 'admin'),
(3064, 'admin_purchase_notifications_delete', 3060, 'Delete', 'admin'),
(3070, 'admin_content_delete_requests', NULL, 'Content Delete Requests', 'admin'),
(3071, 'admin_content_delete_requests_lists', 3070, 'Lists', 'admin'),
(3072, 'admin_content_delete_requests_actions', 3070, 'Approve/Reject', 'admin'),
(3080, 'admin_user_login_history', NULL, 'User Login History', 'admin'),
(3081, 'admin_user_login_history_lists', 3080, 'Lists', 'admin'),
(3082, 'admin_user_login_history_delete', 3080, 'Delete', 'admin'),
(3083, 'admin_user_login_history_end_session', 3080, 'End Session', 'admin'),
(3084, 'admin_user_login_history_export', 3080, 'Export Excel', 'admin'),
(3090, 'admin_user_ip_restriction', NULL, 'User IP Restriction', 'admin'),
(3091, 'admin_user_ip_restriction_lists', 3090, 'Lists', 'admin'),
(3092, 'admin_user_ip_restriction_create', 3090, 'Create/Edit Restriction', 'admin'),
(3093, 'admin_user_ip_restriction_delete', 3090, 'Delete', 'admin'),
(3100, 'admin_product_badges', NULL, 'Product Badges', 'admin'),
(3101, 'admin_product_badges_lists', 3100, 'Lists', 'admin'),
(3102, 'admin_product_badges_create', 3100, 'Create', 'admin'),
(3103, 'admin_product_badges_edit', 3100, 'Edit', 'admin'),
(3104, 'admin_product_badges_delete', 3100, 'Delete', 'admin'),
(3110, 'admin_cart_discount', NULL, 'Cart Discount', 'admin'),
(3111, 'admin_cart_discount_controls', 3110, 'Controls', 'admin'),
(3120, 'admin_abandoned_cart', NULL, 'Abandoned Cart', 'admin'),
(3121, 'admin_abandoned_cart_rules', 3120, 'Rules (Create/Edit/Delete)', 'admin'),
(3122, 'admin_abandoned_cart_users', 3120, 'Users Cart', 'admin'),
(3123, 'admin_abandoned_cart_settings', 3120, 'Settings', 'admin'),
(3130, 'admin_translator', NULL, 'Translator', 'admin'),
(3131, 'admin_translator_actions', 3130, 'Actions (Create/Edit/Delete)', 'admin'),
(100001, 'panel_organization_instructors', NULL, 'Organization Instructors', 'panel'),
(100002, 'panel_organization_instructors_lists', 100001, 'Lists', 'panel'),
(100003, 'panel_organization_instructors_create', 100001, 'Create', 'panel'),
(100004, 'panel_organization_instructors_edit', 100001, 'Edit', 'panel'),
(100005, 'panel_organization_instructors_delete', 100001, 'Delete', 'panel'),
(100010, 'panel_organization_students', NULL, 'Organization Students', 'panel'),
(100011, 'panel_organization_students_lists', 100010, 'Lists', 'panel'),
(100012, 'panel_organization_students_create', 100010, 'Create', 'panel'),
(100013, 'panel_organization_students_edit', 100010, 'Edit', 'panel'),
(100014, 'panel_organization_students_delete', 100010, 'Delete', 'panel'),
(100020, 'panel_webinars', NULL, 'Webinars (Courses)', 'panel'),
(100021, 'panel_webinars_lists', 100020, 'Lists', 'panel'),
(100022, 'panel_webinars_create', 100020, 'Create/Edit', 'panel'),
(100023, 'panel_webinars_delete', 100020, 'Delete', 'panel'),
(100024, 'panel_webinars_learning_page', 100020, 'Learning Page', 'panel'),
(100025, 'panel_webinars_invited_lists', 100020, 'Invited Class Lists', 'panel'),
(100026, 'panel_webinars_organization_classes', 100020, 'My Organization classes', 'panel'),
(100027, 'panel_webinars_my_purchases', 100020, 'My Purchases', 'panel'),
(100028, 'panel_webinars_my_class_comments', 100020, 'My Class Comments', 'panel'),
(100029, 'panel_webinars_comments', 100020, 'My Comments', 'panel'),
(100030, 'panel_webinars_favorites', 100020, 'Favorites', 'panel'),
(100031, 'panel_webinars_personal_course_notes', 100020, 'Personal Course Notes', 'panel'),
(100032, 'panel_webinars_duplicate', 100020, 'Duplicate', 'panel'),
(100033, 'panel_webinars_export_students_list', 100020, 'Export Students List', 'panel'),
(100034, 'panel_webinars_invoice', 100020, 'Invoice', 'panel'),
(100035, 'panel_webinars_statistics', 100020, 'Statistics', 'panel'),
(100040, 'panel_upcoming_courses', NULL, 'Upcoming Courses', 'panel'),
(100041, 'panel_upcoming_courses_lists', 100040, 'Lists', 'panel'),
(100042, 'panel_upcoming_courses_create', 100040, 'Create/Edit', 'panel'),
(100043, 'panel_upcoming_courses_delete', 100040, 'Delete', 'panel'),
(100044, 'panel_upcoming_courses_followings', 100040, 'Followings', 'panel'),
(100045, 'panel_upcoming_courses_followers', 100040, 'Followers', 'panel'),
(100050, 'panel_bundles', NULL, 'Bundles', 'panel'),
(100051, 'panel_bundles_lists', 100050, 'Lists', 'panel'),
(100052, 'panel_bundles_create', 100050, 'Create/Edit', 'panel'),
(100053, 'panel_bundles_delete', 100050, 'Delete', 'panel'),
(100054, 'panel_bundles_export_students_list', 100050, 'Export Students List', 'panel'),
(100055, 'panel_bundles_courses', 100050, 'Courses', 'panel'),
(100060, 'panel_assignments', NULL, 'Assignments', 'panel'),
(100061, 'panel_assignments_lists', 100060, 'My Assignments Lists', 'panel');

INSERT INTO `sections` (`id`, `name`, `section_group_id`, `caption`, `type`) VALUES
(100062, 'panel_assignments_my_courses_assignments', 100060, 'My Courses Assignments', 'panel'),
(100063, 'panel_assignments_students', 100060, 'Students Assignments', 'panel'),
(100070, 'panel_meetings', NULL, 'Meetings', 'panel'),
(100071, 'panel_meetings_my_reservation', 100070, 'My Reservation', 'panel'),
(100072, 'panel_meetings_requests', 100070, 'Requests', 'panel'),
(100073, 'panel_meetings_settings', 100070, 'Settings', 'panel'),
(100080, 'panel_quizzes', NULL, 'Quizzes', 'panel'),
(100081, 'panel_quizzes_lists', 100080, 'Lists', 'panel'),
(100082, 'panel_quizzes_create', 100080, 'Create/Edit', 'panel'),
(100083, 'panel_quizzes_delete', 100080, 'Delete', 'panel'),
(100084, 'panel_quizzes_results', 100080, 'Results', 'panel'),
(100085, 'panel_quizzes_my_results', 100080, 'My Results', 'panel'),
(100086, 'panel_quizzes_not_participated', 100080, 'Not Participated Lists', 'panel'),
(100090, 'panel_certificates', NULL, 'Certificates', 'panel'),
(100091, 'panel_certificates_lists', 100090, 'Lists', 'panel'),
(100092, 'panel_certificates_achievements', 100090, 'Achievements', 'panel'),
(100093, 'panel_certificates_course_certificates', 100090, 'Course Certificates', 'panel'),
(100100, 'panel_products', NULL, 'Products (Store)', 'panel'),
(100101, 'panel_products_lists', 100100, 'Lists', 'panel'),
(100102, 'panel_products_create', 100100, 'Create/Edit', 'panel'),
(100103, 'panel_products_delete', 100100, 'Delete', 'panel'),
(100104, 'panel_products_sales', 100100, 'Sales', 'panel'),
(100105, 'panel_products_purchases', 100100, 'Purchases', 'panel'),
(100106, 'panel_products_comments', 100100, 'Comments', 'panel'),
(100107, 'panel_products_my_comments', 100100, 'My Comments', 'panel'),
(100120, 'panel_financial', NULL, 'Financial', 'panel'),
(100121, 'panel_financial_sales_reports', 100120, 'Sales Reports', 'panel'),
(100122, 'panel_financial_summary', 100120, 'Summary', 'panel'),
(100123, 'panel_financial_payout', 100120, 'Payout', 'panel'),
(100124, 'panel_financial_charge_account', 100120, 'Charge Account', 'panel'),
(100125, 'panel_financial_subscribes', 100120, 'Subscribes', 'panel'),
(100126, 'panel_financial_registration_packages', 100120, 'Registration Packages', 'panel'),
(100127, 'panel_financial_installments', 100120, 'Installments', 'panel'),
(100140, 'panel_support', NULL, 'Support', 'panel'),
(100141, 'panel_support_lists', 100140, 'Lists', 'panel'),
(100142, 'panel_support_create', 100140, 'Create', 'panel'),
(100143, 'panel_support_tickets', 100140, 'Tickets', 'panel'),
(100160, 'panel_marketing', NULL, 'Marketing', 'panel'),
(100161, 'panel_marketing_special_offers', 100160, 'Special Offers', 'panel'),
(100162, 'panel_marketing_promotions', 100160, 'Promotions', 'panel'),
(100163, 'panel_marketing_affiliates', 100160, 'Affiliates', 'panel'),
(100164, 'panel_marketing_registration_bonus', 100160, 'Registration Bonus', 'panel'),
(100165, 'panel_marketing_coupons', 100160, 'Coupons', 'panel'),
(100166, 'panel_marketing_new_coupon', 100160, 'Create Coupons', 'panel'),
(100167, 'panel_marketing_delete_coupon', 100160, 'Delete Coupons', 'panel'),
(100180, 'panel_forums', NULL, 'Forums', 'panel'),
(100181, 'panel_forums_new_topic', 100180, 'New Topic', 'panel'),
(100182, 'panel_forums_my_topics', 100180, 'My Topics', 'panel'),
(100183, 'panel_forums_my_posts', 100180, 'My Posts', 'panel'),
(100184, 'panel_forums_bookmarks', 100180, 'Bookmarks', 'panel'),
(100200, 'panel_blog', NULL, 'Blog', 'panel'),
(100201, 'panel_blog_new_article', 100200, 'New/Edit Article', 'panel'),
(100202, 'panel_blog_my_articles', 100200, 'My Article', 'panel'),
(100203, 'panel_blog_delete_article', 100200, 'Delete Article', 'panel'),
(100204, 'panel_blog_comments', 100200, 'Comments', 'panel'),
(100220, 'panel_noticeboard', NULL, 'Noticeboard', 'panel'),
(100221, 'panel_noticeboard_history', 100220, 'Noticeboard History', 'panel'),
(100222, 'panel_noticeboard_create', 100220, 'Create/Edit Noticeboard', 'panel'),
(100223, 'panel_noticeboard_delete', 100220, 'Delete Noticeboard', 'panel'),
(100224, 'panel_noticeboard_course_notices', 100220, 'Course Notices', 'panel'),
(100225, 'panel_noticeboard_course_notices_create', 100220, 'Create/Edit Course Notices', 'panel'),
(100240, 'panel_rewards', NULL, 'Rewards', 'panel'),
(100241, 'panel_rewards_lists', 100240, 'Lists', 'panel'),
(100260, 'panel_ai_contents', NULL, 'AI Contents', 'panel'),
(100261, 'panel_ai_contents_lists', 100260, 'Lists', 'panel'),
(100280, 'panel_notifications', NULL, 'Notifications', 'panel'),
(100281, 'panel_notifications_lists', 100280, 'Lists', 'panel'),
(100300, 'panel_others', NULL, 'Others', 'panel'),
(100301, 'panel_others_profile_setting', 100300, 'Profile Settings', 'panel'),
(100302, 'panel_others_profile_url', 100300, 'Profile Url', 'panel'),
(100303, 'panel_others_logout', 100300, 'Logout', 'panel');

INSERT INTO `setting_translations` (`id`, `setting_id`, `locale`, `value`) VALUES
(1, 1, 'en', '{\"home\":{\"title\":\"Home\",\"description\":\"Home Page Description\",\"robot\":\"index\"},\"search\":{\"title\":\"Search\",\"description\":\"Search Page Description\",\"robot\":\"index\"},\"categories\":{\"title\":\"Category\",\"description\":\"Categories Page Description\",\"robot\":\"index\"},\"login\":{\"title\":\"Login\",\"description\":\"Login Page Description\",\"robot\":\"index\"},\"register\":{\"title\":\"Register\",\"description\":\"Register Page Description\",\"robot\":\"index\"},\"about\":{\"title\":\"about page title\",\"description\":\"about page Description\"},\"contact\":{\"title\":\"Contact\",\"description\":\"Contact Page Description\",\"robot\":\"index\"},\"certificate_validation\":{\"title\":\"Certificate validation\",\"description\":\"Certificate Validation Description\",\"robot\":\"index\"},\"classes\":{\"title\":\"Courses\",\"description\":\"Courses page Description\",\"robot\":\"index\"},\"blog\":{\"title\":\"Blog\",\"description\":\"Blog Page Description\",\"robot\":\"index\"},\"instructors\":{\"title\":\"Instructors\",\"description\":\"Instructors Page Description\",\"robot\":\"index\"},\"organizations\":{\"title\":\"Organizations\",\"description\":\"Organizations Page Description\",\"robot\":\"index\"},\"instructor_finder_wizard\":{\"title\":\"Instructor finder wizard\",\"description\":\"Tutor Finder Wizard Description\",\"robot\":\"noindex\"},\"instructor_finder\":{\"title\":\"Instructor finder\",\"description\":\"Tutor Finder Description\",\"robot\":\"index\"},\"reward_courses\":{\"title\":\"Reward courses\",\"description\":\"Reward Courses Description\",\"robot\":\"index\"},\"products_lists\":{\"title\":\"Store Products\",\"description\":\"Store Products Description\",\"robot\":\"noindex\"},\"reward_products\":{\"title\":\"Reward Products\",\"description\":\"Reward Products Description\",\"robot\":\"noindex\"},\"forum\":{\"title\":\"Forums\",\"description\":\"Forums Description\",\"robot\":\"noindex\"},\"upcoming_courses_lists\":{\"title\":\"Upcoming Course\",\"description\":\"Upcoming Courses Description\",\"robot\":\"noindex\"},\"tags\":{\"title\":\"Tags\",\"description\":\"Tags Page Description\",\"robot\":\"noindex\"}}'),
(2, 2, 'en', '{\"Instagram\":{\"title\":\"Instagram\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/instagram.svg\",\"link\":\"https:\\/\\/www.instagram.com\\/\",\"order\":\"1\"},\"Whatsapp\":{\"title\":\"Whatsapp\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/whatsapp.svg\",\"link\":\"https:\\/\\/web.whatsapp.com\\/\",\"order\":\"2\"},\"Twitter\":{\"title\":\"Twitter\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/twitter.svg\",\"link\":\"https:\\/\\/twitter.com\\/\",\"order\":\"3\"},\"Facebook\":{\"title\":\"Facebook\",\"image\":\"\\/store\\/1\\/default_images\\/social\\/facebook.svg\",\"link\":\"https:\\/\\/www.facebook.com\\/\",\"order\":\"4\"}}'),
(4, 5, 'en', '{\"site_name\":\"Spyberrys\",\"site_email\":\"spyberrys@gmail.com\",\"site_phone\":\"415-716-1166\",\"site_language\":\"EN\",\"register_method\":\"email\",\"default_time_zone\":\"Asia\\/Kolkata\",\"date_format\":\"textual\",\"time_format\":\"12_hours\",\"user_languages\":[\"AR\",\"EN\",\"ES\"],\"rtl_languages\":[\"AR\"],\"fav_icon\":\"\\/store\\/1\\/favicon.png\",\"logo\":\"\\/store\\/1\\/download.jpeg\",\"footer_logo\":\"\\/store\\/1\\/default_images\\/website-logo-white.png\",\"rtl_layout\":\"0\",\"preloading\":\"1\",\"hero_section1\":\"0\",\"hero_section2\":\"1\",\"content_translate\":\"0\",\"app_debugbar\":\"0\"}'),
(5, 6, 'en', '{\"commission\":\"20\",\"tax\":\"10\",\"minimum_payout\":\"50\",\"currency\":\"USD\",\"currency_position\":\"left\",\"price_display\":\"only_price\"}'),
(6, 8, 'en', '{\"title\":\"Joy of learning & teaching...\",\"description\":\"Rocket LMS is a fully-featured educational platform that helps instructors to create and publish video courses, live classes, and text courses and earn money, and helps students to learn in the easiest way.\",\"hero_background\":\"\\/store\\/1\\/default_images\\/hero_1.jpg\"}'),
(7, 12, 'en', '{\"css\":null,\"js\":null}'),
(8, 14, 'en', '{\"admin_login\":\"\\/store\\/1\\/default_images\\/admin_login.jpg\",\"admin_dashboard\":\"\\/store\\/1\\/default_images\\/admin_dashboard.jpg\",\"login\":\"\\/store\\/1\\/default_images\\/front_login.jpg\",\"register\":\"\\/store\\/1\\/default_images\\/front_register.jpg\",\"remember_pass\":\"\\/store\\/1\\/default_images\\/password_recovery.jpg\",\"verification\":\"\\/store\\/1\\/default_images\\/verification.jpg\",\"search\":\"\\/store\\/1\\/default_images\\/search_cover.png\",\"tags\":\"\\/store\\/1\\/default_images\\/search_cover.png\",\"categories\":\"\\/store\\/1\\/default_images\\/category_cover.png\",\"become_instructor\":\"\\/store\\/1\\/default_images\\/become_instructor.jpg\",\"certificate_validation\":\"\\/store\\/1\\/default_images\\/certificate_validation.jpg\",\"blog\":\"\\/store\\/1\\/default_images\\/blogs_cover.png\",\"instructors\":\"\\/store\\/1\\/default_images\\/instructors_cover.png\",\"organizations\":\"\\/store\\/1\\/default_images\\/organizations_cover.png\",\"dashboard\":\"\\/store\\/1\\/dashboard.png\",\"user_cover\":\"\\/store\\/1\\/default_images\\/default_cover.jpg\",\"instructor_finder_wizard\":\"\\/store\\/1\\/default_images\\/instructor_finder_wizard.jpg\",\"products_lists\":\"\\/store\\/1\\/default_images\\/category_cover.png\",\"upcoming_courses_lists\":\"\\/store\\/1\\/default_images\\/category_cover.png\",\"user_default_signature\":\"\\/store\\/1\\/default_images\\/default_signature.jpg\"}'),
(9, 15, 'en', '{\"title\":\"Joy of learning & teaching...\",\"description\":\"Spyberrys is a fully-featured educational platform that helps instructors to create and publish video courses, live classes, and text courses and earn money, and helps students to learn in the easiest way.\",\"hero_background\":\"\\/assets\\/default\\/img\\/home\\/world.png\",\"hero_vector\":\"\\/store\\/1\\/animated-header.json\",\"has_lottie\":\"1\"}'),
(10, 20, 'en', '[\"Inappropriate Course Content\",\"Inappropriate Behavior\",\"Policy Violation\",\"Spammy Content\",\"Other\"]'),
(11, 22, 'en', '{\"new_comment_admin\":\"7\",\"support_message_admin\":\"10\",\"support_message_replied_admin\":\"11\",\"promotion_plan_admin\":\"29\",\"new_contact_message\":\"26\",\"new_badge\":\"2\",\"change_user_group\":\"3\",\"course_created\":\"4\",\"course_approve\":\"5\",\"course_reject\":\"6\",\"new_comment\":\"7\",\"support_message\":\"8\",\"support_message_replied\":\"9\",\"new_rating\":\"17\",\"webinar_reminder\":\"27\",\"new_financial_document\":\"12\",\"payout_request\":\"13\",\"payout_proceed\":\"14\",\"offline_payment_request\":\"18\",\"offline_payment_approved\":\"19\",\"offline_payment_rejected\":\"20\",\"new_sales\":\"15\",\"new_purchase\":\"16\",\"new_subscribe_plan\":\"21\",\"promotion_plan\":\"28\",\"new_appointment\":\"22\",\"new_appointment_link\":\"23\",\"appointment_reminder\":\"24\",\"meeting_finished\":\"25\",\"new_certificate\":\"30\",\"waiting_quiz\":\"31\",\"waiting_quiz_result\":\"32\",\"payout_request_admin\":\"13\",\"product_new_sale\":\"33\",\"product_new_purchase\":\"34\",\"product_new_comment\":\"35\",\"product_tracking_code\":\"36\",\"product_new_rating\":\"37\",\"product_receive_shipment\":\"38\",\"product_out_of_stock\":\"39\",\"student_send_message\":\"40\",\"instructor_send_message\":\"41\",\"instructor_set_grade\":\"42\",\"send_post_in_topic\":\"44\",\"publish_instructor_blog_post\":\"45\",\"new_comment_for_instructor_blog_post\":\"46\",\"meeting_reserve_reminder\":\"47\",\"subscribe_reminder\":\"48\",\"reminder_gift_to_receipt\":\"52\",\"gift_sender_confirmation\":\"53\",\"gift_sender_notification\":\"54\",\"admin_gift_submission\":\"55\",\"admin_gift_sending_confirmation\":\"56\",\"reminder_installments_before_overdue\":\"57\",\"installment_due_reminder\":\"58\",\"reminder_installments_after_overdue\":\"59\",\"approve_installment_verification_request\":\"60\",\"reject_installment_verification_request\":\"61\",\"paid_installment_step\":\"62\",\"paid_installment_step_for_admin\":\"63\",\"paid_installment_upfront\":\"64\",\"installment_verification_request_sent\":\"65\",\"admin_installment_verification_request_sent\":\"66\",\"instalment_request_submitted\":\"67\",\"instalment_request_submitted_for_admin\":\"68\",\"upcoming_course_submission\":\"69\",\"upcoming_course_submission_for_admin\":\"70\",\"upcoming_course_approved\":\"71\",\"upcoming_course_rejected\":\"72\",\"upcoming_course_published\":\"73\",\"upcoming_course_followed\":\"74\",\"upcoming_course_published_for_followers\":\"75\",\"user_get_cashback\":\"76\",\"user_get_cashback_notification_for_admin\":\"77\",\"bundle_submission\":\"78\",\"bundle_submission_for_admin\":\"79\",\"bundle_approved\":\"80\",\"bundle_rejected\":\"81\",\"new_review_for_bundle\":\"82\",\"registration_bonus_achieved\":\"83\",\"registration_bonus_unlocked\":\"84\",\"registration_bonus_unlocked_for_admin\":\"85\",\"registration_package_activated\":\"86\",\"registration_package_activated_for_admin\":\"87\",\"registration_package_expired\":\"87\",\"contact_message_submission\":\"88\",\"contact_message_submission_for_admin\":\"89\",\"waitlist_submission\":\"90\",\"waitlist_submission_for_admin\":\"91\",\"new_referral_user\":\"92\",\"user_role_change\":\"97\",\"add_to_user_group\":\"98\",\"become_instructor_request_approved\":\"99\",\"become_instructor_request_rejected\":\"100\",\"new_question_in_forum\":\"101\",\"new_answer_in_forum\":\"102\",\"new_appointment_session\":\"103\",\"new_quiz\":\"93\",\"user_get_new_point\":\"94\",\"new_course_notice\":\"96\",\"new_registration\":\"104\",\"new_become_instructor_request\":\"105\",\"new_course_enrollment\":\"106\",\"new_forum_topic\":\"107\",\"new_report_item_for_admin\":\"108\",\"new_item_created\":\"109\",\"new_store_order\":\"110\",\"subscription_plan_activated\":\"111\",\"content_review_request\":\"112\",\"new_user_blog_post\":\"113\",\"new_user_item_rating\":\"114\",\"new_organization_user\":\"115\",\"user_wallet_charge\":\"116\",\"new_user_payout_request\":\"117\",\"new_offline_payment_request\":\"118\",\"user_access_to_content\":\"119\",\"submit_form_by_users\":\"120\"}'),
(12, 23, 'en', '{\"540\":{\"title\":\"Qatar National Bank\",\"image\":\"\\/store\\/1\\/default_images\\/offline_payments\\/Qatar National Bank.png\",\"card_id\":\"2578-4910-3682-6288\",\"account_id\":\"38152294372\",\"iban\":\"QA66QUWW934528129454345775226\"},\"334\":{\"title\":\"State Bank of India\",\"image\":\"\\/store\\/1\\/default_images\\/offline_payments\\/State Bank of India.png\",\"card_id\":\"6282-4518-1237-7641\",\"account_id\":\"56238341127\",\"iban\":\"IN37ABNA2422193788\"},\"jhgDW\":{\"title\":\"JPMorgan\",\"image\":\"\\/store\\/1\\/default_images\\/offline_payments\\/jpmorgan.png\",\"card_id\":\"5012-4518-1772-8911\",\"account_id\":\"46237751125\",\"iban\":\"NL37ABNA2423554788\"}}'),
(13, 24, 'en', '{\"background\":\"\\/store\\/1\\/default_images\\/category_cover.png\",\"latitude\":\"43.45905\",\"longitude\":\"11.87300\",\"map_zoom\":\"16\",\"phones\":\"415-716-1166 , 415-716-1167\",\"emails\":\"mail@lms.rocket-soft.org , info@lms.rocket-soft.org\",\"address\":\"4193 Roosevelt Street\\r\\nSan Francisco, CA 94103\"}'),
(14, 25, 'en', '{\"latest_classes\":\"1\",\"best_sellers\":\"1\",\"free_classes\":\"1\",\"discount_classes\":\"1\",\"best_rates\":\"1\",\"trend_categories\":\"1\",\"testimonials\":\"1\",\"subscribes\":\"1\",\"blog\":\"1\",\"organizations\":\"1\",\"instructors\":\"1\",\"video_or_image_section\":\"1\",\"find_instructors\":\"1\",\"reward_program\":\"1\"}'),
(15, 26, 'en', '{\"02nh9a\":{\"title\":\"Home\",\"link\":\"\\/\",\"order\":\"1\"},\"1cH2kF\":{\"title\":\"Courses\",\"link\":\"\\/classes?sort=newest\",\"order\":\"2\"},\"gGf8Lv\":{\"title\":\"Instructors\",\"link\":\"\\/instructor-finder\",\"order\":\"3\"},\"Uo5b2v\":{\"title\":\"Store\",\"link\":\"\\/products\",\"order\":\"4\"},\"Wnq5Qb\":{\"title\":\"Forums\",\"link\":\"\\/forums\",\"order\":\"5\"}}'),
(16, 27, 'en', '{\"link\":\"\\/classes\",\"title\":\"Start learning anywhere, anytime...\",\"description\":\"Use Rocket LMS to access high-quality education materials without any limitations in the easiest way.\",\"background\":\"\\/store\\/1\\/default_images\\/home_video_section.png\"}'),
(17, 28, 'en', '{\"error_image\":\"\\/store\\/1\\/default_images\\/404.svg\",\"error_title\":\"Page not found!\",\"error_description\":\"Sorry, this page is not available...\"}'),
(18, 29, 'en', '{\"link\":\"\\/classes?sort=newest\",\"background\":\"\\/store\\/1\\/sidebar-user.png\"}'),
(19, 30, 'en', '{\"status\":\"0\",\"users_affiliate_status\":\"0\",\"affiliate_user_commission\":\"5\",\"store_affiliate_user_commission\":\"5\",\"affiliate_user_amount\":\"20\",\"referred_user_amount\":\"10\",\"referral_description\":\"You can share your affiliate URL you will get the above rewards when a user uses the platform.\"}'),
(20, 4, 'en', '{\"first_column\":{\"title\":\"About US\",\"value\":\"<p><font color=\\\"#ffffff\\\">Rocket LMS is a fully-featured learning management system that helps you to run your education business in several hours. This platform helps instructors to create professional education materials and helps students to learn from the best instructors.<\\/font><\\/p>\"},\"second_column\":{\"title\":\"Additional Links\",\"value\":\"<p><a href=\\\"\\/login\\\"><font color=\\\"#ffffff\\\">- Login<\\/font><\\/a><\\/p><p><font color=\\\"#ffffff\\\"><a href=\\\"\\/register\\\"><font color=\\\"#ffffff\\\">- Register<\\/font><\\/a><br><\\/font><\\/p><p><a href=\\\"\\/blog\\\"><font color=\\\"#ffffff\\\">- Blog<\\/font><\\/a><\\/p><p><a href=\\\"\\/contact\\\"><font color=\\\"#ffffff\\\">- Contact us<\\/font><\\/a><\\/p><p><font color=\\\"#ffffff\\\"><a href=\\\"\\/certificate_validation\\\"><font color=\\\"#ffffff\\\">- Certificate validation<\\/font><\\/a><br><\\/font><\\/p><p><font color=\\\"#ffffff\\\"><a href=\\\"\\/become-instructor\\\"><font color=\\\"#ffffff\\\">- Become instructor<\\/font><\\/a><br><\\/font><\\/p><p><a href=\\\"\\/pages\\/terms\\\"><font color=\\\"#ffffff\\\">- Terms &amp; rules<\\/font><\\/a><\\/p><p><a href=\\\"\\/pages\\/about\\\"><font color=\\\"#ffffff\\\">- About us<\\/font><\\/a><br><\\/p>\"},\"third_column\":{\"title\":\"Similar Businesses\",\"value\":\"<p><a href=\\\"https:\\/\\/www.udemy.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Udemy<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillshare.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Skillshare<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.coursera.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Coursera<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.linkedin.com\\/learning\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Lynda<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillsoft.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Skillsoft<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.udacity.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Udacity<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.edx.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- edX<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.masterclass.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Masterclass<\\/font><\\/a><br><\\/p>\"},\"forth_column\":{\"title\":\"Purchase Rocket LMS\",\"value\":\"<p><a title=\\\"Notnt\\\" href=\\\"https:\\/\\/codecanyon.net\\\"><img style=\\\"width: 200px;\\\" src=\\\"\\/store\\/1\\/default_images\\/envato.png\\\"><\\/a><\\/p>\"}}'),
(31, 4, 'ar', '{\"first_column\":{\"title\":\"\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0639\\u0646\\u0627\",\"value\":\"<p><font color=\\\"#ffffff\\\">Rocket LMS \\u0647\\u0648 \\u0646\\u0638\\u0627\\u0645 \\u0625\\u062f\\u0627\\u0631\\u0629 \\u062a\\u0639\\u0644\\u0645 \\u0643\\u0627\\u0645\\u0644 \\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u062a \\u064a\\u0633\\u0627\\u0639\\u062f\\u0643 \\u0639\\u0644\\u0649 \\u0625\\u062f\\u0627\\u0631\\u0629 \\u0623\\u0639\\u0645\\u0627\\u0644\\u0643 \\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645\\u064a\\u0629 \\u0641\\u064a \\u0639\\u062f\\u0629 \\u0633\\u0627\\u0639\\u0627\\u062a. \\u062a\\u0633\\u0627\\u0639\\u062f \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0645\\u0646\\u0635\\u0629 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0645\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0645\\u0648\\u0627\\u062f \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a\\u0629 \\u0627\\u062d\\u062a\\u0631\\u0627\\u0641\\u064a\\u0629 \\u0648\\u062a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0645\\u0646 \\u0623\\u0641\\u0636\\u0644 \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646.<\\/font><\\/p>\"},\"second_column\":{\"title\":\"\\u0631\\u0648\\u0627\\u0628\\u0637 \\u0625\\u0636\\u0627\\u0641\\u064a\\u0629\",\"value\":\"<p><a href=\\\"\\/login\\\"><span style=\\\"color: #ffffff;\\\">- \\u062a\\u0633\\u062c\\u064a\\u0644 \\u0627\\u0644\\u062f\\u062e\\u0648\\u0644<\\/span><\\/a><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/register\\\"><span style=\\\"color: #ffffff;\\\">- \\u062a\\u0633\\u062c\\u064a\\u0644<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><a href=\\\"\\/blog\\\"><span style=\\\"color: #ffffff;\\\">- \\u0645\\u0642\\u0627\\u0644\\u0627\\u062a<\\/span><\\/a><\\/p>\\r\\n<p><a href=\\\"\\/contact\\\"><span style=\\\"color: #ffffff;\\\">- \\u0627\\u062a\\u0635\\u0644 \\u0628\\u0646\\u0627<\\/span><\\/a><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/certificate_validation\\\"><span style=\\\"color: #ffffff;\\\">- \\u0627\\u0644\\u062a\\u062d\\u0642\\u0642 \\u0645\\u0646 \\u0635\\u062d\\u0629 \\u0627\\u0644\\u0634\\u0647\\u0627\\u062f\\u0629<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/become-instructor\\\"><span style=\\\"color: #ffffff;\\\">- \\u0623\\u0635\\u0628\\u062d \\u0645\\u062f\\u0631\\u0628\\u0627<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><a href=\\\"\\/pages\\/terms\\\"><span style=\\\"color: #ffffff;\\\">- \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0648\\u0627\\u0644\\u0642\\u0648\\u0627\\u0639\\u062f<\\/span><\\/a><\\/p>\\r\\n<p><a href=\\\"\\/pages\\/about\\\"><span style=\\\"color: #ffffff;\\\">- \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0639\\u0646\\u0627<\\/span><\\/a><\\/p>\"},\"third_column\":{\"title\":\"\\u0623\\u0639\\u0645\\u0627\\u0644 \\u0645\\u0645\\u0627\\u062b\\u0644\\u0629\",\"value\":\"<p><a href=\\\"https:\\/\\/www.udemy.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u064a\\u0648\\u062f\\u0645\\u064a<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillshare.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0627\\u0633\\u06a9\\u06cc\\u0644 \\u0634\\u06cc\\u0631<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.coursera.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0643\\u0631\\u0633 \\u0627\\u064a\\u0631\\u0627<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.linkedin.com\\/learning\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0644\\u06cc\\u0646\\u062f\\u0627<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillsoft.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0627\\u0633\\u0643\\u064a\\u0644 \\u0633\\u0641\\u062a<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.udacity.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0627\\u0648\\u062f\\u0627\\u0633\\u064a\\u062a\\u064a<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.edx.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">\\u0627\\u062f\\u0643\\u0633<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.masterclass.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- \\u0645\\u0633\\u062a\\u0631 \\u0643\\u0644\\u0633<\\/font><\\/a><br><\\/p>\"},\"forth_column\":{\"title\":\"\\u0642\\u0645 \\u0628\\u0634\\u0631\\u0627\\u0621 Rocket LMS\",\"value\":\"<p><a title=\\\"Notnt\\\" href=\\\"https:\\/\\/codecanyon.net\\\"><img style=\\\"width: 200px;\\\" src=\\\"\\/store\\/1\\/default_images\\/envato.png\\\"><\\/a><\\/p>\"}}'),
(32, 31, 'en', '{\"agora_resolution\":null,\"agora_max_bitrate\":\"2260\",\"agora_min_bitrate\":\"1130\",\"agora_frame_rate\":\"15\",\"agora_live_streaming\":\"1\",\"agora_chat\":\"1\",\"agora_in_free_courses\":\"1\",\"agora_for_meeting\":\"1\",\"meeting_live_stream_type\":\"single\",\"course_live_stream_type\":\"single\",\"agora_app_id\":\"7d9d07ce0bf24373b90e417d922086f8\",\"agora_app_certificate\":\"9fc9765d0fb042538132f5a5dda86526\",\"new_interactive_file\":\"0\",\"timezone_in_register\":\"1\",\"timezone_in_create_webinar\":\"1\",\"sequence_content_status\":\"0\",\"webinar_assignment_status\":\"0\",\"webinar_private_content_status\":\"0\",\"disable_view_content_after_user_register\":\"0\",\"course_forum_status\":\"0\",\"forums_status\":\"0\",\"direct_classes_payment_button_status\":\"1\",\"direct_bundles_payment_button_status\":\"1\",\"direct_products_payment_button_status\":\"1\",\"cookie_settings_status\":\"0\",\"mobile_app_status\":\"0\",\"maintenance_status\":\"0\",\"maintenance_access_key\":\"key\",\"extra_time_to_join_status\":\"1\",\"extra_time_to_join_default_value\":\"20\",\"show_other_register_method\":\"1\",\"show_certificate_additional_in_register\":\"0\",\"show_google_login_button\":\"1\",\"show_facebook_login_button\":\"1\",\"google_client_id\":null,\"google_client_secret\":null,\"facebook_client_id\":null,\"facebook_client_secret\":null,\"show_live_chat_widget\":\"0\",\"cashback_active\":\"0\",\"display_cashback_notice_in_the_product_page\":\"0\",\"display_minimum_amount_cashback_notices\":\"0\",\"available_session_apis\":[\"local\",\"zoom\"],\"available_sources\":[\"upload\",\"youtube\",\"vimeo\",\"external_link\",\"google_drive\",\"iframe\",\"s3\",\"secure_host\"],\"bunny_configs\":{\"library_id\":\"271122\",\"hostname\":\"vz-10fd0cd5-fe2.b-cdn.net\",\"access_key\":\"119c20f0-9e4f-4af5-bc461c68e14d-3666-4c4b\"},\"select_the_role_during_registration\":[\"teacher\",\"organization\"],\"waitlist_status\":\"0\",\"upcoming_courses_status\":\"0\",\"user_register_form\":null,\"instructor_register_form\":null,\"organization_register_form\":null,\"become_instructor_form\":null,\"become_organization_form\":null,\"frontend_coupons_status\":\"0\",\"frontend_coupons_display_type\":null,\"course_notes_status\":\"0\",\"course_notes_attachment\":\"0\",\"zoom_client_id\":null,\"zoom_client_secret\":null,\"zoom_account_id\":null,\"bigbluebutton_server_base_url\":null,\"bigbluebutton_security_salt\":null,\"jitsi_live_url\":null,\"twilio_sid\":null,\"twilio_auth_token\":null,\"twilio_number\":null}'),
(33, 32, 'en', '{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/instructor_finder_banner.jpg\",\"title\":\"Find the best instructor\",\"description\":\"Looking for an instructor? Find the best instructors according to different parameters like gender, skill level, price, meeting type, rating, etc.\\r\\nFind instructors on the map.\",\"button1\":{\"title\":\"Tutor Finder\",\"link\":\"\\/instructor-finder\\/wizard\"},\"button2\":{\"title\":\"Tutors on Map\",\"link\":\"\\/instructor-finder\"}}'),
(34, 33, 'en', '{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/club_points_banner.png\",\"title\":\"Win Club Points\",\"description\":\"Use Rocket LMS and win club points according to different activities.\\r\\nYou will be able to use your club points to get free prizes and courses. Start using the system now and collect points!\",\"button1\":{\"title\":\"Rewards\",\"link\":\"\\/reward-courses\"},\"button2\":{\"title\":\"Points Club\",\"link\":\"\\/panel\\/rewards\"}}'),
(35, 34, 'en', '{\"status\":\"0\",\"exchangeable\":\"0\",\"exchangeable_unit\":null,\"want_more_points_link\":\"\\/pages\\/reward_points_system\"}'),
(38, 37, 'en', '{\"status\":\"0\",\"show_packages_during_registration\":\"0\",\"force_user_to_select_a_package\":\"0\",\"enable_home_section\":\"0\"}'),
(39, 38, 'en', '{\"status\":\"0\",\"courses_capacity\":\"20\",\"courses_count\":\"5\",\"meeting_count\":\"20\",\"product_count\":\"5\"}'),
(40, 39, 'en', '{\"status\":\"0\",\"instructors_count\":\"5\",\"students_count\":\"30\",\"courses_capacity\":\"30\",\"courses_count\":\"10\",\"meeting_count\":\"40\",\"product_count\":\"10\"}'),
(41, 40, 'en', '{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/become_instructor_banner.jpg\",\"title\":\"Become an instructor\",\"description\":\"Are you interested to be a part of our community?\\r\\nYou can be a part of our community by signing up as an instructor or organization.\",\"button1\":{\"title\":\"Become an Instructor\",\"link\":\"\\/become-instructor\"},\"button2\":{\"title\":\"Registration Packages\",\"link\":\"become-instructor\\/packages\\/\"}}'),
(42, 8, 'ar', '{\"title\":\"\\u0645\\u062a\\u0639\\u0629 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0648\\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645 ...\",\"description\":\"Rocket LMS \\u0639\\u0628\\u0627\\u0631\\u0629 \\u0639\\u0646 \\u0646\\u0638\\u0627\\u0645 \\u0623\\u0633\\u0627\\u0633\\u064a \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a \\u0643\\u0627\\u0645\\u0644 \\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u062a \\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0648\\u0646\\u0634\\u0631 \\u062f\\u0648\\u0631\\u0627\\u062a \\u0641\\u064a\\u062f\\u064a\\u0648 \\u0648\\u0641\\u0635\\u0648\\u0644 \\u0645\\u0628\\u0627\\u0634\\u0631\\u0629 \\u0648\\u062f\\u0648\\u0631\\u0627\\u062a \\u0646\\u0635\\u064a\\u0629 \\u0648\\u0643\\u0633\\u0628 \\u0627\\u0644\\u0645\\u0627\\u0644 \\u060c \\u0648\\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0628\\u0623\\u0633\\u0647\\u0644 \\u0637\\u0631\\u064a\\u0642\\u0629.\",\"hero_background\":\"\\/store\\/1\\/default_images\\/hero_1.jpg\"}'),
(43, 8, 'es', '{\"title\":\"Alegr\\u00eda de aprender y ense\\u00f1ar ...\",\"description\":\"Rocket LMS es una plataforma educativa con todas las funciones que ayuda a los instructores a crear y publicar cursos de video, clases en vivo y cursos de texto y ganar dinero, y ayuda a los estudiantes a aprender de la manera m\\u00e1s f\\u00e1cil.\",\"hero_background\":\"\\/store\\/1\\/default_images\\/hero_1.jpg\"}'),
(44, 15, 'ar', '{\"title\":\"\\u0645\\u062a\\u0639\\u0629 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0648\\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645 ...\",\"description\":\"Rocket LMS \\u0639\\u0628\\u0627\\u0631\\u0629 \\u0639\\u0646 \\u0646\\u0638\\u0627\\u0645 \\u0623\\u0633\\u0627\\u0633\\u064a \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a \\u0643\\u0627\\u0645\\u0644 \\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u062a \\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0648\\u0646\\u0634\\u0631 \\u062f\\u0648\\u0631\\u0627\\u062a \\u0641\\u064a\\u062f\\u064a\\u0648 \\u0648\\u0641\\u0635\\u0648\\u0644 \\u0645\\u0628\\u0627\\u0634\\u0631\\u0629 \\u0648\\u062f\\u0648\\u0631\\u0627\\u062a \\u0646\\u0635\\u064a\\u0629 \\u0648\\u0643\\u0633\\u0628 \\u0627\\u0644\\u0645\\u0627\\u0644 \\u060c \\u0648\\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0628\\u0623\\u0633\\u0647\\u0644 \\u0637\\u0631\\u064a\\u0642\\u0629.\",\"hero_background\":\"\\/assets\\/default\\/img\\/home\\/world.png\",\"hero_vector\":\"\\/store\\/1\\/animated-header.json\",\"has_lottie\":\"1\"}'),
(45, 15, 'es', '{\"title\":\"Alegr\\u00eda de aprender y ense\\u00f1ar ...\",\"description\":\"Rocket LMS es una plataforma educativa con todas las funciones que ayuda a los instructores a crear y publicar cursos de video, clases en vivo y cursos de texto y ganar dinero, y ayuda a los estudiantes a aprender de la manera m\\u00e1s f\\u00e1cil.\",\"hero_background\":\"\\/assets\\/default\\/img\\/home\\/world.png\",\"hero_vector\":\"\\/store\\/1\\/animated-header.json\",\"has_lottie\":\"1\"}'),
(46, 27, 'ar', '{\"link\":\"\\/classes\",\"title\":\"\\u0627\\u0628\\u062f\\u0623 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0641\\u064a \\u0623\\u064a \\u0645\\u0643\\u0627\\u0646 \\u0648\\u0641\\u064a \\u0623\\u064a \\u0648\\u0642\\u062a ...\",\"description\":\"\\u0627\\u0633\\u062a\\u062e\\u062f\\u0645 Rocket LMS \\u0644\\u0644\\u0648\\u0635\\u0648\\u0644 \\u0625\\u0644\\u0649 \\u0645\\u0648\\u0627\\u062f \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a\\u0629 \\u0639\\u0627\\u0644\\u064a\\u0629 \\u0627\\u0644\\u062c\\u0648\\u062f\\u0629 \\u062f\\u0648\\u0646 \\u0623\\u064a \\u0642\\u064a\\u0648\\u062f \\u0648\\u0628\\u0623\\u0633\\u0647\\u0644 \\u0637\\u0631\\u064a\\u0642\\u0629.\",\"background\":\"\\/store\\/1\\/default_images\\/home_video_section.png\"}'),
(47, 27, 'es', '{\"link\":\"\\/classes\",\"title\":\"Empiece a aprender en cualquier lugar, en cualquier momento ...\",\"description\":\"Utilice Rocket LMS para acceder a materiales educativos de alta calidad sin limitaciones de la forma m\\u00e1s sencilla.\",\"background\":\"\\/store\\/1\\/default_images\\/home_video_section.png\"}'),
(48, 29, 'ar', '{\"link\":\"\\/classes?sort=newest\",\"background\":\"\\/store\\/1\\/sidebar-user-ar.png\"}'),
(49, 29, 'es', '{\"link\":\"\\/classes?sort=newest\",\"background\":\"\\/store\\/1\\/sidebar-user-sp.png\"}'),
(50, 4, 'es', '{\"first_column\":{\"title\":\"Sobre Nosotras\",\"value\":\"<p><font color=\\\"#ffffff\\\">Rocket LMS es un sistema de gesti\\u00f3n de aprendizaje con todas las funciones que le ayuda a gestionar su negocio educativo en varias horas. Esta plataforma ayuda a los instructores a crear materiales educativos profesionales y ayuda a los estudiantes a aprender de los mejores instructores.<\\/font><\\/p>\"},\"second_column\":{\"title\":\"Enlaces Adicionales\",\"value\":\"<p><a href=\\\"\\/login\\\"><span style=\\\"color: #ffffff;\\\">- Acceso<\\/span><\\/a><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/register\\\"><span style=\\\"color: #ffffff;\\\">- Registrarse<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><a href=\\\"\\/blog\\\"><span style=\\\"color: #ffffff;\\\">- Blog<\\/span><\\/a><\\/p>\\r\\n<p><a href=\\\"\\/contact\\\"><span style=\\\"color: #ffffff;\\\">- Contacta con nosotras<\\/span><\\/a><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/certificate_validation\\\"><span style=\\\"color: #ffffff;\\\">- Validaci\\u00f3n de certificado<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><span style=\\\"color: #ffffff;\\\"><a href=\\\"\\/become-instructor\\\"><span style=\\\"color: #ffffff;\\\">- Convi\\u00e9rtete en instructor<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><a href=\\\"\\/pages\\/terms\\\"><span style=\\\"color: #ffffff;\\\">- T\\u00e9rminos y reglas<\\/span><\\/a><\\/p>\\r\\n<p><a href=\\\"\\/pages\\/about\\\"><span style=\\\"color: #ffffff;\\\">- Sobre nosotras<\\/span><\\/a><\\/p>\"},\"third_column\":{\"title\":\"Negocios Similares\",\"value\":\"<p><a href=\\\"https:\\/\\/www.udemy.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Udemy<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillshare.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Skillshare<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.coursera.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Coursera<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.linkedin.com\\/learning\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Lynda<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.skillsoft.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Skillsoft<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.udacity.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Udacity<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.edx.org\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- edX<\\/font><\\/a><\\/p><p><a href=\\\"https:\\/\\/www.masterclass.com\\/\\\" target=\\\"_blank\\\"><font color=\\\"#ffffff\\\">- Masterclass<\\/font><\\/a><br><\\/p>\"},\"forth_column\":{\"title\":\"Compra Rocket LMS\",\"value\":\"<p><a title=\\\"Notnt\\\" href=\\\"https:\\/\\/codecanyon.net\\\"><img style=\\\"width: 200px;\\\" src=\\\"\\/store\\/1\\/default_images\\/envato.png\\\"><\\/a><\\/p>\"}}'),
(51, 26, 'es', '{\"02nh9a\":{\"title\":\"hogar\",\"link\":\"\\/\",\"order\":\"1\"},\"1cH2kF\":{\"title\":\"Cursos\",\"link\":\"\\/classes?sort=newest\",\"order\":\"2\"},\"gGf8Lv\":{\"title\":\"Instructoras\",\"link\":\"\\/instructor-finder\",\"order\":\"3\"},\"VBxDrB\":{\"title\":\"Blog\",\"link\":\"\\/blog\",\"order\":\"4\"},\"Uo5b2v\":{\"title\":\"Tienda\",\"link\":\"\\/products\",\"order\":\"4\"},\"Wnq5Qb\":{\"title\":\"Foros\",\"link\":\"\\/forums\",\"order\":\"5\"}}'),
(52, 26, 'ar', '{\"02nh9a\":{\"title\":\"\\u0627\\u0644\\u0635\\u0641\\u062d\\u0629 \\u0627\\u0644\\u0631\\u0626\\u064a\\u0633\\u064a\\u0629\",\"link\":\"\\/\",\"order\":\"1\"},\"1cH2kF\":{\"title\":\"\\u0627\\u0644\\u062f\\u0648\\u0631\\u0627\\u062a\",\"link\":\"\\/classes?sort=newest\",\"order\":\"2\"},\"gGf8Lv\":{\"title\":\"\\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646\",\"link\":\"\\/instructor-finder\",\"order\":\"3\"},\"Uo5b2v\":{\"title\":\"\\u0645\\u062a\\u062c\\u0631\",\"link\":\"\\/products\",\"order\":\"4\"},\"Wnq5Qb\":{\"title\":\"\\u0627\\u0644\\u0645\\u0646\\u062a\\u062f\\u064a\\u0627\\u062a\",\"link\":\"\\/forums\",\"order\":\"5\"}}'),
(53, 32, 'ar', '{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/instructor_finder_banner.jpg\",\"title\":\"\\u0627\\u0639\\u062b\\u0631 \\u0639\\u0644\\u0649 \\u0623\\u0641\\u0636\\u0644 \\u0645\\u062f\\u0631\\u0628\",\"description\":\"\\u062a\\u0628\\u062d\\u062b \\u0639\\u0646 \\u0645\\u062f\\u0631\\u0628\\u061f \\u0627\\u0639\\u062b\\u0631 \\u0639\\u0644\\u0649 \\u0623\\u0641\\u0636\\u0644 \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0648\\u0641\\u0642\\u064b\\u0627 \\u0644\\u0645\\u0639\\u0627\\u064a\\u064a\\u0631 \\u0645\\u062e\\u062a\\u0644\\u0641\\u0629 \\u0645\\u062b\\u0644 \\u0627\\u0644\\u062c\\u0646\\u0633 \\u0648\\u0645\\u0633\\u062a\\u0648\\u0649 \\u0627\\u0644\\u0645\\u0647\\u0627\\u0631\\u0629 \\u0648\\u0627\\u0644\\u0633\\u0639\\u0631 \\u0648\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0627\\u062c\\u062a\\u0645\\u0627\\u0639 \\u0648\\u0627\\u0644\\u062a\\u0642\\u064a\\u064a\\u0645 \\u0648\\u0645\\u0627 \\u0625\\u0644\\u0649 \\u0630\\u0644\\u0643.\\r\\n\\u0627\\u0628\\u062d\\u062b \\u0639\\u0646 \\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062e\\u0631\\u064a\\u0637\\u0629.\",\"button1\":{\"title\":\"\\u0627\\u0644\\u0628\\u0627\\u062d\\u062b \\u0639\\u0646 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0645\",\"link\":\"\\/instructor-finder\\/wizard\"},\"button2\":{\"title\":\"\\u0645\\u062f\\u0631\\u0633\\u0648\\u0646 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062e\\u0631\\u064a\\u0637\\u0629\",\"link\":\"\\/instructor-finder\"}}'),
(54, 32, 'es', '{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/instructor_finder_banner.jpg\",\"title\":\"Encuentra la mejor instructora\",\"description\":\"\\u00bfBuscas un instructor? Encuentre los mejores instructores seg\\u00fan diferentes par\\u00e1metros como g\\u00e9nero, nivel de habilidad, precio, tipo de reuni\\u00f3n, calificaci\\u00f3n, etc.\\r\\nEncuentra instructores en el mapa.\",\"button1\":{\"title\":\"Buscadora de tutores\",\"link\":\"\\/instructor-finder\\/wizard\"},\"button2\":{\"title\":\"Tutores en el mapa\",\"link\":\"\\/instructor-finder\"}}'),
(55, 33, 'ar', '{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/club_points_banner.png\",\"title\":\"\\u0627\\u0631\\u0628\\u062d \\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0646\\u0627\\u062f\\u064a\",\"description\":\"\\u0627\\u0633\\u062a\\u062e\\u062f\\u0645 Rocket LMS \\u0648\\u0627\\u0631\\u0628\\u062d \\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0646\\u0627\\u062f\\u064a \\u0648\\u0641\\u0642\\u064b\\u0627 \\u0644\\u0644\\u0623\\u0646\\u0634\\u0637\\u0629 \\u0627\\u0644\\u0645\\u062e\\u062a\\u0644\\u0641\\u0629.\\r\\n\\u0633\\u062a\\u062a\\u0645\\u0643\\u0646 \\u0645\\u0646 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0646\\u0627\\u062f\\u064a \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0628\\u0643 \\u0644\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u062c\\u0648\\u0627\\u0626\\u0632 \\u0648\\u062f\\u0648\\u0631\\u0627\\u062a \\u0645\\u062c\\u0627\\u0646\\u064a\\u0629. \\u0627\\u0628\\u062f\\u0623 \\u0641\\u064a \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u0646\\u0638\\u0627\\u0645 \\u0627\\u0644\\u0622\\u0646 \\u0648\\u0627\\u062c\\u0645\\u0639 \\u0627\\u0644\\u0646\\u0642\\u0627\\u0637!\",\"button1\":{\"title\":\"\\u0627\\u0644\\u0645\\u0643\\u0627\\u0641\\u0622\\u062a\",\"link\":\"\\/reward-courses\"},\"button2\":{\"title\":\"\\u0646\\u0627\\u062f\\u064a \\u0627\\u0644\\u0646\\u0642\\u0627\\u0637\",\"link\":\"\\/panel\\/rewards\"}}'),
(56, 33, 'es', '{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/club_points_banner.png\",\"title\":\"Gana puntos del club\",\"description\":\"Utilice Rocket LMS y gane puntos del club seg\\u00fan diferentes actividades.\\r\\nPodr\\u00e1s utilizar tus puntos del club para conseguir premios y cursos gratuitos. \\u00a1Comience a usar el sistema ahora y acumule puntos!\",\"button1\":{\"title\":\"Recompensas\",\"link\":\"\\/reward-courses\"},\"button2\":{\"title\":\"club de puntos\",\"link\":\"\\/panel\\/rewards\"}}'),
(57, 40, 'ar', '{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/become_instructor_banner.jpg\",\"title\":\"\\u0643\\u0646 \\u0645\\u062f\\u0631\\u0628\\u064b\\u0627\",\"description\":\"\\u0647\\u0644 \\u0623\\u0646\\u062a \\u0645\\u0647\\u062a\\u0645 \\u0628\\u0623\\u0646 \\u062a\\u0643\\u0648\\u0646 \\u062c\\u0632\\u0621\\u064b\\u0627 \\u0645\\u0646 \\u0645\\u062c\\u062a\\u0645\\u0639\\u0646\\u0627\\u061f\\r\\n\\u064a\\u0645\\u0643\\u0646\\u0643 \\u0623\\u0646 \\u062a\\u0643\\u0648\\u0646 \\u062c\\u0632\\u0621\\u064b\\u0627 \\u0645\\u0646 \\u0645\\u062c\\u062a\\u0645\\u0639\\u0646\\u0627 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0627\\u0644\\u062a\\u0633\\u062c\\u064a\\u0644 \\u0643\\u0645\\u062f\\u0631\\u0628 \\u0623\\u0648 \\u0645\\u0646\\u0638\\u0645\\u0629.\",\"button1\":{\"title\":\"\\u0643\\u0646 \\u0645\\u062f\\u0631\\u0633\\u064b\\u0627\",\"link\":\"\\/become-instructor\"},\"button2\":{\"title\":\"\\u062d\\u0632\\u0645 \\u0627\\u0644\\u062a\\u0633\\u062c\\u064a\\u0644\",\"link\":\"become-instructor\\/packages\\/\"}}'),
(58, 40, 'es', '{\"image\":\"\\/store\\/1\\/default_images\\/home_sections_banners\\/become_instructor_banner.jpg\",\"title\":\"Convi\\u00e9rtete en instructora\",\"description\":\"\\u00bfEst\\u00e1s interesado en ser parte de nuestra comunidad?\\r\\nPuedes ser parte de nuestra comunidad registr\\u00e1ndote como instructor u organizaci\\u00f3n.\",\"button1\":{\"title\":\"Convi\\u00e9rtete en instructora\",\"link\":\"\\/become-instructor\"},\"button2\":{\"title\":\"Paquetes de registro\",\"link\":\"become-instructor\\/packages\\/\"}}'),
(59, 42, 'en', '{\"primary\":null,\"primary-border\":null,\"primary-hover\":null,\"primary-border-hover\":null,\"primary-btn-shadow\":null,\"primary-btn-shadow-hover\":null,\"primary-btn-color\":null,\"primary-btn-color-hover\":null,\"secondary\":null,\"secondary-border\":null,\"secondary-hover\":null,\"secondary-border-hover\":null,\"secondary-btn-shadow\":null,\"secondary-btn-shadow-hover\":null,\"secondary-btn-color\":null,\"secondary-btn-color-hover\":null,\"admin_primary\":\"#6777ef\"}'),
(60, 44, 'en', '{\"cookie_settings_modal_message\":\"<p>When you visit any of our websites, it may store or retrieve information on your browser, mostly in the form of cookies. This information might be about you, your preferences or your device and is mostly used to make the site work as you expect it to. The information does not usually directly identify you, but it can give you a more personalized web experience. Because we respect your right to privacy, you can choose not to allow some types of cookies. Click on the different category headings to find out more and manage your preferences. Please note, that blocking some types of cookies may impact your experience of the site and the services we are able to offer.<\\/p>\",\"cookie_settings_modal_items\":{\"dDRjfkGvQfFzQJpa\":{\"title\":\"Strictly Necessary\",\"description\":\"These cookies are necessary for our website to function properly and cannot be switched off in our systems. They are usually only set in response to actions made by you that amount to a request for services, such as setting your privacy preferences, logging in or filling in forms, or where they\\u2019re essential to providing you with a service you have requested. You cannot opt out of these cookies. You can set your browser to block or alert you about these cookies, but if you do, some parts of the site will not then work. These cookies do not store any personally identifiable information.\",\"required\":\"1\"},\"mOzJowgvTnWFlRzz\":{\"title\":\"Performance Cookies\",\"description\":\"These cookies allow us to count visits and traffic sources so we can measure and improve the performance of our site. They help us to know which pages are the most and least popular and see how visitors move around the site, which helps us optimize your experience. All information these cookies collect is aggregated and therefore anonymous. If you do not allow these cookies we will not be able to use your data in this way.\",\"required\":\"0\"},\"XBMtdYaeSrqMicTH\":{\"title\":\"Functional Cookies\",\"description\":\"These cookies enable the website to provide enhanced functionality and personalization. They may be set by us or by third-party providers whose services we have added to our pages. If you do not allow these cookies then some or all of these services may not function properly.\",\"required\":\"0\"},\"XlLqzsvNpRqdcNWP\":{\"title\":\"Targeting Cookies\",\"description\":\"These cookies may be set through our site by our advertising partners. They may be used by those companies to build a profile of your interests and show you relevant adverts on other sites. They do not store directly personal information but are based on uniquely identifying your browser and internet device. If you do not allow these cookies, you will experience less targeted advertising.\",\"required\":\"0\"}}}'),
(61, 41, 'en', '{\"status\":\"0\",\"virtual_product_commission\":\"20\",\"physical_product_commission\":\"10\",\"store_tax\":\"10\",\"possibility_create_virtual_product\":\"0\",\"possibility_create_physical_product\":\"0\",\"shipping_tracking_url\":\"https:\\/\\/www.tracking.my\\/\",\"activate_comments\":\"0\",\"show_address_selection_in_cart\":\"0\",\"take_address_selection_optional\":\"0\"}'),
(62, 46, 'en', '{\"main\":{\"regular\":\"\\/store\\/1\\/fonts\\/montserrat-regular.woff2\",\"bold\":\"\\/store\\/1\\/fonts\\/montserrat-bold.woff2\",\"medium\":\"\\/store\\/1\\/fonts\\/montserrat-medium.woff2\"},\"rtl\":{\"regular\":\"\\/store\\/1\\/fonts\\/Vazir-Regular.woff2\",\"bold\":\"\\/store\\/1\\/fonts\\/Vazir-Bold.woff2\",\"medium\":\"\\/store\\/1\\/fonts\\/Vazir-Medium.woff2\"}}'),
(63, 43, 'en', '{\"image\":\"\\/store\\/1\\/default_images\\/forums\\/forum_section.jpg\",\"title\":\"Have a Question? Ask it in forum and get answer\",\"description\":\"Our forums helps you to create your questions on different subjects and communicate with other forum users. Our users will help you to get the best answer!\",\"button1\":{\"title\":\"Create a new topic\",\"link\":\"\\/forums\\/create-topic\"},\"button2\":{\"title\":\"Browse forums\",\"link\":\"\\/forums\"}}'),
(64, 45, 'en', '{\"mobile_app_hero_image\":\"\\/store\\/1\\/default_images\\/app_only.png\",\"mobile_app_description\":\"<div>Is an amazing, modern, and clean landing page for showcasing your app or anything else.<\\/div><div><br><\\/div><div>A mobile application or app is a computer program or software application designed to run on a mobile device such as a phone, tablet, or watch. Mobile applications often stand in contrast to desktop applications which are designed to run on desktop computers, and web applications which run in mobile web browsers rather than directly on the mobile device.<\\/div>\",\"mobile_app_buttons\":{\"htQgcSjzjLJlGRyY\":{\"title\":\"Download from Play Store\",\"link\":\"https:\\/\\/play.google.com\\/store\\/games\",\"icon\":\"\\/store\\/1\\/default_images\\/google-play.png\",\"color\":\"primary\"}}}'),
(65, 48, 'en', '{\"image\":\"\\/store\\/1\\/default_images\\/ads_modal.png\",\"title\":\"Sales Campaign\",\"description\":\"We have a sales campaign on our promoted courses and products. You can purchase 150 products at a discounted price up to 50% discount.\",\"button1\":{\"title\":\"View Courses\",\"link\":\"\\/classes\"},\"button2\":{\"title\":\"View Products\",\"link\":\"\\/products\"}}'),
(66, 52, 'en', '{\"show_guarantee_text\":\"1\",\"guarantee_text\":\"5 Days money back guarantee\",\"user_avatar_style\":\"ui_avatar\",\"default_user_avatar\":\"\\/store\\/1\\/default_images\\/default_profile.jpg\",\"platform_phone_and_email_position\":\"footer\"}'),
(67, 47, 'en', '{\"webinar_reminder_schedule\":\"1\",\"meeting_reminder_schedule\":\"1\",\"subscribe_reminder_schedule\":\"48\"}'),
(68, 61, 'en', '{\"offline_banks_status\":\"0\"}'),
(69, 62, 'en', '{\"status\":\"0\",\"allow_sending_gift_for_courses\":\"0\",\"allow_sending_gift_for_bundles\":\"0\",\"allow_sending_gift_for_products\":\"0\"}'),
(70, 63, 'en', '{\"status\":\"0\",\"unlock_registration_bonus_instantly\":\"0\",\"unlock_registration_bonus_with_referral\":\"0\",\"number_of_referred_users\":null,\"enable_referred_users_purchase\":\"0\",\"purchase_amount_for_unlocking_bonus\":null,\"registration_bonus_amount\":\"50\",\"bonus_wallet\":\"balance_wallet\"}'),
(71, 57, 'en', '{\"enable_statistics\":\"1\",\"display_default_statistics\":\"1\"}'),
(72, 56, 'en', '{\"currency\":\"USD\",\"currency_position\":\"left\",\"currency_separator\":\"dot\",\"currency_decimal\":\"2\",\"multi_currency\":\"0\"}'),
(73, 53, 'en', '{\"login_device_limit\":\"0\",\"number_of_allowed_devices\":\"10\",\"captcha_for_admin_login\":\"0\",\"captcha_for_admin_forgot_pass\":\"0\",\"captcha_for_login\":\"0\",\"captcha_for_register\":\"0\",\"captcha_for_forgot_pass\":\"0\",\"admin_panel_url\":\"admin\"}'),
(74, 54, 'en', '{\"status\":\"0\",\"disable_course_access_when_user_have_an_overdue_installment\":\"0\",\"disable_all_courses_access_when_user_have_an_overdue_installment\":\"0\",\"disable_instalments_when_the_user_have_an_overdue_installment\":\"0\",\"allow_cancel_verification\":\"0\",\"display_installment_button\":\"0\",\"overdue_interval_days\":\"3\",\"installment_plans_position\":\"top_of_page\",\"reminder_before_overdue_days\":\"3\",\"reminder_after_overdue_days\":\"2\"}'),
(75, 58, 'en', '{\"title\":\"We are under maintenance!\",\"image\":\"\\/store\\/1\\/default_images\\/maintenance.png\",\"description\":\"We are working on the platform; It won\'t take a long time. We will try to back as soon as possible.\",\"maintenance_button\":{\"title\":\"Sample Button\",\"link\":\"\\/\"},\"end_date\":1740094200}'),
(76, 64, 'en', '{\"term_image\":\"\\/store\\/1\\/default_images\\/registration bonus\\/banner.png\",\"items\":{\"DnrPr\":{\"icon\":\"\\/store\\/1\\/default_images\\/registration bonus\\/step1.svg\",\"title\":\"Sign up\",\"description\":\"Create an account on platform and get $50\"},\"eNMTB\":{\"icon\":\"\\/store\\/1\\/default_images\\/registration bonus\\/step2.svg\",\"title\":\"Refer your friends\",\"description\":\"Refer at least 5 users to the system using your affiliate URL\"},\"fdIUc\":{\"icon\":\"\\/store\\/1\\/default_images\\/registration bonus\\/step3.svg\",\"title\":\"Reach purchase target\",\"description\":\"Each referred user should purchase $100 on the platform\"},\"oeMZr\":{\"icon\":\"\\/store\\/1\\/default_images\\/registration bonus\\/step4.svg\",\"title\":\"Unlock your bonus\",\"description\":\"Your bonus will be unlocked! Enjoy spending...\"}}}'),
(77, 55, 'en', '{\"terms_description\":\"<p>Welcome to our website! To ensure the best possible experience for all users, please review and agree to the following terms and rules before using our installment feature:<\\/p><p>Installment Payment Plan: Our website offers an installment payment plan for select courses. By selecting the installment payment option, you agree to pay the full course fee in multiple installments. Each installment payment will be automatically deducted from the payment method you provided on the scheduled dates until the full payment is completed.<\\/p><p>Payment Plan Fees: Our installment payment plan may include a small processing fee for each installment payment. The total processing fee will be disclosed to you before you select the installment payment option.<\\/p><p>Late Payment: If a payment is not received on the scheduled date, a late payment fee may be added to the next scheduled payment.<\\/p><p>Refunds: Once an installment payment is made, it is non-refundable. However, if you wish to cancel your enrollment in the course, you may be eligible for a partial refund according to our Refund Policy.<\\/p><p>Default: If you default on a payment or fail to complete the full payment plan, your access to the course will be revoked, and you may be subject to additional fees and collection efforts.<\\/p><p>Privacy: Your personal and payment information will be kept secure and confidential. We use industry-standard security measures to protect your information.<\\/p><p>Changes to Terms and Rules: We reserve the right to modify these terms and rules at any time. Any changes will be posted on our website and will become effective immediately upon posting.<\\/p><p>By using our installment payment plan, you agree to these terms and rules. If you have any questions or concerns, please contact our support team.<\\/p>\"}'),
(78, 65, 'en', '{\"status\":\"0\",\"active_for_admin_panel\":\"0\",\"active_for_organization_panel\":\"0\",\"active_for_instructor_panel\":\"0\",\"secret_key\":null,\"activate_text_service_type\":\"0\",\"text_service_type\":\"gpt-3.5-turbo\",\"number_of_text_generated_per_request\":\"1\",\"max_tokens\":\"500\",\"activate_image_service_type\":\"0\",\"number_of_images_generated_per_request\":\"1\"}'),
(79, 66, 'en', '{\"_token\":\"Vs87fzAsqf3B65jxoRr8f2ivsRcK85A3dSF9123H\",\"page\":\"general\",\"name\":\"certificate_settings\",\"locale\":\"en\",\"status\":\"0\",\"certificate_id\":\"CR\",\"ltr_font\":\"\\/store\\/1\\/fonts\\/montserrat-medium.woff2\",\"rtl_font\":\"\\/store\\/1\\/fonts\\/Vazir-Medium.woff2\",\"certificate_api_user_id\":null,\"certificate_api_key\":null}'),
(80, 67, 'en', '{\"status\":\"0\",\"reset_cart_items\":\"0\",\"reset_hours\":null,\"default_cart_reminder\":\"121\",\"default_cart_coupon_template\":\"122\"}'),
(81, 68, 'en', '{\"title\":\"Access Limited\",\"image\":\"\\/store\\/1\\/default_images\\/maintenance.png\",\"description\":\"Your IP is not allowed to access the website.\"}'),
(82, 59, 'en', '{\"direct_publication_of_courses\":\"1\",\"direct_publication_of_comments\":\"0\",\"direct_publication_of_reviews\":\"0\",\"direct_publication_of_blog\":\"0\",\"allow_instructor_delete_content\":\"1\",\"content_delete_method\":\"delete_with_admin_approval\",\"disable_registration_verification_process\":null}'),
(83, 69, 'en', '{\"courses\":{\"type\":\"percent\",\"value\":\"20\"},\"bundles\":{\"type\":\"percent\",\"value\":\"20\"},\"virtual_products\":{\"type\":\"percent\",\"value\":\"30\"},\"physical_products\":{\"type\":\"percent\",\"value\":\"10\"},\"meetings\":{\"type\":\"percent\",\"value\":\"30\"}}');

INSERT INTO `settings` (`id`, `page`, `name`, `updated_at`) VALUES
(1, 'seo', 'seo_metas', 1709806236),
(2, 'general', 'socials', 1632121340),
(4, 'other', 'footer', 1632071275),
(5, 'general', 'general', 1721326511),
(6, 'financial', 'financial', 1678734927),
(8, 'personalization', 'home_hero', 1652016269),
(12, 'customization', 'custom_css_js', 1636119881),
(14, 'personalization', 'page_background', 1709889935),
(15, 'personalization', 'home_hero2', 1721326397),
(20, 'other', 'report_reasons', 1632235945),
(22, 'notifications', 'notifications', 1694993271),
(23, 'financial', 'site_bank_accounts', 1617002426),
(24, 'other', 'contact_us', 1664436566),
(25, 'personalization', 'home_sections', 1653226117),
(26, 'other', 'navbar_links', 1647616036),
(27, 'personalization', 'home_video_or_image_box', 1632226618),
(28, 'other', '404', 1678950792),
(29, 'personalization', 'panel_sidebar', 1642355954),
(30, 'financial', 'referral', 1709912090),
(31, 'general', 'features', 1721326776),
(32, 'personalization', 'find_instructors', 1642530710),
(33, 'personalization', 'reward_program', 1645628594),
(34, 'general', 'rewards_settings', 1709911723),
(37, 'financial', 'registration_packages_general', 1709911736),
(38, 'financial', 'registration_packages_instructors', 1709911741),
(39, 'financial', 'registration_packages_organizations', 1709911746),
(40, 'personalization', 'become_instructor_section', 1645345116),
(41, 'general', 'store_settings', 1709911645),
(42, 'personalization', 'theme_colors', 1678865210),
(43, 'personalization', 'forums_section', 1650546951),
(44, 'personalization', 'cookie_settings', 1653487194),
(45, 'personalization', 'mobile_app', 1653489015),
(46, 'personalization', 'theme_fonts', 1677180546),
(47, 'general', 'reminders', 1650982581),
(48, 'other', 'advertising_modal', 1652000772),
(52, 'personalization', 'others_personalization', 1678148917),
(53, 'general', 'security', 1709912634),
(54, 'general', 'installments_settings', 1709911763),
(55, 'general', 'installments_terms_settings', 1679089417),
(56, 'financial', 'currency_settings', 1709912099),
(57, 'personalization', 'statistics', 1678151460),
(58, 'personalization', 'maintenance_settings', 1678873553),
(59, 'general', 'general_options', 1721326580),
(60, 'financial', 'offline_banks_credits', 1676303092),
(61, 'financial', 'offline_banks', 1709912075),
(62, 'general', 'gifts_general_settings', 1709911871),
(63, 'general', 'registration_bonus_settings', 1709911891),
(64, 'general', 'registration_bonus_terms_settings', 1678898719),
(65, 'general', 'ai_contents_settings', 1709911684),
(66, 'general', 'certificate_settings', 1709911596),
(67, 'general', 'abandoned_cart_settings', 1709911815),
(68, 'personalization', 'restriction_settings', 1709805826),
(69, 'financial', 'commission_settings', 1719762024);

INSERT INTO `user_bank_specification_translations` (`id`, `user_bank_specification_id`, `locale`, `name`) VALUES
(15, 10, 'en', 'Account Holder'),
(16, 11, 'en', 'Email'),
(17, 12, 'en', 'Account Holder'),
(18, 13, 'en', 'Account ID');

INSERT INTO `user_bank_specifications` (`id`, `user_bank_id`) VALUES
(10, 4),
(11, 4),
(12, 5),
(13, 5);

INSERT INTO `user_bank_translations` (`id`, `user_bank_id`, `locale`, `title`) VALUES
(6, 4, 'en', 'Paypal'),
(7, 5, 'en', 'Stripe');

INSERT INTO `user_banks` (`id`, `logo`, `created_at`) VALUES
(4, '/store/1/default_images/payment gateways/paypal.png', 1678874235),
(5, '/store/1/default_images/payment gateways/stripe.png', 1679090196);

INSERT INTO `user_login_histories` (`id`, `user_id`, `browser`, `device`, `os`, `ip`, `country`, `city`, `location`, `session_id`, `session_start_at`, `session_end_at`, `end_session_type`, `created_at`) VALUES
(24, 1, 'Chrome', 'desktop', 'OS X-10_15_7', NULL, NULL, NULL, NULL, 'uePnGa3DNTUxFBunD3bB6z8x8XE2bQWFUupdCMcD', 1721141166, NULL, NULL, 1721141166),
(25, 1, 'Chrome', 'desktop', 'OS X-10_15_7', NULL, NULL, NULL, NULL, 'WDsjyftnyLtPoUHIc4nzCxk3FviqwzH16wyKgByL', 1721321288, NULL, NULL, 1721321288),
(26, 1016, 'Chrome', 'desktop', 'OS X-10_15_7', NULL, NULL, NULL, NULL, 'yTrMsBQJ9iILxon09eDizEkV4Dyg9CWUKKQ8nzuP', 1721321690, NULL, NULL, 1721321690),
(27, 1, 'Chrome', 'desktop', 'OS X-10_15_7', NULL, NULL, NULL, NULL, 'FB5oCcERMYFJejWbylo3cmUuN2mK4rQ6sqduYSfn', 1721325178, NULL, NULL, 1721325178),
(28, 1016, 'Chrome', 'desktop', 'OS X-10_15_7', NULL, NULL, NULL, NULL, 'k8HOxMynY4HHrebhnfzMGGTQrPbdPkrf3GFElYhP', 1721327908, 1721328018, 'default', 1721327908),
(29, 1047, 'Chrome', 'desktop', 'OS X-10_15_7', NULL, NULL, NULL, NULL, 'kmBUlQMV3UqGSxEn7cgWvHqOtEmWSlO58ZjEfhQq', 1721328261, NULL, NULL, 1721328261),
(30, 1047, 'Chrome', 'desktop', 'OS X-10_15_7', NULL, NULL, NULL, NULL, 'JnPZhgBUH8c8L1NmUr3pKwKCYlS5NJy1QeiTxybx', 1721328437, NULL, NULL, 1721328437),
(31, 1047, 'Chrome', 'desktop', 'OS X-10_15_7', NULL, NULL, NULL, NULL, 'ar6fBikNRbAozI5hqHF4eT4m6cLDCNi14q1jdHiT', 1721412880, 1721497341, 'default', 1721412880),
(32, 1, 'Chrome', 'desktop', 'OS X-10_15_7', NULL, NULL, NULL, NULL, '2ZZ20jwD7y71JrBSlYXumb8yEv6kkrV9PZ39Ck8u', 1721497358, 1721497982, 'default', 1721497358),
(33, 1016, 'Chrome', 'desktop', 'OS X-10_15_7', NULL, NULL, NULL, NULL, 'R8BOqsV05DzPs8MeGx94GaQhIAwxz2lIwBd0JdUx', 1721498011, NULL, NULL, 1721498011);

INSERT INTO `users` (`id`, `full_name`, `role_name`, `role_id`, `organ_id`, `mobile`, `email`, `bio`, `password`, `google_id`, `facebook_id`, `remember_token`, `logged_count`, `verified`, `financial_approval`, `installment_approval`, `enable_installments`, `disable_cashback`, `enable_registration_bonus`, `registration_bonus_amount`, `avatar`, `avatar_settings`, `cover_img`, `headline`, `about`, `address`, `country_id`, `province_id`, `city_id`, `district_id`, `location`, `level_of_training`, `meeting_type`, `status`, `access_content`, `enable_ai_content`, `language`, `currency`, `timezone`, `newsletter`, `public_message`, `identity_scan`, `certificate`, `affiliate`, `can_create_store`, `ban`, `ban_start_at`, `ban_end_at`, `offline`, `offline_message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin', 2, NULL, '00000000', 'admin@demo.com', 'Senior software developer', '$2y$10$nSUg1Z2rltHGecudC6dEEeRoqfIhlHi8WaAFFQs57oyFtpkvvQufW', NULL, NULL, 'g1LBwxuEMRMpQODxdhRumy1l7zAcgIxVlQQWjRAt7GZX6ynElEq7Eu3l9ye5', 0, 1, 0, 0, 1, 0, 0, NULL, '/store/1/default_images/logo-new.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'all', 'active', 1, 0, 'EN', 'USD', 'America/New_York', 0, 0, NULL, NULL, 1, 0, 0, NULL, NULL, 0, NULL, 1597826952, 1597826952, NULL),
(1014, 'George Hamilton', 'Author Role', 9, NULL, '6104254644', 'Robert@gmail.com', NULL, '$2y$10$UQtinAOPeFdgy81Mxd3z7uGdSz2gsQsh0A3osAkoOb7A6IpjnDH0a', NULL, NULL, NULL, 0, 1, 0, 0, 1, 0, 0, NULL, '/store/1/default_images/testimonials/profile_picture (30).jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'all', 'active', 1, 0, NULL, NULL, 'America/New_York', 0, 0, NULL, NULL, 1, 0, 0, NULL, NULL, 0, NULL, 1624692024, NULL, NULL),
(1016, 'Ricardo dave', 'teacher', 4, NULL, '+12025250175', 'Ricardodave09@hotmail.com', 'Data Analyst at Microsoft', '$2y$10$sUY3BXOjkSw4NmdE7QgWdeuOGLFE/wB24qlGXu8HcSQ1.3j8oaNDe', NULL, NULL, 'BFiCxyz4koYvQ0nR9ePeczMQaieCtGyH0bUM1jz98R7lmeW4Ao5oueZOervu', 2, 0, 1, 0, 1, 0, 0, NULL, '/store/1016/avatar/617a4f17c8e72.png', NULL, '/store/1016/7.jpg', NULL, 'Ricardo dave has a BS and MS in Mechanical Engineering from Santa Clara University and years of experience as a professional instructor and trainer for Data Science and programming. He has publications and patents in various fields such as microfluidics, materials science, and data science technologies. Over the course of his career he has developed a skill set in analyzing data and he hopes to use his experience in teaching and data science to help other people learn the power of programming the ability to analyze data, as well as present the data in clear and beautiful visualizations. Currently he works as the Head of Data Science for Pierian Data Inc. and provides in-person data science and python programming training courses to employees working at top companies, including General Electric, Cigna, The New York Times, Credit Suisse, McKinsey and many more. Feel free to contact him on LinkedIn for more information on in-person training sessions or group training sessions in Las Vegas, NV.', 'Luib, 72 Wern Ddu Lane', NULL, NULL, NULL, NULL, ST_GeomFromText('POINT(48.812349913163 2.2475810225945)'), b'010', 'all', 'active', 1, 0, 'EN', NULL, 'America/New_York', 0, 0, '/store/1016/passport.jpg', '', 1, 0, 0, NULL, NULL, 1, 'I am not available for 2 days due to a business trip', 1624817905, NULL, NULL),
(1047, 'akhil jinu', 'user', 1, NULL, '178786767675', 't.p.akhiljinu@gmail.com', NULL, '$2y$10$hmx98iPPSQxgCN8/QKsb3uLxpIBcfvPzzdiTCJsOQJS1aNg8im5HW', NULL, NULL, 'KJhLoCxLMlM8HMIoSWGahmCp2vo62W8l4jlzWmQq5fF6e5zjlNqMiPuizIuk', 2, 1, 0, 0, 1, 0, 0, NULL, NULL, '{\"color\":\"000000\",\"background\":\"b3e5fc\"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'all', 'active', 1, 0, NULL, NULL, 'America/New_York', 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1721321580, NULL, NULL),
(1048, 'akhil jinu', 'user', 1, NULL, '178786767673', 't.p.akhiljinu1@gmail.com', NULL, '$2y$10$sUY3BXOjkSw4NmdE7QgWdeuOGLFE/wB24qlGXu8HcSQ1.3j8oaNDe', NULL, NULL, NULL, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'all', 'pending', 1, 0, NULL, NULL, 'America/New_York', 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1721321616, NULL, NULL),
(1049, 'T.P.Akhil Jinu', 'user', 1, NULL, NULL, 't.p.akhiljinu22@gmail.com', NULL, '$2y$10$Cf.IhBvKtHY6FuW/28PC7Oy1JuWf27.s/5pquqNM90BvyaJv063BO', NULL, NULL, NULL, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'all', 'pending', 1, 0, NULL, NULL, 'Asia/Kolkata', 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, 0, NULL, 1721327877, NULL, NULL);

INSERT INTO `users_metas` (`id`, `user_id`, `name`, `value`) VALUES
(1, 1016, 'address', 'Luib, 72 Wern Ddu Lane');

INSERT INTO `verifications` (`id`, `user_id`, `mobile`, `email`, `code`, `verified_at`, `expired_at`, `created_at`) VALUES
(86, 1049, NULL, 't.p.akhiljinu22@gmail.com', '37999', NULL, 1721331477, 1721327877);

INSERT INTO `webinar_chapter_items` (`id`, `user_id`, `chapter_id`, `item_id`, `type`, `order`, `created_at`) VALUES
(211, 1016, 1, 1, 'file', 1, 1721322619),
(212, 1016, 1, 96, 'file', 2, 1721323682),
(213, 1016, 1, 97, 'file', 3, 1721325888);

INSERT INTO `webinar_chapter_translations` (`id`, `webinar_chapter_id`, `locale`, `title`) VALUES
(1, 1, 'en', 'Sample section');

INSERT INTO `webinar_chapters` (`id`, `user_id`, `webinar_id`, `order`, `check_all_contents_pass`, `status`, `created_at`) VALUES
(1, 1016, 1, NULL, 0, 'active', 1656669467);

INSERT INTO `webinar_translations` (`id`, `webinar_id`, `locale`, `title`, `seo_description`, `description`) VALUES
(1, 1, 'en', 'Sample Course', 'The most complete course available on Product Management.', '<p>The Lorem ipum filling text is used by graphic designers, programmers and printers with the aim of occupying the spaces of a website, an advertising product or an editorial production whose final text is not yet ready.</p><p>This expedient serves to get an idea of the finished product that will soon be printed or disseminated via digital channels.</p><p><br></p><p>In order to have a result that is more in keeping with the final result, the graphic designers, designers or typographers report the Lorem ipsum text in respect of two fundamental aspects, namely readability and editorial requirements.</p><p><br></p><p>The choice of font and font size with which Lorem ipsum is reproduced answers to specific needs that go beyond the simple and simple filling of spaces dedicated to accepting real texts and allowing to have hands an advertising/publishing product, both web and paper, true to reality.</p><p><br></p><p>Its nonsense allows the eye to focus only on the graphic layout objectively evaluating the stylistic choices of a project, so it is installed on many graphic programs on many software platforms of personal publishing and content management system.</p>'),
(171, 2023, 'en', 'New', NULL, '<p>asdasda</p>');

INSERT INTO `webinars` (`id`, `teacher_id`, `creator_id`, `category_id`, `type`, `private`, `slug`, `start_date`, `duration`, `timezone`, `thumbnail`, `image_cover`, `video_demo`, `video_demo_source`, `capacity`, `sales_count_number`, `price`, `organization_price`, `support`, `certificate`, `downloadable`, `partner_instructor`, `subscribe`, `forum`, `enable_waitlist`, `access_days`, `points`, `message_for_reviewer`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1016, 1016, 612, 'course', 0, 'Sample-Course', NULL, 90, 'America/New_York', '/store/1016/1.jpg', '/store/1016/1_c.jpg', '/store/1016/Become A Product Manager.mp4', 'upload', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 'active', 1656669428, 1721327715, NULL),
(2023, 1016, 1016, 612, 'webinar', 0, 'New', 1721275200, 30, 'America/New_York', '/store/1016/1_c.jpg', '/store/1016/1.jpg', NULL, 'upload', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 20, NULL, NULL, 'is_draft', 1721326810, 1721327146, NULL);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;