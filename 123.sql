-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.30 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных zayavka
CREATE DATABASE IF NOT EXISTS `zayavka` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `zayavka`;

-- Дамп структуры для таблица zayavka.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `themes` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы zayavka.companies: ~2 rows (приблизительно)
INSERT INTO `companies` (`id`, `name`, `themes`) VALUES
	(1, 'Роост ИА', 'Гос закупка'),
	(2, 'Игру ооа', 'Заказ');

-- Дамп структуры для таблица zayavka.divisions_inst
CREATE TABLE IF NOT EXISTS `divisions_inst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `faculty_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty_id` (`faculty_id`),
  CONSTRAINT `divisions_inst_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы zayavka.divisions_inst: ~1 rows (приблизительно)
INSERT INTO `divisions_inst` (`id`, `name`, `faculty_id`) VALUES
	(1, 'АБВ и Г', 92);

-- Дамп структуры для таблица zayavka.faculty
CREATE TABLE IF NOT EXISTS `faculty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы zayavka.faculty: ~2 rows (приблизительно)
INSERT INTO `faculty` (`id`, `name`) VALUES
	(92, 'Институт авиамашиностроения и транспорта'),
	(93, 'Институт архитектуры, строительства и дизайна');

-- Дамп структуры для таблица zayavka.groups_table
CREATE TABLE IF NOT EXISTS `groups_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_number` int DEFAULT NULL,
  `stream_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stream_id` (`stream_id`),
  CONSTRAINT `groups_table_ibfk_1` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы zayavka.groups_table: ~2 rows (приблизительно)
INSERT INTO `groups_table` (`id`, `group_number`, `stream_id`) VALUES
	(1, 1, 12244),
	(2, 1, 12233);

-- Дамп структуры для таблица zayavka.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `faculty_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty_id` (`faculty_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы zayavka.profiles: ~2 rows (приблизительно)
INSERT INTO `profiles` (`id`, `name`, `faculty_id`) VALUES
	(559, 'Машиностроение', 92),
	(568, 'Строительство', 93);

-- Дамп структуры для таблица zayavka.streams
CREATE TABLE IF NOT EXISTS `streams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `year` year DEFAULT NULL,
  `profile_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id` (`profile_id`),
  CONSTRAINT `streams_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12245 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы zayavka.streams: ~2 rows (приблизительно)
INSERT INTO `streams` (`id`, `name`, `full_name`, `code`, `year`, `profile_id`) VALUES
	(12233, 'ЭЛб-23', 'Техническое обслуживание летательных аппаратов и авиационных двигателей', '25.03.01', '2023', 559),
	(12244, 'ДСб-23', 'Архитектурно-дизайнерское проектирование', '07.03.03', '2023', 568);

-- Дамп структуры для таблица zayavka.student
CREATE TABLE IF NOT EXISTS `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fio` varchar(50) DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `stud_id` int DEFAULT NULL,
  `category` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы zayavka.student: ~2 rows (приблизительно)
INSERT INTO `student` (`id`, `fio`, `group_id`, `stud_id`, `category`) VALUES
	(1, 'Пургин Семён Генадьевич', 1, 221, 1),
	(2, 'Маркова Мария Сергеевна', 2, 222, 1);

-- Дамп структуры для таблица zayavka.student_otchet
CREATE TABLE IF NOT EXISTS `student_otchet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `link_ya` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `student_otchet_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы zayavka.student_otchet: ~2 rows (приблизительно)
INSERT INTO `student_otchet` (`id`, `student_id`, `link_ya`, `status`) VALUES
	(1, 1, 1, 0),
	(2, 2, 1, 0);

-- Дамп структуры для таблица zayavka.student_practic
CREATE TABLE IF NOT EXISTS `student_practic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `theme` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `company_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `company_id` (`company_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `student_practic_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `student_practic_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `student_practic_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы zayavka.student_practic: ~1 rows (приблизительно)
INSERT INTO `student_practic` (`id`, `student_id`, `company_id`, `teacher_id`, `theme`, `status`, `company_path`) VALUES
	(1, 1, 1, 1, 'Заказы для..', 0, '1');

-- Дамп структуры для таблица zayavka.teachers
CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fio` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `post` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `work_load` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы zayavka.teachers: ~1 rows (приблизительно)
INSERT INTO `teachers` (`id`, `fio`, `post`, `work_load`) VALUES
	(1, 'Седых Ольга Васильевна', 'Глав бух', 1);

-- Дамп структуры для таблица zayavka.templates
CREATE TABLE IF NOT EXISTS `templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `decanat_check` int DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `templates_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Дамп данных таблицы zayavka.templates: ~1 rows (приблизительно)
INSERT INTO `templates` (`id`, `group_id`, `name`, `decanat_check`, `comment`, `date`) VALUES
	(1, 1, 'Какашки', 1, 'Гнездо', '12.02.2002');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
