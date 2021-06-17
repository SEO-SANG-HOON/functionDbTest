-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- 생성 시간: 20-11-15 15:23
-- 서버 버전: 10.3.21-MariaDB
-- PHP 버전: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `redmine`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL,
  `container_id` int(11) DEFAULT NULL,
  `container_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `disk_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filesize` bigint(20) NOT NULL DEFAULT 0,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `digest` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `created_on` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disk_directory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `attachments`
--

INSERT INTO `attachments` (`id`, `container_id`, `container_type`, `filename`, `disk_filename`, `filesize`, `content_type`, `digest`, `downloads`, `author_id`, `created_on`, `description`, `disk_directory`) VALUES
(2, 3, 'Issue', 'FAQ.PNG', '200609014424_FAQ.PNG', 21030, 'image/png', '2f9aa6efca30bbed7b0e4410cd94aa59', 0, 1, '2020-06-09 01:44:24', '', '2020/06'),
(4, 44, 'Issue', '회원상세항목.PNG', '200707064511_7578a1eefd47f5303c2c22d0f4e3835a.PNG', 34827, 'image/png', '8aabcff04998348072006002212cabc4', 0, 1, '2020-07-07 06:45:11', '', '2020/07'),
(6, 43, 'Issue', '회원관리_김진우.PNG', '200707065005_70d98341c3246618c2df2ce19f79a312.PNG', 45285, 'image/png', '1102292971657a09d869e1a237e93f2d', 0, 1, '2020-07-07 06:50:05', '', '2020/07'),
(7, 46, 'Issue', '레이아웃.PNG', '200707065106_f58530e12e2a775ccb9b1a8fadd3c7dd.PNG', 4862, 'image/png', '3a2b91637d24233d9e9fb8105767e0cc', 0, 1, '2020-07-07 06:51:06', '', '2020/07'),
(8, 47, 'Issue', '페이징.PNG', '200707070143_9c267ec627d705083f00dc409761ed42.PNG', 30987, 'image/png', 'bb3ca452f1597c74bad015e6a026dada', 0, 1, '2020-07-07 07:01:43', '', '2020/07'),
(9, 71, 'Issue', '메인카드UI.PNG', '200824080531_6aad6e5a5c28b61e5018ef4544126032.PNG', 18900, 'image/png', 'ec7f93730f141762f8b7151b310ff5ac', 0, 1, '2020-08-24 08:05:31', '', '2020/08'),
(10, 77, 'Issue', '알림설정.PNG', '200825085443_832789b21cc2af6f18251ceb89601e2a.PNG', 21828, 'image/png', '37f2955cb9bf8e7798a98877e4fc2029', 0, 1, '2020-08-25 08:54:43', '', '2020/08'),
(11, 78, 'Issue', 'picture897-1.png', '200826014641_picture897-1.png', 52607, 'image/png', '57520e75aa0870dd0a742fe06687a163', 0, 1, '2020-08-26 01:46:41', '', '2020/08'),
(12, 81, 'Issue', '중간정렬.png', '200826045742_d76bce58209f0029adaed608982bfde3.png', 41946, 'image/png', '035a52e422c467c252583cc91e25dca0', 0, 8, '2020-08-26 04:57:42', '', '2020/08'),
(13, 81, 'Issue', '메인화면정렬.png', '200826050725_1c88fbf7c1ffa4453055b8b3d10dfaa8.png', 80079, 'image/png', 'c1907c2982aadd7b630e3af709ad71c0', 0, 8, '2020-08-26 05:07:25', '', '2020/08'),
(14, 74, 'Issue', '띵큐해제.PNG', '200826224255_aaa65b119ba7cf8b77fd289a20fcd11e.PNG', 14317, 'image/png', '82dcfdd2f700cc2f5c1dc4d36d019df0', 0, 1, '2020-08-26 22:42:55', '', '2020/08'),
(15, 75, 'Issue', 'picture426-1.png', '200826225146_picture426-1.png', 4163, 'image/png', '9ae5395aaa226101a5a0ef652b95cc3a', 0, 1, '2020-08-26 22:51:46', '', '2020/08'),
(17, 7, 'Project', 'Screenshot_20200827-075606_LG .jpg', '200826225847_7ce2ffd7147d1dc36dde8f49e92d2a81.jpg', 245947, 'image/jpeg', '02ce33b29e92341dfeb3e810368e1b73', 1, 1, '2020-08-26 22:58:47', '', '2020/08'),
(18, 84, 'Issue', '주간사용량.jpg', '200826230106_6273f646e1a0e4be0626c528d4525d42.jpg', 245947, 'image/jpeg', '02ce33b29e92341dfeb3e810368e1b73', 0, 1, '2020-08-26 23:01:06', '', '2020/08'),
(19, 7, 'Project', 'Screenshot_20200827-091702_LG .jpg', '200827001741_0010e094be3b08fe5d411136f6b85538.jpg', 372419, 'image/jpeg', '4fc9e65a5aaca612b22985e102e8015f', 1, 1, '2020-08-27 00:17:41', '', '2020/08'),
(20, 85, 'Issue', '제어이력.jpg', '200827001836_8ef562fb0920e4cb3ec0bd7c35990575.jpg', 372419, 'image/jpeg', '4fc9e65a5aaca612b22985e102e8015f', 0, 1, '2020-08-27 00:18:36', '', '2020/08'),
(21, 86, 'Issue', '20-08-27-10-33-02.mp4', '200827013946_20-08-27-10-33-02.mp4', 3930075, 'video/mp4', '0d7574b01460cd221b8ad46e6dd7b2fb', 0, 8, '2020-08-27 01:39:46', '', '2020/08'),
(22, 7, 'Project', '20200827_110750.jpg', '200827020800_20200827_110750.jpg', 167016, 'image/jpeg', 'eda6cceff5eb127b2d4d072497add93d', 2, 1, '2020-08-27 02:08:00', '', '2020/08'),
(23, 87, 'Issue', '20200827_110750.jpg', '200827020933_20200827_110750.jpg', 167016, 'image/jpeg', '9e52f4fcb583c22c16ad800986144177', 0, 1, '2020-08-27 02:09:33', '', '2020/08'),
(24, 7, 'Project', 'Screenshot_20200827-131424_LG .jpg', '200827041437_2dc8e75c830dcb7f0ee6a66d321ad7b7.jpg', 203309, 'image/jpeg', 'ac9db3118dcaf91cc5f2e3af5bb491d0', 1, 1, '2020-08-27 04:14:37', '', '2020/08'),
(27, 88, 'Issue', '제어이력2.jpg', '200827041823_8ae8772f4caff142d6c4ea251ede11f0.jpg', 203309, 'image/jpeg', '874d8325899c94ef4ba619a960acff0a', 0, 1, '2020-08-27 04:18:23', '', '2020/08'),
(28, 89, 'Issue', '제어이력정보.PNG', '200828003424_f02342d408df275c3d8f3dbd3db2a4a6.PNG', 28754, 'image/png', '31e8460e027cbf97a0611281c64a6689', 0, 1, '2020-08-28 00:34:24', '', '2020/08'),
(29, 89, 'Issue', '알림내역.PNG', '200828003436_0a00b8bcda09b7390618e687726a986c.PNG', 31233, 'image/png', '0e6d079e34002a5c6729bf79108e18d3', 0, 1, '2020-08-28 00:34:36', '', '2020/08'),
(30, 7, 'Project', 'Screenshot_20200828-160018_LG .jpg', '200828070352_7b1a4cf723fa063db631a768e141bc28.jpg', 188798, 'image/jpeg', 'e2048218b78e152504c7d57fd50c8699', 1, 1, '2020-08-28 07:03:52', '', '2020/08'),
(31, 7, 'Project', 'Screenshot_20200828-160428_LG .jpg', '200828070436_2a8f86bebd0333336c0e4a09ce457ef6.jpg', 289493, 'image/jpeg', '38548c296d6016937c8429bed4c80d71', 1, 1, '2020-08-28 07:04:36', '', '2020/08'),
(33, 90, 'Issue', 'thin1.jpg', '200828071210_thin1.jpg', 188798, 'image/jpeg', '5483546a3bdf9ee0e215eacfcce8c65f', 0, 1, '2020-08-28 07:12:10', '', '2020/08'),
(34, 91, 'Issue', 'main.jpg', '200828071528_main.jpg', 26767, 'image/jpeg', '5f62a455f0810a1b572b2e27622e2673', 0, 1, '2020-08-28 07:15:28', '', '2020/08'),
(35, 7, 'Project', 'Screenshot_20200828-164130_LG .jpg', '200828074137_1ba727c78f5662bbfbb48d35f4e91c6f.jpg', 205614, 'image/jpeg', '719480c181936e8da5eb34c1ee73a9bd', 1, 1, '2020-08-28 07:41:37', '', '2020/08'),
(38, 92, 'Issue', '니익.jpg', '200828074706_a379ed578a58bcfc28c6a512a5115edc.jpg', 18521, 'image/jpeg', 'af31c07149ffbee6aa7a9ba5ab3d54fb', 0, 1, '2020-08-28 07:47:06', '', '2020/08'),
(39, 7, 'Project', 'Screenshot_20200831-082504_LG .jpg', '200830232534_bb5a7d614f8fd26f7bd7c90f563e4b7c.jpg', 213466, 'image/jpeg', '8c924e0768a4268dc410eb551c182d5c', 1, 1, '2020-08-30 23:25:34', '', '2020/08'),
(40, 94, 'Issue', '프로필_LI.jpg', '200830232825_e3b8c7295e5ad08ca4d3a9fd46423c3d.jpg', 858330, 'image/jpeg', '98d0b82bc0354568e7c782583210fece', 0, 1, '2020-08-30 23:28:25', '', '2020/08'),
(41, 7, 'Project', 'Screenshot_20200831-083303_LG .jpg', '200830233323_edaee98d2d3792920f66789aff5f599a.jpg', 131282, 'image/jpeg', '5178b424b09d099f7ec4a1930ac65832', 2, 1, '2020-08-30 23:33:23', '', '2020/08'),
(44, 97, 'Issue', '네트웍무.jpg', '200830234341_e575bd3da051ee89dd8d6246b7f043c2.jpg', 131282, 'image/jpeg', '0f0928ad79f6bb660576509288573097', 0, 1, '2020-08-30 23:43:41', '', '2020/08'),
(45, 98, 'Issue', '20200831_085435_274998773409073.mp4', '200830235921_20200831_085435_274998773409073.mp4', 4971361, 'video/mp4', '6a23cc6665ba9646d16b2abe72e1d0a0', 0, 8, '2020-08-30 23:59:21', '', '2020/08'),
(46, 99, 'Issue', '연결해제이슈.png', '200831000558_9afcf33b17ca7fbd602fb3cc8190f3bb.png', 116226, 'image/png', '1746883a9db5b1029c73cf613d1ee525', 0, 8, '2020-08-31 00:05:58', '', '2020/08'),
(48, 102, 'Issue', '화구상세.png', '200831013134_4749019fa97b7181ebf106fba31290f6.png', 35879, 'image/png', '2bfdd0a12ee076ffcc10abf7dcf4a965', 0, 8, '2020-08-31 01:31:34', '', '2020/08'),
(49, 94, 'Issue', '프로필.PNG', '200831013335_2b26ca5e33bc13ed48428d64e5297e21.PNG', 9311, 'image/png', '9048300752088ec9af2b406b4af14099', 0, 1, '2020-08-31 01:33:35', '', '2020/08'),
(50, 104, 'Issue', 'Screenshot_20200831-141021_LG .jpg', '200831051137_f32e6a47e86c4ea21dbe3240bff01c40.jpg', 36550, 'image/jpeg', 'ecf9a89255658063c18078e787b42e43', 0, 8, '2020-08-31 05:11:37', '', '2020/08'),
(52, 112, 'Issue', '접속불가.jpg', '200903214936_1fff0d03dd5333755c9ef962fe85d46b.jpg', 20302, 'image/jpeg', '4523997391ee515d73f4edcd093f4b65', 0, 1, '2020-09-03 21:49:35', '', '2020/09'),
(53, 113, 'Issue', '필터 청소 방법.png', '200904065833_acf10d608f354c1a15712d25296117ec.png', 38575, 'image/png', 'ce99b8fc3d09fb32477c6cb4a2bb4e51', 0, 8, '2020-09-04 06:58:33', '', '2020/09'),
(54, 116, 'Issue', 'picture457-1.png', '200908023023_picture457-1.png', 27782, 'image/png', '295d58aafcd80dc43ac7f619fe844205', 0, 1, '2020-09-08 02:30:23', '', '2020/09'),
(55, 117, 'Issue', 'picture457-1.png', '200908023023_picture457-1.png', 27782, 'image/png', '295d58aafcd80dc43ac7f619fe844205', 0, 1, '2020-09-08 02:30:23', '', '2020/09'),
(56, 118, 'Issue', 'UI정렬1.png', '200914020621_860efa0b3d6fe876c1866e43081b04ff.png', 4675, 'image/png', '5ddb421474bbf055affc1342a8f4fba2', 0, 8, '2020-09-14 02:06:21', '', '2020/09'),
(57, 118, 'Issue', 'UI정렬2.png', '200914020623_bf5f08cca2097fc9c48cc851211db2ef.png', 16065, 'image/png', '14405ade3f8a9afc75184818e536ec4e', 0, 8, '2020-09-14 02:06:23', '', '2020/09'),
(58, 118, 'Issue', 'UI정렬.png', '200914020624_a12d15e27c234cbde7d36e769c38552a.png', 13694, 'image/png', 'ee83d2bfcec4082e380aae62dbac2974', 0, 8, '2020-09-14 02:06:24', '', '2020/09'),
(59, 119, 'Issue', '익스플로러_이슈.png', '200914020836_b80a6474fa7d5276e3d973453739961e.png', 49932, 'image/png', 'e8e19cfa2fba0e1f748dfc7b0846e4bb', 0, 8, '2020-09-14 02:08:36', '', '2020/09'),
(60, 120, 'Issue', '페이지이동_오류.png', '200914021411_a45d737987f103580519d281fa70a8cb.png', 32284, 'image/png', '6dcc0f0d87760833b4fefbc4878a775f', 0, 8, '2020-09-14 02:14:11', '', '2020/09'),
(61, 128, 'Issue', '공기질.gif', '201021042243_79af3c72f304b2b415905955b24e7afd.gif', 20380, 'image/gif', '3a1ad725928c1a58302b9343d40390d0', 0, 9, '2020-10-21 04:22:43', '', '2020/10'),
(62, 7, 'Project', '20201021_145630.jpg', '201021055715_20201021_145630.jpg', 147801, 'image/jpeg', '6baf61940caad3af493c01ea4de282cf', 1, 1, '2020-10-21 05:57:15', '', '2020/10'),
(63, 129, 'Issue', '펌업.jpg', '201021055835_f64523686a09c6e30299d8654ba277e7.jpg', 16724, 'image/jpeg', '445a2696e7180ad437846924700e9029', 0, 1, '2020-10-21 05:58:35', '', '2020/10'),
(64, 127, 'Issue', '쉐어링 중복 등록.png', '201021063036_3d76bcc62f72e7a4ec31f03274c7a64c.png', 55872, 'image/png', '51fb44777579034dc332ea85c6312dc7', 0, 5, '2020-10-21 06:30:36', '', '2020/10');

-- --------------------------------------------------------

--
-- 테이블 구조 `auth_sources`
--

CREATE TABLE `auth_sources` (
  `id` int(11) NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `host` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `base_dn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr_login` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr_firstname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr_lastname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr_mail` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT 0,
  `tls` tinyint(1) NOT NULL DEFAULT 0,
  `filter` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `boards`
--

CREATE TABLE `boards` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `topics_count` int(11) NOT NULL DEFAULT 0,
  `messages_count` int(11) NOT NULL DEFAULT 0,
  `last_message_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `boards`
--

INSERT INTO `boards` (`id`, `project_id`, `name`, `description`, `position`, `topics_count`, `messages_count`, `last_message_id`, `parent_id`) VALUES
(1, 1, '공지사항', '공지사항', 1, 1, 1, 3, NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `changes`
--

CREATE TABLE `changes` (
  `id` int(11) NOT NULL,
  `changeset_id` int(11) NOT NULL,
  `action` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` text COLLATE utf8_unicode_ci NOT NULL,
  `from_path` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_revision` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `revision` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `changesets`
--

CREATE TABLE `changesets` (
  `id` int(11) NOT NULL,
  `repository_id` int(11) NOT NULL,
  `revision` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `committer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `changesets_issues`
--

CREATE TABLE `changesets_issues` (
  `changeset_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `changeset_parents`
--

CREATE TABLE `changeset_parents` (
  `changeset_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `commented_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `commented_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `comments` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field_format` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `possible_values` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `regexp` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `min_length` int(11) DEFAULT NULL,
  `max_length` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_for_all` tinyint(1) NOT NULL DEFAULT 0,
  `is_filter` tinyint(1) NOT NULL DEFAULT 0,
  `position` int(11) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT 0,
  `default_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `editable` tinyint(1) DEFAULT 1,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `multiple` tinyint(1) DEFAULT 0,
  `format_store` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `custom_fields_projects`
--

CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int(11) NOT NULL DEFAULT 0,
  `project_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `custom_fields_roles`
--

CREATE TABLE `custom_fields_roles` (
  `custom_field_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `custom_fields_trackers`
--

CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int(11) NOT NULL DEFAULT 0,
  `tracker_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `custom_field_enumerations`
--

CREATE TABLE `custom_field_enumerations` (
  `id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `custom_reports`
--

CREATE TABLE `custom_reports` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `chart_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `null_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Null',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `custom_reports`
--

INSERT INTO `custom_reports` (`id`, `project_id`, `user_id`, `is_public`, `name`, `description`, `group_by`, `chart_type`, `null_text`, `created_at`, `updated_at`) VALUES
(2, 7, 1, 1, '일감 리포트', '전체일감 처리 대비 결함 처리 현황', 'status', 'horizontal_bar', '-', '2020-08-25 22:27:44', '2020-08-25 22:46:57');

-- --------------------------------------------------------

--
-- 테이블 구조 `custom_report_series`
--

CREATE TABLE `custom_report_series` (
  `id` int(11) NOT NULL,
  `custom_report_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filters` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `custom_report_series`
--

INSERT INTO `custom_report_series` (`id`, `custom_report_id`, `name`, `filters`, `created_at`, `updated_at`) VALUES
(1, 1, '', '---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\n', '2020-08-25 22:27:00', '2020-08-25 22:27:00'),
(2, 2, '전체일감 진행현황', '---\nstatus_id:\n  :operator: \"*\"\n  :values:\n  - \'\'\n', '2020-08-25 22:27:44', '2020-08-25 22:42:57'),
(3, 2, '결함 진행현황', '---\ntracker_id:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n', '2020-08-25 22:41:26', '2020-08-25 22:49:55');

-- --------------------------------------------------------

--
-- 테이블 구조 `custom_values`
--

CREATE TABLE `custom_values` (
  `id` int(11) NOT NULL,
  `customized_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customized_id` int(11) NOT NULL DEFAULT 0,
  `custom_field_id` int(11) NOT NULL DEFAULT 0,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `email_addresses`
--

CREATE TABLE `email_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `notify` tinyint(1) NOT NULL DEFAULT 1,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `email_addresses`
--

INSERT INTO `email_addresses` (`id`, `user_id`, `address`, `is_default`, `notify`, `created_on`, `updated_on`) VALUES
(1, 1, 'juheunglee@hausyspartner.com', 1, 1, '2020-05-29 08:01:52', '2020-06-08 07:59:27'),
(2, 5, 'jys129@gmail.com', 1, 1, '2020-06-08 00:33:30', '2020-06-08 23:41:27'),
(3, 6, 'jtjeong@hausyspartner.com', 1, 1, '2020-06-08 00:34:12', '2020-06-08 00:34:12'),
(4, 7, 'junghwan.son@lgcns.com', 1, 1, '2020-06-09 00:42:40', '2020-06-09 00:42:40'),
(5, 8, 'wlsdn@lghausys.com', 1, 1, '2020-08-21 02:01:02', '2020-08-21 02:01:02'),
(6, 9, 'lgsanghoon@lghausys.com', 1, 1, '2020-09-03 07:40:27', '2020-09-03 07:40:27');

-- --------------------------------------------------------

--
-- 테이블 구조 `enabled_modules`
--

CREATE TABLE `enabled_modules` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `enabled_modules`
--

INSERT INTO `enabled_modules` (`id`, `project_id`, `name`) VALUES
(1, 1, 'issue_tracking'),
(2, 1, 'time_tracking'),
(3, 1, 'news'),
(4, 1, 'documents'),
(5, 1, 'files'),
(6, 1, 'wiki'),
(7, 1, 'repository'),
(8, 1, 'boards'),
(9, 1, 'calendar'),
(10, 1, 'gantt'),
(11, 1, 'monitoring_controlling_project'),
(62, 7, 'issue_tracking'),
(63, 7, 'time_tracking'),
(64, 7, 'news'),
(65, 7, 'documents'),
(66, 7, 'files'),
(67, 7, 'wiki'),
(68, 7, 'repository'),
(69, 7, 'boards'),
(70, 7, 'calendar'),
(71, 7, 'gantt'),
(72, 7, 'custom_reports'),
(73, 8, 'issue_tracking'),
(74, 8, 'time_tracking'),
(75, 8, 'news'),
(76, 8, 'documents'),
(77, 8, 'files'),
(78, 8, 'wiki'),
(79, 8, 'repository'),
(80, 8, 'boards'),
(81, 8, 'calendar'),
(82, 8, 'gantt'),
(83, 8, 'custom_reports');

-- --------------------------------------------------------

--
-- 테이블 구조 `enumerations`
--

CREATE TABLE `enumerations` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `enumerations`
--

INSERT INTO `enumerations` (`id`, `name`, `position`, `is_default`, `type`, `active`, `project_id`, `parent_id`, `position_name`) VALUES
(1, '낮음', 1, 0, 'IssuePriority', 1, NULL, NULL, 'lowest'),
(2, '보통', 2, 1, 'IssuePriority', 1, NULL, NULL, 'default'),
(3, '높음', 3, 0, 'IssuePriority', 1, NULL, NULL, 'high3'),
(4, '긴급', 4, 0, 'IssuePriority', 1, NULL, NULL, 'high2'),
(5, '즉시', 5, 0, 'IssuePriority', 1, NULL, NULL, 'highest'),
(6, '사용자 문서', 1, 0, 'DocumentCategory', 1, NULL, NULL, NULL),
(7, '기술 문서', 2, 0, 'DocumentCategory', 1, NULL, NULL, NULL),
(8, '설계', 1, 0, 'TimeEntryActivity', 1, NULL, NULL, NULL),
(9, '개발', 2, 0, 'TimeEntryActivity', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `groups_users`
--

CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `imports`
--

CREATE TABLE `imports` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_items` int(11) DEFAULT NULL,
  `finished` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `import_items`
--

CREATE TABLE `import_items` (
  `id` int(11) NOT NULL,
  `import_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `issues`
--

CREATE TABLE `issues` (
  `id` int(11) NOT NULL,
  `tracker_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL,
  `fixed_version_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `lock_version` int(11) NOT NULL DEFAULT 0,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int(11) NOT NULL DEFAULT 0,
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `closed_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `issues`
--

INSERT INTO `issues` (`id`, `tracker_id`, `project_id`, `subject`, `description`, `due_date`, `category_id`, `status_id`, `assigned_to_id`, `priority_id`, `fixed_version_id`, `author_id`, `lock_version`, `created_on`, `updated_on`, `start_date`, `done_ratio`, `estimated_hours`, `parent_id`, `root_id`, `lft`, `rgt`, `is_private`, `closed_on`) VALUES
(1, 5, 1, '로그인 OTP 적용건', 'Admin web이 외부망으로 오픈되면서 로그인시 보안강화를 위해 MFA적용이 필요함\r\nMFA 적용을 위해 OTP를 적용을 해야하는데 하우시스에서 API를 제공한다고 함\r\nOTP연동가이드를 전달해주면 개발공수 검토가 필요함', '2020-06-30', NULL, 2, 6, 2, NULL, 1, 4, '2020-06-08 08:06:54', '2020-06-16 23:54:25', '2020-06-08', 0, NULL, NULL, 1, 1, 2, 0, NULL),
(2, 6, 1, '디바이스 테스트 환경제공', '', '2020-06-12', 2, 5, 5, 2, NULL, 1, 6, '2020-06-08 08:08:30', '2020-08-24 04:09:11', '2020-06-11', 0, NULL, NULL, 2, 1, 2, 0, '2020-08-24 04:09:11'),
(3, 5, 1, '최종 기획서 검토', '', '2020-06-19', NULL, 2, 7, 5, NULL, 1, 5, '2020-06-09 00:35:36', '2020-06-10 03:15:42', '2020-06-09', 0, NULL, NULL, 3, 1, 2, 0, NULL),
(4, 2, 1, 'FAQ 분류', 'FAQ 등록시 분류선택후 등록 가능해야함\r\n\r\n- 분류 - \r\n제품\r\n등록\r\n기능 ', NULL, 3, 3, 6, 2, NULL, 1, 2, '2020-06-09 06:22:27', '2020-07-30 22:07:11', '2020-06-09', 0, NULL, NULL, 4, 1, 2, 0, NULL),
(8, 8, 1, '아키텍처 산출물', '1. 아키텍처 설계서\r\n\r\n2. 인프라 운영 이관문서\r\n\r\n3. 잔여업무 확인', '2020-06-16', 4, 5, 1, 2, NULL, 1, 2, '2020-06-12 09:10:19', '2020-06-17 06:09:06', '2020-06-12', 0, NULL, NULL, 8, 1, 2, 0, '2020-06-17 06:09:06'),
(9, 6, 1, 'QC 테스트 시나리오', '전기레인지, 스마트 후드 연동 통합테스트 시나리오 작성', '2020-07-17', 4, 2, 1, 3, NULL, 1, 1, '2020-06-12 09:38:04', '2020-07-13 00:47:39', '2020-06-29', 0, NULL, NULL, 9, 1, 2, 0, NULL),
(11, 7, 1, '고객정보 관리DB 변경건', '고객정보 기존 CosmosDB 에서 MariaDB로 변경\r\n\r\n- 모바일 I/F 고객정보 쿼리모듈 전체 변경\r\n\r\n해당 변경건에 대해 영향도 평가 해주시고\r\n개발 적용은 가능하면 8월에 해도 문제 없는지 검토해주세요\r\n\r\n가능한 일정 검토후 기간 수정 하시면 됩니다.', '2020-08-07', 2, 3, 5, 2, NULL, 1, 3, '2020-06-16 23:12:31', '2020-08-25 06:13:05', '2020-08-03', 0, NULL, NULL, 11, 1, 2, 0, NULL),
(12, 7, 1, '고객정보 관리DB 변경건', '고객정보 기존 CosmosDB 에서 MariaDB로 변경\r\n\r\n- Admin 고객정보 메뉴 기개발부분 변경\r\n\r\n해당 변경건에 대해 영향도 평가 해주시고\r\n개발 적용은 가능하면 8월에 해도 문제 없는지 검토해주세요\r\n\r\n가능한 일정 검토후 기간 수정 하시면 됩니다.', '2020-07-17', 3, 2, 6, 2, NULL, 1, 1, '2020-06-16 23:14:14', '2020-06-16 23:51:35', '2020-06-17', 0, NULL, NULL, 12, 1, 2, 0, NULL),
(13, 5, 1, '개발 검토건', '개발 검토 사항을을 하위 이슈로 등록', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:51:38', '2020-06-18 23:51:38', '2020-06-19', 0, NULL, NULL, 13, 1, 52, 0, NULL),
(14, 5, 1, 'desired의 결과로 report가 올때, timer인 경우 startTime을 저장', 'desired의 결과로 report가 올때, timer인 경우 startTime을 저장할 것\r\n', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:52:47', '2020-06-18 23:52:47', '2020-06-19', 0, NULL, 13, 13, 2, 3, 0, NULL),
(15, 5, 1, '디바이스 필수 속성들을 해당 값을 IoT Hub를 통해 가져올수 없는지', '기존에 디바이스 속성들은 cosmosDb를 조회하지 않고, iot hub의 디바이스 정보에서 가져화서\r\ndb 조회를 줄였다고 함', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:54:38', '2020-06-18 23:54:38', '2020-06-19', 0, NULL, 13, 13, 4, 5, 0, NULL),
(16, 5, 1, '디바이스 hearbeat 처리 방안', 'Ping을 어떻게 처리할지\r\n\r\n- 디바이스 online 상태 판단\r\n- 베터리 타입은 interval 시간보다 데이터 수집이 되지 않으면 offline으로 판단\r\n - led 핸들\r\n- hood, 전기레인지, 환기창\r\n - 모바일 상세 페이지 MQTT들은 Ping으로 판단하자', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:55:14', '2020-06-18 23:55:14', '2020-06-19', 0, NULL, 13, 13, 6, 7, 0, NULL),
(17, 5, 1, 'Device Firmware의 Lastest 정보를 디바이스 속성에 포함하는게 맞는지', 'Device Firmware의 Lastest 정보를 디바이스 속성에 포함하는게 맞는지', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:55:37', '2020-06-18 23:55:37', '2020-06-19', 0, NULL, 13, 13, 8, 9, 0, NULL),
(18, 5, 1, '모바일 weather api에서 미세먼지 코드도 반환할 것', '모바일 weather api에서 미세먼지 코드도 반환할 것', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:55:58', '2020-06-18 23:55:58', '2020-06-19', 0, NULL, 13, 13, 12, 13, 0, NULL),
(19, 5, 1, '제품별/공간별, 방이나 제품구분을 쿼리 파람으로 지원하자', '제품별/공간별, 방이나 제품구분을 쿼리 파람으로 지원하자', NULL, NULL, 1, NULL, 2, NULL, 5, 1, '2020-06-18 23:56:01', '2020-06-18 23:56:19', '2020-06-19', 0, NULL, 13, 13, 10, 11, 0, NULL),
(20, 5, 1, '사용자가 제품의 이름을 변경가능해야함', '사용자가 제품의 이름을 변경가능해야함', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:56:39', '2020-06-18 23:56:39', '2020-06-19', 0, NULL, 13, 13, 16, 17, 0, NULL),
(21, 5, 1, 'put 에대한 응답은 1차 http 코드 / 결과는 객체 전체를 회신', '모바일로 수정(PUT) API가 들어오면 결과값으로 변경사항이나 전체를 회신할 것', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:56:42', '2020-06-18 23:56:42', '2020-06-19', 0, NULL, 13, 13, 14, 15, 0, NULL),
(22, 5, 1, '스마트 후드에서 전기레인지 이름도 나와야함', '스마트 후드에서 전기레인지 이름도 나와야함', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:57:01', '2020-06-18 23:57:01', '2020-06-19', 0, NULL, 13, 13, 18, 19, 0, NULL),
(23, 5, 1, '스마트 후드와 전기레인지는 1:1로 연결', '스마트 후드와 전기레인지는 1:1로 연결', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:57:25', '2020-06-18 23:57:25', '2020-06-19', 0, NULL, 13, 13, 20, 21, 0, NULL),
(24, 5, 1, '알림의 on/off는 개인화 구현', '장소 공유가 되어 있는 상태에서 알림의 개인화 지원해야 함', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:58:02', '2020-06-18 23:58:02', '2020-06-19', 0, NULL, 13, 13, 22, 23, 0, NULL),
(25, 5, 1, '통계나 변경이력은 1달을 보관', '통계나 변경이력은 1달을 보관', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:58:10', '2020-06-18 23:58:10', '2020-06-19', 0, NULL, 13, 13, 24, 25, 0, NULL),
(26, 5, 1, '환기창 : 소자 사용시간 50h, 필터 사용시간 100, 각각 최대 시간이 API에서 제공되어야 함', '환기창 : 소자 사용시간 50h, 필터 사용시간 100, 각각 최대 시간이 API에서 제공되어야 함', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:58:52', '2020-06-18 23:58:52', '2020-06-19', 0, NULL, 13, 13, 26, 27, 0, NULL),
(27, 5, 1, 'LED핸들 수면모드 없음LED핸들은 5분 간격으로 status 상태를 전달', 'LED핸들 수면모드 없음LED핸들은 5분 간격으로 status 상태를 전달', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:59:03', '2020-06-18 23:59:03', '2020-06-19', 0, NULL, 13, 13, 28, 29, 0, NULL),
(28, 5, 1, '섬네일 변경 : 모바일에서 사용자 섬네일 url put 요청함', '섬네일 변경 : 모바일에서 사용자 섬네일 url put 요청함\r\n썸네일은 속성값에 저장하지 말지..?', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:59:27', '2020-06-18 23:59:27', '2020-06-19', 0, NULL, 13, 13, 30, 31, 0, NULL),
(29, 5, 1, '환기창 : 수동 모드일때만 예약 시간이 있음', '환기창 : 수동 모드일때만 예약 시간이 있음', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:59:31', '2020-06-18 23:59:31', '2020-06-19', 0, NULL, 13, 13, 40, 41, 0, NULL),
(30, 5, 1, '컨트롤 내역 조회에 필터 기능이 있어야 함 (항목 카테고리)', '컨트롤 내역 조회에 필터 기능이 있어야 함 (항목 카테고리)', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:59:34', '2020-06-18 23:59:34', '2020-06-19', 0, NULL, 13, 13, 32, 33, 0, NULL),
(31, 5, 1, '스마트 후드 객체 내에 전기레인지 연결 상세 정보를 넣자', '스마트 후드 객체 내에 전기레인지 연결 상세 정보를 넣자', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:59:41', '2020-06-18 23:59:41', '2020-06-19', 0, NULL, 13, 13, 34, 35, 0, NULL),
(32, 5, 1, '평균 / 사용량 / 추가 정보도 전달해야함', '디바이스 통계 페이지에서 지원해야함', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:59:45', '2020-06-18 23:59:45', '2020-06-19', 0, NULL, 13, 13, 36, 37, 0, NULL),
(33, 5, 1, '그래프 범계는 모바일앱에서 하드 코딩(?) 하는 것이 좋을 것 같음', '그래프 범계는 모바일앱에서 하드 코딩(?) 하는 것이 좋을 것 같음', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-18 23:59:46', '2020-06-18 23:59:46', '2020-06-19', 0, NULL, 13, 13, 38, 39, 0, NULL),
(34, 5, 1, '시뮬레이터 개발 검토', '그래프 범계는 모바일앱에서 하드 코딩(?) 하는 것이 좋을 것 같음', NULL, NULL, 1, NULL, 2, NULL, 5, 1, '2020-06-19 00:02:02', '2020-06-19 00:05:52', '2020-06-19', 0, NULL, 13, 13, 42, 43, 0, NULL),
(35, 5, 1, 'LED핸들 수면모드 없음LED핸들은 5분 간격으로 status 상태를 전달', 'LED핸들 수면모드 없음LED핸들은 5분 간격으로 status 상태를 전달', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-19 00:02:25', '2020-06-19 00:02:25', '2020-06-19', 0, NULL, 13, 13, 44, 45, 0, NULL),
(36, 5, 1, '씽큐 연계가 안될때 연동 안됨 상태 저장되어야 함', '씽큐 연계가 안될때 연동 안됨 상태 저장되어야 함', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-19 00:02:37', '2020-06-19 00:02:37', '2020-06-19', 0, NULL, 13, 13, 46, 47, 0, NULL),
(37, 5, 1, '디바이스 상태 조회 (heart beat)시 유전원 디바이스 상태 전달 방법 합의필요', '디바이스 상태 조회 (heart beat)시 유전원 디바이스 상태 전달 방법 합의필요', NULL, NULL, 1, NULL, 2, NULL, 5, 1, '2020-06-19 00:03:01', '2020-06-19 00:03:20', '2020-06-19', 0, NULL, 13, 13, 48, 49, 0, NULL),
(38, 5, 1, '모바일에서 마스터집 수정 가능하도록 변경', '모바일에서 마스터집 수정 가능하도록 변경', NULL, NULL, 1, NULL, 2, NULL, 5, 0, '2020-06-19 00:03:22', '2020-06-19 00:03:22', '2020-06-19', 0, NULL, 13, 13, 50, 51, 0, NULL),
(39, 6, 1, 'S/W 보안점검', '- 보안점검 대상\r\n   모바일 Android\r\n   모바일 IOS \r\n   Admin Web', NULL, NULL, 1, 1, 2, NULL, 1, 1, '2020-06-24 00:57:01', '2020-06-24 01:07:54', '2020-08-03', 0, NULL, NULL, 39, 1, 2, 0, NULL),
(40, 8, 1, '단위테스트 케이스', '모바일앱 단위테스트 케이스', '2020-07-24', NULL, 1, 7, 2, NULL, 1, 0, '2020-06-29 06:20:23', '2020-06-29 06:20:23', '2020-06-29', 0, NULL, NULL, 40, 1, 2, 0, NULL),
(41, 8, 1, '단위테스트 케이스', '프로토콜 인터페이스 단위테스트 케이스', '2020-07-24', 2, 1, 5, 2, NULL, 1, 0, '2020-06-29 06:21:22', '2020-06-29 06:21:22', '2020-06-29', 0, NULL, NULL, 41, 1, 2, 0, NULL),
(42, 8, 1, '단위테스트 케이스', 'Admin 단위테스트 케이스', '2020-07-24', 3, 2, 6, 2, NULL, 1, 1, '2020-06-29 06:22:48', '2020-07-30 22:17:12', '2020-06-29', 0, NULL, NULL, 42, 1, 2, 0, NULL),
(43, 1, 1, '회원상세 팝업 오류', '회원명 : 김진우\r\n\r\n!회원관리_김진우.PNG!', NULL, 3, 3, 6, 2, NULL, 1, 3, '2020-07-07 06:44:13', '2020-07-30 22:14:10', '2020-07-07', 0, NULL, NULL, 43, 1, 2, 0, NULL),
(44, 1, 1, '회원상세 항목 정리 ', '회원상세 항목들중 사용하지 않는 아이템 다수로 보임\r\n\r\n정리가 필요함\r\n\r\n!회원상세항목.PNG!', NULL, 3, 3, 6, 2, NULL, 1, 3, '2020-07-07 06:45:17', '2020-07-30 22:10:34', '2020-07-07', 0, NULL, NULL, 44, 1, 2, 0, NULL),
(46, 1, 1, '회원검색 ', '\r\n 1. 레이아웃을 한줄로 수정할것\r\n\r\n 2. 회원 닉네임 검색 안됨(Like 검색 필요)\r\n\r\n\r\n\r\n\r\n!레이아웃.PNG!', NULL, 3, 3, 6, 2, NULL, 1, 4, '2020-07-07 06:51:49', '2020-07-30 22:12:59', '2020-07-07', 0, NULL, NULL, 46, 1, 2, 0, NULL),
(47, 1, 1, '리스트 페이징 처리', '\r\n- 리스트 페이징 처리\r\n\r\n!페이징.PNG!', NULL, 3, 3, 6, 2, NULL, 1, 1, '2020-07-07 07:01:56', '2020-07-30 22:11:36', '2020-07-07', 0, NULL, NULL, 47, 1, 2, 0, NULL),
(48, 1, 1, '한글화', '메뉴 및 키워드 전체 한글화', NULL, 3, 3, 6, 2, NULL, 1, 1, '2020-07-07 07:27:14', '2020-07-30 22:09:49', '2020-07-07', 0, NULL, NULL, 48, 1, 2, 0, NULL),
(49, 1, 1, '디바이스 모델 삭제 오류', '디바이스 모델 상세보기 -> 삭제 \r\n반응없음', NULL, 3, 3, 6, 2, NULL, 1, 2, '2020-07-07 07:30:52', '2020-07-30 22:15:30', '2020-07-07', 0, NULL, NULL, 49, 1, 2, 0, NULL),
(50, 1, 1, '회원상세 팝업 오류', '이전 회원의 데이터가 지워지지 않고 남아있음\r\n\r\n김진우 --> TEST_nickname 차례로 클릭시 김진우의 주소가 TEST_nickname에 그대로 남아있음', NULL, 3, 3, 6, 2, NULL, 1, 2, '2020-07-08 04:57:15', '2020-07-30 22:08:21', '2020-07-08', 0, NULL, NULL, 50, 1, 2, 0, NULL),
(51, 1, 7, '스마트후드 필터교체 표시', '메인화면에 스마트후드 필터교체가 전원 off하면 없어진다.(off되도 양호 표시가 되어 있어야 함)\r\n   --> 전원 Off와 상관이 상태표시가 되어야함\r\n', NULL, NULL, 5, 7, 3, NULL, 1, 1, '2020-08-21 03:23:27', '2020-08-21 10:14:43', '2020-08-21', 0, NULL, NULL, 51, 1, 2, 0, '2020-08-21 10:14:43'),
(52, 1, 7, '스마트후드 필터교체 표시 2', '메인화면에 필터교체로 잘 못 표기된다.\r\n   --> 대시보드에 \"교체필요\"로 뜨고 상세화면에 \"양호\"로 표시됨. 둘다 서버값을 반영 못하고 있음\r\n', NULL, NULL, 5, 7, 3, NULL, 1, 2, '2020-08-21 03:24:05', '2020-08-21 10:15:26', '2020-08-21', 0, NULL, NULL, 52, 1, 2, 0, '2020-08-21 10:15:26'),
(53, 1, 7, '스마트 후드 상세화면 필터교체 표시', '상세페이지에서 필터교체 시간이 잘 못표시된다.\r\n\r\n   --> 서버값 반영필요\r\n', NULL, NULL, 5, 7, 3, NULL, 1, 2, '2020-08-21 03:24:32', '2020-08-21 10:15:58', '2020-08-21', 0, NULL, NULL, 53, 1, 2, 0, '2020-08-21 10:15:58'),
(54, 1, 7, '스마트후드 제어이력', '제어이력 진입하면 그래프가 나옴', NULL, NULL, 5, 7, 3, NULL, 1, 2, '2020-08-21 03:24:49', '2020-08-21 10:14:07', '2020-08-21', 0, NULL, NULL, 54, 1, 2, 0, '2020-08-21 10:14:07'),
(55, 1, 7, '스마트후드 주간 사용량', '스마트후드 주간사용량 안나옴', NULL, NULL, 5, 7, 3, NULL, 1, 4, '2020-08-21 03:25:20', '2020-08-26 09:53:58', '2020-08-21', 0, NULL, NULL, 55, 1, 2, 0, '2020-08-26 09:53:58'),
(56, 7, 7, '스마트후드 풍량 조절', '풍향을 수평스크롤바로 변경', NULL, NULL, 5, 7, 3, NULL, 1, 2, '2020-08-21 03:25:40', '2020-08-24 09:11:31', '2020-08-21', 0, NULL, NULL, 56, 1, 2, 0, '2020-08-24 09:11:31'),
(57, 1, 7, '메인화면 제품정보 간헐적 보이지 않음', '제품별 화면상태로 메인화면 진입시 간헐적으로 디바이스 제품이 보이지 않는다.\r\n\r\n--> 동영상 확인 필요', NULL, NULL, 6, 7, 3, NULL, 1, 2, '2020-08-21 03:26:18', '2020-08-25 10:34:59', '2020-08-21', 0, NULL, NULL, 57, 1, 2, 0, '2020-08-25 10:34:59'),
(58, 7, 7, '메인화면 리프레쉬 딜레이 현상', '리프레시 하면 로딩이 너무 오래걸린다', NULL, NULL, 5, 5, 2, NULL, 1, 7, '2020-08-21 03:26:34', '2020-08-25 22:40:02', '2020-08-21', 0, NULL, NULL, 58, 1, 2, 0, '2020-08-25 22:40:02'),
(59, 7, 7, '스마트후드 상세UI 텍스트 수정', '\r\nOFF->꺼짐, ON->켜짐 변경\r\n\r\n사용시간 0h -> 0시간 변경\r\n\r\noff/on -> 꺼짐/켜짐 변경\r\n\r\n타이머 00분 -> 꺼짐 변경\r\n', NULL, NULL, 5, 7, 1, NULL, 1, 5, '2020-08-21 03:27:13', '2020-08-26 09:56:28', '2020-08-21', 0, NULL, NULL, 59, 1, 2, 0, '2020-08-26 09:56:28'),
(60, 7, 7, '메인화면 UI', '메인화면 구분자 제거\r\n제품별/공간별 직사각형으로(6자까지 적용)', NULL, NULL, 5, 7, 2, NULL, 1, 3, '2020-08-21 03:27:41', '2020-08-25 04:10:41', '2020-08-21', 0, NULL, NULL, 60, 1, 2, 0, '2020-08-25 04:10:41'),
(61, 7, 7, '날씨정보', '날씨정보 안나오는 경우\r\n--> 날씨 제공업체 변경 예정\r\n\r\n \r\n', NULL, NULL, 5, 5, 2, NULL, 1, 2, '2020-08-21 03:28:25', '2020-08-25 22:40:36', '2020-08-21', 0, NULL, NULL, 61, 1, 2, 0, '2020-08-25 22:40:36'),
(62, 7, 7, '공간 순서 변경', '기타 장소가 제일 뒤에 위치, 신규 등록 공간제일 앞에 위치하도록 변경', NULL, NULL, 5, 5, 2, NULL, 1, 2, '2020-08-21 03:28:41', '2020-08-24 02:45:25', '2020-08-21', 0, NULL, NULL, 62, 1, 2, 0, '2020-08-24 02:45:25'),
(63, 1, 7, '즐겨찾기 순서', '체크표시는 저장되나 순서는 안바뀜', NULL, NULL, 5, 7, 2, NULL, 1, 1, '2020-08-21 10:19:52', '2020-08-28 06:02:32', '2020-08-21', 0, NULL, NULL, 63, 1, 2, 0, '2020-08-28 06:02:32'),
(64, 1, 7, '주간사용량 화면', '상단 주별 좌우 이동표시가 무한대로 움직임\r\n\r\n정책 : 금주포함 이전 3주. \r\n     총4주치 데이터만 볼수 있음. \r\n     이동도 정책에 맞게 처리 필요', NULL, NULL, 5, 7, 2, NULL, 1, 1, '2020-08-21 10:20:54', '2020-08-25 10:33:37', '2020-08-21', 0, NULL, NULL, 64, 1, 2, 0, '2020-08-25 10:33:37'),
(65, 1, 7, '후드 상세화면 알림설정', '\"알림설정\" 메뉴\r\n\r\n1. 필터교체알림, 제어알림 : 후드의 전원 On/Off와 상관없이 설정 가능해야함\r\n   현상 : 후드가 On일 상태에서만 설정됨, on --> 리프레쉬 하면 다시 off로 바뀜\r\n\r\n2. 제어알림 : 동작안함(on/off 상관없이 항상 알림이 옴)', NULL, NULL, 5, 5, 2, NULL, 1, 6, '2020-08-24 00:52:15', '2020-08-27 09:51:08', '2020-08-24', 0, NULL, NULL, 65, 1, 2, 0, '2020-08-27 09:51:08'),
(66, 1, 7, '푸쉬 알림', '앱이 포그라운드 일때는 푸쉬가 notification 되면 안됨', NULL, NULL, 5, 7, 2, NULL, 1, 6, '2020-08-24 00:54:37', '2020-08-25 10:35:32', '2020-08-24', 0, NULL, NULL, 66, 1, 2, 0, '2020-08-25 10:35:32'),
(67, 7, 7, '제품별 제품명, 공간별 공간명 UI 수정', '메인화면 제품별 제품명, 공간별 공간명 UI 수정\r\n\r\n최대 6자 반영되는 직사각형 형태로 수정 필요\r\n\r\n', NULL, NULL, 5, 7, 2, NULL, 1, 4, '2020-08-24 07:54:16', '2020-08-25 06:38:53', '2020-08-24', 0, NULL, NULL, 67, 1, 2, 0, '2020-08-25 06:38:53'),
(68, 7, 7, '메인화면 상단 구분자 제거', '메인화면 상단 구분자 제거', NULL, NULL, 5, 7, 2, NULL, 1, 3, '2020-08-24 07:54:50', '2020-08-25 06:32:53', '2020-08-24', 0, NULL, NULL, 68, 1, 2, 0, '2020-08-25 06:32:53'),
(69, 7, 7, '스마트후드 상세 필터 텍스트 수정', '스마트후드 상세\r\n\r\n필터(양호) 사용시간 7h\r\n--> 필터(양호) *+필터사용시간 7시간+*', NULL, NULL, 5, 7, 1, NULL, 1, 7, '2020-08-24 07:57:45', '2020-08-27 08:54:36', '2020-08-24', 0, NULL, NULL, 69, 1, 2, 0, '2020-08-27 08:54:36'),
(70, 7, 7, '메인화면 제품별 공간별 제품정보 간헐적 보이지 않음', '제품,공간을 오갈때 간헐적으로 제품명이 나오지 않는 현상이 발생함\r\n\r\n동영상으로 공유한 내용임\r\n\r\n손정환책임님 모바일앱에서 같이봐야하는 문제입니다.', NULL, NULL, 5, 5, 3, NULL, 1, 5, '2020-08-24 08:00:27', '2020-09-08 22:29:24', '2020-08-24', 0, NULL, NULL, 70, 1, 2, 0, '2020-09-08 22:29:24'),
(71, 5, 7, '메인화면 제품리스트 UI 변경 검토요청', '\r\n후드 상세페이지의 카테고리 분류처럼 \r\n메인화면의 제품 구분도 같은 형태로 처리 가능한지 검토 요청\r\n\r\n!메인카드UI.PNG!', NULL, 9, 5, 7, 2, NULL, 1, 4, '2020-08-24 08:06:52', '2020-09-04 07:57:56', '2020-08-24', 0, NULL, NULL, 71, 1, 2, 0, '2020-09-04 07:57:56'),
(72, 7, 7, '로딩이미지 변경', '로딩이미지의 배경(화이트)이 투명하게 처리 되도록 수정.', NULL, NULL, 5, 7, 1, NULL, 8, 4, '2020-08-24 08:20:41', '2020-08-26 10:21:33', '2020-08-24', 0, NULL, NULL, 72, 1, 2, 0, '2020-08-26 10:21:33'),
(73, 6, 7, 'IOS 테스트', 'IOS 전용기능 테스트 필요\r\n\r\n* 상이한 제품등록 프로세스\r\n* 애플로그인\r\n* 푸쉬 알림\r\n* 화면 리프레쉬', NULL, NULL, 5, 7, 3, NULL, 1, 4, '2020-08-24 09:33:08', '2020-09-04 07:57:29', '2020-08-24', 0, NULL, NULL, 73, 1, 2, 0, '2020-09-04 07:57:29'),
(74, 2, 7, 'ThinQ 연동 해제', 'ThinQ 연동해제 기능 API 추가\r\n\r\n사용자 프로필 UI 추가\r\n\r\n지책임 API 추가후 손책임에게 assign 변경 해주세요', NULL, NULL, 5, 7, 2, NULL, 1, 9, '2020-08-25 04:14:33', '2020-08-27 09:28:26', '2020-08-25', 0, NULL, NULL, 74, 1, 2, 0, '2020-08-27 09:28:26'),
(75, 7, 7, 'ThinQ 연동 프로세스 변경건', 'ThinQ 제품 연동 수정건', NULL, NULL, 5, 7, 2, NULL, 1, 4, '2020-08-25 05:36:58', '2020-08-27 01:29:14', '2020-08-25', 0, NULL, NULL, 75, 1, 2, 0, '2020-08-27 01:29:14'),
(76, 5, 7, '스마트후드 풍량바 활성화 이슈', '스마트후드 전원이 Off 인 상태에서 풍량조절바가 활성화 되어 있음', NULL, NULL, 5, 7, 2, NULL, 1, 2, '2020-08-25 07:06:43', '2020-09-06 23:42:04', '2020-08-25', 0, NULL, NULL, 76, 1, 2, 0, '2020-09-06 23:42:04'),
(77, 7, 7, '전체알림 일부기능 삭제', '전체 알림설정에서 제어알림,상태알림 기능삭제\r\n\r\n!알림설정.PNG!', NULL, NULL, 5, 7, 2, NULL, 1, 2, '2020-08-25 08:55:17', '2020-08-27 08:55:34', '2020-08-25', 0, NULL, NULL, 77, 1, 2, 0, '2020-08-27 08:55:34'),
(78, 5, 7, 'IOS 위치정보 활용 동의 문구 작성', '', NULL, NULL, 5, 1, 2, NULL, 1, 3, '2020-08-26 01:26:20', '2020-08-26 01:50:48', '2020-08-26', 0, NULL, NULL, 78, 1, 2, 0, '2020-08-26 01:50:48'),
(79, 2, 7, '애플로그인 개발', 'IOS 앱등록을 위해 애플로그인 개발', NULL, NULL, 5, 7, 3, NULL, 1, 3, '2020-08-26 01:30:13', '2020-09-03 05:05:19', '2020-08-26', 0, NULL, NULL, 79, 1, 2, 0, '2020-09-03 05:05:19'),
(80, 7, 7, '스마트후드 필터교체 문구 삽입', '1. 스마트후드 상세페이지의 \"필터교체\" 문구를 \"필터청소\" 문구로 교체\r\n\r\n2. \"필터청소\"를 클릭하면 아래의 가이드 내용 표시\r\n-----------------------\r\n알루미늄 필터는 중성세제(일바 주방용 세제)를\r\n푼 미지근한 물에 10분정도 담근 후, 물로\r\n헹구어 청소합니다.\r\n벨 마우스와 정류판은 후드 외관 청소 방법과\r\n동일하게 부드러운 천을 이용해 손쉽게\r\n청소 할 수 있습니다.\r\n\r\n* 상세 내용은 설명서를 참조하세요.\r\n-----------------------', NULL, NULL, 5, 7, 2, NULL, 8, 3, '2020-08-26 04:45:01', '2020-08-27 08:56:40', '2020-08-26', 0, NULL, NULL, 80, 1, 2, 0, '2020-08-27 08:56:40'),
(81, 7, 7, '상세페이지 라인 중간 정렬', '상세페이지의 이미지-텍스트 부분을 중간정렬 한다.\r\n\r\n스마트후드 필터부분을 보면 하단정렬 되어 있음.\r\n\r\n!중간정렬.png!\r\n\r\n!메인화면정렬.png!', NULL, NULL, 5, 7, 1, NULL, 8, 6, '2020-08-26 04:57:46', '2020-09-01 09:22:16', '2020-08-26', 0, NULL, NULL, 81, 1, 2, 0, '2020-09-01 09:22:16'),
(82, 7, 7, '스마트후드 텍스트 수정', '스마트후드 상세페이지->동작제어->타이머\r\n\r\n타이머 하단 문구가  잘 못 표시됨\r\n\r\n* \"꺼진 후 5분동안 작동\" -> \"5분 후 꺼짐\" 으로 변경', NULL, NULL, 5, 7, 2, NULL, 8, 3, '2020-08-26 05:03:08', '2020-08-27 08:57:10', '2020-08-26', 0, NULL, NULL, 82, 1, 2, 0, '2020-08-27 08:57:10'),
(84, 1, 7, '후드 주간사용량 시간 불일치건', '!주간사용량.jpg!\r\n\r\n8, 32 이 디바이스에서 올라오는값이 어떤 의미인지 확인필요\r\n디바이스 값이 오류면 요청하기 바람', NULL, NULL, 5, 7, 2, NULL, 1, 6, '2020-08-26 23:02:12', '2020-08-28 05:58:55', '2020-08-27', 0, NULL, NULL, 84, 1, 2, 0, '2020-08-28 05:58:55'),
(85, 1, 7, '제어이력 날짜 모두 수요일로 나옴', '제어이력에 날짜와 무관하게 모두 수요일로 표시됨\r\n\r\n요일이 의미가 없다면 요일 삭제해도 무방함\r\n\r\n!제어이력.jpg!', NULL, NULL, 5, 7, 2, NULL, 1, 3, '2020-08-27 00:18:44', '2020-08-27 08:59:36', '2020-08-27', 0, NULL, NULL, 85, 1, 2, 0, '2020-08-27 08:59:36'),
(86, 1, 7, '상세페이지 상단 기기명이 기존 이름이 보여짐', '기본 이름이 스마트후드인 제품의 이름을 \"벽걸이후드\"로 변경\r\n\r\n메인화면 -> 기기상세페이지 이동 : 상세페이지 최상단 제품의 이름이 스마트후드로 표시되다가 벽걸이후드로 변경 됨\r\n\r\n* 다른 화면에서 상세페이지로 넘어가면 해당 증상이 무조건 발생\r\n* 동영상 파일 첨부', NULL, NULL, 5, 7, 1, NULL, 8, 5, '2020-08-27 01:39:50', '2020-08-28 05:57:53', '2020-08-27', 0, NULL, NULL, 86, 1, 2, 0, '2020-08-28 05:57:53'),
(87, 2, 8, '등록된 제품 네트워크 변경', '등록된 디바이스의 내부 AP가 변경되었을때 처리건 입니다.\r\n\r\n기기정보 > 네트워크 변경\r\n\r\n기존 페어링 시나리오 재활용해서 제품 AP만 변경하는 기능인데 검토 부탁드립니다.\r\n\r\n시나리오는 검토후 반영하겠습니다.\r\n\r\nh2. *<ThinQ 앱 예시>*\r\n!20200827_110750.jpg!', NULL, NULL, 5, 7, 2, NULL, 1, 11, '2020-08-27 02:09:43', '2020-10-07 01:23:05', '2020-08-27', 0, NULL, NULL, 87, 1, 2, 0, '2020-10-07 01:23:05'),
(88, 1, 7, '제이이력 데이터 없을때 토스트 삭제', '제어이력 진입 -> 데이터가 없음 \r\n\r\n현상 : \"무언가 잘못되었습니다\" 토스트 발생\r\n처리 : 데이터가 없을땐 빈화면으로 나오고 토스트는 오류로 판단할수 있으니 삭제\r\n\r\n!제어이력2.jpg!', NULL, NULL, 5, 7, 2, NULL, 1, 4, '2020-08-27 04:17:05', '2020-08-27 09:02:54', '2020-08-27', 0, NULL, NULL, 88, 1, 2, 0, '2020-08-27 09:02:54'),
(89, 5, 7, '알림내역,제어이력정보 카테고리 분류 ', '알림내역과 제어이력정보에 기획서상 카테고리가 분류되어 있습니다.\r\n분류가 필요하다면 각 화면별 어떻게 분류할것인지 정의가 필요하니 검토 요청드립니다.\r\n\r\n!알림내역.PNG!\r\n\r\n!제어이력정보.PNG!', NULL, NULL, 5, 8, 2, NULL, 1, 1, '2020-08-28 00:37:10', '2020-09-08 22:29:55', '2020-08-28', 0, NULL, NULL, 89, 1, 2, 0, '2020-09-08 22:29:55'),
(90, 1, 7, '[ThinQ] 기등록된 디바이스는 선택되면 안됨', '\"등록완료\" 로 나오는 디바이스는 재등록 불가하게 Diable 처리 바랍니다.\r\n\r\n!thin1.jpg!', NULL, NULL, 5, 7, 2, NULL, 1, 6, '2020-08-28 07:12:17', '2020-08-31 10:52:22', '2020-08-28', 0, NULL, NULL, 90, 1, 2, 0, '2020-08-31 10:52:22'),
(91, 7, 7, '메인화면 상단 라인 추가', '레이아웃 자꾸 번복해서 죄송합니다.\r\n이번이 마지막입니다......\r\n\r\n1. 첫번째 제품 상단에도 동일한 구분선 필요\r\n2. 마지막 제품 아래부분은 이하는 구분선과 같은 회색처리하여 마지막임을 표시\r\n\r\n!main.jpg!', NULL, NULL, 5, 7, 1, NULL, 1, 4, '2020-08-28 07:16:36', '2020-09-03 07:44:32', '2020-08-28', 0, NULL, NULL, 91, 1, 2, 0, '2020-09-03 07:44:32'),
(92, 1, 7, '프로필 닉네임 변경시 햄버거메뉴에 변경안됨', '프로필 변경후\r\n햄버거 메뉴의 상단 닉네임은 변경안됨\r\n\r\n!니익.jpg!', NULL, NULL, 5, 5, 2, NULL, 1, 8, '2020-08-28 07:43:52', '2020-09-01 02:24:04', '2020-08-28', 0, NULL, NULL, 92, 1, 2, 0, '2020-09-01 02:24:04'),
(93, 1, 7, '[IOS] 스마트후드 주간사용량 화면 이상', '진입후 흰색화면만 나옴\r\n\r\n아이패드 에어3', NULL, NULL, 5, 7, 2, NULL, 1, 3, '2020-08-30 22:25:06', '2020-09-02 10:57:08', '2020-08-31', 0, NULL, NULL, 93, 1, 2, 0, '2020-09-02 10:57:08'),
(94, 1, 7, '사용자 프로필에 User code 추가', 'SNS 항목위에 서버에서 주는 회원ID 추가 필요\r\n서버에서 주는값은 User code 입니다.\r\n\r\n회원ID 12308471032\r\nSNS   google\r\n이메일 정보 .....................\r\n\r\n!프로필_LI.jpg!', NULL, NULL, 5, 7, 2, NULL, 1, 5, '2020-08-30 23:30:08', '2020-08-31 10:53:05', '2020-08-31', 0, NULL, NULL, 94, 1, 2, 0, '2020-08-31 10:53:05'),
(95, 1, 7, '사용자 계정이 삭제될 경우(회원 탈퇴 등) 서버에 연결할수 없다는 팝업만 뜸', '사용자 계정이 삭제될 경우(회원 탈퇴 등) 앱을 실행하면, 서버에 연결할수 없다는 팝업만 뜹니다.\r\n\r\n멀티 디바이스 사용자로 예를 들면 \r\n안드로이드 / ISO를 동시에 사용하는 유저가 안드로이드를 통해 탈퇴하고, \r\nIOS로 앱을 실행하면, 서버에 연결할 수 없다는 팝업만 무한으로 생성 됩니다.\r\n로그인 화면으로 이동하도록 수정해야 될 것 같습니다\r\n\r\n\r\n ', NULL, NULL, 5, 7, 2, NULL, 5, 3, '2020-08-30 23:30:35', '2020-09-02 11:04:34', '2020-08-31', 0, NULL, NULL, 95, 1, 2, 0, '2020-09-02 11:04:34'),
(96, 1, 7, '집 추가가 되지 않음 (Android, 주소 입력시 빈 화면 출력됨)', '현재 버전 기준 (2020.08.31, 08:30)\r\nAndroid에서 집 추가 화면에서 주소찾기 버튼을 선택하면 빈 화면만 출력됩니다.\r\n(IOS는 정상 동작 가능)', NULL, NULL, 5, 7, 2, NULL, 5, 2, '2020-08-30 23:33:58', '2020-08-31 10:53:24', '2020-08-31', 0, NULL, NULL, 96, 1, 2, 0, '2020-08-31 10:53:24'),
(97, 1, 7, '네트워크 없을시 화면 전환이슈', '네트워크 없을때 아래 화면나오고 -> 재시도 -> 프로그래스 돌다가 사라짐 -> 재시도 버튼 비활성화유지되고 Back키 동작안함\r\n\r\n!네트웍무.jpg!\r\n', NULL, NULL, 5, 7, 2, NULL, 1, 5, '2020-08-30 23:38:01', '2020-09-02 10:56:50', '2020-08-31', 0, NULL, NULL, 97, 1, 2, 0, '2020-09-02 10:56:50'),
(98, 1, 7, '앱 실행 시, 오류로 인한 제품 표시 및 서버오류 메시지 출력', '* 증상\r\n- 간헐적으로 증상 발생\r\n- 앱 실행시 등록되어 있던 제품이 표시가 안됨. 이후, 재 실행하니 서버오류 팝업이 뜨고 정상동작 하지 않음\r\n몇 번, 반복해야 재 진입됨.\r\n- 동영상 파일 참조', NULL, NULL, 5, 1, 3, NULL, 8, 3, '2020-08-30 23:59:33', '2020-09-08 22:28:16', '2020-08-30', 0, NULL, NULL, 98, 1, 2, 0, '2020-09-08 22:28:16'),
(99, 1, 7, '[AOS][스마트후드] 상세페이지 전기레인지 연결해제 표시 오류', '* 재현경로\r\n- 스마트후드->전기레인지연동->전기레인지 삭제->스마트후드 상세페이지 진입\r\n\r\n* 증상\r\n- 스마트후드와 전기레인지가 연동된 상태에서 전기레인지를 삭제하면 \"연결해제\"라는 UI가 계속 남아있음\r\n- 첨부파일 참조', NULL, NULL, 5, 5, 2, NULL, 8, 4, '2020-08-31 00:06:17', '2020-09-01 03:55:46', '2020-08-31', 0, NULL, NULL, 99, 1, 2, 0, '2020-09-01 03:55:46'),
(100, 7, 7, '[공통][Splash화면] splash화면 텍스트 문구 추가 요청', '* 재현경로\r\n- 앱 실행시 splash(인트로) 화면 텍스트문구\r\n\r\n* 증상\r\n- \"공간과 공간을 연결하다\"\r\n- \"공간과 사람을 연결하다\" <- 이 문구 추가\r\n- \"사람과 사람을 연결하다\"\r\n\r\n*** 세 문구가 모두 표시된 후에 메인화면으로 이동 ***', NULL, NULL, 5, 7, 1, NULL, 8, 2, '2020-08-31 00:13:18', '2020-08-31 22:19:53', '2020-08-31', 0, NULL, NULL, 100, 1, 2, 0, '2020-08-31 22:19:53'),
(101, 1, 7, '스마트후드 주간사용량 \"지난 주 대비\" 연산 확인', '8/27 : 283분\r\n8/28 : 662분\r\n8/29 : 703분\r\n\r\n8/31 : 840분\r\n\r\n금주 \"지난 주 대비 57% 높음\" 으로 나옴\r\n\r\nziniottest 계정으로 확인 바람', NULL, NULL, 5, 7, 2, NULL, 1, 6, '2020-08-31 00:45:33', '2020-09-02 10:58:18', '2020-08-31', 0, NULL, NULL, 101, 1, 2, 0, '2020-09-02 10:58:18'),
(102, 7, 7, '[공통][스마트후드] 스마트후드-전기레인지 연동 화구수 텍스트 변경', '* 재현경로\r\n- 스마트후드-전기레인지 연동 -> 상세페이지 진입\r\n\r\n* 증상\r\n- 전기레인지 화구별 설정 텍스트 변경\r\n- 1구 ON -> 한 개 사용\r\n- \"화구 작동수에 따른 풍량조절\" -> \"화구 동작수에 따라서 풍량이 자동조절 됩니다\"', NULL, NULL, 5, 7, 1, NULL, 8, 2, '2020-08-31 01:31:53', '2020-08-31 22:20:36', '2020-08-31', 0, NULL, NULL, 102, 1, 2, 0, '2020-08-31 22:20:36'),
(103, 1, 7, '[공통][날씨정보] 메인화면 날씨 정보 표기 오류', '* 재현경로\r\n- 메인화면 진입\r\n\r\n* 증상\r\n- 날씨정보의 날씨이미지(맑음,비,구름 등)가 항상 비로만 표시 됨.', NULL, NULL, 5, 7, 2, NULL, 8, 11, '2020-08-31 02:57:33', '2020-09-02 10:55:25', '2020-08-31', 0, NULL, NULL, 103, 1, 2, 0, '2020-09-02 10:55:25'),
(104, 1, 7, '[AOS][집주소] 집주소 입력화면이 빈페이지로 나옴', '* 재현경로\r\n- 신규로그인 : 집주소입력->주소찾기클릭\r\n- 집추가 : 집주소입력->주소찾기클릭\r\n\r\n* 증상\r\n- 빈화면만 나옴', NULL, NULL, 5, 7, 4, NULL, 8, 2, '2020-08-31 05:14:55', '2020-08-31 10:52:41', '2020-08-31', 0, NULL, NULL, 104, 1, 2, 0, '2020-08-31 10:52:41'),
(105, 1, 7, '\"기타\" 공간에 제품등록 가능하게 처리', '현재 \"기타\" 공간에 제품등록시 block 처리 되어 있는데\r\n등록가능하게 해제 처리 필요', NULL, NULL, 5, 7, 1, NULL, 1, 3, '2020-08-31 10:11:49', '2020-09-01 09:25:45', '2020-08-31', 0, NULL, NULL, 105, 1, 2, 0, '2020-09-01 09:25:45'),
(106, 1, 7, '특정 API가 너무 많이 호출됨 (/api/v1/board/lastestSequence/notice)', '1. 하단 메뉴가 나타나고 숨겨질때 호출되는 것 같은데, 나타날때만 호출하도록 변경 필요\r\n2. 디바이스 상세 화면으로 들어가면 10회이상 연속으로 호출됨\r\n<pre><code class=\"text\">\r\n2020-09-01 00:59:59 info:   --> GET /api/v1/user/5f4b1753927aee00186e0b8b/place/5f4b1799332d5049b01bc47c?group=room&filter=000000000000000000000000 200 46ms 7.01kb\r\n2020-09-01 00:59:59 info:   <-- GET /api/v1/board/lastestSequence/notice\r\n2020-09-01 00:59:59 info: USER TOKEN eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjRiMTc1MzkyN2FlZTAwMTg2ZTBiOGIiLCJvYXV0aFNpdGUiOiJrYWthbyIsImxvZ2luQXQiOiIxNTk4ODczNjAzMzcxIiwibmlja25hbWUiOiLsp4DsmIHsirkyIiwic3RhdHVzIjoiYWN0aXZlIiwiaWF0IjoxNTk4ODczNjAzfQ.LHauF-oD1RwPl3gtFLki-_LYiRi80hxZKg4sbKVAsTA\r\n2020-09-01 00:59:59 info:   --> GET /api/v1/board/lastestSequence/notice 200 12ms 21b\r\n2020-09-01 00:59:59 info:   <-- GET /api/v1/board/lastestSequence/notice\r\n2020-09-01 00:59:59 info: USER TOKEN eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjRiMTc1MzkyN2FlZTAwMTg2ZTBiOGIiLCJvYXV0aFNpdGUiOiJrYWthbyIsImxvZ2luQXQiOiIxNTk4ODczNjAzMzcxIiwibmlja25hbWUiOiLsp4DsmIHsirkyIiwic3RhdHVzIjoiYWN0aXZlIiwiaWF0IjoxNTk4ODczNjAzfQ.LHauF-oD1RwPl3gtFLki-_LYiRi80hxZKg4sbKVAsTA\r\n2020-09-01 00:59:59 info:   --> GET /api/v1/board/lastestSequence/notice 200 10ms 21b\r\n2020-09-01 00:59:59 info:   <-- GET /api/v1/board/lastestSequence/notice\r\n2020-09-01 00:59:59 info: USER TOKEN eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjRiMTc1MzkyN2FlZTAwMTg2ZTBiOGIiLCJvYXV0aFNpdGUiOiJrYWthbyIsImxvZ2luQXQiOiIxNTk4ODczNjAzMzcxIiwibmlja25hbWUiOiLsp4DsmIHsirkyIiwic3RhdHVzIjoiYWN0aXZlIiwiaWF0IjoxNTk4ODczNjAzfQ.LHauF-oD1RwPl3gtFLki-_LYiRi80hxZKg4sbKVAsTA\r\n2020-09-01 00:59:59 info:   --> GET /api/v1/board/lastestSequence/notice 200 11ms 21b\r\n2020-09-01 00:59:59 info:   <-- GET /api/v1/board/lastestSequence/notice\r\n2020-09-01 00:59:59 info: USER TOKEN eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjRiMTc1MzkyN2FlZTAwMTg2ZTBiOGIiLCJvYXV0aFNpdGUiOiJrYWthbyIsImxvZ2luQXQiOiIxNTk4ODczNjAzMzcxIiwibmlja25hbWUiOiLsp4DsmIHsirkyIiwic3RhdHVzIjoiYWN0aXZlIiwiaWF0IjoxNTk4ODczNjAzfQ.LHauF-oD1RwPl3gtFLki-_LYiRi80hxZKg4sbKVAsTA\r\n2020-09-01 00:59:59 info:   --> GET /api/v1/board/lastestSequence/notice 200 11ms 21b\r\n2020-09-01 01:00:00 info:   <-- GET /api/v1/board/lastestSequence/notice\r\n2020-09-01 01:00:00 info: USER TOKEN eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjRiMTc1MzkyN2FlZTAwMTg2ZTBiOGIiLCJvYXV0aFNpdGUiOiJrYWthbyIsImxvZ2luQXQiOiIxNTk4ODczNjAzMzcxIiwibmlja25hbWUiOiLsp4DsmIHsirkyIiwic3RhdHVzIjoiYWN0aXZlIiwiaWF0IjoxNTk4ODczNjAzfQ.LHauF-oD1RwPl3gtFLki-_LYiRi80hxZKg4sbKVAsTA\r\n2020-09-01 01:00:00 info:   --> GET /api/v1/board/lastestSequence/notice 200 10ms 21b\r\n───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────2020-09-01 00:59:59 info:   <-- GET /api/v1/board/lastestSequence/notice\r\n2020-09-01 00:59:59 info: USER TOKEN eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjRiMTc1MzkyN2FlZTAwMTg2ZTBiOGIiLCJvYXV0aFNpdGUiOiJrYWthbyIsImxvZ2luQXQiOiIxNTk4ODczNjAzMzcxIiwibmlja25hbWUiOiLsp4DsmIHsirkyIiwic3RhdHVzIjoiYWN0aXZlIiwiaWF0IjoxNTk4ODczNjAzfQ.LHauF-oD1RwPl3gtFLki-_LYiRi80hxZKg4sbKVAsTA\r\n2020-09-01 00:59:59 info:   --> GET /api/v1/board/lastestSequence/notice 200 11ms 21b\r\n2020-09-01 00:59:59 info:   <-- GET /api/v1/board/lastestSequence/notice\r\n2020-09-01 00:59:59 info: USER TOKEN eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjRiMTc1MzkyN2FlZTAwMTg2ZTBiOGIiLCJvYXV0aFNpdGUiOiJrYWthbyIsImxvZ2luQXQiOiIxNTk4ODczNjAzMzcxIiwibmlja25hbWUiOiLsp4DsmIHsirkyIiwic3RhdHVzIjoiYWN0aXZlIiwiaWF0IjoxNTk4ODczNjAzfQ.LHauF-oD1RwPl3gtFLki-_LYiRi80hxZKg4sbKVAsTA\r\n2020-09-01 00:59:59 info:   --> GET /api/v1/board/lastestSequence/notice 200 9ms 21b\r\n2020-09-01 00:59:59 info:   <-- GET /api/v1/board/lastestSequence/notice\r\n2020-09-01 00:59:59 info: USER TOKEN eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjRiMTc1MzkyN2FlZTAwMTg2ZTBiOGIiLCJvYXV0aFNpdGUiOiJrYWthbyIsImxvZ2luQXQiOiIxNTk4ODczNjAzMzcxIiwibmlja25hbWUiOiLsp4DsmIHsirkyIiwic3RhdHVzIjoiYWN0aXZlIiwiaWF0IjoxNTk4ODczNjAzfQ.LHauF-oD1RwPl3gtFLki-_LYiRi80hxZKg4sbKVAsTA\r\n2020-09-01 00:59:59 info:   --> GET /api/v1/board/lastestSequence/notice 200 9ms 21b\r\n2020-09-01 00:59:59 info:   <-- GET /api/v1/board/lastestSequence/notice\r\n2020-09-01 00:59:59 info: USER TOKEN eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjRiMTc1MzkyN2FlZTAwMTg2ZTBiOGIiLCJvYXV0aFNpdGUiOiJrYWthbyIsImxvZ2luQXQiOiIxNTk4ODczNjAzMzcxIiwibmlja25hbWUiOiLsp4DsmIHsirkyIiwic3RhdHVzIjoiYWN0aXZlIiwiaWF0IjoxNTk4ODczNjAzfQ.LHauF-oD1RwPl3gtFLki-_LYiRi80hxZKg4sbKVAsTA\r\n2020-09-01 00:59:59 info:   --> GET /api/v1/board/lastestSequence/notice 200 10ms 21b\r\n2020-09-01 00:59:59 info:   <-- GET /api/v1/board/lastestSequence/notice\r\n2020-09-01 00:59:59 info: USER TOKEN eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjRiMTc1MzkyN2FlZTAwMTg2ZTBiOGIiLCJvYXV0aFNpdGUiOiJrYWthbyIsImxvZ2luQXQiOiIxNTk4ODczNjAzMzcxIiwibmlja25hbWUiOiLsp4DsmIHsirkyIiwic3RhdHVzIjoiYWN0aXZlIiwiaWF0IjoxNTk4ODczNjAzfQ.LHauF-oD1RwPl3gtFLki-_LYiRi80hxZKg4sbKVAsTA\r\n2020-09-01 00:59:59 info:   --> GET /api/v1/board/lastestSequence/notice 200 10ms 21b\r\n2020-09-01 01:00:00 info:   <-- GET /api/v1/board/lastestSequence/notice\r\n2020-09-01 01:00:00 info: USER TOKEN eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjRiMTc1MzkyN2FlZTAwMTg2ZTBiOGIiLCJvYXV0aFNpdGUiOiJrYWthbyIsImxvZ2luQXQiOiIxNTk4ODczNjAzMzcxIiwibmlja25hbWUiOiLsp4DsmIHsirkyIiwic3RhdHVzIjoiYWN0aXZlIiwiaWF0IjoxNTk4ODczNjAzfQ.LHauF-\r\n</code></pre>\r\n', NULL, NULL, 5, 7, 2, NULL, 5, 2, '2020-09-01 01:03:02', '2020-09-03 09:42:04', '2020-09-01', 0, NULL, NULL, 106, 1, 2, 0, '2020-09-03 09:42:04'),
(107, 1, 7, '[TC_AP001_001] 앱버전 관리', '전체메뉴 > 앱정보 및 이용정책\r\n\r\n버전관리 필요', NULL, NULL, 5, 7, 2, NULL, 1, 4, '2020-09-01 04:28:11', '2020-09-02 10:57:51', '2020-09-01', 0, NULL, NULL, 107, 1, 2, 0, '2020-09-02 10:57:51'),
(108, 1, 7, '집이름 변경시 대시보드에 반영안됨', '* 재현경로\r\n  전체메뉴 > 집관리 > 수정 > 집이름 변경 > 메인화면 \r\n* 현상\r\n  상단 집리스트에 이름 변경안됨\r\n  집이름 드롭다운에서 터치 한번하면 변경됨', NULL, NULL, 5, 7, 2, NULL, 1, 2, '2020-09-01 06:28:25', '2020-09-02 10:54:48', '2020-09-01', 0, NULL, NULL, 108, 1, 2, 0, '2020-09-02 10:54:48'),
(109, 1, 7, '등록된 디바이스가 없는 공간은 공간별리스트에 나오지 않음', '* 재현경로\r\n \"방방\" 공간에 스마트후드 등록 > 등록된 스마트후드 삭제 > \"방방\"에는 등록된 디바이스가 없음\r\n* 현상\r\n 메인화면 이동시 \"방방\"이 공간별 리스트에 나와야하는데 등록된 디바이스가 없어서 공간명이 안나옴\r\n \"기타\" 공간만 등록된 디바이스가 없을때 보이지 않아야함', NULL, NULL, 5, 7, 2, NULL, 1, 3, '2020-09-01 06:31:11', '2020-09-04 07:50:12', '2020-09-01', 0, NULL, NULL, 109, 1, 2, 0, '2020-09-04 07:50:12'),
(110, 1, 7, '카카오계정 로그아웃 이슈', '카카오계정에서 간헐적으로 로그아웃 안되는 현상 있음\r\n\r\n앱데이터 삭제후 정상 로그아웃 진행됨', NULL, NULL, 5, 7, 2, NULL, 1, 4, '2020-09-01 06:36:20', '2020-09-02 11:01:03', '2020-09-01', 0, NULL, NULL, 110, 1, 2, 0, '2020-09-02 11:01:03'),
(111, 5, 7, '제품등록 워딩 통일건', '메인화면\r\n - 하단 네비게이션 : 제품등록\r\n - 제품별 화면 : 제품추가\r\n\r\n통일이 필요함', NULL, NULL, 5, 8, 1, NULL, 1, 1, '2020-09-01 09:55:13', '2020-09-07 06:54:58', '2020-09-01', 0, NULL, NULL, 111, 1, 2, 0, '2020-09-07 06:54:58'),
(112, 1, 7, '네트워크 없을때 ', '서버 접속 불가일때\r\n\r\n로그인 실패 팝업 > 확인 > 구글계정 로그인 터치 > 앱 재로딩 > 로그인 실패 팝업 : 무한반복\r\n\r\n구글 로그인 터치시 로그인실패 팝업이 떠야 하고 팝업에서 앱을 빠져나가는 루틴이 필요함\r\n\r\n또한 전반적으로 네트워크없을때나 접속장애 일때 앱 화면전환에 대해 확인이 필요함\r\n\r\n!접속불가.jpg!', NULL, NULL, 1, 7, 2, NULL, 1, 3, '2020-09-03 21:51:54', '2020-10-05 22:21:43', '2020-09-04', 0, NULL, NULL, 112, 1, 2, 0, NULL),
(113, 7, 7, '[공통][스마트후드] 필터청소 텍스트 정리필요', '* 재현경로\r\n- 스마트후드 상세페이지 이동 -> 필터청소방법 선택\r\n\r\n* 증상\r\n- 텍스트가 붙어서 나옴\r\n\r\n* 첨부파일과 같이 해주세요.', NULL, NULL, 5, 7, 1, NULL, 8, 1, '2020-09-04 06:58:48', '2020-09-08 22:27:31', '2020-09-04', 0, NULL, NULL, 113, 1, 2, 0, '2020-09-08 22:27:31'),
(114, 1, 7, '[공통][기기이동] 기기이동 시 공간을 무조건 등록하게 되어있음', '* 재현경로\r\n: 기기정보 -> 기기이동 -> 기존공간 선택\r\n\r\n* 증상\r\n: 기존 공간을 선택할 수 있는 방법이 없음. 무조건 공간추가를 하지 않으면 넘어가질 않음\r\n\r\n* 해결\r\n: 기존공간도 선택해서 진행할 수 있도록 해야한다.', NULL, NULL, 5, 8, 2, NULL, 8, 3, '2020-09-07 00:11:51', '2020-09-08 00:25:48', '2020-09-06', 0, NULL, NULL, 114, 1, 2, 0, '2020-09-08 00:25:48'),
(115, 7, 7, '[공통][스마트후드] 상세페이지 용어(텍스트) 변경', '* 재현경로\r\n: 스마크후드 상세\r\n\r\n* 증상\r\n: Delay OFF 설정 용어 변경\r\n\r\n* 해결\r\n: Delay OFF 설정 -> 자동꺼짐 설정', NULL, NULL, 5, 7, 1, NULL, 8, 3, '2020-09-07 00:55:36', '2020-09-09 05:37:52', '2020-09-07', 0, NULL, NULL, 115, 1, 2, 0, '2020-09-09 05:37:52'),
(116, 2, 8, '알림설정 UI 수정건', '\r\n\r\n!picture457-1.png!', NULL, NULL, 5, 7, 2, NULL, 1, 3, '2020-09-08 02:30:23', '2020-10-20 07:12:50', '2020-09-08', 0, NULL, NULL, 116, 1, 2, 0, '2020-10-20 07:12:50'),
(117, 2, 8, '알림설정 UI 수정건', '\r\n해당 UI를 위한 API 추가건\r\n\r\n!picture457-1.png!', NULL, NULL, 5, 5, 2, NULL, 1, 3, '2020-09-10 04:45:02', '2020-10-07 06:48:27', '2020-09-08', 0, NULL, NULL, 117, 1, 2, 0, '2020-10-07 06:48:27'),
(118, 7, 7, '[관리자][UI] UI정렬 필요', '* 재현경로\r\n- 모든 페이지 UI 정렬 필요\r\n\r\n* 증상\r\n- UI를 전반적으로 다듬을 필요가 있음\r\n\r\n-> 첨부파일과 같이 전반적인 UI 개선 필요', NULL, NULL, 5, 6, 2, NULL, 8, 2, '2020-09-14 02:06:41', '2020-10-05 01:53:59', '2020-09-14', 0, NULL, NULL, 118, 1, 2, 0, '2020-10-05 01:53:59'),
(119, 1, 7, '[관리자][기능] 익스플로러에서 표시 안됨', '* 재현경로\r\n: 익스플로러에서 로그인\r\n\r\n* 증상\r\n: 첨부파일처럼 리스트가 나오지 않음', NULL, NULL, 5, 6, 3, NULL, 8, 2, '2020-09-14 02:08:41', '2020-10-05 01:54:31', '2020-09-14', 0, NULL, NULL, 119, 1, 2, 0, '2020-10-05 01:54:31'),
(120, 1, 7, '[관리자][기능] 로그인페이지 오류 발생', '* 재현경로\r\n1. 로그인 후 인터넷 끊기 -> 페이지를 이동하면 페이지 이동 오류(F5누르라는) 페이지가 나옴 -> 인터넷 연결후 F5를 눌러도 동작하지 않음\r\n2. 1번과 같이 오류 페이지가 나오고 인터넷이 연결된 상태에서 브라우저의 \"뒤로가기\" 버튼 클릭\r\n\r\n* 증상\r\n1. 오류페이지에서 정상적으로 인터넷이 연결되었음에도 F5눌렀을 경우 정상동작 하지 않음.\r\n2. 뒤로가기 버튼 클릭 시 웹 페이지가 정상적으로 나옴\r\n\r\n* 정상동작\r\n1. F5를 누르면 로그아웃 후 로그인 페이지로 이동\r\n2. 뒤로가기 클릭 시 로그아웃 후 로그인페이지로 이동', NULL, NULL, 2, 5, 3, NULL, 8, 2, '2020-09-14 02:14:20', '2020-10-19 01:25:10', '2020-09-14', 0, NULL, NULL, 120, 1, 2, 0, NULL),
(121, 7, 7, '[관리자][기능] UI 개선 사항(회원관리 페이지 이동)', '* 재현경로\r\n: 현재 페이지 순서가 \"회원관리\" \"디바이스관리\" \"공지관리\" \"약관관리\" \"서브관리자관리\" 로 되어 있음\r\n\r\n* 증상\r\n: 현재 페이지 순서가  \r\n\r\n* 정상동작\r\n: \"디바이스관리\" \"공지관리\" \"약관관리\" \"서브관리자관리\" \"회원관리\"로 이동 필요', NULL, NULL, 5, 6, 2, NULL, 8, 2, '2020-09-14 02:25:29', '2020-10-05 01:54:15', '2020-09-14', 0, NULL, NULL, 121, 1, 2, 0, '2020-10-05 01:54:15'),
(122, 7, 8, 'LED 핸들 그래프 색구분', 'LED핸들 개폐이력 그래프에 개폐그래프와 상하단 구분선이 색이 같아서 구분이 안됨', NULL, NULL, 5, 7, 1, NULL, 1, 4, '2020-09-18 02:03:47', '2020-10-20 07:14:09', '2020-09-18', 0, NULL, NULL, 122, 1, 2, 0, '2020-10-20 07:14:09'),
(123, 1, 8, '일별,주별 이동 제한 필요', '주간사용량 \r\n\r\n일별 / 주별 그래프 이동은 총 4주제한\r\n후드와 동일하게 처리 필요', NULL, NULL, 5, 7, 1, NULL, 1, 2, '2020-09-18 02:05:01', '2020-10-07 06:44:26', '2020-09-18', 0, NULL, NULL, 123, 1, 2, 0, '2020-10-07 06:44:26'),
(124, 2, 8, '이메일 등록/수정 건', '이메일 등록/수정 기능 추가건\r\n\r\n수정된 기획서 참고하세요', NULL, NULL, 5, 7, 2, NULL, 1, 2, '2020-09-29 04:29:11', '2020-10-20 07:12:32', '2020-09-29', 0, NULL, NULL, 124, 1, 2, 0, '2020-10-20 07:12:32'),
(125, 1, 7, '[홈쉐어링] Slave가 공유받은집 삭제시 오류', '* 삭제시 토스트 팝업 발생\r\n  --> 집은 삭제 되어 있음\r\n* 토스트 발생후 화면전환 없어서 다시 삭제시 403에러 발생\r\n ', NULL, NULL, 5, 5, 2, NULL, 1, 1, '2020-10-05 01:56:03', '2020-10-07 06:49:13', '2020-10-05', 0, NULL, NULL, 125, 1, 2, 0, '2020-10-07 06:49:13'),
(126, 1, 7, '[환기창] 모드변경시 수정사항', '스페셜모드1, 스페셜모드2, 풍량모드 3개의 모드가 있으며 택1로 설정할수 있음\r\n스페셜모드1의 환기모드는 삭제됨\r\n\r\n* 모드 변경시 대시보드 처리할 사항\r\n  - 스페셜모드1, 스페셜모드2, 풍량모드 각각 선택시 해당 모드 아이콘으로 대시보드 표시\r\n  - 스페셜모드1,2 선택시 모드명 표시\r\n  - 풍량모드 선택시 풍량만 표시\r\n\r\n* 모드 변경시 상세페이지 처리할 사항\r\n  - \"풍량모드\" 표시\r\n  - 풍량바 앞에 라디오 버튼\r\n  - 스페셜모드1,2 중에 선택되어 있을때 풍량모드 라디오 버튼은 선택해제 되며 풍량바는 Disable 처리\r\n  - 풍량모드 선택시 스페셜모드1,2 에 선택된것 있으면 사라지게 처리\r\n\r\n기획서 다시 업데이트 해서 공유하겠습니다.\r\n  ', NULL, NULL, 5, 7, 2, NULL, 1, 2, '2020-10-06 05:44:38', '2020-10-19 01:13:44', '2020-10-06', 0, NULL, NULL, 126, 1, 2, 0, '2020-10-19 01:13:44'),
(127, 7, 7, '[ 환경설정 ][ 홈쉐어링 ] 안내 문구 필요', '현재 홈쉐어링 코드 전송 -> 홈쉐어링 수락 시 안내문구에 대해 추가가 필요한 것 같습니다.\r\n\r\n1. 홈웨어링 실패시 ( 안내문구 있음 )\r\n -> 유효하지 않은 코드를 입력했을때, 코드 불일치 안내를 팝업으로 줘서 사용자가 그 다음 동작을 수행할 수 있음\r\n\r\n2. 홈쉐어링 성공시 ( 안내문구 없음 )\r\n -> 성공 후에 따로 인폼이 없이 바로 창이 나가지다보니, 우리는 홈쉐어링이란 것이 어떤 컨셉인지 알고 있어 집 주소를 확인하거나 이름으로써\r\n    성공 여부에 대한 상황을 알 수 있으나, 일반적으로는 내가 홈쉐어링이 완료되었는지 피드백을 알 수 없을 것으로 예상됨.\r\n    홈쉐어링 성공했습니다. 메인 화면 상단의 주소 혹은 집명을 변경하면 원하는 곳의 정보를 선택하여 볼 수 있습니다. 정도의 인폼 필요\r\n\r\n3. 중복된 집 수락시 (안내문구 없음 )\r\n -> 사용자가 APP에 미숙해 이미 홈쉐어링을 받았음에도 불구하고 찾지 못해 다시 홈쉐어링 시도를 할 가능성이 충분히 있는데,\r\n    현재 같은 집을 다시 쉐어링을 받아보면 아무 인포메이션도 없이 해당화면에 머물러 있음.\r\n    이미 홈쉐어링이 완료된 집이라고 인폼을 주어야 함. ( 혹시 가능하다면 메인의 상단 주소/집명을 확인하라고까지도 인폼주면 좋겠습니다. )', '2020-10-23', NULL, 5, 7, 3, NULL, 9, 5, '2020-10-21 04:18:29', '2020-10-23 05:40:05', '2020-10-21', 0, NULL, NULL, 127, 1, 2, 0, '2020-10-23 05:40:05'),
(128, 5, 7, '[ 디바이스 상세 ] [ 환기 시스템 ] 공기질 알림 기준 재확인 요청', '환기창 공기질 수치대비 좋음,보통,나쁨,매우나쁨에 대한 기준이 잘못 전달 된 것 같습니다.\r\n\r\n첨부이미지에 각 수치별 기준이 있사오니 확인해주셔서 수정 해주시면 감사드리겠습니다.', NULL, NULL, 5, 7, 4, NULL, 9, 5, '2020-10-21 04:23:36', '2020-10-23 05:39:50', '2020-10-21', 0, NULL, NULL, 128, 1, 2, 0, '2020-10-23 05:39:50'),
(129, 7, 7, '펌웨어 업데이트 뱃지 처리', '!펌업.jpg!\r\n\r\n펌웨어 신규 업데이트가 있을시 제품정보 상세화면의 기기정보 진입 링크에 \"N\" 처리 검토 바랍니다.', NULL, NULL, 5, 7, 2, NULL, 1, 1, '2020-10-21 05:59:22', '2020-10-23 05:39:33', '2020-10-21', 0, NULL, NULL, 129, 1, 2, 0, '2020-10-23 05:39:33');

-- --------------------------------------------------------

--
-- 테이블 구조 `issue_categories`
--

CREATE TABLE `issue_categories` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `assigned_to_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `issue_categories`
--

INSERT INTO `issue_categories` (`id`, `project_id`, `name`, `assigned_to_id`) VALUES
(1, 1, '모바일', 7),
(2, 1, '인터페이스', 5),
(3, 1, 'Admin', 6),
(4, 1, '설계', NULL),
(8, 7, '1차 Open', NULL),
(9, 7, '2차 Open', NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `issue_relations`
--

CREATE TABLE `issue_relations` (
  `id` int(11) NOT NULL,
  `issue_from_id` int(11) NOT NULL,
  `issue_to_id` int(11) NOT NULL,
  `relation_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delay` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `issue_relations`
--

INSERT INTO `issue_relations` (`id`, `issue_from_id`, `issue_to_id`, `relation_type`, `delay`) VALUES
(1, 11, 12, 'copied_to', NULL),
(2, 70, 98, 'relates', NULL),
(3, 96, 104, 'relates', NULL),
(5, 116, 117, 'copied_to', NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `issue_statuses`
--

CREATE TABLE `issue_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `position` int(11) DEFAULT NULL,
  `default_done_ratio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `issue_statuses`
--

INSERT INTO `issue_statuses` (`id`, `name`, `is_closed`, `position`, `default_done_ratio`) VALUES
(1, 'Open', 0, 1, NULL),
(2, 'In Progress', 0, 2, NULL),
(3, 'Resolved', 0, 3, NULL),
(4, 'Demand', 0, 4, NULL),
(5, 'Closed', 1, 6, NULL),
(6, 'Reject', 1, 7, NULL),
(7, 'Reopen', 0, 5, NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `journals`
--

CREATE TABLE `journals` (
  `id` int(11) NOT NULL,
  `journalized_id` int(11) NOT NULL DEFAULT 0,
  `journalized_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `private_notes` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `journals`
--

INSERT INTO `journals` (`id`, `journalized_id`, `journalized_type`, `user_id`, `notes`, `created_on`, `private_notes`) VALUES
(1, 1, 'Issue', 1, '', '2020-06-08 08:07:23', 0),
(2, 2, 'Issue', 5, '', '2020-06-08 22:11:17', 0),
(3, 3, 'Issue', 1, '', '2020-06-09 00:37:21', 0),
(4, 3, 'Issue', 1, '', '2020-06-09 00:40:18', 0),
(5, 3, 'Issue', 1, 'p.29 : 동작제어 > 전원 삭제\r\n\r\nFAQ 분류 Admin에서 등록시 반영 필요\r\n\r\n!FAQ.PNG!', '2020-06-09 01:45:16', 0),
(6, 3, 'Issue', 1, '손책임님 검토 부탁드립니다.', '2020-06-09 01:47:54', 0),
(7, 3, 'Issue', 1, '', '2020-06-09 04:46:16', 0),
(8, 1, 'Issue', 6, '', '2020-06-09 05:54:21', 0),
(9, 1, 'Issue', 6, '이 주흥의 덧글:\r\n> Admin web이 외부망으로 오픈되면서 로그인시 보안강화를 위해 MFA적용이 필요함\r\n> MFA 적용을 위해 OTP를 적용을 해야하는데 하우시스에서 API를 제공한다고 함\r\n> OTP연동가이드를 전달해주면 개발공수 검토가 필요함\r\n\r\nUX 시나리오 확인 필요\r\n예) Admin 로그인 후 OPT로 인증', '2020-06-09 06:11:01', 0),
(10, 2, 'Issue', 1, '', '2020-06-09 06:23:17', 0),
(11, 2, 'Issue', 1, '', '2020-06-09 06:23:32', 0),
(12, 4, 'Issue', 6, '공지 개발시 반영 예정', '2020-06-10 03:15:34', 0),
(13, 3, 'Issue', 1, '', '2020-06-10 03:15:42', 0),
(14, 8, 'Issue', 1, '', '2020-06-12 09:12:19', 0),
(15, 11, 'Issue', 1, '', '2020-06-16 23:14:26', 0),
(16, 12, 'Issue', 1, '', '2020-06-16 23:14:33', 0),
(17, 2, 'Issue', 5, '테스트 가능한 환경 구성하였습니다.\r\n서상훈 선임과 테스트 후에 작업 완료로 변경하겠습니다.', '2020-06-16 23:34:31', 0),
(18, 11, 'Issue', 5, '8월에 적용해도 문제 없을 것 같습니다.\r\n1, 진행 사항\r\n- MongoDb Collections에서 MariaDb로 데이터 객체 변환 모듈은 개발 완료\r\n- MariaDb Table 생성 완료 (개발 서버)\r\n\r\n2. 잔여\r\n- 기존 개발 사용자 데이터 이관\r\n- MariaDb CRUD 개발 / 적용', '2020-06-16 23:39:11', 0),
(19, 12, 'Issue', 6, '이 주흥의 덧글:\r\n> 고객정보 기존 CosmosDB 에서 MariaDB로 변경\r\n> \r\n> - Admin 고객정보 메뉴 기개발부분 변경\r\n> \r\n> 해당 변경건에 대해 영향도 평가 해주시고\r\n> 개발 적용은 가능하면 8월에 해도 문제 없는지 검토해주세요\r\n> \r\n> 가능한 일정 검토후 기간 수정 하시면 됩니다.\r\n\r\n클라우드 개발 환경의 MariaDB에 Users 테이블 생성하였습니다. \r\n통계가 진행되기 전에 진행해야 중복 작업이 없을 거 같습니다.\r\n공지,약관 개발(7월) 이후에 변경하겠습니다.', '2020-06-16 23:51:36', 0),
(20, 1, 'Issue', 6, '이 주흥의 덧글:\r\n> Admin web이 외부망으로 오픈되면서 로그인시 보안강화를 위해 MFA적용이 필요함\r\n> MFA 적용을 위해 OTP를 적용을 해야하는데 하우시스에서 API를 제공한다고 함\r\n> OTP연동가이드를 전달해주면 개발공수 검토가 필요함\r\n\r\n1. UX 시나리오 입수 완료 \r\n \'ID/PW 인증\' -> \'OTP인증\' -> \'시스템 접속\' \r\n2. Azure 환경(관리자)에서 OTP 서버(내부망) 접근 요청 (to 김진우 책임) ', '2020-06-16 23:54:25', 0),
(21, 8, 'Issue', 1, '1차 버전 완료\r\n\r\n현행화 작업 계속 예정', '2020-06-17 06:09:06', 0),
(22, 19, 'Issue', 5, '모바일 화면을 출력할 때, 화면 조회 / 정렬 방법에 따른 param 지원 필요', '2020-06-18 23:56:19', 0),
(23, 37, 'Issue', 5, '상태 전송 요청중인 경우 모바일에서 heartbeat api를 요청해야함', '2020-06-19 00:03:23', 0),
(24, 34, 'Issue', 5, '', '2020-06-19 00:05:54', 0),
(25, 39, 'Issue', 1, '', '2020-06-24 01:07:55', 0),
(27, 44, 'Issue', 1, '', '2020-07-07 06:49:09', 0),
(28, 43, 'Issue', 1, '', '2020-07-07 06:49:42', 0),
(29, 43, 'Issue', 1, '', '2020-07-07 06:50:19', 0),
(30, 43, 'Issue', 1, '', '2020-07-07 06:50:31', 0),
(31, 46, 'Issue', 1, '', '2020-07-07 06:52:17', 0),
(32, 46, 'Issue', 1, '', '2020-07-07 06:52:43', 0),
(33, 46, 'Issue', 1, '', '2020-07-07 06:54:01', 0),
(34, 44, 'Issue', 1, 'ID, User Code 각각 어떤 의미인지?\r\n\r\nID는 내부적으로 사용하는 코드이고 User code가 앱에서 생성하는 코드 같은데\r\n회원관리에서는 User Code 로 검색하고 디바이스 검색에서는 ID로 검색하고 있음\r\n어떤게 맞는건지?', '2020-07-07 07:08:02', 0),
(35, 50, 'Issue', 1, '', '2020-07-08 04:58:04', 0),
(36, 9, 'Issue', 1, '', '2020-07-13 00:47:39', 0),
(37, 4, 'Issue', 6, '적용 완료하였습니다. ', '2020-07-30 22:07:11', 0),
(38, 50, 'Issue', 6, '수정하였습니다. ', '2020-07-30 22:08:21', 0),
(39, 49, 'Issue', 6, '수정하였습니다. ', '2020-07-30 22:09:04', 0),
(40, 48, 'Issue', 6, '수정하였습니다. ', '2020-07-30 22:09:49', 0),
(41, 44, 'Issue', 6, '수정하였습니다. ', '2020-07-30 22:10:34', 0),
(42, 47, 'Issue', 6, '수정하였습니다. ', '2020-07-30 22:11:36', 0),
(43, 46, 'Issue', 6, '수정하였습니다. ', '2020-07-30 22:13:03', 0),
(44, 43, 'Issue', 6, '수정하였습니다. ', '2020-07-30 22:14:11', 0),
(45, 49, 'Issue', 6, '', '2020-07-30 22:15:31', 0),
(46, 42, 'Issue', 6, '작성 진행 중이며, 통합테스트 케이스와 함게 8월 2주차까지 완료 예정입니다. ', '2020-07-30 22:17:12', 0),
(47, 58, 'Issue', 1, '', '2020-08-21 03:29:08', 0),
(48, 52, 'Issue', 1, '', '2020-08-21 03:30:21', 0),
(49, 53, 'Issue', 1, '', '2020-08-21 03:30:57', 0),
(50, 54, 'Issue', 1, '', '2020-08-21 03:31:43', 0),
(51, 55, 'Issue', 1, '', '2020-08-21 03:32:13', 0),
(52, 56, 'Issue', 1, '', '2020-08-21 03:32:44', 0),
(53, 54, 'Issue', 1, '이력 리스트 정렬이슈로 수정완료', '2020-08-21 10:14:08', 0),
(54, 51, 'Issue', 1, '수정완료', '2020-08-21 10:14:43', 0),
(55, 52, 'Issue', 1, '서버값 반영되게 수정완료', '2020-08-21 10:15:26', 0),
(56, 53, 'Issue', 1, '서버값 반영되게 수정완료', '2020-08-21 10:16:01', 0),
(57, 65, 'Issue', 1, '', '2020-08-24 01:09:51', 0),
(58, 66, 'Issue', 7, '이 주흥의 덧글:\r\n> 앱이 포그라운드 일때는 푸쉬가 notification 되면 안됨\r\n\r\n서버에서 push 요청하실때 data에 있는 notification_foreground 를 false로 설정하여 전송 부탁 드립니다.\r\n\"data\": {\r\n            \"notification_foreground\": \"true\",\r\n            \"notification_body\" : \"Notification body\",\r\n            \"notification_title\": \"Notification title\",\r\n            \"notification_android_channel_id\": \"my_channel\",\r\n            \"notification_android_priority\": \"2\",\r\n            \"notification_android_visibility\": \"1\",\r\n            \"notification_ios_badge\": \"1\"\r\n        }\r\n', '2020-08-24 02:21:50', 0),
(59, 62, 'Issue', 5, '', '2020-08-24 02:44:18', 0),
(60, 62, 'Issue', 1, '확인함', '2020-08-24 02:45:25', 0),
(61, 11, 'Issue', 5, '1차 개발은 완료 -> 테스트 및 성능 모니터링 중입니다.', '2020-08-24 04:08:50', 0),
(62, 2, 'Issue', 5, '', '2020-08-24 04:09:11', 0),
(63, 61, 'Issue', 5, '개발 완료 되었습니다.\r\n고객이 유료 날씨 서비스를 구독 검토 중입니다.\r\n날씨 API가 변경되면 재 작업이 필요합니다.', '2020-08-24 04:09:58', 0),
(64, 58, 'Issue', 1, '메인화면 진입시(리프레쉬)중 날씨 API 호출시 날씨서버 응답시간 지연에 따른 간헐적 이슈로 분석됨\r\n\r\n날씨제공업체 변경후 재테스트 필요', '2020-08-24 06:31:54', 0),
(65, 58, 'Issue', 1, '', '2020-08-24 06:32:16', 0),
(66, 67, 'Issue', 1, '', '2020-08-24 07:55:11', 0),
(67, 68, 'Issue', 1, '', '2020-08-24 07:55:26', 0),
(68, 69, 'Issue', 1, '', '2020-08-24 08:00:45', 0),
(69, 72, 'Issue', 8, '', '2020-08-24 08:21:02', 0),
(70, 72, 'Issue', 8, '', '2020-08-24 08:21:26', 0),
(71, 56, 'Issue', 1, '확인함', '2020-08-24 09:11:31', 0),
(72, 69, 'Issue', 1, '', '2020-08-24 09:13:00', 0),
(73, 59, 'Issue', 1, '', '2020-08-24 09:13:23', 0),
(74, 58, 'Issue', 1, '', '2020-08-24 09:13:49', 0),
(75, 57, 'Issue', 1, '', '2020-08-24 09:14:25', 0),
(76, 73, 'Issue', 1, '', '2020-08-24 09:33:45', 0),
(77, 73, 'Issue', 1, '', '2020-08-24 09:50:26', 0),
(78, 66, 'Issue', 5, '해당 내용 적용하였습니다.\r\n확인 부탁드립니다.', '2020-08-25 02:05:19', 0),
(79, 59, 'Issue', 7, '', '2020-08-25 03:28:49', 0),
(80, 70, 'Issue', 5, '', '2020-08-25 03:29:05', 0),
(81, 60, 'Issue', 7, '', '2020-08-25 03:30:22', 0),
(82, 65, 'Issue', 7, '전원값과 상관없이 on/off 가능하도록 변경.\r\n제어알림 동작 관련하여 서버쪽 확인중.', '2020-08-25 03:32:27', 0),
(83, 58, 'Issue', 5, '1. 날씨 API를 Function 쪽에서 처리했는데, 간헐적으로 느림 현상이 발생해서 Mobile API 쪽 서버로 전환하였습니다.\r\n2. 이후에도 외부 날씨 API 서버가 비상식적으로 지연이 발생하는 경우가 있습니다. (오전 9시에 특히 빈번하게 발생함)\r\n<pre>\r\n[평소]\r\n$ time curl \"apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?ServiceKey=RW6mJYhYyOisycRzgeys2tfdJd%2BiWrrO616yLjCPWLo2sMTEOtqlr%2FCRwoLSYAttfqAlROPmydOAmolMO%2BL17w%3D%3D&base_date=20200824&base_time=0200&nx=68&ny=100&pageNo=1&dataType=json\"\r\nreal    0m0.151s\r\n\r\n[0824 - 오전 09:00:00]\r\n$ time curl \"apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?ServiceKey=RW6mJYhYyOisycRzgeys2tfdJd%2BiWrrO616yLjCPWLo2sMTEOtqlr%2FCRwoLSYAttfqAlROPmydOAmolMO%2BL17w%3D%3D&base_date=20200824&base_time=0200&nx=68&ny=100&pageNo=1&dataType=json\"\r\nreal    0m40.008s\r\n\r\n$ time curl \"apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?ServiceKey=RW6mJYhYyOisycRzgeys2tfdJd%2BiWrrO616yLjCPWLo2sMTEOtqlr%2FCRwoLSYAttfqAlROPmydOAmolMO%2BL17w%3D%3D&base_date=20200824&base_time=0200&nx=68&ny=100&pageNo=1&dataType=json\"\r\nreal    0m59.397s\r\n\r\n$ time curl \"apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?ServiceKey=RW6mJYhYyOisycRzgeys2tfdJd%2BiWrrO616yLjCPWLo2sMTEOtqlr%2FCRwoLSYAttfqAlROPmydOAmolMO%2BL17w%3D%3D&base_date=20200824&base_time=0200&nx=68&ny=100&pageNo=1&dataType=json\"\r\nreal    1m21.639s\r\n</pre>', '2020-08-25 03:32:40', 0),
(84, 66, 'Issue', 7, '도준 선임이 메일로 요청한 대로 \"notification_foreground\" 항목을 삭제 부탁 드립니다.', '2020-08-25 03:33:36', 0),
(85, 67, 'Issue', 7, '퍼블리셔 대응중', '2020-08-25 03:34:00', 0),
(86, 68, 'Issue', 7, '퍼블리셔 대응중', '2020-08-25 03:34:30', 0),
(87, 60, 'Issue', 7, '#67 #68 건과 중복되어 완료 처리 부탁 드립니다.', '2020-08-25 03:35:58', 0),
(88, 71, 'Issue', 7, '디자인 확인 결과.\r\n기기 상세화면의 구분선과 메인화면의 구분선이 동일해야했음.\r\n중간에 디자인이 변경되었던 것으로 보임. \r\n--> 퍼블리셔 대응중', '2020-08-25 03:51:45', 0),
(89, 69, 'Issue', 7, '', '2020-08-25 03:53:14', 0),
(90, 60, 'Issue', 1, '중복건으로 완료처리', '2020-08-25 04:10:41', 0),
(91, 74, 'Issue', 1, '', '2020-08-25 04:46:19', 0),
(92, 74, 'Issue', 5, 'API 추가하였습니다. 박상희 차장님이 개발 중입니다.', '2020-08-25 06:08:02', 0),
(93, 66, 'Issue', 5, '수정 완료하여 민도준 선임에게 공유 하였습니다.', '2020-08-25 06:09:16', 0),
(94, 58, 'Issue', 5, '날씨 API 변경 후 개선될 사항으로 \'해결\'로 상태 변경하겠습니다.', '2020-08-25 06:10:36', 0),
(95, 11, 'Issue', 5, '', '2020-08-25 06:13:05', 0),
(96, 66, 'Issue', 1, '', '2020-08-25 06:21:27', 0),
(97, 67, 'Issue', 7, '', '2020-08-25 06:32:34', 0),
(98, 68, 'Issue', 7, '', '2020-08-25 06:32:54', 0),
(99, 67, 'Issue', 1, '확인함', '2020-08-25 06:38:53', 0),
(100, 65, 'Issue', 1, '', '2020-08-25 06:42:45', 0),
(101, 59, 'Issue', 1, '미반영 상태로 확인됨', '2020-08-25 06:50:12', 0),
(102, 65, 'Issue', 1, '서버 확인필요', '2020-08-25 06:53:33', 0),
(103, 65, 'Issue', 5, '손정환 책임님과 모니터링 하고 있습니다.', '2020-08-25 08:50:05', 0),
(104, 76, 'Issue', 1, '디바이스 푸쉬에 따른 처리가 안되는 이슈로 \r\n디바이스,UI,서버가 같이 논의해야할 이슈 입니다.', '2020-08-25 10:31:15', 0),
(105, 64, 'Issue', 1, '확인함', '2020-08-25 10:33:37', 0),
(106, 57, 'Issue', 1, '#70 이슈와 중복으로 삭제함', '2020-08-25 10:35:00', 0),
(107, 66, 'Issue', 1, '확인함', '2020-08-25 10:35:32', 0),
(108, 58, 'Issue', 1, '날씨제공업체 변경후 재개발이 필요한 사항으로\r\n이슈에서 제외 하겠습니다.', '2020-08-25 22:40:02', 0),
(109, 61, 'Issue', 1, '날씨제공업체 변경 예정으로\r\n이슈에서 제외하겠습니다.', '2020-08-25 22:40:36', 0),
(110, 55, 'Issue', 1, '모바일 쿼리 파라미터 확인 바랍니다.', '2020-08-26 00:48:15', 0),
(111, 74, 'Issue', 7, '', '2020-08-26 00:52:37', 0),
(112, 59, 'Issue', 7, '', '2020-08-26 00:53:15', 0),
(113, 69, 'Issue', 7, '', '2020-08-26 00:53:32', 0),
(114, 72, 'Issue', 7, '', '2020-08-26 00:53:53', 0),
(115, 75, 'Issue', 7, '', '2020-08-26 00:54:10', 0),
(116, 78, 'Issue', 1, '(예제)\r\n!picture897-1.png!', '2020-08-26 01:46:41', 0),
(117, 78, 'Issue', 1, '적용 문구\r\n\r\nh1. *제품등록을 위한 Wi-Fi 검색시 위치정보 권한이 필요합니다.*', '2020-08-26 01:50:32', 0),
(118, 78, 'Issue', 1, '', '2020-08-26 01:50:48', 0),
(119, 80, 'Issue', 8, '1. \"필터 교체 방법\" -> \"필터 청소 방법\" 으로 변경\r\n\r\n2. 제품의 필터망 세척 알림 버튼을 길게 누르면 청소 주기가 초기화 됩니다. <- 문구 추가', '2020-08-26 04:51:00', 0),
(120, 81, 'Issue', 8, '* 추가사항으로 필터 옆에 있는 \"양호\" 이미지도 센터정렬이 아닌 하단정렬로 되어 있는것으로 보여짐', '2020-08-26 04:58:48', 0),
(121, 82, 'Issue', 8, '', '2020-08-26 05:03:21', 0),
(122, 81, 'Issue', 8, '* \"메인화면 정렬\" 이미지 파일을 보면 메인대시화면에서 \"+공간추가\" 정렬이 하단으로 되어 있습니다.\r\n\r\n전반적으로 정렬부분은 전부 검토 바랍니다.', '2020-08-26 05:07:26', 0),
(123, 81, 'Issue', 1, '', '2020-08-26 05:08:58', 0),
(124, 74, 'Issue', 1, '', '2020-08-26 09:19:25', 0),
(125, 74, 'Issue', 1, '해제시 기존등록된 레인지 삭제 안됨', '2020-08-26 09:19:41', 0),
(126, 55, 'Issue', 7, '', '2020-08-26 09:46:59', 0),
(127, 75, 'Issue', 1, '완료 확인', '2020-08-26 09:48:24', 0),
(128, 69, 'Issue', 1, '사용시간(X)\r\n필터사용시간(O)', '2020-08-26 09:49:15', 0),
(129, 55, 'Issue', 1, '', '2020-08-26 09:53:58', 0),
(130, 59, 'Issue', 1, '', '2020-08-26 09:56:28', 0),
(131, 74, 'Issue', 1, '제품 삭제 확인함', '2020-08-26 10:19:16', 0),
(132, 72, 'Issue', 1, '', '2020-08-26 10:21:33', 0),
(133, 74, 'Issue', 1, '!띵큐해제.PNG!\r\n\r\n해제 터치시 경고팝업 없음\r\n기획서 p.46', '2020-08-26 22:43:21', 0),
(134, 75, 'Issue', 1, '!picture426-1.png!\r\n\r\n\r\n등록완료 제품 터치시 상기 팝업 표출하고\r\n등록 처리 필요함\r\n기획서에는 없으나 필요에 의해 요청드림(기획서는 업데이트함)', '2020-08-26 22:51:46', 0),
(137, 85, 'Issue', 1, '', '2020-08-27 00:19:14', 0),
(138, 75, 'Issue', 1, '팝업 띄우지 않기로 고객과 협의 했습니다.', '2020-08-27 01:29:14', 0),
(139, 84, 'Issue', 1, '주간사용량은 시간이 아니고 분 으로 UI 수정 필요', '2020-08-27 01:51:02', 0),
(140, 87, 'Issue', 1, '', '2020-08-27 02:10:35', 0),
(141, 70, 'Issue', 1, '서버 502 bad gateway 오류로 확인필요', '2020-08-27 02:24:06', 0),
(142, 87, 'Issue', 1, '', '2020-08-27 02:38:05', 0),
(143, 71, 'Issue', 1, '', '2020-08-27 02:40:35', 0),
(144, 74, 'Issue', 1, '', '2020-08-27 02:41:39', 0),
(145, 86, 'Issue', 1, '김 진우 wrote:\r\n> 기본 이름이 스마트후드인 제품의 이름을 \"벽걸이후드\"로 변경\r\n> \r\n> 메인화면 -> 기기상세페이지 이동 : 상세페이지 최상단 제품의 이름이 스마트후드로 표시되다가 벽걸이후드로 변경 됨\r\n> \r\n> * 다른 화면에서 상세페이지로 넘어가면 해당 증상이 무조건 발생\r\n> * 동영상 파일 첨부\r\n\r\n레인지 이름 수정시 상세페이지에서 수정된명으로 바뀌지 않음', '2020-08-27 03:19:11', 0),
(146, 88, 'Issue', 1, '', '2020-08-27 04:18:00', 0),
(147, 88, 'Issue', 1, '', '2020-08-27 04:18:31', 0),
(148, 88, 'Issue', 1, '', '2020-08-27 04:18:50', 0),
(149, 88, 'Issue', 1, '', '2020-08-27 04:18:57', 0),
(150, 84, 'Issue', 7, '', '2020-08-27 07:00:33', 0),
(151, 85, 'Issue', 7, '', '2020-08-27 07:06:43', 0),
(152, 88, 'Issue', 7, '', '2020-08-27 07:18:28', 0),
(153, 77, 'Issue', 7, '', '2020-08-27 07:19:07', 0),
(154, 86, 'Issue', 7, '', '2020-08-27 08:30:07', 0),
(155, 80, 'Issue', 7, '', '2020-08-27 08:30:33', 0),
(156, 82, 'Issue', 7, '', '2020-08-27 08:31:46', 0),
(157, 69, 'Issue', 7, '', '2020-08-27 08:32:31', 0),
(158, 69, 'Issue', 1, '확인함', '2020-08-27 08:54:36', 0),
(159, 77, 'Issue', 1, '확인함', '2020-08-27 08:55:34', 0),
(160, 80, 'Issue', 1, '확인함', '2020-08-27 08:56:40', 0),
(161, 82, 'Issue', 1, '확인함', '2020-08-27 08:57:10', 0),
(162, 84, 'Issue', 1, '하단에 \"시간/요일\" 분으로 변경 필요', '2020-08-27 08:58:42', 0),
(163, 84, 'Issue', 1, '', '2020-08-27 08:58:58', 0),
(164, 85, 'Issue', 1, '확인함', '2020-08-27 08:59:36', 0),
(165, 86, 'Issue', 1, '전기레인지는 상세화면 상단에 제품명 나오지 않음', '2020-08-27 09:01:54', 0),
(166, 88, 'Issue', 1, '확인함', '2020-08-27 09:02:54', 0),
(167, 87, 'Issue', 7, '변경범위가 많이 큽니다. \r\n요구사항 변경 건은 현재까지 충분히 수용한 거 같은데\r\n계속 나와서 우려가 되네요.', '2020-08-27 09:14:24', 0),
(168, 74, 'Issue', 1, '확인함', '2020-08-27 09:28:27', 0),
(169, 87, 'Issue', 1, '해당 추가건은 변경범위가 크기 때문에 현재로선 반영하기 어렵습니다.\r\n재고를 부탁드립니다.', '2020-08-27 09:35:16', 0),
(170, 87, 'Issue', 1, '', '2020-08-27 09:35:36', 0),
(171, 65, 'Issue', 1, '확인함', '2020-08-27 09:51:08', 0),
(172, 70, 'Issue', 1, '서버 Kube 이슈로 로그분석을 위한 환경구성후 분석예정', '2020-08-27 23:47:57', 0),
(173, 87, 'Issue', 8, '저희 제품 QC에서 제기한 이슈라 안하고 넘어가기에는 무리가 있습니다.\r\n초반 기획에 해당 부분이 포함 되지 못 한게 실수이지만,\r\n기능상 반드시 필요한 부분이라고 생각해주세요.\r\n그리고, 변경범위가 크다는게 어떤 의미인가요?\r\n\r\n기존 와이파이페어링 부분 재활용하면 그다지 많은 공수가 들어갈 사항은 아니라고 생각이 듭니다.\r\n\r\n긍정적인 검토 부탁드립니다.', '2020-08-27 23:51:31', 0),
(174, 87, 'Issue', 8, '', '2020-08-27 23:51:52', 0),
(175, 79, 'Issue', 1, '이 주흥 wrote:\r\n> IOS 앱등록을 위해 애플로그인 개발\r\n\r\n애플은 별도 닉네임이 없이 토큰값이 전달되므로 닉네임은 공통으로 \"애플\" 로 등록하고 사용자가 수정하게끔 한다.\r\n\r\n--> 김진우책임님 컨펌 부탁드립니다.', '2020-08-28 00:49:51', 0),
(176, 86, 'Issue', 7, '', '2020-08-28 04:16:52', 0),
(177, 84, 'Issue', 7, '', '2020-08-28 04:17:17', 0),
(178, 86, 'Issue', 1, '확인함', '2020-08-28 05:57:53', 0),
(179, 84, 'Issue', 1, '확인함', '2020-08-28 05:58:55', 0),
(180, 63, 'Issue', 1, '확인함', '2020-08-28 06:02:32', 0),
(181, 79, 'Issue', 1, '\"애플\"로 넣지말고 빈값으로 서버에 전송해주시길 바랍니다.', '2020-08-28 07:07:28', 0),
(182, 91, 'Issue', 1, '', '2020-08-28 07:21:23', 0),
(183, 91, 'Issue', 1, '1번은 수정하지 마시고 현상태 유지해주시고\r\n2번은 라인을 맞출수 있으면 맞추고 안되면 전체 회색처리', '2020-08-28 07:32:42', 0),
(184, 92, 'Issue', 1, '', '2020-08-28 07:45:30', 0),
(185, 92, 'Issue', 1, '', '2020-08-28 07:45:55', 0),
(186, 92, 'Issue', 1, '', '2020-08-28 07:46:51', 0),
(187, 92, 'Issue', 1, '', '2020-08-28 07:47:13', 0),
(188, 90, 'Issue', 1, '', '2020-08-28 07:50:43', 0),
(189, 94, 'Issue', 1, '', '2020-08-30 23:31:20', 0),
(190, 97, 'Issue', 1, '', '2020-08-30 23:43:10', 0),
(191, 97, 'Issue', 1, '', '2020-08-30 23:43:52', 0),
(192, 97, 'Issue', 1, '', '2020-08-30 23:44:14', 0),
(193, 94, 'Issue', 1, '\r\n!프로필.PNG!\r\n\r\n', '2020-08-31 00:08:21', 0),
(194, 70, 'Issue', 1, '', '2020-08-31 00:13:22', 0),
(195, 98, 'Issue', 1, '', '2020-08-31 00:13:26', 0),
(196, 98, 'Issue', 1, '김 진우 wrote:\r\n> * 증상\r\n> - 간헐적으로 증상 발생\r\n> - 앱 실행시 등록되어 있던 제품이 표시가 안됨. 이후, 재 실행하니 서버오류 팝업이 뜨고 정상동작 하지 않음\r\n> 몇 번, 반복해야 재 진입됨.\r\n> - 동영상 파일 참조\r\n\r\n#70 이슈와 동일건으로 Redis 오류로 컨테이너 자동재기동중 접속불가인 현상임\r\n     방어코드 삽입후 모니터링중이나 MS측에 문의할 예정', '2020-08-31 00:14:53', 0),
(197, 101, 'Issue', 1, '', '2020-08-31 00:46:02', 0),
(198, 94, 'Issue', 1, '', '2020-08-31 01:32:24', 0),
(199, 94, 'Issue', 1, '', '2020-08-31 01:33:37', 0),
(200, 103, 'Issue', 7, '날씨 관련된 값을 \"-\"로 받고 있어 비로만 표시되고 있음. 서버 데이터 확인 필요\r\n{\r\n    \"gsKey\": \"062-126\",\r\n    \"gsUTC\": \"2020-08-31T05:15:46.654Z\",\r\n    \"gsHigh\": \"-\",\r\n    \"gsLow\": \"23.0\",\r\n    \"gsCurr\": \"28.6\",\r\n    \"gsRain\": \"-\",\r\n    \"gsSky\": \"-\",\r\n    \"gsPM10\": \"8\",\r\n    \"gsPM25\": \"1\",\r\n    \"cacheDate\": \"2020-08-31T05:15:46.941Z\"\r\n}', '2020-08-31 05:20:03', 0),
(201, 96, 'Issue', 1, '', '2020-08-31 05:40:55', 0),
(202, 104, 'Issue', 1, '', '2020-08-31 05:41:00', 0),
(203, 99, 'Issue', 7, '스마트 후드에 연결된 레인지 삭제 시\r\nlink에 레인지 정보도 아래와 같이 삭제처리 필요\r\n\r\n    link: {\r\n      autoMode: OnOff.OFF,\r\n      targetDeviceId: \'\',\r\n      event: {\r\n        fanCountBySpeed: [0, 0, 0],\r\n        delayTimer: 0,\r\n        delayTimerOnOff: false\r\n      }\r\n    }', '2020-08-31 07:35:22', 0),
(204, 104, 'Issue', 7, '', '2020-08-31 07:51:48', 0),
(205, 96, 'Issue', 7, '', '2020-08-31 07:52:26', 0),
(206, 94, 'Issue', 7, '', '2020-08-31 07:53:12', 0),
(207, 97, 'Issue', 7, ' 재시도 버튼 눌렀을때 버튼이 눌림상태로 유지되는 현상 수정(~09.01)', '2020-08-31 08:00:08', 0),
(208, 95, 'Issue', 7, '회원탈퇴 화면에서 선 처리 필요, 서버단 http status 수정(완료),\r\n→ baseService 수정(~09.02)', '2020-08-31 08:00:49', 0),
(209, 93, 'Issue', 7, '현상 확인중', '2020-08-31 08:02:20', 0),
(210, 92, 'Issue', 7, '', '2020-08-31 08:02:39', 0),
(211, 90, 'Issue', 7, '', '2020-08-31 08:03:03', 0),
(212, 101, 'Issue', 7, '주간 평균값 기준으로 지난주 대비 비율을 계산하고 있었음.\r\n주간 합계 기준으로 계산하도록 계산식 변경 진행중.', '2020-08-31 08:04:43', 0),
(213, 92, 'Issue', 7, '로그아웃 후 재로그인하면 SNS의 nickname으로 다시 설정되는 현상이 있어 확인중', '2020-08-31 08:46:42', 0),
(214, 92, 'Issue', 7, '로그아웃 이후에 재로그인 하는 경우, 기존 가입자의 경우 소셜에서 준 닉네임이 아니라 기존 닉네임이 /auth/login의 응답으로 오도록 변경 요청 드립니다.', '2020-08-31 09:02:48', 0),
(215, 101, 'Issue', 7, '', '2020-08-31 10:08:52', 0),
(218, 99, 'Issue', 5, '', '2020-08-31 10:51:58', 0),
(219, 90, 'Issue', 1, '확인함', '2020-08-31 10:52:04', 0),
(220, 90, 'Issue', 1, '', '2020-08-31 10:52:22', 0),
(221, 104, 'Issue', 1, '확인함', '2020-08-31 10:52:41', 0),
(222, 94, 'Issue', 1, '확인함', '2020-08-31 10:53:05', 0),
(223, 96, 'Issue', 1, '', '2020-08-31 10:53:24', 0),
(224, 101, 'Issue', 1, '데이터가 쌓이지 않아서 추후 확인예정', '2020-08-31 10:54:04', 0),
(225, 103, 'Issue', 5, 'gsSky, gsRain 값이 없을때는 \'-\'로 주긴 하는데,\r\n현재 아래와 같이 값이 있는경우에도 전부 비로 나옵니다.\r\n확인 부탁드립니다.\r\n\r\n{\r\n	\"gsKey\": \"057-127\",\r\n	\"gsUTC\": \"2020-08-31T10:31:58.991Z\",\r\n	\"gsHigh\": \"-\",\r\n	\"gsLow\": \"24.0\",\r\n	\"gsCurr\": \"28.3\",\r\n	\"gsRain\": \"0\",\r\n	\"gsSky\": \"3\",\r\n	\"gsPM10\": \"8\",\r\n	\"gsPM25\": \"2\",\r\n	\"cacheDate\": \"2020-08-31T10:32:05.220Z\"\r\n}\r\n\r\n{\r\n	\"gsKey\": \"088-090\",\r\n	\"gsUTC\": \"2020-08-31T10:53:20.979Z\",\r\n	\"gsHigh\": \"-\",\r\n	\"gsLow\": \"24.0\",\r\n	\"gsCurr\": \"24.8\",\r\n	\"gsRain\": \"0\",\r\n	\"gsSky\": \"4\",\r\n	\"gsPM10\": \"11\",\r\n	\"gsPM25\": \"7\",\r\n	\"cacheDate\": \"2020-08-31T10:53:23.195Z\"\r\n}\r\n\r\n{\r\n	\"gsKey\": \"062-123\",\r\n	\"gsUTC\": \"2020-08-31T10:34:17.574Z\",\r\n	\"gsHigh\": \"-\",\r\n	\"gsLow\": \"23.0\",\r\n	\"gsCurr\": \"26.9\",\r\n	\"gsRain\": \"0\",\r\n	\"gsSky\": \"4\",\r\n	\"gsPM10\": \"14\",\r\n	\"gsPM25\": \"6\",\r\n	\"cacheDate\": \"2020-08-31T10:34:17.791Z\"\r\n}', '2020-08-31 10:54:55', 0),
(226, 102, 'Issue', 7, '', '2020-08-31 11:16:16', 0),
(227, 100, 'Issue', 7, '', '2020-08-31 11:16:43', 0),
(228, 100, 'Issue', 1, '확인함', '2020-08-31 22:19:53', 0),
(229, 102, 'Issue', 1, '확인함', '2020-08-31 22:20:36', 0),
(230, 92, 'Issue', 5, '수정 완료 하였습니다.', '2020-09-01 01:40:38', 0),
(231, 92, 'Issue', 1, '확인함', '2020-09-01 02:02:10', 0),
(232, 103, 'Issue', 7, '날씨  이미지 로직은 아래와 같습니다.\r\n\r\nlet weatherImage\r\n  if (data?.gsRain === 0) {\r\n    if (data.gsSky === 1) {\r\n      weatherImage = WeatherSunny\r\n    } else {\r\n      weatherImage = WeatherCloudy\r\n    }\r\n  } else {\r\n    if (data?.gsRain === 3) {\r\n      weatherImage = WeatherSnowy\r\n    } else {\r\n      weatherImage = WeatherRainy\r\n    }\r\n  }', '2020-09-01 02:20:51', 0),
(233, 81, 'Issue', 7, '', '2020-09-01 02:23:31', 0),
(234, 92, 'Issue', 1, '', '2020-09-01 02:24:05', 0),
(235, 105, 'Issue', 1, '기타 공간을 삭제시 제품등록 절차상 문제가 발생할수 있음\r\n\r\n제품등록 -> 공간등록 화면에서 앱을 강제종료시 해당제품은 제품리스트에만 나오고 공간별 목록에는 나오지 않음\r\n공간등록 화면에서 강제종료 하더라도 기타공간에 등록되게끔 처리가 필요함', '2020-09-01 03:29:23', 0),
(236, 99, 'Issue', 5, '수정 완료 하였습니다.', '2020-09-01 03:40:19', 0),
(237, 99, 'Issue', 1, '확인함', '2020-09-01 03:55:47', 0),
(238, 103, 'Issue', 5, 'API 변경하도록 하겠습니다. gsSky 상태만 보시면 되고, 각 상태는 다음과 같습니다.\r\n0: 맑음 (WeatherSunny)\r\n1: 흐림 (WeatherCloudy)\r\n2: 비 (WeatherRainy)\r\n3: 눈 (WeatherSnowy)', '2020-09-01 04:46:59', 0),
(239, 107, 'Issue', 1, '', '2020-09-01 06:25:11', 0),
(240, 109, 'Issue', 1, '', '2020-09-01 06:31:43', 0),
(241, 110, 'Issue', 1, '', '2020-09-01 06:36:53', 0),
(242, 107, 'Issue', 1, '통합테스트 Fail건 입니다.', '2020-09-01 07:25:41', 0),
(243, 107, 'Issue', 7, '', '2020-09-01 09:16:54', 0),
(244, 105, 'Issue', 7, '', '2020-09-01 09:17:12', 0),
(245, 103, 'Issue', 7, '', '2020-09-01 09:17:28', 0),
(246, 81, 'Issue', 7, '', '2020-09-01 09:19:30', 0),
(247, 81, 'Issue', 1, '확인함', '2020-09-01 09:22:16', 0),
(248, 105, 'Issue', 1, '확인함', '2020-09-01 09:25:45', 0),
(249, 103, 'Issue', 7, '', '2020-09-01 09:56:26', 0),
(250, 103, 'Issue', 7, '', '2020-09-01 10:43:14', 0),
(251, 110, 'Issue', 7, '카카오 SDK 초기화가 안되어 있어서 발생한 이슈로 수정하여 테스트 진행 예정', '2020-09-01 11:06:46', 0),
(252, 103, 'Issue', 5, '날씨 API가 변경 된 후 아이콘이 나오지 않습니다.\r\n현재 서버에서는 다음과 같이 주고 있습니다.\r\n확인 부탁드립니다.\r\n\r\n{\r\n	\"gsKey\": \"057-127\",\r\n	\"gsUTC\": \"2020-09-01T23:04:46.939Z\",\r\n	\"gsHigh\": \"-\",\r\n	\"gsLow\": \"24.0\",\r\n	\"gsCurr\": \"25.5\",\r\n	\"gsSky\": \"2\",\r\n	\"gsPM10\": \"12\",\r\n	\"gsPM25\": \"6\",\r\n	\"cacheDate\": \"2020-09-01T23:04:51.197Z\"\r\n}', '2020-09-01 23:12:39', 0),
(253, 103, 'Issue', 5, 'gsSky를 int로 판단하는 것 같아서, 서버에서 int로 변경하니 날씨가 제대로 출력됩니다.\r\n그런데 날씨 문구가 항상 흐림으로 출력됩니다.\r\n확인 부탁드립니다.', '2020-09-01 23:43:31', 0),
(254, 101, 'Issue', 1, '(금주 총사용량 - 지난주 총사용량)/지난주 총사용량 * 100\r\n\r\n(940분 - 850분)/850분 * 100 = 지난주대비 10.5% 높음\r\n(600분 - 850분)/850분 * 100 = 지난주대비 -30% 낮음\r\n\r\n위계산식이 맞는지 확인 부탁드립니다.', '2020-09-02 01:26:41', 0),
(255, 103, 'Issue', 7, '', '2020-09-02 03:14:03', 0),
(256, 97, 'Issue', 7, '', '2020-09-02 10:50:20', 0),
(257, 95, 'Issue', 7, '', '2020-09-02 10:51:20', 0),
(258, 93, 'Issue', 7, '', '2020-09-02 10:51:41', 0),
(259, 108, 'Issue', 7, '', '2020-09-02 10:52:16', 0),
(260, 110, 'Issue', 7, '', '2020-09-02 10:53:05', 0),
(261, 108, 'Issue', 1, '확인함', '2020-09-02 10:54:48', 0),
(262, 103, 'Issue', 1, '확인', '2020-09-02 10:55:25', 0),
(263, 97, 'Issue', 1, '확인함', '2020-09-02 10:56:50', 0),
(264, 93, 'Issue', 1, '확인함', '2020-09-02 10:57:08', 0),
(265, 107, 'Issue', 1, '확인함', '2020-09-02 10:57:51', 0),
(266, 101, 'Issue', 1, '확인함', '2020-09-02 10:58:18', 0),
(267, 110, 'Issue', 1, '확인함', '2020-09-02 11:01:03', 0),
(268, 95, 'Issue', 5, '', '2020-09-02 11:04:34', 0),
(269, 106, 'Issue', 7, '', '2020-09-03 02:06:09', 0),
(270, 79, 'Issue', 1, '완료 확인함', '2020-09-03 05:05:20', 0),
(271, 109, 'Issue', 7, '', '2020-09-03 05:15:57', 0),
(272, 91, 'Issue', 7, '', '2020-09-03 05:16:18', 0),
(273, 91, 'Issue', 1, '확인함', '2020-09-03 07:44:33', 0),
(274, 106, 'Issue', 5, '', '2020-09-03 09:42:04', 0),
(275, 71, 'Issue', 7, '', '2020-09-03 10:06:46', 0),
(276, 73, 'Issue', 7, '', '2020-09-04 00:49:11', 0),
(277, 112, 'Issue', 1, '이 주흥 wrote:\r\n> 서버 접속 불가일때\r\n> \r\n> 로그인 실패 팝업 > 확인 > 구글계정 로그인 터치 > 앱 재로딩 > 로그인 실패 팝업 : 무한반복\r\n> \r\n> 구글 로그인 터치시 로그인실패 팝업이 떠야 하고 팝업에서 앱을 빠져나가는 루틴이 필요함\r\n> \r\n> 또한 전반적으로 네트워크없을때나 접속장애 일때 앱 화면전환에 대해 확인이 필요함\r\n> \r\n> !접속불가.jpg!\r\n\r\n의도한 내용이면 앱탈출 액션만 필요할것 같은데 의견 주세요', '2020-09-04 01:42:34', 0),
(278, 109, 'Issue', 1, '확인함', '2020-09-04 07:50:12', 0),
(279, 73, 'Issue', 1, '', '2020-09-04 07:57:30', 0),
(280, 71, 'Issue', 1, '확인함', '2020-09-04 07:57:56', 0),
(281, 76, 'Issue', 1, '', '2020-09-06 23:42:04', 0),
(282, 114, 'Issue', 1, '기기이동시 별도 확인버튼을 통해 이동완료가 되는게 아니라 공간을 선택하면 바로 이동이 처리된 상태 입니다.\r\n공간을 추가하지 않아도 됩니다.', '2020-09-07 00:59:44', 0),
(283, 114, 'Issue', 1, '', '2020-09-07 01:01:27', 0),
(284, 115, 'Issue', 1, '', '2020-09-07 01:20:44', 0),
(285, 111, 'Issue', 1, '\"제품등록\"으로 통일', '2020-09-07 06:54:58', 0),
(286, 98, 'Issue', 1, '', '2020-09-07 08:37:40', 0),
(287, 114, 'Issue', 1, '', '2020-09-08 00:25:48', 0),
(288, 113, 'Issue', 1, '확인함', '2020-09-08 22:27:31', 0),
(289, 98, 'Issue', 1, '모니터링 결과 현상 재현되지 않음', '2020-09-08 22:28:17', 0),
(290, 70, 'Issue', 1, '#98 일감 closed로 이슈 닫음', '2020-09-08 22:29:07', 0),
(291, 70, 'Issue', 1, '', '2020-09-08 22:29:24', 0),
(292, 89, 'Issue', 1, '전원,제어,센서 로 분류해서 처리완료', '2020-09-08 22:29:55', 0),
(293, 115, 'Issue', 1, '확인함', '2020-09-08 22:30:37', 0),
(294, 115, 'Issue', 1, '확인함', '2020-09-09 05:37:52', 0),
(295, 116, 'Issue', 1, '', '2020-09-10 04:31:33', 0),
(296, 87, 'Issue', 1, '', '2020-09-10 04:32:47', 0),
(297, 116, 'Issue', 1, '', '2020-09-10 04:45:06', 0),
(298, 117, 'Issue', 1, '', '2020-09-10 04:45:09', 0),
(299, 117, 'Issue', 5, '개발 완료 되었습니다.', '2020-09-10 23:36:08', 0),
(300, 87, 'Issue', 1, '디바이스 API 추가후 확인 바랍니다.', '2020-09-15 07:10:44', 0),
(301, 121, 'Issue', 6, '개선하였습니다. \r\n운영서버(https://iot-admin.lghausys.com/)에 반영되어 있습니다. \r\n', '2020-09-17 09:20:16', 0),
(302, 118, 'Issue', 6, '개선 하였습니다.\r\n개발 서버(https://ziniot-test.koreacentral.cloudapp.azure.com/)에 반영되어 있습니다. \r\n', '2020-09-17 09:23:58', 0),
(303, 122, 'Issue', 1, '', '2020-09-18 02:05:14', 0),
(304, 122, 'Issue', 1, '그래프 가능 여부 논의후 다시 오픈 하겠습니다.', '2020-09-18 02:31:44', 0),
(305, 122, 'Issue', 1, '그래프는 나오는거네요..착각했습니다.', '2020-09-18 04:56:07', 0),
(306, 119, 'Issue', 6, '향후 IE는 서비스 중단 예정인 브라우저이기에 Chrome, Edge에 최적화하였습니다.\r\n사용자에게 IE 접속시 안내 메시지 출력됩니다.\r\n', '2020-09-21 04:06:59', 0),
(307, 120, 'Issue', 6, '', '2020-09-21 04:07:51', 0),
(308, 118, 'Issue', 1, '', '2020-10-05 01:53:59', 0),
(309, 121, 'Issue', 1, '', '2020-10-05 01:54:15', 0),
(310, 119, 'Issue', 1, '', '2020-10-05 01:54:31', 0),
(311, 112, 'Issue', 7, '서버와 함께 날잡아서 예외상황을 만들어놓고 테스트를 해봐야 할 거 같습니다. \r\n\r\n', '2020-10-05 07:22:43', 0),
(312, 124, 'Issue', 7, '', '2020-10-05 07:23:18', 0),
(313, 123, 'Issue', 7, '', '2020-10-05 07:23:37', 0),
(314, 87, 'Issue', 7, '', '2020-10-05 07:29:29', 0),
(315, 116, 'Issue', 7, '\"집 + 공간\" 별로 그룹핑이 되어야 할 거 같습니다. 아니면 사용자 입장에서 구분도 어렵고 설정이 난해해 보일 수 있을 거 같습니다.\r\n그리고 현재 api에 데이터가 정상적으로 세팅이 되지 않는 것처럼 보입니다. 아래와 같이 빈값으로 옵니다.\r\n\r\n{enable: false, nightMode: false, homeSharing: false, deviceEnable: [], deviceFilter: []}\r\n', '2020-10-05 07:57:48', 0),
(316, 112, 'Issue', 1, '손 정환 wrote:\r\n> 서버와 함께 날잡아서 예외상황을 만들어놓고 테스트를 해봐야 할 거 같습니다.\r\n\r\n차주에 5층에서 하루 같이 작업할수 있게 일정 잡아 보시죠~', '2020-10-05 22:21:43', 0),
(317, 126, 'Issue', 1, '상세페이지는 수정되었음', '2020-10-06 08:28:31', 0),
(318, 87, 'Issue', 1, '변경 테스트 확인 완료', '2020-10-07 01:23:05', 0),
(319, 123, 'Issue', 1, '확인함', '2020-10-07 06:44:26', 0),
(320, 117, 'Issue', 1, '', '2020-10-07 06:48:28', 0),
(321, 125, 'Issue', 1, '', '2020-10-07 06:49:13', 0),
(322, 126, 'Issue', 1, '수정 확인', '2020-10-19 01:13:44', 0),
(323, 120, 'Issue', 1, '', '2020-10-19 01:25:10', 0),
(324, 124, 'Issue', 1, '', '2020-10-20 07:12:32', 0),
(325, 116, 'Issue', 1, '', '2020-10-20 07:12:50', 0),
(326, 122, 'Issue', 1, '', '2020-10-20 07:14:09', 0),
(327, 127, 'Issue', 9, '', '2020-10-21 04:20:47', 0),
(328, 128, 'Issue', 1, '기전달 받은 기준에 PM1.0 이 없었는데 확인 부탁드립니다.', '2020-10-21 05:14:53', 0),
(329, 127, 'Issue', 1, '2번은 수락하면 master에게 푸쉬 알림이 가는데 추가적으로 팝업이 불필요해 보이는데요\r\n     member는 수락하면 해당집으로 바로 이동합니다.\r\n3번은 서버에서 예외처리 하면 에러코드 받아서 처리할수 있게 확인 부탁드립니다.', '2020-10-21 05:23:06', 0),
(330, 128, 'Issue', 1, '이 주흥 wrote:\r\n> 기전달 받은 기준에 PM1.0 이 없었는데 확인 부탁드립니다.\r\n\r\nPM1.0 은 무시하시면 됩니다. 기존에 김진우책임께 전달받은 내용과 동일합니다. 변경사항 없음', '2020-10-21 05:26:34', 0),
(331, 128, 'Issue', 1, '', '2020-10-21 05:27:43', 0),
(332, 127, 'Issue', 5, '이미 등록된 집을 다시 쉐어링을 요청하면 다음과 같은 에러가 발생합니다.\r\n{status: 409, name: \"Invalid Request\", error_description: \"Duplicated Sharing User\", error: \"ApiError\"}\r\n해당 에러 status에 맞게 에러 팝업을 출력하시면 됩니다.', '2020-10-21 06:30:53', 0),
(333, 127, 'Issue', 9, '완료\r\n--> 홈쉐어링이 완료되었습니다.\r\n    해당 집 화면으로 이동합니다.\r\n\r\n중복\r\n--> 이미 쉐어링된 집 입니다. ( 서버 중복 에러코드는 409 라고 합니다. )    \r\n', '2020-10-21 06:32:10', 0),
(334, 128, 'Issue', 7, '', '2020-10-21 07:41:02', 0),
(335, 129, 'Issue', 1, '', '2020-10-23 05:39:33', 0),
(336, 128, 'Issue', 1, '', '2020-10-23 05:39:50', 0),
(337, 127, 'Issue', 1, '', '2020-10-23 05:40:05', 0);

-- --------------------------------------------------------

--
-- 테이블 구조 `journal_details`
--

CREATE TABLE `journal_details` (
  `id` int(11) NOT NULL,
  `journal_id` int(11) NOT NULL DEFAULT 0,
  `property` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `prop_key` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `old_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `journal_details`
--

INSERT INTO `journal_details` (`id`, `journal_id`, `property`, `prop_key`, `old_value`, `value`) VALUES
(1, 1, 'attr', 'due_date', NULL, '2020-06-30'),
(2, 2, 'attr', 'status_id', '1', '2'),
(3, 3, 'attr', 'status_id', '1', '2'),
(4, 4, 'attachment', '1', NULL, '하우시스 통합 앱기획_V0.8_0608.pptx'),
(5, 5, 'attachment', '2', NULL, 'FAQ.PNG'),
(6, 6, 'attr', 'assigned_to_id', '1', '7'),
(7, 7, 'attachment', '1', '하우시스 통합 앱기획_V0.8_0608.pptx', NULL),
(8, 8, 'attr', 'status_id', '1', '2'),
(9, 10, 'attr', 'tracker_id', '5', '6'),
(10, 11, 'attr', 'category_id', NULL, '2'),
(11, 12, 'attr', 'status_id', '1', '2'),
(12, 13, 'attr', 'due_date', '2020-06-09', '2020-06-19'),
(13, 14, 'attr', 'category_id', NULL, '4'),
(14, 14, 'attr', 'status_id', '1', '2'),
(15, 15, 'relation', 'copied_to', NULL, '12'),
(16, 16, 'relation', 'copied_from', NULL, '11'),
(17, 17, 'attr', 'status_id', '2', '3'),
(18, 18, 'attr', 'due_date', '2020-06-26', '2020-08-07'),
(19, 18, 'attr', 'start_date', '2020-06-17', '2020-08-03'),
(20, 19, 'attr', 'due_date', '2020-06-26', '2020-07-17'),
(21, 19, 'attr', 'status_id', '1', '2'),
(22, 21, 'attr', 'status_id', '2', '5'),
(23, 24, 'attr', 'subject', '그래프 범계는 모바일앱에서 하드 코딩(?) 하는 것이 좋을 것 같음', '시뮬레이터 개발 검토'),
(24, 25, 'attr', 'description', '', '- 보안점검 대상\r\n   모바일 Android\r\n   모바일 IOS \r\n   Admin Web'),
(25, 27, 'attr', 'description', '회원상세 항목들중 사용하지 않는 아이템 다수로 보임\r\n\r\n정리가 필요함', '회원상세 항목들중 사용하지 않는 아이템 다수로 보임\r\n\r\n정리가 필요함\r\n\r\n!회원상세항목.PNG!'),
(26, 28, 'attr', 'description', '회원명 : 김진우', '회원명 : 김진우\r\n\r\n!회원상세항목.PNG!'),
(27, 29, 'attachment', '6', NULL, '회원관리_김진우.PNG'),
(28, 29, 'attr', 'description', '회원명 : 김진우\r\n\r\n!회원상세항목.PNG!', '회원명 : 김진우\r\n\r\n!회원관리_김진우.PNG!'),
(29, 30, 'attachment', '3', '회원상세항목.PNG', NULL),
(30, 31, 'attr', 'description', '\r\n - 레이아웃을 한줄로 수정할것\r\n\r\n - 회원 닉네임 검색은 Like 검색 필요\r\n\r\n!레이아웃.PNG!', '\r\n 1. 레이아웃을 한줄로 수정할것\r\n\r\n 2. 회원 닉네임 검색은 Like 검색 필요\r\n\r\n!레이아웃.PNG!'),
(31, 32, 'attr', 'description', '\r\n 1. 레이아웃을 한줄로 수정할것\r\n\r\n 2. 회원 닉네임 검색은 Like 검색 필요\r\n\r\n!레이아웃.PNG!', '\r\n 1. 레이아웃을 한줄로 수정할것\r\n\r\n 2. 회원 닉네임 검색은 Like 검색 필요\r\n\r\n\r\n\r\n\r\n!레이아웃.PNG!'),
(32, 33, 'attr', 'description', '\r\n 1. 레이아웃을 한줄로 수정할것\r\n\r\n 2. 회원 닉네임 검색은 Like 검색 필요\r\n\r\n\r\n\r\n\r\n!레이아웃.PNG!', '\r\n 1. 레이아웃을 한줄로 수정할것\r\n\r\n 2. 회원 닉네임 검색 안됨(Like 검색 필요)\r\n\r\n\r\n\r\n\r\n!레이아웃.PNG!'),
(33, 35, 'attr', 'description', '이전 회원의 데이터가 지워지지 않고 남아있음\r\n\r\n김진우 --> TEST_nickname 두번 클릭시 김진우의 주소가 TEST_nickname에 그대로 남아있음', '이전 회원의 데이터가 지워지지 않고 남아있음\r\n\r\n김진우 --> TEST_nickname 차례로 클릭시 김진우의 주소가 TEST_nickname에 그대로 남아있음'),
(34, 36, 'attr', 'status_id', '1', '2'),
(35, 37, 'attr', 'status_id', '2', '3'),
(36, 38, 'attr', 'status_id', '1', '3'),
(37, 39, 'attr', 'status_id', '1', '2'),
(38, 40, 'attr', 'status_id', '1', '3'),
(39, 41, 'attr', 'status_id', '1', '3'),
(40, 42, 'attr', 'status_id', '1', '3'),
(41, 43, 'attr', 'status_id', '1', '3'),
(42, 44, 'attr', 'status_id', '1', '3'),
(43, 45, 'attr', 'status_id', '2', '3'),
(44, 46, 'attr', 'status_id', '1', '2'),
(45, 47, 'attr', 'assigned_to_id', NULL, '7'),
(46, 48, 'attr', 'priority_id', '2', '3'),
(47, 49, 'attr', 'priority_id', '2', '3'),
(48, 50, 'attr', 'priority_id', '2', '3'),
(49, 51, 'attr', 'priority_id', '2', '3'),
(50, 52, 'attr', 'priority_id', '2', '3'),
(51, 53, 'attr', 'status_id', '1', '5'),
(52, 54, 'attr', 'status_id', '1', '5'),
(53, 55, 'attr', 'status_id', '1', '5'),
(54, 56, 'attr', 'status_id', '1', '5'),
(55, 57, 'attr', 'description', '\"알림설정\" 메뉴\r\n\r\n1. 필터교체알림, 제어알림 : 후드의 전원 On/Off와 상관없이 설정 가능해야함\r\n   현상 : 후드가 On일 상태에서만 설정됨, on --> 리프레쉬 하면 다시 off로 바뀜\r\n\r\n2. 제어알림 : 동작안함', '\"알림설정\" 메뉴\r\n\r\n1. 필터교체알림, 제어알림 : 후드의 전원 On/Off와 상관없이 설정 가능해야함\r\n   현상 : 후드가 On일 상태에서만 설정됨, on --> 리프레쉬 하면 다시 off로 바뀜\r\n\r\n2. 제어알림 : 동작안함(on/off 상관없이 항상 알림이 옴)'),
(56, 58, 'attr', 'assigned_to_id', '7', '5'),
(57, 59, 'attr', 'status_id', '1', '3'),
(58, 60, 'attr', 'status_id', '3', '5'),
(59, 61, 'attr', 'status_id', '1', '2'),
(60, 62, 'attr', 'status_id', '3', '5'),
(61, 63, 'attr', 'status_id', '1', '3'),
(62, 64, 'attr', 'status_id', '1', '4'),
(63, 65, 'attr', 'assigned_to_id', '7', '5'),
(64, 66, 'attr', 'tracker_id', '1', '7'),
(65, 67, 'attr', 'tracker_id', '1', '7'),
(66, 68, 'attr', 'assigned_to_id', NULL, '7'),
(67, 69, 'attr', 'assigned_to_id', NULL, '7'),
(68, 70, 'attr', 'tracker_id', '1', '7'),
(69, 71, 'attr', 'status_id', '1', '5'),
(70, 72, 'attr', 'priority_id', '2', '1'),
(71, 73, 'attr', 'priority_id', '2', '1'),
(72, 74, 'attr', 'subject', '리프레쉬', '메인화면 리프레쉬 딜레이 현상'),
(73, 75, 'attr', 'subject', '메인화면 제품정보', '메인화면 제품정보 간헐적 보이지 않음'),
(74, 75, 'attr', 'priority_id', '2', '3'),
(75, 76, 'attr', 'description', 'IOS 전용기능 테스트 필요\r\n\r\n - 상이한 제품등록 프로세스\r\n - 애플로그인', 'IOS 전용기능 테스트 필요\r\n\r\n* 상이한 제품등록 프로세스\r\n* 애플로그인'),
(76, 77, 'attr', 'description', 'IOS 전용기능 테스트 필요\r\n\r\n* 상이한 제품등록 프로세스\r\n* 애플로그인', 'IOS 전용기능 테스트 필요\r\n\r\n* 상이한 제품등록 프로세스\r\n* 애플로그인\r\n* 푸쉬 알림\r\n* 화면 리프레쉬'),
(77, 78, 'attr', 'assigned_to_id', '5', '7'),
(78, 79, 'attr', 'status_id', '1', '3'),
(79, 80, 'attr', 'status_id', '1', '2'),
(80, 81, 'attr', 'status_id', '1', '2'),
(81, 82, 'attr', 'status_id', '1', '3'),
(82, 82, 'attr', 'assigned_to_id', '7', '5'),
(83, 84, 'attr', 'status_id', '1', '2'),
(84, 84, 'attr', 'assigned_to_id', '7', '5'),
(85, 85, 'attr', 'status_id', '1', '2'),
(86, 86, 'attr', 'status_id', '1', '2'),
(87, 87, 'attr', 'status_id', '2', '4'),
(88, 88, 'attr', 'status_id', '1', '2'),
(89, 89, 'attr', 'status_id', '1', '2'),
(90, 90, 'attr', 'status_id', '4', '5'),
(91, 91, 'attr', 'tracker_id', '7', '2'),
(92, 92, 'attr', 'status_id', '1', '2'),
(93, 92, 'attr', 'assigned_to_id', '5', '7'),
(94, 93, 'attr', 'status_id', '2', '3'),
(95, 93, 'attr', 'assigned_to_id', '5', '7'),
(96, 94, 'attr', 'status_id', '4', '3'),
(97, 95, 'attr', 'status_id', '2', '3'),
(98, 96, 'attr', 'status_id', '3', '2'),
(99, 97, 'attr', 'status_id', '2', '3'),
(100, 98, 'attr', 'status_id', '2', '5'),
(101, 99, 'attr', 'status_id', '3', '5'),
(102, 100, 'attr', 'status_id', '3', '6'),
(103, 101, 'attr', 'status_id', '3', '2'),
(104, 102, 'attr', 'status_id', '6', '2'),
(105, 104, 'attr', 'tracker_id', '1', '5'),
(106, 104, 'attr', 'status_id', '1', '4'),
(107, 105, 'attr', 'status_id', '1', '5'),
(108, 106, 'attr', 'status_id', '1', '6'),
(109, 107, 'attr', 'status_id', '2', '5'),
(110, 108, 'attr', 'status_id', '3', '5'),
(111, 109, 'attr', 'status_id', '3', '5'),
(112, 110, 'attr', 'status_id', '1', '7'),
(113, 111, 'attr', 'status_id', '2', '3'),
(114, 112, 'attr', 'status_id', '2', '3'),
(115, 113, 'attr', 'status_id', '2', '3'),
(116, 114, 'attr', 'status_id', '1', '2'),
(117, 115, 'attr', 'status_id', '1', '2'),
(118, 116, 'attachment', '11', NULL, 'picture897-1.png'),
(119, 118, 'attr', 'status_id', '1', '5'),
(120, 121, 'attr', 'tracker_id', '1', '7'),
(121, 121, 'attr', 'status_id', '1', '4'),
(122, 122, 'attachment', '13', NULL, '메인화면정렬.png'),
(123, 123, 'attr', 'description', '상세페이지의 이미지-텍스트 부분을 중간정렬 한다.\r\n\r\n스마트후드 필터부분을 보면 하단정렬 되어 있음.', '상세페이지의 이미지-텍스트 부분을 중간정렬 한다.\r\n\r\n스마트후드 필터부분을 보면 하단정렬 되어 있음.\r\n\r\n!중간정렬.png!\r\n\r\n!메인화면정렬.png!'),
(124, 124, 'attr', 'status_id', '3', '7'),
(125, 124, 'attr', 'assigned_to_id', '7', '5'),
(126, 126, 'attr', 'status_id', '7', '3'),
(127, 127, 'attr', 'status_id', '2', '5'),
(128, 128, 'attr', 'status_id', '3', '7'),
(129, 129, 'attr', 'status_id', '3', '5'),
(130, 130, 'attr', 'status_id', '3', '5'),
(131, 131, 'attr', 'status_id', '7', '5'),
(132, 132, 'attr', 'status_id', '2', '5'),
(133, 133, 'attachment', '14', NULL, '띵큐해제.PNG'),
(134, 133, 'attr', 'status_id', '5', '7'),
(135, 133, 'attr', 'assigned_to_id', '5', '7'),
(136, 134, 'attachment', '15', NULL, 'picture426-1.png'),
(137, 134, 'attr', 'status_id', '5', '4'),
(140, 137, 'attr', 'assigned_to_id', NULL, '7'),
(141, 138, 'attr', 'status_id', '4', '5'),
(142, 139, 'attr', 'assigned_to_id', '5', '7'),
(143, 140, 'attr', 'description', '등록된 디바이스의 내부 AP가 변경되었을때 처리건 입니다.\r\n\r\n기기정보 > 네트워크 변경\r\n\r\n기존 페어링 시나리오 재활용해서 제품 AP만 변경하는 기능인데 검토 부탁드립니다.\r\n\r\n시나리오는 검토후 반영하겠습니다.\r\n\r\n!20200827_110750.jpg!', '등록된 디바이스의 내부 AP가 변경되었을때 처리건 입니다.\r\n\r\n기기정보 > 네트워크 변경\r\n\r\n기존 페어링 시나리오 재활용해서 제품 AP만 변경하는 기능인데 검토 부탁드립니다.\r\n\r\n시나리오는 검토후 반영하겠습니다.\r\n\r\nh2. *<ThinQ 앱 예시>*\r\n!20200827_110750.jpg!'),
(144, 142, 'attr', 'category_id', NULL, '9'),
(145, 143, 'attr', 'category_id', NULL, '9'),
(146, 144, 'attr', 'category_id', '7', NULL),
(147, 146, 'attachment', '26', NULL, '제어이력.jpg'),
(148, 146, 'attr', 'description', '제어이력 진입 -> 데이터가 없음 \r\n\r\n현상 : \"무언가 잘못되었습니다\" 토스트 발생\r\n처리 : 데이터가 없을땐 빈화면으로 나오고 토스트는 오류로 판단할수 있으니 삭제\r\n\r\n!Screenshot_20200827-131424_LG .jpg!', '제어이력 진입 -> 데이터가 없음 \r\n\r\n현상 : \"무언가 잘못되었습니다\" 토스트 발생\r\n처리 : 데이터가 없을땐 빈화면으로 나오고 토스트는 오류로 판단할수 있으니 삭제\r\n\r\n!제어이력.jpg!'),
(149, 147, 'attachment', '27', NULL, '제어이력2.jpg'),
(150, 147, 'attr', 'description', '제어이력 진입 -> 데이터가 없음 \r\n\r\n현상 : \"무언가 잘못되었습니다\" 토스트 발생\r\n처리 : 데이터가 없을땐 빈화면으로 나오고 토스트는 오류로 판단할수 있으니 삭제\r\n\r\n!제어이력.jpg!', '제어이력 진입 -> 데이터가 없음 \r\n\r\n현상 : \"무언가 잘못되었습니다\" 토스트 발생\r\n처리 : 데이터가 없을땐 빈화면으로 나오고 토스트는 오류로 판단할수 있으니 삭제\r\n\r\n!제어이력2.jpg!'),
(151, 148, 'attachment', '25', 'Screenshot_20200827-131424_LG .jpg', NULL),
(152, 149, 'attachment', '26', '제어이력.jpg', NULL),
(153, 150, 'attr', 'status_id', '1', '3'),
(154, 151, 'attr', 'status_id', '1', '3'),
(155, 152, 'attr', 'status_id', '1', '3'),
(156, 153, 'attr', 'status_id', '1', '3'),
(157, 154, 'attr', 'status_id', '1', '3'),
(158, 155, 'attr', 'status_id', '4', '3'),
(159, 156, 'attr', 'status_id', '4', '3'),
(160, 157, 'attr', 'status_id', '7', '3'),
(161, 158, 'attr', 'status_id', '3', '5'),
(162, 159, 'attr', 'status_id', '3', '5'),
(163, 160, 'attr', 'status_id', '3', '5'),
(164, 161, 'attr', 'status_id', '3', '5'),
(165, 163, 'attr', 'status_id', '3', '7'),
(166, 164, 'attr', 'status_id', '3', '5'),
(167, 165, 'attr', 'status_id', '3', '7'),
(168, 166, 'attr', 'status_id', '3', '5'),
(169, 168, 'attr', 'status_id', '7', '5'),
(170, 169, 'attr', 'assigned_to_id', '7', '8'),
(171, 170, 'attr', 'status_id', '1', '4'),
(172, 171, 'attr', 'status_id', '2', '5'),
(173, 172, 'attr', 'tracker_id', '1', '7'),
(174, 174, 'attr', 'assigned_to_id', '8', '1'),
(175, 175, 'attr', 'status_id', '1', '4'),
(176, 175, 'attr', 'assigned_to_id', '7', '8'),
(177, 176, 'attr', 'status_id', '7', '3'),
(178, 177, 'attr', 'status_id', '7', '3'),
(179, 178, 'attr', 'status_id', '3', '5'),
(180, 179, 'attr', 'status_id', '3', '5'),
(181, 180, 'attr', 'status_id', '1', '5'),
(182, 181, 'attr', 'status_id', '4', '1'),
(183, 181, 'attr', 'assigned_to_id', '8', '7'),
(184, 182, 'attr', 'status_id', '4', '6'),
(185, 183, 'attr', 'status_id', '6', '4'),
(186, 183, 'attr', 'priority_id', '2', '1'),
(187, 184, 'attachment', '36', '닉.jpg', NULL),
(188, 185, 'attachment', '37', NULL, '닉.jpg'),
(189, 186, 'attachment', '37', '닉.jpg', NULL),
(190, 187, 'attachment', '38', NULL, '니익.jpg'),
(191, 187, 'attr', 'description', '프로필 변경후\r\n햄버거 메뉴의 상단 닉네임은 변경안됨\r\n\r\n!닉.jpg!', '프로필 변경후\r\n햄버거 메뉴의 상단 닉네임은 변경안됨\r\n\r\n!니익.jpg!'),
(192, 188, 'attr', 'assigned_to_id', NULL, '7'),
(193, 189, 'attr', 'description', 'SNS 항목위에 서버에서 주는 회원ID 추가 필요\r\n\r\n회원ID 12308471032\r\nSNS   google\r\n이메일 정보 .....................\r\n\r\n!프로필_LI.jpg!', 'SNS 항목위에 서버에서 주는 회원ID 추가 필요\r\n서버에서 주는값은 User code 입니다.\r\n\r\n회원ID 12308471032\r\nSNS   google\r\n이메일 정보 .....................\r\n\r\n!프로필_LI.jpg!'),
(194, 190, 'attachment', '43', '네트웍안됨.jpg', NULL),
(195, 191, 'attachment', '44', NULL, '네트웍무.jpg'),
(196, 191, 'attr', 'description', '네트워크 없을때 아래 화면나오고 -> 재시도 -> 프로그래스 돌다가 사라짐 -> 재시도 버튼 비활성화유지되고 Back키 동작안함\r\n\r\n!네트웍안됨.jpg!', '네트워크 없을때 아래 화면나오고 -> 재시도 -> 프로그래스 돌다가 사라짐 -> 재시도 버튼 비활성화유지되고 Back키 동작안함\r\n\r\n!네트웍무.jpg!\r\n'),
(197, 192, 'attr', 'assigned_to_id', NULL, '7'),
(198, 193, 'attachment', '47', NULL, '프로필.PNG'),
(199, 194, 'relation', 'relates', NULL, '98'),
(200, 195, 'relation', 'relates', NULL, '70'),
(201, 197, 'attr', 'subject', '주간사용량 \"지난 주 대비\" 연산 확인', '스마트후드 주간사용량 \"지난 주 대비\" 연산 확인'),
(202, 198, 'attachment', '47', '프로필.PNG', NULL),
(203, 199, 'attachment', '49', NULL, '프로필.PNG'),
(204, 200, 'attr', 'assigned_to_id', '7', '5'),
(205, 201, 'relation', 'relates', NULL, '104'),
(206, 202, 'relation', 'relates', NULL, '96'),
(207, 203, 'attr', 'assigned_to_id', '7', '5'),
(208, 204, 'attr', 'status_id', '1', '3'),
(209, 205, 'attr', 'status_id', '1', '3'),
(210, 206, 'attr', 'status_id', '1', '3'),
(211, 207, 'attr', 'status_id', '1', '2'),
(212, 208, 'attr', 'status_id', '1', '2'),
(213, 209, 'attr', 'status_id', '1', '2'),
(214, 210, 'attr', 'status_id', '1', '3'),
(215, 211, 'attr', 'status_id', '1', '3'),
(216, 212, 'attr', 'status_id', '1', '2'),
(217, 213, 'attr', 'status_id', '3', '2'),
(218, 214, 'attr', 'assigned_to_id', '7', '5'),
(219, 215, 'attr', 'status_id', '2', '3'),
(220, 218, 'attr', 'status_id', '1', '2'),
(221, 220, 'attr', 'status_id', '3', '5'),
(222, 221, 'attr', 'status_id', '3', '5'),
(223, 222, 'attr', 'status_id', '3', '5'),
(224, 223, 'attr', 'status_id', '3', '5'),
(225, 225, 'attr', 'assigned_to_id', '5', '7'),
(226, 226, 'attr', 'status_id', '4', '3'),
(227, 227, 'attr', 'status_id', '4', '3'),
(228, 228, 'attr', 'status_id', '3', '5'),
(229, 229, 'attr', 'status_id', '3', '5'),
(230, 230, 'attr', 'status_id', '2', '3'),
(231, 233, 'attr', 'status_id', '4', '2'),
(232, 234, 'attr', 'status_id', '3', '5'),
(233, 236, 'attr', 'status_id', '2', '3'),
(234, 237, 'attr', 'status_id', '3', '5'),
(235, 239, 'attr', 'subject', '앱버전 관리', '[TC_AP001_001]앱버전 관리'),
(236, 240, 'attr', 'subject', '등록된 디바이스가 없는 공간명도 메인에 나와야함', '등록된 디바이스가 없는 공간은 공간별리스트에 나오지 않음'),
(237, 241, 'attr', 'description', '카카오계정에서 간헐적으로 로그아웃 안되는 현상 있음', '카카오계정에서 간헐적으로 로그아웃 안되는 현상 있음\r\n\r\n앱데이터 삭제후 정상 로그아웃 진행됨'),
(238, 242, 'attr', 'subject', '[TC_AP001_001]앱버전 관리', '[TC_AP001_001] 앱버전 관리'),
(239, 243, 'attr', 'status_id', '1', '3'),
(240, 244, 'attr', 'status_id', '1', '3'),
(241, 245, 'attr', 'status_id', '1', '3'),
(242, 246, 'attr', 'status_id', '2', '3'),
(243, 247, 'attr', 'status_id', '3', '5'),
(244, 248, 'attr', 'status_id', '3', '5'),
(245, 249, 'attr', 'status_id', '3', '2'),
(246, 250, 'attr', 'status_id', '2', '3'),
(247, 251, 'attr', 'status_id', '1', '2'),
(248, 252, 'attr', 'status_id', '3', '4'),
(249, 255, 'attr', 'status_id', '4', '3'),
(250, 256, 'attr', 'status_id', '2', '3'),
(251, 257, 'attr', 'status_id', '2', '3'),
(252, 258, 'attr', 'status_id', '2', '3'),
(253, 259, 'attr', 'status_id', '1', '3'),
(254, 260, 'attr', 'status_id', '2', '3'),
(255, 261, 'attr', 'status_id', '3', '5'),
(256, 262, 'attr', 'status_id', '3', '5'),
(257, 263, 'attr', 'status_id', '3', '5'),
(258, 264, 'attr', 'status_id', '3', '5'),
(259, 265, 'attr', 'status_id', '3', '5'),
(260, 266, 'attr', 'status_id', '3', '5'),
(261, 267, 'attr', 'status_id', '3', '5'),
(262, 268, 'attr', 'status_id', '3', '5'),
(263, 269, 'attr', 'status_id', '1', '3'),
(264, 270, 'attr', 'status_id', '1', '5'),
(265, 271, 'attr', 'status_id', '1', '3'),
(266, 272, 'attr', 'status_id', '4', '3'),
(267, 273, 'attr', 'status_id', '3', '5'),
(268, 274, 'attr', 'status_id', '3', '5'),
(269, 275, 'attr', 'status_id', '2', '3'),
(270, 276, 'attr', 'status_id', '1', '3'),
(271, 278, 'attr', 'status_id', '3', '5'),
(272, 279, 'attr', 'status_id', '3', '5'),
(273, 280, 'attr', 'status_id', '3', '5'),
(274, 281, 'attr', 'status_id', '4', '5'),
(275, 282, 'attr', 'status_id', '1', '4'),
(276, 283, 'attr', 'assigned_to_id', '7', '8'),
(277, 284, 'attr', 'assigned_to_id', NULL, '7'),
(278, 285, 'attr', 'status_id', '1', '5'),
(279, 286, 'attr', 'status_id', '1', '4'),
(280, 287, 'attr', 'status_id', '4', '5'),
(281, 288, 'attr', 'status_id', '4', '5'),
(282, 289, 'attr', 'status_id', '4', '5'),
(283, 291, 'attr', 'status_id', '2', '5'),
(284, 292, 'attr', 'status_id', '1', '5'),
(285, 294, 'attr', 'status_id', '4', '5'),
(286, 295, 'attr', 'project_id', '7', '8'),
(287, 296, 'attr', 'project_id', '7', '8'),
(288, 296, 'attr', 'category_id', '9', NULL),
(289, 297, 'relation', 'copied_to', NULL, '117'),
(290, 298, 'relation', 'copied_from', NULL, '116'),
(291, 299, 'attr', 'status_id', '1', '3'),
(292, 300, 'attr', 'assigned_to_id', '1', '7'),
(293, 301, 'attr', 'status_id', '4', '3'),
(294, 302, 'attr', 'status_id', '4', '3'),
(295, 303, 'attr', 'priority_id', '2', '1'),
(296, 304, 'attr', 'status_id', '4', '6'),
(297, 305, 'attr', 'status_id', '6', '1'),
(298, 306, 'attr', 'status_id', '1', '3'),
(299, 307, 'attr', 'status_id', '1', '2'),
(300, 308, 'attr', 'status_id', '3', '5'),
(301, 309, 'attr', 'status_id', '3', '5'),
(302, 310, 'attr', 'status_id', '3', '5'),
(303, 312, 'attr', 'status_id', '1', '2'),
(304, 313, 'attr', 'status_id', '1', '3'),
(305, 314, 'attr', 'status_id', '4', '3'),
(306, 317, 'attr', 'description', '스페셜모드1, 스페셜모드2, 풍량모드 3개의 모드가 있으며 택1로 설정할수 있음\r\n\r\n* 모드 변경시 대시보드 처리할 사항\r\n  - 스페셜모드1, 스페셜모드2, 풍량모드 각각 선택시 해당 모드 아이콘으로 대시보드 표시\r\n  - 스페셜모드1,2 선택시 모드명 표시\r\n  - 풍량모드 선택시 풍량만 표시\r\n\r\n* 모드 변경시 상세페이지 처리할 사항\r\n  - \"풍량모드\" 표시\r\n  - 풍량바 앞에 라디오 버튼\r\n  - 스페셜모드1,2 중에 선택되어 있을때 풍량모드 라디오 버튼은 선택해제 되며 풍량바는 Disable 처리\r\n  - 풍량모드 선택시 스페셜모드1,2 에 선택된것 있으면 사라지게 처리\r\n\r\n기획서 다시 업데이트 해서 공유하겠습니다.\r\n  ', '스페셜모드1, 스페셜모드2, 풍량모드 3개의 모드가 있으며 택1로 설정할수 있음\r\n스페셜모드1의 환기모드는 삭제됨\r\n\r\n* 모드 변경시 대시보드 처리할 사항\r\n  - 스페셜모드1, 스페셜모드2, 풍량모드 각각 선택시 해당 모드 아이콘으로 대시보드 표시\r\n  - 스페셜모드1,2 선택시 모드명 표시\r\n  - 풍량모드 선택시 풍량만 표시\r\n\r\n* 모드 변경시 상세페이지 처리할 사항\r\n  - \"풍량모드\" 표시\r\n  - 풍량바 앞에 라디오 버튼\r\n  - 스페셜모드1,2 중에 선택되어 있을때 풍량모드 라디오 버튼은 선택해제 되며 풍량바는 Disable 처리\r\n  - 풍량모드 선택시 스페셜모드1,2 에 선택된것 있으면 사라지게 처리\r\n\r\n기획서 다시 업데이트 해서 공유하겠습니다.\r\n  '),
(307, 318, 'attr', 'status_id', '3', '5'),
(308, 319, 'attr', 'status_id', '3', '5'),
(309, 320, 'attr', 'status_id', '3', '5'),
(310, 321, 'attr', 'status_id', '1', '5'),
(311, 322, 'attr', 'status_id', '1', '5'),
(312, 323, 'attr', 'assigned_to_id', '6', '5'),
(313, 324, 'attr', 'status_id', '2', '5'),
(314, 325, 'attr', 'status_id', '1', '5'),
(315, 326, 'attr', 'status_id', '1', '5'),
(316, 327, 'attr', 'subject', '[ 환결설정 ][ 홈쉐어링 ] 안내 문구 필요', '[ 환경설정 ][ 홈쉐어링 ] 안내 문구 필요'),
(317, 328, 'attr', 'assigned_to_id', NULL, '7'),
(318, 329, 'attr', 'assigned_to_id', NULL, '7'),
(319, 331, 'attr', 'status_id', '1', '2'),
(320, 332, 'attachment', '64', NULL, '쉐어링 중복 등록.png'),
(321, 334, 'attr', 'status_id', '2', '3'),
(322, 335, 'attr', 'status_id', '4', '5'),
(323, 336, 'attr', 'status_id', '3', '5'),
(324, 337, 'attr', 'status_id', '4', '5');

-- --------------------------------------------------------

--
-- 테이블 구조 `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `created_on` datetime DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `members`
--

INSERT INTO `members` (`id`, `user_id`, `project_id`, `created_on`, `mail_notification`) VALUES
(1, 1, 1, '2020-06-08 00:36:23', 0),
(4, 5, 1, '2020-06-08 08:02:27', 0),
(5, 6, 1, '2020-06-08 08:02:27', 0),
(6, 7, 1, '2020-06-09 00:43:56', 0),
(39, 7, 7, '2020-08-21 01:55:14', 0),
(40, 1, 7, '2020-08-21 01:55:14', 0),
(41, 6, 7, '2020-08-21 01:55:14', 0),
(42, 5, 7, '2020-08-21 01:55:14', 0),
(43, 8, 7, '2020-08-21 02:01:35', 0),
(44, 9, 7, '2020-09-04 01:20:52', 0),
(45, 8, 8, '2020-09-10 04:28:22', 0),
(46, 9, 8, '2020-09-10 04:28:22', 0),
(47, 7, 8, '2020-09-10 04:28:22', 0),
(48, 6, 8, '2020-09-10 04:28:22', 0),
(49, 5, 8, '2020-09-10 04:28:22', 0),
(50, 1, 8, '2020-09-10 04:28:31', 0);

-- --------------------------------------------------------

--
-- 테이블 구조 `member_roles`
--

CREATE TABLE `member_roles` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inherited_from` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `member_roles`
--

INSERT INTO `member_roles` (`id`, `member_id`, `role_id`, `inherited_from`) VALUES
(1, 1, 3, NULL),
(2, 1, 4, NULL),
(3, 1, 5, NULL),
(8, 4, 4, NULL),
(9, 4, 5, NULL),
(10, 5, 4, NULL),
(11, 5, 5, NULL),
(12, 6, 4, NULL),
(13, 6, 5, NULL),
(84, 39, 4, NULL),
(85, 39, 5, NULL),
(86, 40, 4, NULL),
(87, 40, 5, NULL),
(88, 41, 4, NULL),
(89, 41, 5, NULL),
(90, 42, 4, NULL),
(91, 42, 5, NULL),
(92, 40, 3, NULL),
(93, 43, 5, NULL),
(94, 44, 4, NULL),
(95, 44, 5, NULL),
(96, 45, 4, NULL),
(97, 45, 5, NULL),
(98, 46, 4, NULL),
(99, 46, 5, NULL),
(100, 47, 4, NULL),
(101, 47, 5, NULL),
(102, 48, 4, NULL),
(103, 48, 5, NULL),
(104, 49, 4, NULL),
(105, 49, 5, NULL),
(106, 50, 3, NULL),
(107, 50, 4, NULL),
(108, 50, 5, NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `board_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `replies_count` int(11) NOT NULL DEFAULT 0,
  `last_reply_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT 0,
  `sticky` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `messages`
--

INSERT INTO `messages` (`id`, `board_id`, `parent_id`, `subject`, `content`, `author_id`, `replies_count`, `last_reply_id`, `created_on`, `updated_on`, `locked`, `sticky`) VALUES
(3, 1, NULL, '레드마인 오픈', 'h1. *레드마인 오픈*', 1, 0, NULL, '2020-06-09 01:00:04', '2020-06-09 01:00:59', 0, 0);

-- --------------------------------------------------------

--
-- 테이블 구조 `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `created_on` datetime DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `news`
--

INSERT INTO `news` (`id`, `project_id`, `title`, `summary`, `description`, `author_id`, `created_on`, `comments_count`) VALUES
(1, 1, '전기레인지 시료 설치', '', '3층 연구실에 전기레인지 시료 2종 설치\r\n\r\n3구 하이브리드\r\n3구 인덕션', 1, '2020-06-09 00:14:28', 0),
(4, 1, '프로젝트 산출물 업로드 금지', '프로젝트 산출물 업로드 금지', '외부서버라서 자료유출에 대한 이슈가 있을수 있으니\r\n\r\n프로젝트 내부자료는 가급적 올리지 말아주세요', 1, '2020-06-09 04:47:48', 0);

-- --------------------------------------------------------

--
-- 테이블 구조 `open_id_authentication_associations`
--

CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL,
  `issued` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assoc_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_url` blob DEFAULT NULL,
  `secret` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `open_id_authentication_nonces`
--

CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- 테이블의 덤프 데이터 `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('redmine_user', '[{\"db\":\"redmine\",\"table\":\"issues\"}]');

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- 테이블의 덤프 데이터 `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('redmine_user', '2020-11-15 06:14:07', '{\"lang\":\"ko\",\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

-- --------------------------------------------------------

--
-- 테이블 구조 `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `homepage` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `inherit_members` tinyint(1) NOT NULL DEFAULT 0,
  `default_version_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `homepage`, `is_public`, `parent_id`, `created_on`, `updated_on`, `identifier`, `status`, `lft`, `rgt`, `inherit_members`, `default_version_id`) VALUES
(1, 'ZIN Home IoT', '', '', 1, NULL, '2020-06-08 00:35:40', '2020-06-08 00:35:40', 'zin-home-iot', 1, 1, 2, 0, NULL),
(7, 'ZIN Home IoT 통합테스트', '', '', 0, NULL, '2020-08-21 01:54:36', '2020-08-21 01:54:36', 'zin-home-iot-test', 1, 5, 6, 0, NULL),
(8, 'ZIN Home IoT 2차', '', '', 0, NULL, '2020-09-10 04:27:48', '2020-09-10 04:27:48', 'zin-home-iot-2', 1, 3, 4, 0, NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `projects_trackers`
--

CREATE TABLE `projects_trackers` (
  `project_id` int(11) NOT NULL DEFAULT 0,
  `tracker_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `projects_trackers`
--

INSERT INTO `projects_trackers` (`project_id`, `tracker_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(7, 1),
(7, 2),
(7, 5),
(7, 6),
(7, 7),
(8, 1),
(8, 2),
(8, 5),
(8, 7);

-- --------------------------------------------------------

--
-- 테이블 구조 `queries`
--

CREATE TABLE `queries` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filters` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `column_names` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_criteria` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility` int(11) DEFAULT 0,
  `options` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `queries`
--

INSERT INTO `queries` (`id`, `project_id`, `name`, `filters`, `user_id`, `column_names`, `sort_criteria`, `group_by`, `type`, `visibility`, `options`) VALUES
(1, NULL, '상태별 그룹', '---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nassigned_to_id:\n  :operator: \"=\"\n  :values:\n  - \'5\'\n', 5, NULL, NULL, 'status', 'IssueQuery', 0, '---\n:totalable_names: []\n:draw_relations: \n:draw_progress_line: \n'),
(3, 7, '개선사항', '---\nstatus_id:\n  :operator: \"*\"\n  :values:\n  - \'\'\ntracker_id:\n  :operator: \"=\"\n  :values:\n  - \'7\'\n', 1, NULL, NULL, '', 'IssueQuery', 2, '---\n:totalable_names: []\n:draw_relations: \n:draw_progress_line: \n'),
(4, 7, '결함완료', '---\nstatus_id:\n  :operator: \"=\"\n  :values:\n  - \'5\'\ntracker_id:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n', 1, NULL, NULL, '', 'IssueQuery', 2, '---\n:totalable_names: []\n:draw_relations: \n:draw_progress_line: \n'),
(5, 7, '추가검토건', '---\ntracker_id:\n  :operator: \"=\"\n  :values:\n  - \'2\'\n  - \'5\'\n', 1, NULL, NULL, '', 'IssueQuery', 2, '---\n:totalable_names: []\n:draw_relations: \n:draw_progress_line: \n'),
(6, 7, '결함미완료', '---\nstatus_id:\n  :operator: \"!\"\n  :values:\n  - \'3\'\n  - \'5\'\n  - \'6\'\ntracker_id:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n', 1, NULL, NULL, '', 'IssueQuery', 2, '---\n:totalable_names: []\n:draw_relations: \n:draw_progress_line: \n'),
(7, 7, '미해결', '---\nstatus_id:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n  - \'2\'\n  - \'4\'\n  - \'7\'\ntracker_id:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n  - \'2\'\n  - \'5\'\n  - \'7\'\n', 1, NULL, NULL, '', 'IssueQuery', 2, '---\n:totalable_names: []\n:draw_relations: \n:draw_progress_line: \n'),
(8, 7, '해결건', '---\nstatus_id:\n  :operator: \"=\"\n  :values:\n  - \'3\'\n', 1, NULL, NULL, '', 'IssueQuery', 0, '---\n:totalable_names: []\n:draw_relations: \n:draw_progress_line: \n');

-- --------------------------------------------------------

--
-- 테이블 구조 `queries_roles`
--

CREATE TABLE `queries_roles` (
  `query_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `repositories`
--

CREATE TABLE `repositories` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `login` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `root_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path_encoding` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_encoding` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra_info` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `created_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) DEFAULT NULL,
  `assignable` tinyint(1) DEFAULT 1,
  `builtin` int(11) NOT NULL DEFAULT 0,
  `permissions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `issues_visibility` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `users_visibility` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `time_entries_visibility` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `all_roles_managed` tinyint(1) NOT NULL DEFAULT 1,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `roles`
--

INSERT INTO `roles` (`id`, `name`, `position`, `assignable`, `builtin`, `permissions`, `issues_visibility`, `users_visibility`, `time_entries_visibility`, `all_roles_managed`, `settings`) VALUES
(1, 'Non member', 0, 1, 1, NULL, 'default', 'all', 'all', 1, '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),
(2, 'Anonymous', 0, 1, 2, NULL, 'default', 'all', 'all', 1, '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),
(3, '관리자', 1, 1, 0, '---\n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :manage_boards\n- :view_calendar\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :manage_public_queries\n- :save_queries\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :manage_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :protect_wiki_pages\n- :manage_wiki\n', 'all', 'all', 'all', 1, '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),
(4, '개발자', 2, 1, 0, '---\n- :manage_versions\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :view_private_notes\n- :set_notes_private\n- :manage_issue_relations\n- :manage_subtasks\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :manage_files\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n', 'default', 'all', 'all', 1, NULL),
(5, '보고자', 3, 1, 0, '---\n- :add_messages\n- :edit_own_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :add_issue_notes\n- :save_queries\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :view_time_entries\n- :log_time\n- :view_wiki_pages\n- :view_wiki_edits\n', 'default', 'all', 'all', 1, '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n');

-- --------------------------------------------------------

--
-- 테이블 구조 `roles_managed_roles`
--

CREATE TABLE `roles_managed_roles` (
  `role_id` int(11) NOT NULL,
  `managed_role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('1'),
('10'),
('100'),
('101'),
('102'),
('103'),
('104'),
('105'),
('106'),
('107'),
('108'),
('11'),
('12'),
('13'),
('14'),
('15'),
('16'),
('17'),
('18'),
('19'),
('2'),
('20'),
('20090214190337'),
('20090312172426'),
('20090312194159'),
('20090318181151'),
('20090323224724'),
('20090401221305'),
('20090401231134'),
('20090403001910'),
('20090406161854'),
('20090425161243'),
('20090503121501'),
('20090503121505'),
('20090503121510'),
('20090614091200'),
('20090704172350'),
('20090704172355'),
('20090704172358'),
('20091010093521'),
('20091017212227'),
('20091017212457'),
('20091017212644'),
('20091017212938'),
('20091017213027'),
('20091017213113'),
('20091017213151'),
('20091017213228'),
('20091017213257'),
('20091017213332'),
('20091017213444'),
('20091017213536'),
('20091017213642'),
('20091017213716'),
('20091017213757'),
('20091017213835'),
('20091017213910'),
('20091017214015'),
('20091017214107'),
('20091017214136'),
('20091017214236'),
('20091017214308'),
('20091017214336'),
('20091017214406'),
('20091017214440'),
('20091017214519'),
('20091017214611'),
('20091017214644'),
('20091017214720'),
('20091017214750'),
('20091025163651'),
('20091108092559'),
('20091114105931'),
('20091123212029'),
('20091205124427'),
('20091220183509'),
('20091220183727'),
('20091220184736'),
('20091225164732'),
('20091227112908'),
('20100129193402'),
('20100129193813'),
('20100221100219'),
('20100313132032'),
('20100313171051'),
('20100705164950'),
('20100819172912'),
('20101104182107'),
('20101107130441'),
('20101114115114'),
('20101114115359'),
('20110220160626'),
('20110223180944'),
('20110223180953'),
('20110224000000'),
('20110226120112'),
('20110226120132'),
('20110227125750'),
('20110228000000'),
('20110228000100'),
('20110401192910'),
('20110408103312'),
('20110412065600'),
('20110511000000'),
('20110902000000'),
('20111201201315'),
('20120115143024'),
('20120115143100'),
('20120115143126'),
('20120127174243'),
('20120205111326'),
('20120223110929'),
('20120301153455'),
('20120422150750'),
('20120705074331'),
('20120707064544'),
('20120714122000'),
('20120714122100'),
('20120714122200'),
('20120731164049'),
('20120930112914'),
('20121026002032'),
('20121026003537'),
('20121209123234'),
('20121209123358'),
('20121212125001-redmine_custom_reports'),
('20121212125002-redmine_custom_reports'),
('20121212125003-redmine_custom_reports'),
('20121213084931'),
('20130110122628'),
('20130201184705'),
('20130202090625'),
('20130207175206'),
('20130207181455'),
('20130215073721'),
('20130215111127'),
('20130215111141'),
('20130217094251'),
('20130602092539'),
('20130710182539'),
('20130713104233'),
('20130713111657'),
('20130729070143'),
('20130911193200'),
('20131004113137'),
('20131005100610'),
('20131124175346'),
('20131210180802'),
('20131214094309'),
('20131215104612'),
('20131218183023'),
('20140228130325'),
('20140903143914'),
('20140920094058'),
('20141029181752'),
('20141029181824'),
('20141109112308'),
('20141122124142'),
('20150113194759'),
('20150113211532'),
('20150113213922'),
('20150113213955'),
('20150208105930'),
('20150510083747'),
('20150525103953'),
('20150526183158'),
('20150528084820'),
('20150528092912'),
('20150528093249'),
('20150725112753'),
('20150730122707'),
('20150730122735'),
('20150921204850'),
('20150921210243'),
('20151020182334'),
('20151020182731'),
('20151021184614'),
('20151021185456'),
('20151021190616'),
('20151024082034'),
('20151025072118'),
('20151031095005'),
('20160404080304'),
('20160416072926'),
('20160529063352'),
('21'),
('22'),
('23'),
('24'),
('25'),
('26'),
('27'),
('28'),
('29'),
('3'),
('30'),
('31'),
('32'),
('33'),
('34'),
('35'),
('36'),
('37'),
('38'),
('39'),
('4'),
('40'),
('41'),
('42'),
('43'),
('44'),
('45'),
('46'),
('47'),
('48'),
('49'),
('5'),
('50'),
('51'),
('52'),
('53'),
('54'),
('55'),
('56'),
('57'),
('58'),
('59'),
('6'),
('60'),
('61'),
('62'),
('63'),
('64'),
('65'),
('66'),
('67'),
('68'),
('69'),
('7'),
('70'),
('71'),
('72'),
('73'),
('74'),
('75'),
('76'),
('77'),
('78'),
('79'),
('8'),
('80'),
('81'),
('82'),
('83'),
('84'),
('85'),
('86'),
('87'),
('88'),
('89'),
('9'),
('90'),
('91'),
('92'),
('93'),
('94'),
('95'),
('96'),
('97'),
('98'),
('99');

-- --------------------------------------------------------

--
-- 테이블 구조 `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `updated_on`) VALUES
(1, 'mail_from', 'Redmine Admin', '2020-06-09 00:22:18'),
(2, 'bcc_recipients', '1', '2020-06-08 07:37:36'),
(3, 'plain_text_mail', '0', '2020-06-08 07:37:36'),
(4, 'default_notification_option', 'only_my_events', '2020-06-08 07:37:37'),
(5, 'notified_events', '---\n- issue_added\n- issue_updated\n- news_added\n- document_added\n- file_added\n- message_posted\n', '2020-06-09 00:19:00'),
(6, 'emails_header', '', '2020-06-08 07:37:38'),
(7, 'emails_footer', 'You have received this notification because you have either subscribed to it, or are involved in it.\r\nTo change your notification preferences, please click here: http://hostname/my/account', '2020-06-08 07:37:38'),
(8, 'app_title', 'Redmine', '2020-06-08 08:10:27'),
(9, 'welcome_text', '', '2020-06-08 08:10:27'),
(10, 'per_page_options', '25,50,100', '2020-06-08 08:10:27'),
(11, 'search_results_per_page', '10', '2020-06-08 08:10:28'),
(12, 'activity_days_default', '30', '2020-06-08 08:10:28'),
(13, 'host_name', 'http://heungs.synology.me:8080', '2020-06-08 08:10:36'),
(14, 'protocol', 'http', '2020-06-08 08:10:28'),
(15, 'text_formatting', 'textile', '2020-06-08 08:10:28'),
(16, 'cache_formatted_text', '0', '2020-06-08 08:10:28'),
(17, 'wiki_compression', '', '2020-06-08 08:10:28'),
(18, 'feeds_limit', '15', '2020-06-08 08:10:28'),
(19, 'ui_theme', 'PurpleMine2-master', '2020-06-08 23:41:42'),
(20, 'default_language', 'en', '2020-08-26 00:49:08'),
(21, 'force_default_language_for_anonymous', '0', '2020-06-08 08:16:18'),
(22, 'force_default_language_for_loggedin', '0', '2020-06-08 08:16:18'),
(23, 'start_of_week', '', '2020-06-08 08:16:19'),
(24, 'date_format', '', '2020-06-08 08:16:19'),
(25, 'time_format', '', '2020-06-08 08:16:19'),
(26, 'user_format', 'lastname_firstname', '2020-06-08 10:15:44'),
(27, 'gravatar_enabled', '1', '2020-08-26 00:50:16'),
(28, 'gravatar_default', '', '2020-06-08 08:16:20'),
(29, 'thumbnails_enabled', '0', '2020-06-08 08:16:20'),
(30, 'thumbnails_size', '100', '2020-06-08 08:16:20'),
(31, 'new_item_menu_tab', '2', '2020-06-08 08:16:21'),
(32, 'enabled_scm', '---\n- Subversion\n- Darcs\n- Mercurial\n- Cvs\n- Bazaar\n- Git\n', '2020-06-08 08:20:59'),
(33, 'autofetch_changesets', '1', '2020-06-08 08:20:59'),
(34, 'sys_api_enabled', '0', '2020-06-08 08:20:59'),
(35, 'repository_log_display_limit', '100', '2020-06-08 08:20:59'),
(36, 'commit_ref_keywords', 'refs,references,IssueID', '2020-06-08 08:20:59'),
(37, 'commit_cross_project_ref', '0', '2020-06-08 08:20:59'),
(38, 'commit_logtime_enabled', '0', '2020-06-08 08:20:59'),
(39, 'commit_update_keywords', '--- []\n', '2020-06-08 08:20:59'),
(40, 'login_required', '1', '2020-06-09 00:30:38'),
(41, 'autologin', '0', '2020-06-09 00:30:38'),
(42, 'self_registration', '2', '2020-06-09 00:30:38'),
(43, 'unsubscribe', '1', '2020-06-09 00:30:38'),
(44, 'password_min_length', '8', '2020-06-09 00:30:39'),
(45, 'password_max_age', '0', '2020-06-09 00:30:39'),
(46, 'lost_password', '1', '2020-06-09 00:30:39'),
(47, 'max_additional_emails', '5', '2020-06-09 00:30:39'),
(48, 'openid', '0', '2020-06-09 00:30:40'),
(49, 'session_lifetime', '0', '2020-06-09 00:30:40'),
(50, 'session_timeout', '0', '2020-06-09 00:30:40'),
(51, 'default_users_hide_mail', '1', '2020-06-09 00:30:42'),
(52, 'default_projects_public', '0', '2020-06-09 00:31:08'),
(53, 'default_projects_modules', '---\n- issue_tracking\n- time_tracking\n- news\n- documents\n- files\n- wiki\n- repository\n- boards\n- calendar\n- gantt\n', '2020-06-09 00:31:09'),
(54, 'default_projects_tracker_ids', '--- []\n', '2020-06-09 00:31:10'),
(55, 'sequential_project_identifiers', '0', '2020-06-09 00:31:10'),
(56, 'cross_project_issue_relations', '0', '2020-08-27 02:37:38'),
(57, 'link_copied_issue', 'ask', '2020-08-27 02:37:38'),
(58, 'cross_project_subtasks', 'tree', '2020-08-27 02:37:38'),
(59, 'issue_group_assignment', '0', '2020-08-27 02:37:38'),
(60, 'default_issue_start_date_to_creation_date', '1', '2020-08-27 02:37:38'),
(61, 'display_subprojects_issues', '1', '2020-08-27 02:37:38'),
(62, 'issue_done_ratio', 'issue_field', '2020-08-27 02:37:38'),
(63, 'non_working_week_days', '---\n- \'6\'\n- \'7\'\n', '2020-08-27 02:37:39'),
(64, 'issues_export_limit', '500', '2020-08-27 02:37:39'),
(65, 'gantt_items_limit', '500', '2020-08-27 02:37:39'),
(66, 'parent_issue_dates', 'derived', '2020-08-27 02:37:39'),
(67, 'parent_issue_priority', 'derived', '2020-08-27 02:37:39'),
(68, 'parent_issue_done_ratio', 'derived', '2020-08-27 02:37:40'),
(69, 'issue_list_default_columns', '---\n- category\n- tracker\n- status\n- priority\n- subject\n- assigned_to\n- updated_on\n', '2020-08-27 02:37:40'),
(70, 'issue_list_default_totals', '--- []\n', '2020-08-27 02:37:40');

-- --------------------------------------------------------

--
-- 테이블 구조 `time_entries`
--

CREATE TABLE `time_entries` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int(11) NOT NULL,
  `tmonth` int(11) NOT NULL,
  `tweek` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `action`, `value`, `created_on`, `updated_on`) VALUES
(5, 1, 'feeds', 'f4595f543987462ec18d198e05c82ecee31028f8', '2020-06-08 00:32:27', '2020-06-08 00:32:27'),
(19, 6, 'feeds', '4cca9a997ddbcc807e8cf3ddc2ad354b87c7c227', '2020-06-08 09:27:48', '2020-06-08 09:27:48'),
(30, 5, 'feeds', 'd0daeff32098e183e460822d5ab19ae9990a7c93', '2020-06-08 22:09:43', '2020-06-08 22:09:43'),
(47, 7, 'feeds', '8f7b00ce5b15b369e435cca90d4c02ee2d21ea25', '2020-06-09 05:01:34', '2020-06-09 05:01:34'),
(124, 8, 'session', '9ddd906e45e9525036615a42b77e8cc7e2cb5725', '2020-08-24 05:10:31', '2020-08-24 08:21:31'),
(125, 8, 'feeds', '2778b082a86b405277caddd51f81bedba238df26', '2020-08-24 05:12:02', '2020-08-24 05:12:02'),
(136, 8, 'session', 'c5813c9364eb4b9213b76201a7d5cc35bda73159', '2020-08-26 04:40:37', '2020-08-26 05:07:30'),
(143, 8, 'session', '9dd217ad715505cdb21ac9c4206c4e3d26eadce1', '2020-08-27 01:34:14', '2020-08-27 01:48:47'),
(148, 6, 'session', '1ee7a5d15cca58a07d2c62c29575e1dbc410f6e0', '2020-08-27 07:08:45', '2020-08-27 07:10:34'),
(150, 8, 'session', 'ae3883ad2fa35bf934a6b3dcc04a82b0cddf89df', '2020-08-27 23:45:48', '2020-08-27 23:51:57'),
(156, 6, 'session', 'c92fedb75e8541c18ac648a46ce64856fb5b5b03', '2020-08-30 23:26:10', '2020-08-31 11:22:53'),
(158, 8, 'session', '11a8a895a43f4e9c711aee0d6b83308e150c802e', '2020-08-30 23:53:44', '2020-08-31 08:50:14'),
(168, 6, 'session', '94ee0e99de9b6eb62c68e6dc49dd0e54af7840a6', '2020-09-01 07:50:40', '2020-09-01 10:02:18'),
(170, 5, 'session', '5b0ec90fb97a16c6df8ad34b1c66ffb3c64f07c6', '2020-09-01 23:10:01', '2020-09-01 23:43:38'),
(172, 6, 'session', 'a9906b32b7d95d9e78c6e88c192513d326f98102', '2020-09-02 03:53:01', '2020-09-02 03:53:21'),
(173, 5, 'session', 'ebcbdeac4451c26eed61249f6ae9b341e45e32be', '2020-09-02 08:18:06', '2020-09-02 11:04:38'),
(176, 8, 'session', 'fb9577cb793eb0355c2f80b5cc34f3ac4fcd0024', '2020-09-03 00:53:57', '2020-09-03 01:36:13'),
(180, 5, 'session', 'fd2186189a0e99d9d195abfcd70defa783691ef0', '2020-09-03 09:41:23', '2020-09-03 09:42:10'),
(186, 9, 'feeds', '1fd7c994da695241c6ee48057edef9b6573f7116', '2020-09-04 01:08:17', '2020-09-04 01:08:17'),
(187, 8, 'session', '2f37cda0015ed87a236c465acec700213fe565f6', '2020-09-04 06:44:11', '2020-09-04 07:01:36'),
(190, 8, 'session', 'b973c5c3a868150d954deb40199c1acc2a304369', '2020-09-06 23:44:25', '2020-09-07 00:55:40'),
(198, 5, 'session', '1bc02e7fc4fa9d4e1b376183375ce723107d5a03', '2020-09-10 23:26:21', '2020-09-10 23:36:25'),
(202, 8, 'session', '27d768924fbc01f740004ed3bcef30d1c7f94e10', '2020-09-14 02:04:04', '2020-09-14 02:25:34'),
(203, 6, 'session', 'be98bf3a8fc1e5c42fb62c59c02543aaf4f2936c', '2020-09-14 02:21:17', '2020-09-14 03:00:51'),
(204, 6, 'session', '9abbf170ce060e9cc2927f00ea2791439e7902b2', '2020-09-14 02:22:45', '2020-09-14 05:15:07'),
(207, 6, 'session', '32038703aca3b1cf963c18f5eb240ac1fb2d7617', '2020-09-15 23:34:20', '2020-09-15 23:34:38'),
(211, 6, 'session', 'b00325a5e255824a2ef31b196e39311f30fbed12', '2020-09-17 07:40:24', '2020-09-17 09:24:27'),
(215, 5, 'session', '34e5c94ef6b02b8bc7bc29bf382a10bb4356acf9', '2020-09-18 00:56:38', '2020-09-18 01:34:04'),
(217, 6, 'session', '5fdbc9cc7c77dbcfabc9e2443e790ffe037edf8a', '2020-09-20 23:37:35', '2020-09-20 23:37:42'),
(218, 6, 'session', 'c6b82670188721581c6253e8348bce1126af19d1', '2020-09-21 04:04:13', '2020-09-21 06:21:52'),
(219, 5, 'session', 'e161cae032cbb387e78bd200c0f7d1fea11b93a3', '2020-09-21 04:29:28', '2020-09-21 04:29:29'),
(232, 7, 'session', '4474315482e9afb5a34bd54c314180f0f934c042', '2020-09-28 05:03:08', '2020-09-28 05:05:14'),
(234, 7, 'session', '592f9ca305a5596e86a5c97a1e57e3f87e4c09c6', '2020-09-29 05:10:58', '2020-09-29 05:11:05'),
(235, 7, 'session', 'f886713b68177643f860f9c7dd6e0a1f97efd363', '2020-10-04 23:45:38', '2020-10-05 02:30:27'),
(237, 7, 'session', 'a9c00de2b80582e9d0803b7fd8d418420af00dc2', '2020-10-05 07:21:18', '2020-10-05 07:57:52'),
(241, 7, 'session', '3f11a99629e0aef78306ce0fea62a0948940a992', '2020-10-07 02:16:26', '2020-10-07 02:25:24'),
(243, 7, 'session', '793c9a0b1d672efc6b61196862b3e22b497cfe3c', '2020-10-08 06:10:45', '2020-10-08 06:10:50'),
(244, 7, 'session', 'cfff91bfaf692a2cee459f4347c8ed3f7b243e1b', '2020-10-12 05:48:15', '2020-10-12 05:48:16'),
(249, 9, 'session', '84f61e5ef0bfbeb34c4ebf60e05c19fac3bf9c78', '2020-10-21 04:05:56', '2020-10-21 06:32:14'),
(252, 5, 'session', '2528cec0658b9220f8be50596053f66e8580add6', '2020-10-21 06:28:28', '2020-10-21 06:31:03'),
(253, 7, 'session', 'f696b7bafbac4ed20da0f5ee17293e9c28772ae3', '2020-10-21 07:38:43', '2020-10-21 07:38:52'),
(254, 7, 'session', 'abc69e476fad5a9baeb1ac7e7117e249fd72d9e9', '2020-10-21 07:38:45', '2020-10-22 00:42:28'),
(255, 7, 'session', '97d954e78c0f9b394e36d425352958bda1a8c01c', '2020-10-21 07:39:12', '2020-10-23 04:22:46'),
(256, 5, 'session', 'b5890241c89361f50a8529de11e8f4c5c70f9b86', '2020-10-23 01:19:20', '2020-10-23 01:23:40'),
(257, 9, 'session', 'b7bad46d1eb8bdeb76c1363cd09c59a0da07fe2d', '2020-10-23 04:16:37', '2020-10-23 04:17:09'),
(259, 5, 'session', '9b3fb5261d1e629d4b8a3753ebb2082d610aaed9', '2020-10-23 04:23:15', '2020-10-23 04:25:40'),
(262, 5, 'session', '29b65ea92c7b7161bd45a93acc28e6864d1f7852', '2020-10-29 07:36:15', '2020-10-29 07:36:26'),
(267, 1, 'session', '4dd23e495b3d198f75d8f275a75436707a643d4f', '2020-11-15 06:21:48', '2020-11-15 06:22:09');

-- --------------------------------------------------------

--
-- 테이블 구조 `trackers`
--

CREATE TABLE `trackers` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_in_chlog` tinyint(1) NOT NULL DEFAULT 0,
  `position` int(11) DEFAULT NULL,
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT 1,
  `fields_bits` int(11) DEFAULT 0,
  `default_status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `trackers`
--

INSERT INTO `trackers` (`id`, `name`, `is_in_chlog`, `position`, `is_in_roadmap`, `fields_bits`, `default_status_id`) VALUES
(1, '결함', 1, 1, 0, 0, 1),
(2, '새기능', 1, 2, 1, 0, 1),
(3, '지원', 0, 3, 0, 0, 1),
(5, '검토', 0, 4, 1, 0, 1),
(6, '테스트', 0, 5, 1, 0, 1),
(7, '개선', 0, 6, 1, 0, 4),
(8, '산출물', 0, 7, 1, 0, 1);

-- --------------------------------------------------------

--
-- 테이블 구조 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hashed_password` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci DEFAULT '',
  `auth_source_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identity_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_notification` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `must_change_passwd` tinyint(1) NOT NULL DEFAULT 0,
  `passwd_changed_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `users`
--

INSERT INTO `users` (`id`, `login`, `hashed_password`, `firstname`, `lastname`, `admin`, `status`, `last_login_on`, `language`, `auth_source_id`, `created_on`, `updated_on`, `type`, `identity_url`, `mail_notification`, `salt`, `must_change_passwd`, `passwd_changed_on`) VALUES
(1, 'admin', 'acd249cdd97df3a66acd24f4c4f5d746aebb4f88', '주흥', '이', 1, 1, '2020-11-15 06:21:48', '', NULL, '2020-05-29 07:53:46', '2020-11-15 06:21:40', 'User', NULL, 'all', '53937c3a603321972ad77e045193df90', 0, '2020-11-15 06:21:40'),
(2, '', '', '', 'Anonymous users', 0, 1, NULL, '', NULL, '2020-05-29 08:01:40', '2020-05-29 08:01:40', 'GroupAnonymous', NULL, '', NULL, 0, NULL),
(3, '', '', '', 'Non member users', 0, 1, NULL, '', NULL, '2020-05-29 08:01:40', '2020-05-29 08:01:40', 'GroupNonMember', NULL, '', NULL, 0, NULL),
(4, '', '', '', 'Anonymous', 0, 0, NULL, '', NULL, '2020-06-07 05:29:08', '2020-06-07 05:29:08', 'AnonymousUser', NULL, 'only_my_events', NULL, 0, NULL),
(5, 'youngseungji', '760d2facc9ac9880b8d498a5fbcb9bce41b6a7b4', '영승', '지', 0, 1, '2020-10-29 07:36:15', 'ko', NULL, '2020-06-08 00:33:30', '2020-06-08 22:09:24', 'User', NULL, 'only_my_events', '00763ba30eb2401086d73bc185c0f33c', 0, '2020-06-08 22:09:24'),
(6, 'jtjeong', '962bb8f65d483af7a5ccfaf76fb8e50874b93353', '종태', '정', 0, 1, '2020-09-21 04:04:12', 'ko', NULL, '2020-06-08 00:34:12', '2020-08-21 09:29:44', 'User', NULL, 'only_my_events', 'a21d753bf8f914c18f438c43176ade1d', 0, '2020-08-21 09:29:44'),
(7, 'junghwan.son', '14397021a98a0884af7efa9f2ab5a8f77254dcc8', '정환', '손', 0, 1, '2020-10-21 07:39:12', '', NULL, '2020-06-09 00:42:39', '2020-09-21 05:10:06', 'User', NULL, 'only_my_events', 'ceaf9d43c467f4017c209243072a40f3', 0, '2020-09-21 05:10:06'),
(8, 'wlsdn', '6a708073997fdec7f7fcfdefbaf4d59b8bfc26f9', '진우', '김', 0, 1, '2020-09-14 02:04:04', 'ko', NULL, '2020-08-21 02:01:02', '2020-08-24 05:10:30', 'User', NULL, 'only_my_events', '6a065c7e79c87d60e784488671658ebc', 0, '2020-08-24 05:10:30'),
(9, 'lgsanghoon', 'fbb357a0af7d2d24dc968b34a88e369cebdb96fc', '상훈', '서', 0, 1, '2020-10-23 04:16:37', 'en', NULL, '2020-09-03 07:40:27', '2020-10-21 04:04:40', 'User', NULL, 'only_my_events', '0d1f29a527e0afdd5bf67284a7e1e983', 0, '2020-10-21 04:04:40');

-- --------------------------------------------------------

--
-- 테이블 구조 `user_preferences`
--

CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `others` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `hide_mail` tinyint(1) DEFAULT 1,
  `time_zone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `user_id`, `others`, `hide_mail`, `time_zone`) VALUES
(1, 1, '---\n:no_self_notified: \'1\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:gantt_zoom: 2\n:gantt_months: 6\n:my_page_layout:\n  top:\n  - issuesreportedbyme\n  - issuesassignedtome\n  left: []\n  right: []\n', 1, 'Seoul'),
(2, 5, '---\n:no_self_notified: \'1\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n', 1, 'Seoul'),
(3, 6, '---\n:no_self_notified: \'1\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n', 1, 'Seoul'),
(4, 7, '---\n:no_self_notified: \'1\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:gantt_zoom: 2\n:gantt_months: 6\n', 1, 'Seoul'),
(5, 8, '---\n:no_self_notified: \'1\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n', 1, ''),
(6, 9, '---\n:no_self_notified: \'1\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:activity_scope:\n- news\n- messages\n:gantt_zoom: 2\n:gantt_months: 6\n', 1, '');

-- --------------------------------------------------------

--
-- 테이블 구조 `versions`
--

CREATE TABLE `versions` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `wiki_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'open',
  `sharing` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `watchers`
--

CREATE TABLE `watchers` (
  `id` int(11) NOT NULL,
  `watchable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `watchable_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `watchers`
--

INSERT INTO `watchers` (`id`, `watchable_type`, `watchable_id`, `user_id`) VALUES
(1, 'Issue', 1, 1),
(2, 'Issue', 2, 1),
(3, 'News', 1, 1),
(8, 'Message', 3, 1),
(10, 'News', 4, 1),
(11, 'Issue', 4, 1),
(12, 'Issue', 9, 1),
(14, 'Issue', 11, 1),
(15, 'Issue', 11, 5),
(16, 'Issue', 12, 1),
(17, 'Issue', 48, 6),
(18, 'Issue', 48, 5),
(19, 'Issue', 70, 7),
(20, 'Issue', 70, 1);

-- --------------------------------------------------------

--
-- 테이블 구조 `wikis`
--

CREATE TABLE `wikis` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `start_page` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `wikis`
--

INSERT INTO `wikis` (`id`, `project_id`, `start_page`, `status`) VALUES
(1, 1, 'Wiki', 1),
(7, 7, 'Wiki', 1),
(8, 8, 'Wiki', 1);

-- --------------------------------------------------------

--
-- 테이블 구조 `wiki_contents`
--

CREATE TABLE `wiki_contents` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `wiki_content_versions`
--

CREATE TABLE `wiki_content_versions` (
  `id` int(11) NOT NULL,
  `wiki_content_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `data` longblob DEFAULT NULL,
  `compression` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `comments` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `wiki_pages`
--

CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT 0,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `wiki_redirects`
--

CREATE TABLE `wiki_redirects` (
  `id` int(11) NOT NULL,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirects_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `redirects_to_wiki_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `workflows`
--

CREATE TABLE `workflows` (
  `id` int(11) NOT NULL,
  `tracker_id` int(11) NOT NULL DEFAULT 0,
  `old_status_id` int(11) NOT NULL DEFAULT 0,
  `new_status_id` int(11) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `assignee` tinyint(1) NOT NULL DEFAULT 0,
  `author` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 테이블의 덤프 데이터 `workflows`
--

INSERT INTO `workflows` (`id`, `tracker_id`, `old_status_id`, `new_status_id`, `role_id`, `assignee`, `author`, `type`, `field_name`, `rule`) VALUES
(1, 1, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(2, 1, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(3, 1, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(4, 1, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(5, 1, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(6, 1, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(7, 1, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(8, 1, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(9, 1, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(10, 1, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(11, 1, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(12, 1, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(13, 1, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(14, 1, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(15, 1, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(16, 1, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(17, 1, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(18, 1, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(19, 1, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(20, 1, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(21, 1, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(22, 1, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(23, 1, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(24, 1, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(25, 1, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(26, 1, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(27, 1, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(28, 1, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(29, 1, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(30, 1, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(31, 2, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(32, 2, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(33, 2, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(34, 2, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(35, 2, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(36, 2, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(37, 2, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(38, 2, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(39, 2, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(40, 2, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(41, 2, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(42, 2, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(43, 2, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(44, 2, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(45, 2, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(46, 2, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(47, 2, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(48, 2, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(49, 2, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(50, 2, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(51, 2, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(52, 2, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(53, 2, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(54, 2, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(55, 2, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(56, 2, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(57, 2, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(58, 2, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(59, 2, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(60, 2, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(61, 3, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(62, 3, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(63, 3, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(64, 3, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(65, 3, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(66, 3, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(67, 3, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(68, 3, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(69, 3, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(70, 3, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(71, 3, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(72, 3, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(73, 3, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(74, 3, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(75, 3, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(76, 3, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(77, 3, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(78, 3, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(79, 3, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(80, 3, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(81, 3, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(82, 3, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(83, 3, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(84, 3, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(85, 3, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(86, 3, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(87, 3, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(88, 3, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(89, 3, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(90, 3, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(91, 1, 1, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(92, 1, 1, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(93, 1, 1, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(94, 1, 1, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(95, 1, 2, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(96, 1, 2, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(97, 1, 2, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(98, 1, 3, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(99, 1, 3, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(100, 1, 3, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(101, 1, 4, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(102, 1, 4, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(103, 1, 4, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(104, 2, 1, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(105, 2, 1, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(106, 2, 1, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(107, 2, 1, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(108, 2, 2, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(109, 2, 2, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(110, 2, 2, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(111, 2, 3, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(112, 2, 3, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(113, 2, 3, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(114, 2, 4, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(115, 2, 4, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(116, 2, 4, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(117, 3, 1, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(118, 3, 1, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(119, 3, 1, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(120, 3, 1, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(121, 3, 2, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(122, 3, 2, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(123, 3, 2, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(124, 3, 3, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(125, 3, 3, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(126, 3, 3, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(127, 3, 4, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(128, 3, 4, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(129, 3, 4, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(130, 1, 1, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(131, 1, 2, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(132, 1, 3, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(133, 1, 4, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(134, 1, 3, 4, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(135, 2, 1, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(136, 2, 2, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(137, 2, 3, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(138, 2, 4, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(139, 2, 3, 4, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(140, 3, 1, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(141, 3, 2, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(142, 3, 3, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(143, 3, 4, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(144, 3, 3, 4, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(145, 5, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(146, 5, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(147, 5, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(148, 5, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(149, 5, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(150, 5, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(151, 5, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(152, 5, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(153, 5, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(154, 5, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(155, 5, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(156, 5, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(157, 5, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(158, 5, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(159, 5, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(160, 5, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(161, 5, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(162, 5, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(163, 5, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(164, 5, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(165, 5, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(166, 5, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(167, 5, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(168, 5, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(169, 5, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(170, 5, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(171, 5, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(172, 5, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(173, 5, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(174, 5, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(176, 5, 1, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(177, 5, 1, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(178, 5, 1, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(179, 5, 1, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(180, 5, 2, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(181, 5, 2, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(182, 5, 2, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(183, 5, 3, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(184, 5, 3, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(185, 5, 3, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(186, 5, 4, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(187, 5, 4, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(188, 5, 4, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(191, 5, 1, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(192, 5, 2, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(193, 5, 3, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(194, 5, 3, 4, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(195, 5, 4, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(198, 6, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(199, 6, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(200, 6, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(201, 6, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(202, 6, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(203, 6, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(204, 6, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(205, 6, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(206, 6, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(207, 6, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(208, 6, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(209, 6, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(210, 6, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(211, 6, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(212, 6, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(213, 6, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(214, 6, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(215, 6, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(216, 6, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(217, 6, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(218, 6, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(219, 6, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(220, 6, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(221, 6, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(222, 6, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(223, 6, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(224, 6, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(225, 6, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(226, 6, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(227, 6, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(229, 6, 1, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(230, 6, 1, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(231, 6, 1, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(232, 6, 1, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(233, 6, 2, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(234, 6, 2, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(235, 6, 2, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(236, 6, 3, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(237, 6, 3, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(238, 6, 3, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(239, 6, 4, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(240, 6, 4, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(241, 6, 4, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(244, 6, 1, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(245, 6, 2, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(246, 6, 3, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(247, 6, 3, 4, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(248, 6, 4, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(249, 7, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(250, 7, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(251, 7, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(252, 7, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(253, 7, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(254, 7, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(255, 7, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(256, 7, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(257, 7, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(258, 7, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(259, 7, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(260, 7, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(261, 7, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(262, 7, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(263, 7, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(264, 7, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(265, 7, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(266, 7, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(267, 7, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(268, 7, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(269, 7, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(270, 7, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(271, 7, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(272, 7, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(273, 7, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(274, 7, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(275, 7, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(276, 7, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(277, 7, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(278, 7, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(280, 7, 1, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(281, 7, 1, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(282, 7, 1, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(283, 7, 1, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(284, 7, 2, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(285, 7, 2, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(286, 7, 2, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(287, 7, 3, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(288, 7, 3, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(289, 7, 3, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(290, 7, 4, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(291, 7, 4, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(292, 7, 4, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(295, 7, 1, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(296, 7, 2, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(297, 7, 3, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(298, 7, 3, 4, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(299, 7, 4, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(302, 8, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(303, 8, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(304, 8, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(305, 8, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(306, 8, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(307, 8, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(308, 8, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(309, 8, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(310, 8, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(311, 8, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(312, 8, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(313, 8, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(314, 8, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(315, 8, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(316, 8, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(317, 8, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(318, 8, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(319, 8, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(320, 8, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(321, 8, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(322, 8, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(323, 8, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(324, 8, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(325, 8, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(326, 8, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(327, 8, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(328, 8, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(329, 8, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(330, 8, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(331, 8, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(333, 8, 1, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(334, 8, 1, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(335, 8, 1, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(336, 8, 1, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(337, 8, 2, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(338, 8, 2, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(339, 8, 2, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(340, 8, 3, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(341, 8, 3, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(342, 8, 3, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(343, 8, 4, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(344, 8, 4, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(345, 8, 4, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(348, 8, 1, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(349, 8, 2, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(350, 8, 3, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(351, 8, 3, 4, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(352, 8, 4, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(353, 1, 7, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(354, 1, 7, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(355, 1, 7, 3, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(356, 2, 7, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(357, 2, 7, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(358, 2, 7, 3, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(359, 3, 7, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(360, 3, 7, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(361, 3, 7, 3, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(362, 5, 7, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(363, 5, 7, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(364, 5, 7, 3, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(365, 6, 7, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(366, 6, 7, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(367, 6, 7, 3, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(368, 7, 7, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(369, 7, 7, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(370, 7, 7, 3, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(371, 8, 7, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(372, 8, 7, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(373, 8, 7, 3, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(374, 1, 7, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(375, 1, 7, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(376, 1, 7, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(377, 2, 7, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(378, 2, 7, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(379, 2, 7, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(380, 3, 7, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(381, 3, 7, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(382, 3, 7, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(383, 5, 7, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(384, 5, 7, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(385, 5, 7, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(386, 6, 7, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(387, 6, 7, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(388, 6, 7, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(389, 7, 7, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(390, 7, 7, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(391, 7, 7, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(392, 8, 7, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(393, 8, 7, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(394, 8, 7, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(395, 1, 7, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(396, 1, 7, 6, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(397, 1, 7, 6, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(398, 2, 7, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(399, 2, 7, 6, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(400, 2, 7, 6, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(401, 3, 7, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(402, 3, 7, 6, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(403, 3, 7, 6, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(404, 5, 7, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(405, 5, 7, 6, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(406, 5, 7, 6, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(407, 6, 7, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(408, 6, 7, 6, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(409, 6, 7, 6, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(410, 7, 7, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(411, 7, 7, 6, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(412, 7, 7, 6, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(413, 8, 7, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(414, 8, 7, 6, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(415, 8, 7, 6, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(556, 1, 7, 3, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(557, 1, 7, 3, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(558, 1, 7, 3, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(559, 1, 7, 3, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(560, 1, 7, 3, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(561, 2, 7, 3, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(562, 2, 7, 3, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(563, 2, 7, 3, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(564, 2, 7, 3, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(565, 2, 7, 3, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(566, 3, 7, 3, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(567, 3, 7, 3, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(568, 3, 7, 3, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(569, 3, 7, 3, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(570, 3, 7, 3, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(571, 5, 7, 3, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(572, 5, 7, 3, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(573, 5, 7, 3, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(574, 5, 7, 3, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(575, 5, 7, 3, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(576, 6, 7, 3, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(577, 6, 7, 3, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(578, 6, 7, 3, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(579, 6, 7, 3, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(580, 6, 7, 3, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(581, 7, 7, 3, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(582, 7, 7, 3, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(583, 7, 7, 3, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(584, 7, 7, 3, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(585, 7, 7, 3, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(586, 8, 7, 3, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(587, 8, 7, 3, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(588, 8, 7, 3, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(589, 8, 7, 3, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(590, 8, 7, 3, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(591, 1, 7, 5, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(592, 1, 7, 5, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(593, 1, 7, 5, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(594, 1, 7, 5, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(595, 1, 7, 5, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(596, 2, 7, 5, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(597, 2, 7, 5, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(598, 2, 7, 5, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(599, 2, 7, 5, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(600, 2, 7, 5, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(601, 3, 7, 5, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(602, 3, 7, 5, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(603, 3, 7, 5, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(604, 3, 7, 5, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(605, 3, 7, 5, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(606, 5, 7, 5, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(607, 5, 7, 5, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(608, 5, 7, 5, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(609, 5, 7, 5, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(610, 5, 7, 5, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(611, 6, 7, 5, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(612, 6, 7, 5, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(613, 6, 7, 5, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(614, 6, 7, 5, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(615, 6, 7, 5, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(616, 7, 7, 5, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(617, 7, 7, 5, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(618, 7, 7, 5, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(619, 7, 7, 5, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(620, 7, 7, 5, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(621, 8, 7, 5, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(622, 8, 7, 5, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(623, 8, 7, 5, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(624, 8, 7, 5, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(625, 8, 7, 5, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(626, 1, 7, 6, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(627, 1, 7, 6, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(628, 1, 7, 6, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(629, 1, 7, 6, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(630, 1, 7, 6, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(631, 2, 7, 6, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(632, 2, 7, 6, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(633, 2, 7, 6, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(634, 2, 7, 6, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(635, 2, 7, 6, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(636, 3, 7, 6, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(637, 3, 7, 6, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(638, 3, 7, 6, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(639, 3, 7, 6, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(640, 3, 7, 6, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(641, 5, 7, 6, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(642, 5, 7, 6, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(643, 5, 7, 6, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(644, 5, 7, 6, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(645, 5, 7, 6, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(646, 6, 7, 6, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(647, 6, 7, 6, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(648, 6, 7, 6, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(649, 6, 7, 6, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(650, 6, 7, 6, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(651, 7, 7, 6, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(652, 7, 7, 6, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(653, 7, 7, 6, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(654, 7, 7, 6, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(655, 7, 7, 6, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(656, 8, 7, 6, 1, 0, 1, 'WorkflowTransition', NULL, NULL),
(657, 8, 7, 6, 2, 0, 1, 'WorkflowTransition', NULL, NULL),
(658, 8, 7, 6, 3, 0, 1, 'WorkflowTransition', NULL, NULL),
(659, 8, 7, 6, 4, 0, 1, 'WorkflowTransition', NULL, NULL),
(660, 8, 7, 6, 5, 0, 1, 'WorkflowTransition', NULL, NULL),
(661, 1, 7, 3, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(662, 1, 7, 3, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(663, 2, 7, 3, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(664, 2, 7, 3, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(665, 3, 7, 3, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(666, 3, 7, 3, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(667, 5, 7, 3, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(668, 5, 7, 3, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(669, 6, 7, 3, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(670, 6, 7, 3, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(671, 7, 7, 3, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(672, 7, 7, 3, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(673, 8, 7, 3, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(674, 8, 7, 3, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(675, 1, 7, 5, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(676, 1, 7, 5, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(677, 2, 7, 5, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(678, 2, 7, 5, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(679, 3, 7, 5, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(680, 3, 7, 5, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(681, 5, 7, 5, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(682, 5, 7, 5, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(683, 6, 7, 5, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(684, 6, 7, 5, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(685, 7, 7, 5, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(686, 7, 7, 5, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(687, 8, 7, 5, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(688, 8, 7, 5, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(689, 1, 7, 6, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(690, 1, 7, 6, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(691, 2, 7, 6, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(692, 2, 7, 6, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(693, 3, 7, 6, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(694, 3, 7, 6, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(695, 5, 7, 6, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(696, 5, 7, 6, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(697, 6, 7, 6, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(698, 6, 7, 6, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(699, 7, 7, 6, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(700, 7, 7, 6, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(701, 8, 7, 6, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(702, 8, 7, 6, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(703, 1, 3, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(704, 1, 3, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(705, 1, 3, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(706, 1, 3, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(707, 1, 3, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(708, 2, 3, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(709, 2, 3, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(710, 2, 3, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(711, 2, 3, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(712, 2, 3, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(713, 3, 3, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(714, 3, 3, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(715, 3, 3, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(716, 3, 3, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(717, 3, 3, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(718, 5, 3, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(719, 5, 3, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(720, 5, 3, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(721, 5, 3, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(722, 5, 3, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(723, 6, 3, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(724, 6, 3, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(725, 6, 3, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(726, 6, 3, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(727, 6, 3, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(728, 7, 3, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(729, 7, 3, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(730, 7, 3, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(731, 7, 3, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(732, 7, 3, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(733, 8, 3, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(734, 8, 3, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(735, 8, 3, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(736, 8, 3, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(737, 8, 3, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(738, 1, 4, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(739, 1, 4, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(740, 1, 4, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(741, 1, 4, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(742, 1, 4, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(743, 2, 4, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(744, 2, 4, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(745, 2, 4, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(746, 2, 4, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(747, 2, 4, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(748, 3, 4, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(749, 3, 4, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(750, 3, 4, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(751, 3, 4, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(752, 3, 4, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(753, 5, 4, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(754, 5, 4, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(755, 5, 4, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(756, 5, 4, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(757, 5, 4, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(758, 6, 4, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(759, 6, 4, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(760, 6, 4, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(761, 6, 4, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(762, 6, 4, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(763, 7, 4, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(764, 7, 4, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(765, 7, 4, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(766, 7, 4, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(767, 7, 4, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(768, 8, 4, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(769, 8, 4, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(770, 8, 4, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(771, 8, 4, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(772, 8, 4, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(773, 1, 5, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(774, 1, 5, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(775, 1, 5, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(776, 1, 5, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(777, 1, 5, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(778, 2, 5, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(779, 2, 5, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(780, 2, 5, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(781, 2, 5, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(782, 2, 5, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(783, 3, 5, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(784, 3, 5, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(785, 3, 5, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(786, 3, 5, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(787, 3, 5, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(788, 5, 5, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(789, 5, 5, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(790, 5, 5, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(791, 5, 5, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(792, 5, 5, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(793, 6, 5, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(794, 6, 5, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(795, 6, 5, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(796, 6, 5, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(797, 6, 5, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(798, 7, 5, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(799, 7, 5, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(800, 7, 5, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(801, 7, 5, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(802, 7, 5, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(803, 8, 5, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(804, 8, 5, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(805, 8, 5, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(806, 8, 5, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(807, 8, 5, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(808, 1, 6, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(809, 1, 6, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(810, 1, 6, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(811, 1, 6, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(812, 1, 6, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(813, 2, 6, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(814, 2, 6, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(815, 2, 6, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(816, 2, 6, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(817, 2, 6, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(818, 3, 6, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(819, 3, 6, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(820, 3, 6, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(821, 3, 6, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(822, 3, 6, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(823, 5, 6, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(824, 5, 6, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(825, 5, 6, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(826, 5, 6, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(827, 5, 6, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(828, 6, 6, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(829, 6, 6, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(830, 6, 6, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(831, 6, 6, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(832, 6, 6, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(833, 7, 6, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(834, 7, 6, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(835, 7, 6, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(836, 7, 6, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(837, 7, 6, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(838, 8, 6, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(839, 8, 6, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(840, 8, 6, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(841, 8, 6, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(842, 8, 6, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(948, 1, 7, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(949, 1, 7, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(950, 1, 7, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(951, 1, 7, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(952, 1, 7, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(953, 2, 7, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(954, 2, 7, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(955, 2, 7, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(956, 2, 7, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(957, 2, 7, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(958, 3, 7, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(959, 3, 7, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(960, 3, 7, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(961, 3, 7, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(962, 3, 7, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(963, 5, 7, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(964, 5, 7, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(965, 5, 7, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(966, 5, 7, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(967, 5, 7, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(968, 6, 7, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(969, 6, 7, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(970, 6, 7, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(971, 6, 7, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(972, 6, 7, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(973, 7, 7, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(974, 7, 7, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(975, 7, 7, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(976, 7, 7, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(977, 7, 7, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(978, 8, 7, 7, 1, 0, 0, 'WorkflowTransition', NULL, NULL),
(979, 8, 7, 7, 2, 0, 0, 'WorkflowTransition', NULL, NULL),
(980, 8, 7, 7, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(981, 8, 7, 7, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(982, 8, 7, 7, 5, 0, 0, 'WorkflowTransition', NULL, NULL);

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_attachments_on_author_id` (`author_id`),
  ADD KEY `index_attachments_on_created_on` (`created_on`),
  ADD KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`);

--
-- 테이블의 인덱스 `auth_sources`
--
ALTER TABLE `auth_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_auth_sources_on_id_and_type` (`id`,`type`);

--
-- 테이블의 인덱스 `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boards_project_id` (`project_id`),
  ADD KEY `index_boards_on_last_message_id` (`last_message_id`);

--
-- 테이블의 인덱스 `changes`
--
ALTER TABLE `changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `changesets_changeset_id` (`changeset_id`);

--
-- 테이블의 인덱스 `changesets`
--
ALTER TABLE `changesets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  ADD KEY `index_changesets_on_user_id` (`user_id`),
  ADD KEY `index_changesets_on_repository_id` (`repository_id`),
  ADD KEY `index_changesets_on_committed_on` (`committed_on`),
  ADD KEY `changesets_repos_scmid` (`repository_id`,`scmid`);

--
-- 테이블의 인덱스 `changesets_issues`
--
ALTER TABLE `changesets_issues`
  ADD UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`);

--
-- 테이블의 인덱스 `changeset_parents`
--
ALTER TABLE `changeset_parents`
  ADD KEY `changeset_parents_changeset_ids` (`changeset_id`),
  ADD KEY `changeset_parents_parent_ids` (`parent_id`);

--
-- 테이블의 인덱스 `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  ADD KEY `index_comments_on_author_id` (`author_id`);

--
-- 테이블의 인덱스 `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_custom_fields_on_id_and_type` (`id`,`type`);

--
-- 테이블의 인덱스 `custom_fields_projects`
--
ALTER TABLE `custom_fields_projects`
  ADD UNIQUE KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`);

--
-- 테이블의 인덱스 `custom_fields_roles`
--
ALTER TABLE `custom_fields_roles`
  ADD UNIQUE KEY `custom_fields_roles_ids` (`custom_field_id`,`role_id`);

--
-- 테이블의 인덱스 `custom_fields_trackers`
--
ALTER TABLE `custom_fields_trackers`
  ADD UNIQUE KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`);

--
-- 테이블의 인덱스 `custom_field_enumerations`
--
ALTER TABLE `custom_field_enumerations`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `custom_reports`
--
ALTER TABLE `custom_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_custom_reports_on_project_id` (`project_id`),
  ADD KEY `index_custom_reports_on_user_id` (`user_id`);

--
-- 테이블의 인덱스 `custom_report_series`
--
ALTER TABLE `custom_report_series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_custom_report_series_on_custom_report_id` (`custom_report_id`);

--
-- 테이블의 인덱스 `custom_values`
--
ALTER TABLE `custom_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_values_customized` (`customized_type`,`customized_id`),
  ADD KEY `index_custom_values_on_custom_field_id` (`custom_field_id`);

--
-- 테이블의 인덱스 `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_project_id` (`project_id`),
  ADD KEY `index_documents_on_category_id` (`category_id`),
  ADD KEY `index_documents_on_created_on` (`created_on`);

--
-- 테이블의 인덱스 `email_addresses`
--
ALTER TABLE `email_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_email_addresses_on_user_id` (`user_id`);

--
-- 테이블의 인덱스 `enabled_modules`
--
ALTER TABLE `enabled_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enabled_modules_project_id` (`project_id`);

--
-- 테이블의 인덱스 `enumerations`
--
ALTER TABLE `enumerations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_enumerations_on_project_id` (`project_id`),
  ADD KEY `index_enumerations_on_id_and_type` (`id`,`type`);

--
-- 테이블의 인덱스 `groups_users`
--
ALTER TABLE `groups_users`
  ADD UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`);

--
-- 테이블의 인덱스 `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `import_items`
--
ALTER TABLE `import_items`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issues_project_id` (`project_id`),
  ADD KEY `index_issues_on_status_id` (`status_id`),
  ADD KEY `index_issues_on_category_id` (`category_id`),
  ADD KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  ADD KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  ADD KEY `index_issues_on_tracker_id` (`tracker_id`),
  ADD KEY `index_issues_on_priority_id` (`priority_id`),
  ADD KEY `index_issues_on_author_id` (`author_id`),
  ADD KEY `index_issues_on_created_on` (`created_on`),
  ADD KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`);

--
-- 테이블의 인덱스 `issue_categories`
--
ALTER TABLE `issue_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issue_categories_project_id` (`project_id`),
  ADD KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`);

--
-- 테이블의 인덱스 `issue_relations`
--
ALTER TABLE `issue_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_issue_relations_on_issue_from_id_and_issue_to_id` (`issue_from_id`,`issue_to_id`),
  ADD KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  ADD KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`);

--
-- 테이블의 인덱스 `issue_statuses`
--
ALTER TABLE `issue_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_issue_statuses_on_position` (`position`),
  ADD KEY `index_issue_statuses_on_is_closed` (`is_closed`);

--
-- 테이블의 인덱스 `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  ADD KEY `index_journals_on_user_id` (`user_id`),
  ADD KEY `index_journals_on_journalized_id` (`journalized_id`),
  ADD KEY `index_journals_on_created_on` (`created_on`);

--
-- 테이블의 인덱스 `journal_details`
--
ALTER TABLE `journal_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journal_details_journal_id` (`journal_id`);

--
-- 테이블의 인덱스 `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  ADD KEY `index_members_on_user_id` (`user_id`),
  ADD KEY `index_members_on_project_id` (`project_id`);

--
-- 테이블의 인덱스 `member_roles`
--
ALTER TABLE `member_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_member_roles_on_member_id` (`member_id`),
  ADD KEY `index_member_roles_on_role_id` (`role_id`);

--
-- 테이블의 인덱스 `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_board_id` (`board_id`),
  ADD KEY `messages_parent_id` (`parent_id`),
  ADD KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  ADD KEY `index_messages_on_author_id` (`author_id`),
  ADD KEY `index_messages_on_created_on` (`created_on`);

--
-- 테이블의 인덱스 `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_project_id` (`project_id`),
  ADD KEY `index_news_on_author_id` (`author_id`),
  ADD KEY `index_news_on_created_on` (`created_on`);

--
-- 테이블의 인덱스 `open_id_authentication_associations`
--
ALTER TABLE `open_id_authentication_associations`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `open_id_authentication_nonces`
--
ALTER TABLE `open_id_authentication_nonces`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- 테이블의 인덱스 `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- 테이블의 인덱스 `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- 테이블의 인덱스 `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- 테이블의 인덱스 `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- 테이블의 인덱스 `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- 테이블의 인덱스 `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- 테이블의 인덱스 `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- 테이블의 인덱스 `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- 테이블의 인덱스 `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- 테이블의 인덱스 `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- 테이블의 인덱스 `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- 테이블의 인덱스 `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- 테이블의 인덱스 `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- 테이블의 인덱스 `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- 테이블의 인덱스 `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- 테이블의 인덱스 `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- 테이블의 인덱스 `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- 테이블의 인덱스 `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_projects_on_lft` (`lft`),
  ADD KEY `index_projects_on_rgt` (`rgt`);

--
-- 테이블의 인덱스 `projects_trackers`
--
ALTER TABLE `projects_trackers`
  ADD UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  ADD KEY `projects_trackers_project_id` (`project_id`);

--
-- 테이블의 인덱스 `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_queries_on_project_id` (`project_id`),
  ADD KEY `index_queries_on_user_id` (`user_id`);

--
-- 테이블의 인덱스 `queries_roles`
--
ALTER TABLE `queries_roles`
  ADD UNIQUE KEY `queries_roles_ids` (`query_id`,`role_id`);

--
-- 테이블의 인덱스 `repositories`
--
ALTER TABLE `repositories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_repositories_on_project_id` (`project_id`);

--
-- 테이블의 인덱스 `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `roles_managed_roles`
--
ALTER TABLE `roles_managed_roles`
  ADD UNIQUE KEY `index_roles_managed_roles_on_role_id_and_managed_role_id` (`role_id`,`managed_role_id`);

--
-- 테이블의 인덱스 `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD UNIQUE KEY `unique_schema_migrations` (`version`);

--
-- 테이블의 인덱스 `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_settings_on_name` (`name`);

--
-- 테이블의 인덱스 `time_entries`
--
ALTER TABLE `time_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_entries_project_id` (`project_id`),
  ADD KEY `time_entries_issue_id` (`issue_id`),
  ADD KEY `index_time_entries_on_activity_id` (`activity_id`),
  ADD KEY `index_time_entries_on_user_id` (`user_id`),
  ADD KEY `index_time_entries_on_created_on` (`created_on`);

--
-- 테이블의 인덱스 `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_value` (`value`),
  ADD KEY `index_tokens_on_user_id` (`user_id`);

--
-- 테이블의 인덱스 `trackers`
--
ALTER TABLE `trackers`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_users_on_id_and_type` (`id`,`type`),
  ADD KEY `index_users_on_auth_source_id` (`auth_source_id`),
  ADD KEY `index_users_on_type` (`type`);

--
-- 테이블의 인덱스 `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user_preferences_on_user_id` (`user_id`);

--
-- 테이블의 인덱스 `versions`
--
ALTER TABLE `versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `versions_project_id` (`project_id`),
  ADD KEY `index_versions_on_sharing` (`sharing`);

--
-- 테이블의 인덱스 `watchers`
--
ALTER TABLE `watchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  ADD KEY `index_watchers_on_user_id` (`user_id`),
  ADD KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`);

--
-- 테이블의 인덱스 `wikis`
--
ALTER TABLE `wikis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wikis_project_id` (`project_id`);

--
-- 테이블의 인덱스 `wiki_contents`
--
ALTER TABLE `wiki_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_contents_page_id` (`page_id`),
  ADD KEY `index_wiki_contents_on_author_id` (`author_id`);

--
-- 테이블의 인덱스 `wiki_content_versions`
--
ALTER TABLE `wiki_content_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  ADD KEY `index_wiki_content_versions_on_updated_on` (`updated_on`);

--
-- 테이블의 인덱스 `wiki_pages`
--
ALTER TABLE `wiki_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  ADD KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  ADD KEY `index_wiki_pages_on_parent_id` (`parent_id`);

--
-- 테이블의 인덱스 `wiki_redirects`
--
ALTER TABLE `wiki_redirects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  ADD KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`);

--
-- 테이블의 인덱스 `workflows`
--
ALTER TABLE `workflows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  ADD KEY `index_workflows_on_old_status_id` (`old_status_id`),
  ADD KEY `index_workflows_on_role_id` (`role_id`),
  ADD KEY `index_workflows_on_new_status_id` (`new_status_id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- 테이블의 AUTO_INCREMENT `auth_sources`
--
ALTER TABLE `auth_sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `boards`
--
ALTER TABLE `boards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 테이블의 AUTO_INCREMENT `changes`
--
ALTER TABLE `changes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `changesets`
--
ALTER TABLE `changesets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 테이블의 AUTO_INCREMENT `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `custom_field_enumerations`
--
ALTER TABLE `custom_field_enumerations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `custom_reports`
--
ALTER TABLE `custom_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 테이블의 AUTO_INCREMENT `custom_report_series`
--
ALTER TABLE `custom_report_series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 테이블의 AUTO_INCREMENT `custom_values`
--
ALTER TABLE `custom_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `email_addresses`
--
ALTER TABLE `email_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 테이블의 AUTO_INCREMENT `enabled_modules`
--
ALTER TABLE `enabled_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- 테이블의 AUTO_INCREMENT `enumerations`
--
ALTER TABLE `enumerations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 테이블의 AUTO_INCREMENT `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `import_items`
--
ALTER TABLE `import_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- 테이블의 AUTO_INCREMENT `issue_categories`
--
ALTER TABLE `issue_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 테이블의 AUTO_INCREMENT `issue_relations`
--
ALTER TABLE `issue_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 테이블의 AUTO_INCREMENT `issue_statuses`
--
ALTER TABLE `issue_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 테이블의 AUTO_INCREMENT `journals`
--
ALTER TABLE `journals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- 테이블의 AUTO_INCREMENT `journal_details`
--
ALTER TABLE `journal_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;

--
-- 테이블의 AUTO_INCREMENT `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- 테이블의 AUTO_INCREMENT `member_roles`
--
ALTER TABLE `member_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- 테이블의 AUTO_INCREMENT `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 테이블의 AUTO_INCREMENT `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 테이블의 AUTO_INCREMENT `open_id_authentication_associations`
--
ALTER TABLE `open_id_authentication_associations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `open_id_authentication_nonces`
--
ALTER TABLE `open_id_authentication_nonces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 테이블의 AUTO_INCREMENT `queries`
--
ALTER TABLE `queries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 테이블의 AUTO_INCREMENT `repositories`
--
ALTER TABLE `repositories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 테이블의 AUTO_INCREMENT `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- 테이블의 AUTO_INCREMENT `time_entries`
--
ALTER TABLE `time_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- 테이블의 AUTO_INCREMENT `trackers`
--
ALTER TABLE `trackers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 테이블의 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 테이블의 AUTO_INCREMENT `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 테이블의 AUTO_INCREMENT `versions`
--
ALTER TABLE `versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `watchers`
--
ALTER TABLE `watchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- 테이블의 AUTO_INCREMENT `wikis`
--
ALTER TABLE `wikis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 테이블의 AUTO_INCREMENT `wiki_contents`
--
ALTER TABLE `wiki_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `wiki_content_versions`
--
ALTER TABLE `wiki_content_versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `wiki_pages`
--
ALTER TABLE `wiki_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `wiki_redirects`
--
ALTER TABLE `wiki_redirects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `workflows`
--
ALTER TABLE `workflows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=983;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
