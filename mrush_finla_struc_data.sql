-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 03 2017 г., 18:54
-- Версия сервера: 5.7.11
-- Версия PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mrush`
--

-- --------------------------------------------------------

--
-- Структура таблицы `account_type`
--

CREATE TABLE IF NOT EXISTS `account_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `account_type`
--

INSERT INTO `account_type` (`type_id`, `type_name`) VALUES
(1, 'regular'),
(2, 'premium');

-- --------------------------------------------------------

--
-- Структура таблицы `albums`
--

CREATE TABLE IF NOT EXISTS `albums` (
  `album_id` int(11) NOT NULL,
  `album_name` varchar(128) NOT NULL,
  `album_photo` varchar(128) DEFAULT 'album-nophoto.png',
  `album_year` int(5) DEFAULT '2017',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  `album_type` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `albums`
--

INSERT INTO `albums` (`album_id`, `album_name`, `album_photo`, `album_year`, `created_at`, `updated_at`, `album_type`) VALUES
(3, 'Test', 'album-nophoto.png', 2018, '2017-11-10 16:16:07', '2017-11-10 16:16:07', 1),
(4, 'Test', 'album-nophoto.png', 2018, '2017-11-10 16:16:56', '2017-11-10 16:16:56', 1),
(5, 'Test', 'vlad_lolka.jpg', 2055, '2017-11-21 15:02:12', '2017-11-21 15:02:12', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `albums_in_artists`
--

CREATE TABLE IF NOT EXISTS `albums_in_artists` (
  `album_in_artist_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `albums_in_artists`
--

INSERT INTO `albums_in_artists` (`album_in_artist_id`, `album_id`, `artist_id`, `created_at`, `updated_at`) VALUES
(1, 4, 16, '2017-11-10 16:16:56', '2017-11-10 16:16:56'),
(2, 5, 17, '2017-11-21 15:02:12', '2017-11-21 15:02:12');

-- --------------------------------------------------------

--
-- Структура таблицы `albums_in_users`
--

CREATE TABLE IF NOT EXISTS `albums_in_users` (
  `album_in_user_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `albums_in_users`
--

INSERT INTO `albums_in_users` (`album_in_user_id`, `album_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '2017-11-10 16:16:56', '2017-11-10 16:16:56'),
(2, 5, 2, '2017-11-21 15:02:12', '2017-11-21 15:02:12');

-- --------------------------------------------------------

--
-- Структура таблицы `album_types`
--

CREATE TABLE IF NOT EXISTS `album_types` (
  `album_type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `album_types`
--

INSERT INTO `album_types` (`album_type_id`, `type_name`) VALUES
(1, 'studio'),
(2, 'concert');

-- --------------------------------------------------------

--
-- Структура таблицы `artists`
--

CREATE TABLE IF NOT EXISTS `artists` (
  `artist_id` int(11) NOT NULL,
  `artist_name` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  `country` int(11) DEFAULT NULL,
  `artist_type` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `artists`
--

INSERT INTO `artists` (`artist_id`, `artist_name`, `created_at`, `updated_at`, `country`, `artist_type`) VALUES
(1, 'L''One', '2017-11-07 20:45:57', '2017-12-03 15:51:00', NULL, 1),
(2, 'George Michael', '2017-11-07 20:45:57', '2017-12-03 15:51:00', NULL, 1),
(3, 'Fall Out Boy', '2017-11-07 20:45:57', '2017-12-03 15:52:04', NULL, 2),
(4, 'Звери', '2017-11-07 20:45:57', '2017-12-03 15:52:04', NULL, 2),
(5, 'Любэ', '2017-11-07 20:45:57', '2017-12-03 15:52:04', NULL, 2),
(6, 'Jamiroquai', '2017-11-07 20:45:57', '2017-12-03 15:52:04', NULL, 2),
(7, 'Пицца', '2017-11-07 20:45:57', '2017-12-03 15:52:04', NULL, 2),
(8, 'Imagine Dragons', '2017-11-07 20:45:57', '2017-12-03 15:52:04', NULL, 2),
(9, '5''nizza', '2017-11-07 20:45:57', '2017-12-03 15:52:04', NULL, 2),
(10, 'ATL', '2017-11-07 17:46:10', '2017-12-03 15:51:00', NULL, 1),
(11, 'Bumble Beezy & The Motrix', '2017-11-08 17:01:50', '2017-11-08 17:01:50', NULL, 1),
(12, 'Unknown artist', '2017-11-08 17:01:56', '2017-11-08 17:01:56', NULL, 1),
(13, 'Arctic Monkeys', '2017-11-08 17:29:09', '2017-11-08 17:29:09', NULL, 1),
(14, 'Sleeping With Sirens', '2017-11-08 17:29:09', '2017-11-08 17:29:09', NULL, 1),
(15, 'THE32ND', '2017-11-08 17:29:09', '2017-11-08 17:29:09', NULL, 1),
(16, 'EFE', '2017-11-10 16:10:17', '2017-11-10 16:10:17', NULL, 1),
(17, '12', '2017-11-21 15:02:12', '2017-11-21 15:02:12', NULL, 1),
(18, 'Artist', '2017-11-25 11:03:40', '2017-11-25 11:03:40', NULL, 1),
(19, 'Unknoddddd', '2017-11-25 11:06:16', '2017-11-25 11:06:16', NULL, 1),
(20, 'DEwd', '2017-11-25 11:27:02', '2017-11-25 11:27:02', NULL, 1),
(21, 'AT1L', '2017-11-25 11:29:30', '2017-11-25 11:29:30', NULL, 1),
(22, 'ATL2', '2017-11-25 12:13:45', '2017-11-25 12:13:45', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `artist_types`
--

CREATE TABLE IF NOT EXISTS `artist_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `artist_types`
--

INSERT INTO `artist_types` (`type_id`, `type_name`) VALUES
(1, 'singer'),
(2, 'band');

-- --------------------------------------------------------

--
-- Структура таблицы `audit_logging`
--

CREATE TABLE IF NOT EXISTS `audit_logging` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `button_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  `created_at_user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_text`, `created_at_user`, `created_at`, `updated_at`) VALUES
(2, 'edw', 2, '2017-11-21 14:51:52', '2017-11-21 14:51:52');

-- --------------------------------------------------------

--
-- Структура таблицы `comments_in_communities`
--

CREATE TABLE IF NOT EXISTS `comments_in_communities` (
  `comment_in_community_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments_in_communities`
--

INSERT INTO `comments_in_communities` (`comment_in_community_id`, `comment_id`, `community_id`, `created_at`, `updated_at`) VALUES
(2, 2, 9, '2017-11-21 14:51:52', '2017-11-21 14:51:52');

-- --------------------------------------------------------

--
-- Структура таблицы `communities`
--

CREATE TABLE IF NOT EXISTS `communities` (
  `community_id` int(11) NOT NULL,
  `community_name` varchar(128) NOT NULL,
  `community_photo` varchar(128) DEFAULT 'communityPhoto.jpg',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at_user` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `communities`
--

INSERT INTO `communities` (`community_id`, `community_name`, `community_photo`, `created_at`, `created_at_user`, `genre_id`, `updated_at`) VALUES
(9, 'Test', 'community_nophoto.jpg', '2017-11-21 14:38:30', 2, 10, '2017-11-21 14:38:30');

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(1024) NOT NULL,
  `event_time` varchar(255) NOT NULL,
  `event_location` int(11) NOT NULL,
  `event_date` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `event_locations`
--

CREATE TABLE IF NOT EXISTS `event_locations` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `genres`
--

CREATE TABLE IF NOT EXISTS `genres` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genres`
--

INSERT INTO `genres` (`genre_id`, `genre_name`, `created_at`, `updated_at`) VALUES
(1, 'Rock', '2017-11-07 14:14:18', '0000-00-00 00:00:00'),
(2, 'Pop', '2017-11-07 14:14:18', '0000-00-00 00:00:00'),
(3, 'io', '2017-11-07 11:14:36', '2017-11-07 11:14:36'),
(4, 'вв', '2017-11-07 11:16:45', '2017-11-07 11:16:45'),
(5, 'Hip-Hop', '2017-11-07 17:59:09', '2017-11-07 17:59:09'),
(6, 'Other', '2017-11-08 16:59:27', '2017-11-08 16:59:27'),
(7, 'Rap', '2017-11-08 17:01:50', '2017-11-08 17:01:50'),
(8, 'Witch House', '2017-11-08 17:29:09', '2017-11-08 17:29:09'),
(9, '', '2017-11-21 14:21:18', '2017-11-21 14:21:18'),
(10, 'R', '2017-11-21 14:38:30', '2017-11-21 14:38:30');

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `like_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `music_news`
--

CREATE TABLE IF NOT EXISTS `music_news` (
  `news_id` int(11) NOT NULL,
  `news_photo` varchar(255) NOT NULL,
  `news_url` varchar(255) NOT NULL,
  `news_title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `news_creator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `news_creators`
--

CREATE TABLE IF NOT EXISTS `news_creators` (
  `creator_id` int(11) NOT NULL,
  `creator_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `playlists`
--

CREATE TABLE IF NOT EXISTS `playlists` (
  `playlist_id` int(11) NOT NULL,
  `playlist_name` varchar(128) NOT NULL,
  `playlist_photo` varchar(128) DEFAULT 'playlistPhoto.jpg',
  `created_at_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `playlists`
--

INSERT INTO `playlists` (`playlist_id`, `playlist_name`, `playlist_photo`, `created_at_user`, `created_at`, `updated_at`) VALUES
(5, 'Test', 'community_nophoto.jpg', 2, '2017-11-21 14:38:30', '2017-11-21 14:38:30');

-- --------------------------------------------------------

--
-- Структура таблицы `playlists_in_communities`
--

CREATE TABLE IF NOT EXISTS `playlists_in_communities` (
  `playlist_in_community_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `playlists_in_communities`
--

INSERT INTO `playlists_in_communities` (`playlist_in_community_id`, `playlist_id`, `community_id`, `created_at`, `updated_at`) VALUES
(2, 5, 9, '2017-11-21 14:38:30', '2017-11-21 14:38:30');

-- --------------------------------------------------------

--
-- Структура таблицы `playlists_in_users`
--

CREATE TABLE IF NOT EXISTS `playlists_in_users` (
  `playlist_in_user_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tracks`
--

CREATE TABLE IF NOT EXISTS `tracks` (
  `track_id` int(11) NOT NULL,
  `track_name` varchar(128) NOT NULL,
  `track_photo` varchar(128) DEFAULT 'nophoto.jpg',
  `duration` varchar(10) NOT NULL,
  `is_copy` int(11) NOT NULL,
  `track_download_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  `created_at_user` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tracks`
--

INSERT INTO `tracks` (`track_id`, `track_name`, `track_photo`, `duration`, `is_copy`, `track_download_name`, `created_at`, `updated_at`, `created_at_user`) VALUES
(8, '1000', '08. 1000.jpg', '3:36', 0, '08. 1000.mp3', '2017-11-07 18:01:33', '2017-11-08 18:40:33', 1),
(9, 'Гори Ясно', '08. 1000.jpg', '3:13', 0, '07. Гори Ясно.mp3', '2017-11-07 18:23:01', '2017-11-08 18:40:33', 1),
(10, 'Вороний Грай', '08. 1000.jpg', '3:00', 0, '06. Вороний Грай.mp3', '2017-11-07 18:24:46', '2017-11-08 18:40:33', 1),
(11, 'Майк3', '04. Maik.jpg', '2:26', 0, '04. Maik.mp3', '2017-11-07 18:28:21', '2017-11-08 18:40:33', 1),
(12, 'Обратно (Feat. Eecii McFly)', '08. 1000.jpg', '3:43', 0, '09. Обратно (Feat. Eecii McFly).mp3', '2017-11-08 15:38:51', '2017-11-08 18:40:33', 1),
(13, 'Танцуйте', '08. 1000.jpg', '3:41', 0, '10. Танцуйте.mp3', '2017-11-08 15:38:52', '2017-11-08 18:40:33', 1),
(14, 'Астронавт1', '08. 1000.jpg', '2:57', 0, '11. Астронавт.mp3', '2017-11-08 15:38:52', '2017-11-25 11:54:26', 1),
(15, 'Знак1', 'Bumble_Beezy.jpg', '4:05', 0, 'Bumble_Beezy.mp3', '2017-11-08 17:01:50', '2017-11-25 12:39:27', 1),
(16, 'Unknown2323r', 'nophoto.jpg', '5:17', 0, 'Ed_Sheeran_-_I_See_Fire_(Kygo_Remix).mp3', '2017-11-08 17:01:56', '2017-11-25 11:08:41', 1),
(17, 'Do I Wanna Know?', 'Arctic_Monkeys_-_Do_I_Wanna_Know.jpg', '4:32', 0, 'Arctic_Monkeys_-_Do_I_Wanna_Know.mp3', '2017-11-08 17:29:09', '2017-11-08 17:29:09', 1),
(18, 'Track namr', 'nophoto.jpg', '3:51', 0, 'Kanye_West_-_FML.mp3', '2017-11-08 17:29:09', '2017-11-25 11:03:40', 1),
(19, 'Dead Walker Texas Ranger', 'nophoto.jpg', '3:30', 0, 'Sleeping_With_Sirens_-_Dead_Walker_Texas_Ranger.mp3', '2017-11-08 17:29:09', '2017-11-08 17:29:09', 1),
(20, 'MNFRST', 'ZD - Kaif.jpg', '7:12', 0, 'ZD - Kaif.mp3', '2017-11-08 17:29:09', '2017-11-08 20:30:15', 1),
(21, 'Do I Wanna Know?', 'Arctic_Monkeys_-_Do_I_Wanna_Know.jpg', '4:32', 0, 'Arctic_Monkeys_-_Do_I_Wanna_Know.mp3', '2017-11-21 14:59:21', '2017-11-21 14:59:21', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `tracks_in_albums`
--

CREATE TABLE IF NOT EXISTS `tracks_in_albums` (
  `track_in_album_id` int(11) NOT NULL,
  `track_id` int(11) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tracks_in_albums`
--

INSERT INTO `tracks_in_albums` (`track_in_album_id`, `track_id`, `album_id`, `created_at`, `updated_at`) VALUES
(1, 15, 4, '2017-11-10 16:16:56', '2017-11-10 16:16:56'),
(2, 16, 4, '2017-11-10 16:16:56', '2017-11-10 16:16:56'),
(3, 17, 4, '2017-11-10 16:16:56', '2017-11-10 16:16:56'),
(4, 19, 4, '2017-11-10 16:16:56', '2017-11-10 16:16:56'),
(5, 20, 4, '2017-11-10 16:16:56', '2017-11-10 16:16:56'),
(6, 21, 5, '2017-11-21 15:02:12', '2017-11-21 15:02:12');

-- --------------------------------------------------------

--
-- Структура таблицы `tracks_in_artists`
--

CREATE TABLE IF NOT EXISTS `tracks_in_artists` (
  `track_in_artist_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tracks_in_artists`
--

INSERT INTO `tracks_in_artists` (`track_in_artist_id`, `track_id`, `artist_id`, `created_at`, `updated_at`) VALUES
(3, 8, 10, '2017-11-07 18:01:33', '2017-11-07 18:01:33'),
(4, 9, 10, '2017-11-07 18:23:01', '2017-11-07 18:23:01'),
(5, 10, 10, '2017-11-07 18:24:46', '2017-11-07 18:24:46'),
(6, 11, 10, '2017-11-07 18:28:21', '2017-11-07 18:28:21'),
(7, 12, 10, '2017-11-08 15:38:52', '2017-11-08 15:38:52'),
(11, 16, 12, '2017-11-08 17:01:56', '2017-11-08 17:01:56'),
(12, 17, 13, '2017-11-08 17:29:09', '2017-11-08 17:29:09'),
(13, 18, 12, '2017-11-08 17:29:09', '2017-11-08 17:29:09'),
(14, 19, 14, '2017-11-08 17:29:09', '2017-11-08 17:29:09'),
(15, 20, 15, '2017-11-08 17:29:09', '2017-11-08 17:29:09'),
(16, 21, 13, '2017-11-21 14:59:21', '2017-11-21 14:59:21'),
(17, 18, 18, '2017-11-25 11:03:40', '2017-11-25 11:03:40'),
(18, 18, 19, '2017-11-25 11:06:16', '2017-11-25 11:06:16'),
(19, 16, 12, '2017-11-25 11:08:41', '2017-11-25 11:08:41'),
(20, 16, 20, '2017-11-25 11:27:02', '2017-11-25 11:27:02'),
(21, 8, 21, '2017-11-25 11:29:30', '2017-11-25 11:29:30'),
(22, 14, 22, '2017-11-25 12:13:45', '2017-11-25 12:13:45'),
(23, 13, 22, '2017-11-25 12:14:04', '2017-11-25 12:14:04'),
(25, 15, 11, '2017-11-25 12:39:27', '2017-11-25 12:39:27');

-- --------------------------------------------------------

--
-- Структура таблицы `tracks_in_genres`
--

CREATE TABLE IF NOT EXISTS `tracks_in_genres` (
  `track_in_genre_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tracks_in_genres`
--

INSERT INTO `tracks_in_genres` (`track_in_genre_id`, `track_id`, `genre_id`, `created_at`, `updated_at`) VALUES
(1, 8, 5, '2017-11-07 18:01:33', '2017-11-07 18:01:33'),
(2, 9, 5, '2017-11-07 18:23:01', '2017-11-07 18:23:01'),
(3, 10, 5, '2017-11-07 18:24:46', '2017-11-07 18:24:46'),
(4, 11, 5, '2017-11-07 18:28:21', '2017-11-07 18:28:21'),
(5, 12, 5, '2017-11-08 15:38:52', '2017-11-08 15:38:52'),
(6, 13, 5, '2017-11-08 15:38:52', '2017-11-08 15:38:52'),
(7, 14, 5, '2017-11-08 15:38:52', '2017-11-08 15:38:52'),
(8, 15, 7, '2017-11-08 17:01:50', '2017-11-08 17:01:50'),
(9, 16, 6, '2017-11-08 17:01:56', '2017-11-08 17:01:56'),
(10, 17, 1, '2017-11-08 17:29:09', '2017-11-08 17:29:09'),
(11, 18, 6, '2017-11-08 17:29:09', '2017-11-08 17:29:09'),
(12, 19, 1, '2017-11-08 17:29:09', '2017-11-08 17:29:09'),
(13, 20, 8, '2017-11-08 17:29:09', '2017-11-08 17:29:09'),
(14, 21, 1, '2017-11-21 14:59:21', '2017-11-21 14:59:21');

-- --------------------------------------------------------

--
-- Структура таблицы `tracks_in_playlists`
--

CREATE TABLE IF NOT EXISTS `tracks_in_playlists` (
  `track_in_playlist_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tracks_in_users`
--

CREATE TABLE IF NOT EXISTS `tracks_in_users` (
  `track_in_user_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tracks_in_users`
--

INSERT INTO `tracks_in_users` (`track_in_user_id`, `user_id`, `track_id`, `created_at`, `updated_at`) VALUES
(3, 1, 9, '2017-11-07 18:23:01', '2017-11-07 18:23:01'),
(4, 1, 10, '2017-11-07 18:24:46', '2017-11-07 18:24:46'),
(5, 1, 11, '2017-11-07 18:28:21', '2017-11-07 18:28:21'),
(6, 1, 12, '2017-11-08 15:38:52', '2017-11-08 15:38:52'),
(7, 1, 13, '2017-11-08 15:38:52', '2017-11-08 15:38:52'),
(8, 1, 14, '2017-11-08 15:38:52', '2017-11-08 15:38:52'),
(9, 1, 15, '2017-11-08 17:01:50', '2017-11-08 17:01:50'),
(14, 1, 17, '2017-11-08 17:29:09', '2017-11-08 17:29:09'),
(16, 1, 19, '2017-11-08 17:29:09', '2017-11-08 17:29:09'),
(17, 1, 20, '2017-11-08 17:29:09', '2017-11-08 17:29:09'),
(19, 2, 21, '2017-11-21 14:59:21', '2017-11-21 14:59:21'),
(20, 1, 8, '2017-11-25 12:31:49', '2017-11-25 12:31:49');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `created_at`, `updated_at`, `user_type`) VALUES
(1, 'AlexChuiko', 'alex.chuyko9@gmail.com', '$2y$10$tWlpV26.cZ/GOPx0PR0c9.xbwQm2UaiiwfL8U6JopJZG5fQjxUz0C', '2017-11-07 07:13:16', '2017-11-07 07:13:16', 1),
(2, 'ADMIN', 'admin@test.com', '$2y$10$FW6fOBerbr0qSfbwU7ZnveVzHF5uCjYCBFO4NqJGj61oxgr8K.2x.', '2017-11-21 14:19:43', '2017-11-21 14:19:43', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users_genres`
--

CREATE TABLE IF NOT EXISTS `users_genres` (
  `user_genre_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_in_communities`
--

CREATE TABLE IF NOT EXISTS `users_in_communities` (
  `user_id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_in_communities`
--

INSERT INTO `users_in_communities` (`user_id`, `community_id`, `updated_at`, `created_at`) VALUES
(1, 9, '2017-11-26 06:07:28', '2017-11-26 06:07:28'),
(2, 9, '2017-11-21 14:51:47', '2017-11-21 14:51:47');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `account_type`
--
ALTER TABLE `account_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Индексы таблицы `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `album_name` (`album_name`),
  ADD KEY `album_type_inx` (`album_type`);

--
-- Индексы таблицы `albums_in_artists`
--
ALTER TABLE `albums_in_artists`
  ADD PRIMARY KEY (`album_in_artist_id`),
  ADD KEY `album_id` (`album_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Индексы таблицы `albums_in_users`
--
ALTER TABLE `albums_in_users`
  ADD PRIMARY KEY (`album_in_user_id`);

--
-- Индексы таблицы `album_types`
--
ALTER TABLE `album_types`
  ADD PRIMARY KEY (`album_type_id`);

--
-- Индексы таблицы `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`artist_id`),
  ADD KEY `artist_name` (`artist_name`),
  ADD KEY `country_indx` (`country`),
  ADD KEY `artist_type_indx` (`artist_type`);

--
-- Индексы таблицы `artist_types`
--
ALTER TABLE `artist_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Индексы таблицы `audit_logging`
--
ALTER TABLE `audit_logging`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `fk_comments_created_user_id` (`created_at_user`);

--
-- Индексы таблицы `comments_in_communities`
--
ALTER TABLE `comments_in_communities`
  ADD PRIMARY KEY (`comment_in_community_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `community_id` (`community_id`);

--
-- Индексы таблицы `communities`
--
ALTER TABLE `communities`
  ADD PRIMARY KEY (`community_id`),
  ADD KEY `fk_communities_created_user_id` (`created_at_user`),
  ADD KEY `fk_communities_genre_id` (`genre_id`),
  ADD KEY `community_name` (`community_name`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Индексы таблицы `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `event_location_indx` (`event_location`);

--
-- Индексы таблицы `event_locations`
--
ALTER TABLE `event_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Индексы таблицы `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`),
  ADD KEY `genre_name` (`genre_name`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `user_id_indx` (`user_id`),
  ADD KEY `track_id_indx` (`track_id`);

--
-- Индексы таблицы `music_news`
--
ALTER TABLE `music_news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `news_creator_indx` (`news_creator`);

--
-- Индексы таблицы `news_creators`
--
ALTER TABLE `news_creators`
  ADD PRIMARY KEY (`creator_id`);

--
-- Индексы таблицы `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`playlist_id`),
  ADD KEY `fk_playlists_created_user_id` (`created_at_user`);

--
-- Индексы таблицы `playlists_in_communities`
--
ALTER TABLE `playlists_in_communities`
  ADD PRIMARY KEY (`playlist_in_community_id`),
  ADD KEY `playlist_id` (`playlist_id`),
  ADD KEY `community_id` (`community_id`);

--
-- Индексы таблицы `playlists_in_users`
--
ALTER TABLE `playlists_in_users`
  ADD PRIMARY KEY (`playlist_in_user_id`);

--
-- Индексы таблицы `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`track_id`),
  ADD KEY `track_name` (`track_name`),
  ADD KEY `created_at_user` (`created_at_user`);

--
-- Индексы таблицы `tracks_in_albums`
--
ALTER TABLE `tracks_in_albums`
  ADD PRIMARY KEY (`track_in_album_id`),
  ADD KEY `fk_track_in_albums_track_id` (`track_id`),
  ADD KEY `fk_track_in_albums_album_id` (`album_id`);

--
-- Индексы таблицы `tracks_in_artists`
--
ALTER TABLE `tracks_in_artists`
  ADD PRIMARY KEY (`track_in_artist_id`),
  ADD KEY `track_id` (`track_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Индексы таблицы `tracks_in_genres`
--
ALTER TABLE `tracks_in_genres`
  ADD PRIMARY KEY (`track_in_genre_id`);

--
-- Индексы таблицы `tracks_in_playlists`
--
ALTER TABLE `tracks_in_playlists`
  ADD PRIMARY KEY (`track_in_playlist_id`),
  ADD KEY `fk_tracks_in_playlists_playlist_id` (`playlist_id`),
  ADD KEY `fk_tracks_in_playlists_track_id` (`track_id`) USING BTREE;

--
-- Индексы таблицы `tracks_in_users`
--
ALTER TABLE `tracks_in_users`
  ADD PRIMARY KEY (`track_in_user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`email`),
  ADD UNIQUE KEY `user_name` (`name`),
  ADD KEY `user_type_indx` (`user_type`);

--
-- Индексы таблицы `users_genres`
--
ALTER TABLE `users_genres`
  ADD PRIMARY KEY (`user_genre_id`),
  ADD KEY `g_user_id_indx` (`user_id`),
  ADD KEY `g_genre_id_indx` (`genre_id`);

--
-- Индексы таблицы `users_in_communities`
--
ALTER TABLE `users_in_communities`
  ADD PRIMARY KEY (`user_id`,`community_id`),
  ADD KEY `fk_users_in_communities_community_id` (`community_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `account_type`
--
ALTER TABLE `account_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `albums`
--
ALTER TABLE `albums`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `albums_in_artists`
--
ALTER TABLE `albums_in_artists`
  MODIFY `album_in_artist_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `albums_in_users`
--
ALTER TABLE `albums_in_users`
  MODIFY `album_in_user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `album_types`
--
ALTER TABLE `album_types`
  MODIFY `album_type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `artists`
--
ALTER TABLE `artists`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT для таблицы `artist_types`
--
ALTER TABLE `artist_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `audit_logging`
--
ALTER TABLE `audit_logging`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `comments_in_communities`
--
ALTER TABLE `comments_in_communities`
  MODIFY `comment_in_community_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `communities`
--
ALTER TABLE `communities`
  MODIFY `community_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `event_locations`
--
ALTER TABLE `event_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `music_news`
--
ALTER TABLE `music_news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `news_creators`
--
ALTER TABLE `news_creators`
  MODIFY `creator_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `playlists`
--
ALTER TABLE `playlists`
  MODIFY `playlist_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `playlists_in_communities`
--
ALTER TABLE `playlists_in_communities`
  MODIFY `playlist_in_community_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `playlists_in_users`
--
ALTER TABLE `playlists_in_users`
  MODIFY `playlist_in_user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tracks`
--
ALTER TABLE `tracks`
  MODIFY `track_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT для таблицы `tracks_in_albums`
--
ALTER TABLE `tracks_in_albums`
  MODIFY `track_in_album_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `tracks_in_artists`
--
ALTER TABLE `tracks_in_artists`
  MODIFY `track_in_artist_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT для таблицы `tracks_in_genres`
--
ALTER TABLE `tracks_in_genres`
  MODIFY `track_in_genre_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `tracks_in_playlists`
--
ALTER TABLE `tracks_in_playlists`
  MODIFY `track_in_playlist_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tracks_in_users`
--
ALTER TABLE `tracks_in_users`
  MODIFY `track_in_user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `users_genres`
--
ALTER TABLE `users_genres`
  MODIFY `user_genre_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `fk_album_type` FOREIGN KEY (`album_type`) REFERENCES `album_types` (`album_type_id`);

--
-- Ограничения внешнего ключа таблицы `albums_in_artists`
--
ALTER TABLE `albums_in_artists`
  ADD CONSTRAINT `fk_album_id_artists` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`),
  ADD CONSTRAINT `fk_artist_id_albums` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`);

--
-- Ограничения внешнего ключа таблицы `artists`
--
ALTER TABLE `artists`
  ADD CONSTRAINT `fk_artist_type` FOREIGN KEY (`artist_type`) REFERENCES `artist_types` (`type_id`);

--
-- Ограничения внешнего ключа таблицы `audit_logging`
--
ALTER TABLE `audit_logging`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_created_user_id` FOREIGN KEY (`created_at_user`) REFERENCES `users_in_communities` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `comments_in_communities`
--
ALTER TABLE `comments_in_communities`
  ADD CONSTRAINT `fk_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_community_comm_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`community_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `communities`
--
ALTER TABLE `communities`
  ADD CONSTRAINT `fk_communities_created_user_id` FOREIGN KEY (`created_at_user`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_communities_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_event_location` FOREIGN KEY (`event_location`) REFERENCES `event_locations` (`location_id`);

--
-- Ограничения внешнего ключа таблицы `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_like_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_lise_track_id` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`);

--
-- Ограничения внешнего ключа таблицы `music_news`
--
ALTER TABLE `music_news`
  ADD CONSTRAINT `fk_news_creator` FOREIGN KEY (`news_creator`) REFERENCES `news_creators` (`creator_id`);

--
-- Ограничения внешнего ключа таблицы `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `fk_playlists_created_user_id` FOREIGN KEY (`created_at_user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `playlists_in_communities`
--
ALTER TABLE `playlists_in_communities`
  ADD CONSTRAINT `fk_community_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`community_id`),
  ADD CONSTRAINT `fk_playlist_id` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`);

--
-- Ограничения внешнего ключа таблицы `tracks`
--
ALTER TABLE `tracks`
  ADD CONSTRAINT `fk_created_at_user` FOREIGN KEY (`created_at_user`) REFERENCES `users` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `tracks_in_albums`
--
ALTER TABLE `tracks_in_albums`
  ADD CONSTRAINT `fk_track_in_albums_album_id` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`),
  ADD CONSTRAINT `fk_track_in_albums_track_id` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`);

--
-- Ограничения внешнего ключа таблицы `tracks_in_artists`
--
ALTER TABLE `tracks_in_artists`
  ADD CONSTRAINT `fk_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_track_id` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tracks_in_playlists`
--
ALTER TABLE `tracks_in_playlists`
  ADD CONSTRAINT `fk_tracks_in_playlists_playlist_id` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tracks_in_playlists_track_id` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_type` FOREIGN KEY (`user_type`) REFERENCES `account_type` (`type_id`);

--
-- Ограничения внешнего ключа таблицы `users_genres`
--
ALTER TABLE `users_genres`
  ADD CONSTRAINT `f_g_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`),
  ADD CONSTRAINT `fk_g_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `users_in_communities`
--
ALTER TABLE `users_in_communities`
  ADD CONSTRAINT `fk_users_in_communities_community_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`community_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users_in_communities_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
