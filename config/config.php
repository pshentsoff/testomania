<?php

/*---------------------------------------------------------------------------
 * @Plugin Name: BlockBanner
 * @Plugin Id: blockbanner
 * @Plugin URI: 
 * @Description: Banners Blocks management for LiveStreet/ACE
 * @Version: 0.0.1
 * @Author: Vadim Pshentsov (aka pshentsoff)
 * @Author URI: http://blog.pshentsoff.ru 
 * @LiveStreet Version: 1.x
 * @File Name: %%filename%%
 * @License: GNU GPL v2, http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 *----------------------------------------------------------------------------
 */

$config = array ();

//Default values
$config['default']['template'] = 'testpage';
$config['default']['block'] = '/blocks/block.tests.tpl';
$config['default']['js_calculate_function'] = 'testomania_count()';
$config['default']['mainpage'] = '/services/';

// plugin`s settings table name
$config['table']['tests'] = '___db.table.prefix___testomania_tests';
$config['table']['questions'] = '___db.table.prefix___testomania_questions';
$config['table']['variants'] = '___db.table.prefix___testomania_variants';
$config['table']['results'] = '___db.table.prefix___testomania_results';

//plugin routing
$config['$root$']['router']['page']['testomania'] = 'PluginTestomania_ActionTestomaniaAdmin';
//Наследство... services? почему, блядь, services? это же тестирование...
//@todo убрать это нахуй
$config['$root$']['router']['page']['services'] = 'PluginTestomania_ActionTestomania';

//Настройки кеша
//Время жизни кэша
$config['cache']['ttl'] = 1;
$config['cache']['taskschange'] = 'testomania_taskschange';
$config['cache']['questionschange'] = 'testomania_questionschange';
$config['cache']['resultschange'] = 'testomania_resultschange';
$config['cache']['variantschange'] = 'testomania_variantschange';
$config['cache']['allchange_array'] = array('testomania_taskschange', 'testomania_questionschange', 'testomania_variantschange', 'testomania_resultschange');

//Оказывать/нет краткое описание
$config['tests']['show_description_short'] = 1;
$config['tests']['url'] = '/services/';
$config['tests']['show_donate_link'] = 1;

// Выводить/нет порядковый номер вопросов в тесте
$config['questions']['show_order'] = 1;
//Максимально допустимое количество вопросов для добавления блоком
$config['questions']['max_per_addition'] = 50;

//Максимально допустимое количество вопросов для добавления блоком
$config['variants']['max_per_addition'] = 10;

return $config;

