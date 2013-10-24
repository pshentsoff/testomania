<?php

/**
 * @file        PluginTestomania.class.php
 * @description
 *
 * PHP Version  5.3
 *
 * @package
 * @category
 * @plugin URI
 * @version     1.1.1
 * @copyright   2013, Vadim Pshentsov. All Rights Reserved.
 * @license     http://www.apache.org/licenses/LICENSE-2.0 Apache License, Version 2.0
 * @author      Vadim Pshentsov <pshentsoff@gmail.com>
 * @created     06.03.13
 */

if(!class_exists('Plugin')) {
  die('This script can not be executed directly.');
  }

class PluginTestomania extends Plugin {

    /** Plugin init **/
    public function Init() {
        parent::Init();

        $this->Viewer_AppendStyle(Plugin::GetTemplateWebPath(__CLASS__).'/css/testomania.css', array('priority'=>100));
        $this->Viewer_AppendScript(Plugin::GetTemplateWebPath(__CLASS__).'/js/testomania.js');

    }

    public function Activate() {
        $file = dirname(__FILE__).'/sql/install.sql';
        if(file_exists($file)) {
            $this->ExportSQL($file);
        }
        return true;
    }

    public function Deactivate() {
        $file = dirname(__FILE__).'/sql/uninstall.sql';
        if(file_exists($file)) {
            $this->ExportSQL($file);
        }
        return true;
    }
      
  }