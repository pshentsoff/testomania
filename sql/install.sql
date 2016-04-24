-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Мар 12 2013 г., 12:27
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- База данных: `db_takzdorovo`
--

-- --------------------------------------------------------

--
-- Структура таблицы `prefix_testomania_questions`
--

CREATE TABLE IF NOT EXISTS `prefix_testomania_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL COMMENT 'ID теста',
  `order` int(11) DEFAULT NULL COMMENT 'Порядковый номер',
  `question` text COMMENT 'Текст вопроса',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Структура таблицы `prefix_testomania_results`
--

CREATE TABLE IF NOT EXISTS `prefix_testomania_results` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_id` int(10) unsigned NOT NULL COMMENT 'ID теста',
  `weights_low` int(11) NOT NULL COMMENT 'Баллы ниж.(включительно)',
  `result` text NOT NULL COMMENT 'Результат теста',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Структура таблицы `prefix_testomania_tests`
--

CREATE TABLE IF NOT EXISTS `prefix_testomania_tests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'Системное имя теста',
  `title` varchar(256) DEFAULT NULL COMMENT 'Название теста',
  `description_short` varchar(256) DEFAULT NULL COMMENT 'Краткое описание теста.',
  `template` varchar(256) DEFAULT NULL COMMENT 'Используемый шаблон',
  `logo_url` varchar(256) DEFAULT NULL COMMENT 'URL иконки/лого теста',
  `order` int(11) DEFAULT NULL COMMENT 'Порядковый номер',
  `published` int(1) NOT NULL DEFAULT '0' COMMENT 'Признак публикации теста',
  `description` text COMMENT 'Описание теста.',
  `js_result_func` text COMMENT 'Тело javascript функции обработки результатов.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Данные тестов';

--
-- Структура таблицы `prefix_testomania_variants`
--

CREATE TABLE IF NOT EXISTS `prefix_testomania_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL COMMENT 'ID вопроса',
  `order` int(11) DEFAULT NULL COMMENT 'Порядковый номер',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Вес вопроса в баллах',
  `variant` text NOT NULL COMMENT 'Текст варианта ответа',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
