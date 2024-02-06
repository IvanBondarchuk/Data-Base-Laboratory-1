-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Фев 06 2024 г., 14:05
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_bondarchuk7678_databaselab1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `id` int NOT NULL COMMENT 'ID автора',
  `id_publication` int NOT NULL COMMENT 'ID публикации',
  `id_person` int NOT NULL COMMENT 'ID персоны',
  `share_of_participation` int NOT NULL COMMENT 'Доля участия'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`id`, `id_publication`, `id_person`, `share_of_participation`) VALUES
(1, 1, 1, 100),
(2, 2, 3, 100),
(3, 3, 4, 50),
(4, 3, 6, 50),
(5, 4, 6, 100),
(6, 5, 5, 100);

-- --------------------------------------------------------

--
-- Структура таблицы `journal`
--

CREATE TABLE `journal` (
  `id` int NOT NULL COMMENT 'ID журнала',
  `name` varchar(255) NOT NULL COMMENT 'Название журнала'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `journal`
--

INSERT INTO `journal` (`id`, `name`) VALUES
(1, 'Информационные технологии и техника'),
(2, 'CPU-Journal');

-- --------------------------------------------------------

--
-- Структура таблицы `link`
--

CREATE TABLE `link` (
  `id` int NOT NULL COMMENT 'ID ссылки',
  `id_publication` int NOT NULL COMMENT 'ID публикации',
  `id_publication_link` int NOT NULL COMMENT 'ID публикации ссылки'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `link`
--

INSERT INTO `link` (`id`, `id_publication`, `id_publication_link`) VALUES
(1, 1, 2),
(3, 5, 3),
(4, 4, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `person`
--

CREATE TABLE `person` (
  `id` int NOT NULL COMMENT 'ID персоны',
  `full name` varchar(255) NOT NULL COMMENT 'ФИО персоны',
  `birthdate` date DEFAULT NULL COMMENT 'Дата рождения персоны'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `person`
--

INSERT INTO `person` (`id`, `full name`, `birthdate`) VALUES
(1, 'Иван Иванович Иванов', '1994-03-01'),
(3, 'Александр Петрович Павлов', '1978-01-06'),
(4, 'Дмитрий Викторович Захаров', '1986-04-10'),
(5, 'Кирилл Сергеевич Захаров', '1987-07-01'),
(6, 'Михаил Александрович Романов', '1982-01-20');

-- --------------------------------------------------------

--
-- Структура таблицы `publications`
--

CREATE TABLE `publications` (
  `id` int NOT NULL COMMENT 'ID публикации',
  `id_journal` int NOT NULL COMMENT 'ID журнала',
  `name` varchar(255) NOT NULL COMMENT 'Наименование',
  `date_publication` date NOT NULL COMMENT 'Дата публикации'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `publications`
--

INSERT INTO `publications` (`id`, `id_journal`, `name`, `date_publication`) VALUES
(1, 1, 'Нейросети. В каких странах и в каких сферах они уже используются?', '2024-02-01'),
(2, 1, 'Зарождение искусственного интеллекта', '2023-01-10'),
(3, 1, 'Архитектура операционных систем для персональных компьютеров.', '2010-02-11'),
(4, 2, 'Создание приложений для систем архитектуры Windows NT', '2014-06-22'),
(5, 2, 'Разработка собственного дистрибутива Linux', '2018-09-12');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_person` (`id_person`),
  ADD KEY `id_publication` (`id_publication`);

--
-- Индексы таблицы `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_publication` (`id_publication`),
  ADD KEY `link_ibfk_2` (`id_publication_link`);

--
-- Индексы таблицы `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_journal` (`id_journal`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID автора', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `journal`
--
ALTER TABLE `journal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID журнала', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `link`
--
ALTER TABLE `link`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID ссылки', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `person`
--
ALTER TABLE `person`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID персоны', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `publications`
--
ALTER TABLE `publications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID публикации', AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `author_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `author_ibfk_2` FOREIGN KEY (`id_publication`) REFERENCES `publications` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `link`
--
ALTER TABLE `link`
  ADD CONSTRAINT `link_ibfk_1` FOREIGN KEY (`id_publication`) REFERENCES `publications` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `link_ibfk_2` FOREIGN KEY (`id_publication_link`) REFERENCES `publications` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `publications`
--
ALTER TABLE `publications`
  ADD CONSTRAINT `publications_ibfk_1` FOREIGN KEY (`id_journal`) REFERENCES `journal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
