<?php
/**
 * @file        Testomania.mapper.class.php
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

if(!class_exists('Mapper')) {
    die('This script can not be executed directly.');
}

class PluginTestomania_ModuleTestomania_MapperTestomania extends Mapper {

    public function GetTests($bPublishedOnly = true) {

        $sql = 'SELECT * FROM `'.Config::Get ('plugin.testomania.table.tests') . '`';
        $sql .= $bPublishedOnly ? ' WHERE `published`=1' : '';
        $sql .= ' ORDER BY `order` ASC, `name` ASC';

        $result = $this->oDb->select($sql);
        return $result;
    }

    public function GetTestDataByName($sName) {

        $aData = array();
        if($aData = $this->GetTestByName($sName)) {
            if($aData['questions'] = $this->GetTestQuestions($aData['id'])) {
                foreach($aData['questions'] as $key => $aQuestion) {
                    $aData['questions'][$key]['variants'] = $this->GetQuestionVariants($aQuestion['id']);
                }
            }
            $aData['questions_count'] = count($aData['questions']);
            $aData['results'] = $this->GetTestResults($aData['id'], 'DESC');
        }

        PluginFirephp::GetLog("GetTestDataByName($sName) = ");
        PluginFirephp::GetLog($aData);
        return $aData;
    }

    public function GetTest($iTestId) {
        if($iTestId <= 0) return false;

        $sql = 'SELECT * FROM `'.Config::Get ('plugin.testomania.table.tests') . '`';
        $sql .= ' WHERE `id`=?d';

        $result = $this->oDb->selectRow($sql, $iTestId);
        return $result;
    }

    public function GetTestByName($sName) {
        if(empty($sName)) return false;

        $sql = 'SELECT * FROM `'.Config::Get ('plugin.testomania.table.tests') . '`';
        $sql .= ' WHERE `name`=?s';

        $result = $this->oDb->selectRow($sql, $sName);
        return $result;
    }

    public function DeleteTests($aTestIds) {
        foreach($aTestIds as $Id) {
            $this->DeleteTest($Id);
        }
    }

    public function DeleteTest($iTestId) {

        if($iTestId <= 0) return false;

        $sql = 'DELETE FROM `'.Config::Get('plugin.testomania.table.tests').'`';
        $sql .= ' WHERE `id`=?d';

        $this->DeleteTestQuestions($iTestId);

        return $this->oDb->query($sql, $iTestId);
    }

    public function SetTests($aTests) {

        foreach($aTests as $aTest) {
            $this->SetTest($aTest);
        }

    }

    public function SetTest($aTest) {

        if(isset($aTest['id']) && !empty($aTest['id']) && $aTest > 0) {
            return $this->_UpdateTest($aTest);
        } else {
            return $this->_InsertTest($aTest);
        }
    }

    protected function _UpdateTest($aTest) {

        $sql = 'UPDATE `'.Config::Get('plugin.testomania.table.tests').'`';
        $sql .= ' SET `name`=?s,`title`=?s,`description_short`=?s,`template`=?s,`logo_url`=?s,`order`=?d,`published`=?d,`description`=?s';
        $sql .= ' WHERE `id`=?d';

        return $this->oDb->query($sql, $aTest['name'], $aTest['title'], $aTest['description_short'], $aTest['template'], $aTest['logo_url'], $aTest['order'], $aTest['published'], $aTest['description'], $aTest['id']);
    }

    protected function _InsertTest($aTest) {

        $sql = 'INSERT INTO `'.Config::Get('plugin.testomania.table.tests').'`';
        $sql .= ' (`name`, `title`, `description_short`, `template`, `logo_url`, `order`, `published`, `description`)';
        $sql .= ' VALUES (?s, ?s, ?s, ?s, ?s, ?d, ?d, ?s)';

        return $this->oDb->query($sql, $aTest['name'], $aTest['title'], $aTest['description_short'], $aTest['template'], $aTest['logo_url'], $aTest['order'], $aTest['published'], $aTest['description']);
    }

    public function GetTestQuestions($iTestId) {

        if($iTestId <= 0) return false;

        $sql = 'SELECT * FROM `'.Config::Get ('plugin.testomania.table.questions') . '`';
        $sql .= ' WHERE `test_id`=?d';
        $sql .= ' ORDER BY `order` ASC, `id` ASC';

        $result = $this->oDb->select($sql, $iTestId);
        return $result;
    }

    public function GetQuestion($iQuestionId) {

        if($iQuestionId <= 0) return false;

        $sql = 'SELECT * FROM `'.Config::Get ('plugin.testomania.table.questions') . '`';
        $sql .= ' WHERE `id`=?d';

        $result = $this->oDb->selectRow($sql, $iQuestionId);
        return $result;
    }

    public function SetQuestions($aQuestions) {
        foreach($aQuestions as $aQuestion) {
            $this->SetQuestion($aQuestion);
        }
    }

    public function SetQuestion($aQuestion) {
        if(isset($aQuestion['id']) && !empty($aQuestion['id']) && $aQuestion > 0) {
            return $this->_UpdateQuestion($aQuestion);
        } else {
            return $this->_InsertQuestion($aQuestion);
        }
    }

    protected function _InsertQuestion($aQuestion) {
        $sql = 'INSERT INTO `'.Config::Get('plugin.testomania.table.questions').'`';
        $sql .= ' (`test_id`, `order`, `question`)';
        $sql .= ' VALUES (?d, ?d, ?s)';

        return $this->oDb->query($sql, $aQuestion['test_id'], $aQuestion['order'], $aQuestion['question']);
    }

    protected function _UpdateQuestion($aQuestion) {

        $sql = 'UPDATE `'.Config::Get('plugin.testomania.table.questions').'`';
        $sql .= ' SET `test_id`=?d,`order`=?d,`question`=?s';
        $sql .= ' WHERE `id`=?d';

        return $this->oDb->query($sql,$aQuestion['test_id'], $aQuestion['order'], $aQuestion['question'], $aQuestion['id']);
    }

    public function DeleteTestQuestions($iTestId) {
        if($iTestId <= 0) return false;
        $aQuestions = $this->GetTestQuestions($iTestId);
        $aQuestionIds = array();
        foreach($aQuestions as $aQuestion) {
            $aQuestionIds[] = $aQuestion['id'];
        }
        if(!empty($aQuestionIds)) $this->DeleteQuestions($aQuestionIds);
    }

    public function DeleteQuestions($aQuestionIds) {
        foreach($aQuestionIds as $id) {
            $this->DeleteQuestion($id);
        }
    }

    public function DeleteQuestion($iQuestionId) {

        if($iQuestionId <= 0) {
            return false;
        }

        $sql = 'DELETE FROM `'.Config::Get('plugin.testomania.table.questions').'`';
        $sql .= ' WHERE `id`=?d';

        $this->DeleteQuestionVariants($iQuestionId);

        return $this->oDb->query($sql, $iQuestionId);
    }

    public function GetQuestionVariants($iQuestionId) {
        if($iQuestionId <= 0) return false;

        $sql = 'SELECT * FROM `'.Config::Get ('plugin.testomania.table.variants') . '`';
        $sql .= ' WHERE `question_id`=?d';
        $sql .= ' ORDER BY `order` ASC, `id` ASC';

        $result = $this->oDb->select($sql, $iQuestionId);
        return $result;
    }

    public function SetVariants($aVariants) {
        foreach($aVariants as $aVariant) {
            $this->SetVariant($aVariant);
        }
    }

    public function SetVariant($aVariant) {
        if(isset($aVariant['id']) && !empty($aVariant['id']) && $aVariant > 0) {
            return $this->_UpdateVariant($aVariant);
        } else {
            return $this->_InsertVariant($aVariant);
        }
    }

    protected function _InsertVariant($aVariant) {

        $sql = 'INSERT INTO `'.Config::Get ('plugin.testomania.table.variants') . '`';
        $sql .= ' (`question_id`, `order`, `weight`, `variant`)';
        $sql .= ' VALUES (?d, ?d, ?d, ?s)';

        return $this->oDb->query($sql, $aVariant['question_id'], $aVariant['order'], $aVariant['weight'], $aVariant['variant']);
    }

    protected function _UpdateVariant($aVariant) {

        $sql = 'UPDATE `'.Config::Get ('plugin.testomania.table.variants') . '`';
        $sql .= ' SET `question_id`=?d,`order`=?d,`weight`=?d,`variant`=?s';
        $sql .= ' WHERE `id`=?d';

        return $this->oDb->query($sql, $aVariant['question_id'], $aVariant['order'], $aVariant['weight'], $aVariant['variant'], $aVariant['id']);
    }

    public function DeleteQuestionVariants($iQuestionId) {
        if($iQuestionId <= 0) return false;
        $sql = 'DELETE FROM `'.Config::Get ('plugin.testomania.table.variants') . '`';
        $sql .= ' WHERE `question_id`=?d';
        return $this->oDb->query($sql, $iQuestionId);
    }

    public function DeleteVariants($aVariantIds) {
        foreach($aVariantIds as $Id) {
            $this->DeleteVariant($Id);
        }
    }

    public function DeleteVariant($iVariantId) {
        if($iVariantId <= 0) {
            return false;
        }
        $sql = 'DELETE FROM `'.Config::Get ('plugin.testomania.table.variants') . '`';
        $sql .= ' WHERE `id`=?d';
        return $this->oDb->query($sql, $iVariantId);
    }

    public function GetTestResults($iTestId, $order = 'ASC') {

        if($iTestId <= 0) return false;

        $sql = 'SELECT * FROM `'.Config::Get ('plugin.testomania.table.results') . '`';
        $sql .= ' WHERE `test_id`=?d';
        $sql .= " ORDER BY `weights_low` $order, `id` $order";

        $result = $this->oDb->select($sql, $iTestId);
        return $result;
    }

    public function SetResults($aResults) {
        foreach($aResults as $aResult) {
            $this->SetResult($aResult);
        }
    }

    public function SetResult($aResult) {
        if(isset($aResult['id']) && !empty($aResult['id']) && $aResult > 0) {
            return $this->_UpdateResult($aResult);
        } else {
            return $this->_InsertResult($aResult);
        }
    }

    protected function _InsertResult($aResult) {
        $sql = 'INSERT INTO `'.Config::Get('plugin.testomania.table.results').'`';
        $sql .= ' (`test_id`, `weights_low`, `order`, `result`)';
        $sql .= ' VALUES (?d, ?d, ?s)';

        return $this->oDb->query($sql, $aResult['test_id'], $aResult['weights_low'], $aResult['result']);
    }

    protected function _UpdateResult($aResult) {

        $sql = 'UPDATE `'.Config::Get('plugin.testomania.table.results').'`';
        $sql .= ' SET `test_id`=?d, `weights_low`=?d, `result`=?s';
        $sql .= ' WHERE `id`=?d';

        return $this->oDb->query($sql,$aResult['test_id'], $aResult['weights_low'], $aResult['result'], $aResult['id']);
    }

    public function DeleteTestResults($iTestId) {
        if($iTestId <= 0) return false;
        $aResults = $this->GetTestResults($iTestId);
        $aResultIds = array();
        foreach($aResults as $aResult) {
            $aResultIds[] = $aResult['id'];
        }
        if(!empty($aResultIds)) $this->DeleteQuestions($aResultIds);
    }

    public function DeleteResults($aResultIds) {
        foreach($aResultIds as $id) {
            $this->DeleteResult($id);
        }
    }

    public function DeleteResult($iResultId) {

        if($iResultId <= 0) {
            return false;
        }

        $sql = 'DELETE FROM `'.Config::Get('plugin.testomania.table.results').'`';
        $sql .= ' WHERE `id`=?d';

        return $this->oDb->query($sql, $iResultId);
    }

}
