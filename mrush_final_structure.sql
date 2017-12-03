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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `album_types`
--

CREATE TABLE IF NOT EXISTS `album_types` (
  `album_type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `artist_types`
--

CREATE TABLE IF NOT EXISTS `artist_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `albums`
--
ALTER TABLE `albums`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `albums_in_artists`
--
ALTER TABLE `albums_in_artists`
  MODIFY `album_in_artist_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `albums_in_users`
--
ALTER TABLE `albums_in_users`
  MODIFY `album_in_user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `album_types`
--
ALTER TABLE `album_types`
  MODIFY `album_type_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `artists`
--
ALTER TABLE `artists`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `artist_types`
--
ALTER TABLE `artist_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `audit_logging`
--
ALTER TABLE `audit_logging`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `comments_in_communities`
--
ALTER TABLE `comments_in_communities`
  MODIFY `comment_in_community_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `communities`
--
ALTER TABLE `communities`
  MODIFY `community_id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `playlist_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `playlists_in_communities`
--
ALTER TABLE `playlists_in_communities`
  MODIFY `playlist_in_community_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `playlists_in_users`
--
ALTER TABLE `playlists_in_users`
  MODIFY `playlist_in_user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tracks`
--
ALTER TABLE `tracks`
  MODIFY `track_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tracks_in_albums`
--
ALTER TABLE `tracks_in_albums`
  MODIFY `track_in_album_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tracks_in_artists`
--
ALTER TABLE `tracks_in_artists`
  MODIFY `track_in_artist_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tracks_in_genres`
--
ALTER TABLE `tracks_in_genres`
  MODIFY `track_in_genre_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tracks_in_playlists`
--
ALTER TABLE `tracks_in_playlists`
  MODIFY `track_in_playlist_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tracks_in_users`
--
ALTER TABLE `tracks_in_users`
  MODIFY `track_in_user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
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
