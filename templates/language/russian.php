<?php
/**
 * @file        russian.php
 * @description
 *
 * PHP Version  5.3
 *
 * @package
 * @category
 * @plugin URI
 * @copyright   2013, Vadim Pshentsov. All Rights Reserved.
 * @license     http://www.apache.org/licenses/LICENSE-2.0 Apache License, Version 2.0
 * @author      Vadim Pshentsov <pshentsoff@gmail.com>
 * @created     07.03.13
 */

return array(
    'title' => 'Testomania',
    'description' => 'Описание',
    'license' => 'Лицензия',
    'donate' => 'Пожертвования',

    'manage_tests' => 'Тесты',
    'manage_test' => 'Тест',
    'manage_questions' => 'Вопросы',
    'manage_variants' => 'Варианты ответов',
    'manage_results' => 'Результаты теста',

    'no_data' => 'Нет данных',
    'save' => 'Сохранить',
    'delete' => 'Удалить выбранные',
    'add' => 'Добавить',
    'copytoall' => 'Копировать на все вопросы',

    'tests_title' => 'Тесты',
    'goback' => array(
        'tests_page' => 'Вернуться на страницу с тестами',
        ),

    'test_results' => 'Результаты теста:',
    'test_calculate' => 'Расчитать',

    'admin' => array(
        'tests' => array(
            'id' => 'ID',
            'name' => 'Имя',
            'title' => 'Наименование',
            'description_short' => 'Краткое описание',
            'template' => 'Шаблон',
            'logo_url' => 'URL логотипа',
            'logo' => 'Логотип',
            'order' => 'Порядок',
            'published' => 'Опубл.',
            'description' => 'Описание',
            'js_result_func' => 'Функция анализа результатов (value = кол-во баллов набранных в тесте)',
            'questions' => 'Вопросы',
            'results' => 'Результаты',
        ),
        'questions' => array(
            'id' => 'ID',
            'test_id' => 'ID теста',
            'order' => 'Порядок',
            'question' => 'Вопрос',
            'variants' => 'Варианты ответов',
        ),
        'variants' => array(
            'id' => 'ID',
            'question_id' => 'ID вопроса',
            'order' => 'Порядок',
            'weight' => 'Вес ответа (баллы)',
            'variant' => 'Текст варианта'
        ),
        'results' => array(
            'id' => 'ID',
            'test_id' => 'ID теста',
            'weights_low' => 'Баллы ниж.(вкл-но)',
            'order' => 'Порядок',
            'result' => 'Результат теста',
        ),
    ),
);