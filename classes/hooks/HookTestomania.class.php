<?php
/**
 * @file        HookTestomania.class.php
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
 * @created     12.03.13
 */

if(!class_exists('Hook')) {
    die('This script can not be executed directly.');
}

class PluginTestomania_HookTestomania extends Hook {

    public function RegisterHook() {
        $this->AddHook('template_testomania_block', 'TestsBlock');
    }

    public function TestsBlock() {

        $aTests = $this->PluginTestomania_Testomania_GetTests();
        $this->Viewer_Assign('aTests', $aTests);

        $out = $this->Viewer_Fetch(Plugin::GetTemplatePath(__CLASS__).Config::Get('plugin.testomania.default.block'));

        return $out;
    }

}
