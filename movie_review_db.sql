-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 23 2022 г., 22:54
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `movie_review_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id_comment` int NOT NULL,
  `data_comment` date NOT NULL,
  `text_comment` varchar(255) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `review`
--

CREATE TABLE `review` (
  `id_review` int NOT NULL,
  `title_review` varchar(255) NOT NULL,
  `description_review` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `poster_review` varchar(255) NOT NULL,
  `video_review` varchar(255) NOT NULL,
  `date_review` date NOT NULL,
  `text_review` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `review`
--

INSERT INTO `review` (`id_review`, `title_review`, `description_review`, `poster_review`, `video_review`, `date_review`, `text_review`, `id_user`) VALUES
(2, 'хуйня', 'пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!пРЕКРАСНЫЙ фильм о хуйне!', 'лооо', 'лолоо', '2022-10-05', 'авааааааааааааааааааааааааааааааааваааааааааааааааааааааааааааааааавааааааааааааааааааааааааааааааааваааааааааааааааааааааааааааааааавааааааааааааааааааааааааааааааааваааааааааааааааааааааааааааааааавааааааааааааааааааааааааааааааааваааааааааааааааааааааааааааааааавааааааааааааааааааааааааааааааааваааааааааааааааааааааааааааааааавааааааааааааааааааааааааааааааааваааааааааааааааааааааааааааааааавааааааааааааааааааааааааааааааааваааааааааааааааааааааааааааааааавааааааааааааааааааааааааааааааааваааааааааааааааааааааааааааааааавааааааааааааааааааааааааааааааааваааааааааааааааааааааааааааааааавааааааааааааааааааааааааааааааааваааааааааааааааааааааааааааааааавааааааааааааааааааааааааааааааааваааааааааааааааааааааааааааааааавааааааааааааааааааааааааааааааа', 114);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `name_user` varchar(255) NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `password_user` varchar(255) NOT NULL,
  `role_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id_user`, `name_user`, `login_user`, `password_user`, `role_user`) VALUES
(114, 'Никита Никифоров', 'nikita_nikifrov', 'f02284870a436f6c307c2a18d250a10d', 'Модератор'),
(115, 'Ксения Николаева', 'ksenia4341', 'f02284870a436f6c307c2a18d250a10d', 'Пользователь'),
(116, 'Тихон Петухов', 'pet_tixon0999', 'f02284870a436f6c307c2a18d250a10d', 'Пользователь'),
(117, 'Сергей Громов', 'sergey_grom_0999888', 'f02284870a436f6c307c2a18d250a10d', 'Пользователь'),
(118, 'Ольга Иванова', 'olha_ivanova_111', 'f02284870a436f6c307c2a18d250a10d', 'Пользователь'),
(119, 'Филипп Кузнецов', 'kyznec_filip_09123', 'f02284870a436f6c307c2a18d250a10d', 'Модератор'),
(120, 'Ярослава Муравьева', 'myr_yar_pro_1222', 'f02284870a436f6c307c2a18d250a10d', 'Пользователь'),
(121, 'Александр Белов', 'beliy_alex_111', 'f02284870a436f6c307c2a18d250a10d', 'Пользователь'),
(122, 'Антон Моисеев', 'moisey09123', 'f02284870a436f6c307c2a18d250a10d', 'Модератор'),
(123, 'Роберт Иванов', 'robert_ivanov_000', 'f02284870a436f6c307c2a18d250a10d', 'Пользователь');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Индексы таблицы `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id_review`),
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `review`
--
ALTER TABLE `review`
  MODIFY `id_review` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
