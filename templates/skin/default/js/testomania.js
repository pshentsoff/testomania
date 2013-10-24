/**
 * Javascript source file
 * @file            testomania.js
 * @description     Tests management tool
 *
 * PHP Version 5.3
 *
 * @package    Testomania
 * @category    Javascript file
 * @copyright  2013, Vadim Pshentsov. All Rights Reserved.
 * @license    http://www.apache.org/licenses/LICENSE-2.0 Apache License, Version 2.0
 * @author     Vadim Pshentsov <pshentsoff@gmail.com>
 * @created    06.03.13
 */

function testomania_count(){
    var sum = 0;
    var value = 0;

    for (var i = 1; i <= testomania_questions_count; i++){
        value = jQuery("input[name='question_"+i+"']:checked").val();
        if (!value) value = 0;
        sum += parseInt(value);
    }
    var msg = testomania_results(sum);
    testomania_show_results(msg);
}

function testomania_show_results(msg){
    jQuery('.test-results p').html(msg);
    jQuery('.test-results').fadeIn();
}

