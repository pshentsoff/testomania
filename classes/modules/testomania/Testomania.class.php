<?php
/**
 * @file        Testomania.class.php
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

if(!class_exists('Module')) {
    die('This script can not be executed directly.');
}

class PluginTestomania_ModuleTestomania Extends Module {

    protected $oMapper;
    protected $oUserCurrent;

    public function Init() {

        $this->oUserCurrent = $this->User_GetUserCurrent();
        $this->oMapper = Engine::GetMapper(__CLASS__);

    }

    public function GetTests($bPublishedOnly = true) {

        $tag = 'testomania_tests_'.($bPublishedOnly ? 'published' : 'all');
        if(($aTests = $this->Cache_Get($tag)) === false) {
            $aTests = $this->oMapper->GetTests($bPublishedOnly);
            $this->Cache_Set($aTests, $tag, array(Config::Get('plugin.testomania.cache.testschange')), Config::Get('plugin.testomania.cache.ttl'));
        }
        return $aTests;
    }

    public function GetTest($iTestId) {

        $tag = 'testomania_test_'.$iTestId;

        if(($aData = $this->Cache_Get($tag)) === false) {
            $aData = $this->oMapper->GetTest($iTestId);
            $this->Cache_Set($aData, $tag, array(Config::Get('plugin.testomania.cache.testschange')), Config::Get('plugin.testomania.cache.ttl'));
        }
        return $aData;
    }

    public function GetTestDataByName($sName) {

        $tag = 'testomania_test_'.$sName;

        if(($aData = $this->Cache_Get($tag)) === false) {
            $aData = $this->oMapper->GetTestDataByName($sName);
            $this->Cache_Set($aData, $tag, array(Config::Get('plugin.testomania.cache.testschange')), Config::Get('plugin.testomania.cache.ttl'));
        }
        return $aData;
    }

    public function DeleteTests($aTestIds) {
        if (!LS::Adm()) return;
        $this->Cache_Clean(Zend_Cache::CLEANING_MODE_MATCHING_TAG, Config::Get('plugin.testomania.cache.allchange_array'));
        $this->oMapper->DeleteTests($aTestIds);
    }

    public function SetTests($aTests) {
        if (!LS::Adm()) return;
        $this->Cache_Clean(Zend_Cache::CLEANING_MODE_MATCHING_TAG, array(Config::Get('plugin.testomania.cache.testschange')));
        $this->oMapper->SetTests($aTests);
    }

    public function GetTestQuestions($iTestId) {
        if($iTestId <= 0) return false;
        $tag = 'testomania_questions_'.$iTestId;
        if(($aData = $this->Cache_Get($tag)) === false) {
            $aData = $this->oMapper->GetTestQuestions($iTestId);
            $this->Cache_Set($aData, $tag, array(Config::Get('plugin.testomania.cache.testschange'), Config::Get('plugin.testomania.cache.questionschange')), Config::Get('plugin.testomania.cache.ttl'));
        }
        return $aData;
    }

    public function GetQuestion($iQuestionId) {
        if($iQuestionId <= 0) return false;
        $tag = 'testomania_question_id_'.$iQuestionId;
        if(($aData = $this->Cache_Get($tag)) === false) {
            $aData = $this->oMapper->GetQuestion($iQuestionId);
            $this->Cache_Set($aData, $tag, array(Config::Get('plugin.testomania.cache.testschange'), Config::Get('plugin.testomania.cache.questionschange')), Config::Get('plugin.testomania.cache.ttl'));
        }
        return $aData;
    }

    public function SetQuestions($aQuestions) {
        if (!LS::Adm()) return;
        $this->Cache_Clean(Zend_Cache::CLEANING_MODE_MATCHING_TAG, array(Config::Get('plugin.testomania.cache.testschange'), Config::Get('plugin.testomania.cache.questionschange')));
        $this->oMapper->SetQuestions($aQuestions);
    }

    public function DeleteQuestions($aQuestionIds) {
        if (!LS::Adm()) return;
        $this->Cache_Clean(Zend_Cache::CLEANING_MODE_MATCHING_TAG, Config::Get('plugin.testomania.cache.allchange_array'));
        $this->oMapper->DeleteQuestions($aQuestionIds);
    }

    public function GetQuestionVariants($iQuestionId) {

        $tag = 'testomania_variants_'.$iQuestionId;

        if(($aData = $this->Cache_Get($tag)) === false) {
            $aData = $this->oMapper->GetQuestionVariants($iQuestionId);
            $this->Cache_Set($aData, $tag, array(Config::Get('plugin.testomania.cache.variantschange')), Config::Get('plugin.testomania.cache.ttl'));
        }
        return $aData;
    }

    public function DeleteVariants($aVariantIds) {
        if (!LS::Adm()) return;
        $this->Cache_Clean(Zend_Cache::CLEANING_MODE_MATCHING_TAG, Config::Get('plugin.testomania.cache.allchange_array'));
        $this->oMapper->DeleteVariants($aVariantIds);
    }

    public function DeleteQuestionVariants($iQuestionId) {
        if (!LS::Adm()) return;
        $this->Cache_Clean(Zend_Cache::CLEANING_MODE_MATCHING_TAG, Config::Get('plugin.testomania.cache.allchange_array'));
        $this->oMapper->DeleteQuestionVariants($iQuestionId);
    }

    public function SetVariants($aVariants) {
        if (!LS::Adm()) return;
        $this->Cache_Clean(Zend_Cache::CLEANING_MODE_MATCHING_TAG, Config::Get('plugin.testomania.cache.allchange_array'));
        $this->oMapper->SetVariants($aVariants);
    }

    public function GetTestResults($iTestId) {
        if($iTestId <= 0) return false;
        return $this->oMapper->GetTestResults($iTestId);
    }

    public function SetResults($aResults) {
        if (!LS::Adm()) return;
        $this->Cache_Clean(Zend_Cache::CLEANING_MODE_MATCHING_TAG, array(Config::Get('plugin.testomania.cache.testschange'), Config::Get('plugin.testomania.cache.resultschange')));
        $this->oMapper->SetResults($aResults);
    }

    public function DeleteResults($aResultIds) {
        if (!LS::Adm()) return;
        $this->Cache_Clean(Zend_Cache::CLEANING_MODE_MATCHING_TAG, Config::Get('plugin.testomania.cache.allchange_array'));
        $this->oMapper->DeleteQuestions($aResultIds);
    }

}
