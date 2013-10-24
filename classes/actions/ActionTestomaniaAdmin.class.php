<?php
/**
 * @file        ActionTestomaniaAdmin.class.php
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
 * @created     09.03.13
 */

class PluginTestomania_ActionTestomaniaAdmin extends Action {

    public function Init() {
        $this->SetDefaultEvent('tests');
    }

    protected  function RegisterEvent() {
        $this->AddEvent('description', 'ShowDescription');
        $this->AddEvent('license', 'ShowLicense');
        $this->AddEvent('donate', 'ShowDonate');

        $this->AddEvent('tests', 'ManageTests');
        $this->AddEvent('questions', 'ManageQuestions');
        $this->AddEvent('variants', 'ManageVariants');
        $this->AddEvent('results', 'ManageResults');
    }

    protected function ShowDescription() {
        $this->Viewer_Assign('sShowTextTitle', $this->Lang_Get('plugin.testomania.title').' : '.$this->Lang_Get('plugin.testomania.description'));
        $this->Viewer_Assign('sURLBack', 'testomania/tests');
        $this->Viewer_Assign('sURLBackTitle', $this->Lang_Get('plugin.testomania.goback.tests_page'));
        $this->Viewer_Assign('sTextFile', Plugin::GetPath(__CLASS__).'/Readme.txt');
        $this->SetTemplateAction('showtext');
    }

    protected function ShowLicense() {
        $this->Viewer_Assign('sShowTextTitle', $this->Lang_Get('plugin.testomania.title').' : '.$this->Lang_Get('plugin.testomania.license'));
        $this->Viewer_Assign('sURLBack', 'testomania/tests');
        $this->Viewer_Assign('sURLBackTitle', $this->Lang_Get('plugin.testomania.goback.tests_page'));
        $this->Viewer_Assign('sTextFile', Plugin::GetPath(__CLASS__).'/License.txt');
        $this->SetTemplateAction('showtext');
    }

    protected function ShowDonate() {
        $this->Viewer_Assign('sShowTextTitle', $this->Lang_Get('plugin.testomania.title').' : '.$this->Lang_Get('plugin.testomania.donate'));
        $this->Viewer_Assign('sURLBack', 'testomania/tests');
        $this->Viewer_Assign('sURLBackTitle', $this->Lang_Get('plugin.testomania.goback.tests_page'));
        $this->Viewer_Assign('sHTMLFile', Plugin::GetPath(__CLASS__).'/Donate.html');
        $this->SetTemplateAction('showtext');
    }

    protected function ManageTests() {

        if (!LS::Adm()) {
            return parent::EventNotFound();
        }

        if(isPost('testomania_tests_add')) {
            $this->Viewer_Assign('TestomaniaTestsAddNew', 1);
        } elseif(isPost('testomania_tests_delete')) {
            $aTests = getRequest('tests', array(), 'post');
            $aSelected = array();
            foreach($aTests as $key => $aTest) {
                if(isset($aTest['selected']) && $aTest['selected'] == 'on' && isset($aTest['id'])) {
                    $aSelected[] = $aTest['id'];
                }
            }
            if(!empty($aSelected)) {
                $this->PluginTestomania_Testomania_DeleteTests($aSelected);
            }
            unset($aSelected);
            unset($aTests);
        } elseif(isPost('testomania_tests_save')) {
            $aTests = getRequest('tests', array(), 'post');
            // простенькая проверка параметров @todo: нормальную проверку
            foreach($aTests as $id => $aTest) {
                //@todo: нормальную проверку параметров
                $aTests[$id]['id'] = isset($aTest['id']) ? (int)$aTest['id'] : null;
                $aTests[$id]['published'] = isset($aTest['published']) ? 1 : 0;
            }
            $this->PluginTestomania_Testomania_SetTests($aTests);
            unset($aTests);
        }

        $aTests = $this->PluginTestomania_Testomania_GetTests(false);
        $this->Viewer_Assign('bShowDonateLink', Config::Get('plugin.testomania.tests.show_donate_link'));
        $this->Viewer_Assign('aTests', $aTests);
        $this->SetTemplateAction('managetests');
    }

    protected function ManageQuestions() {

        if (!LS::Adm()) {
            return parent::EventNotFound();
        }

        $iTestId = isset($this->aParams[0]) ? $this->aParams[0] : getRequest('testomania_testid');
        if(!$iTestId) {
            return parent::EventNotFound();
        }

        if(isPost('testomania_questions_add')) {

            $TestomaniaQuestionsAddNewCount = (int)getRequest('testomania_questions_addcount', 1, 'post');
            if($TestomaniaQuestionsAddNewCount <= 0) {
                $TestomaniaQuestionsAddNewCount = 1;
            } elseif($TestomaniaQuestionsAddNewCount > Config::Get('plugin.testomania.questions.max_per_addition')) {
                $TestomaniaQuestionsAddNewCount = Config::Get('plugin.testomania.questions.max_per_addition');
            }

            $this->Viewer_Assign('TestomaniaQuestionsAddNewCount', $TestomaniaQuestionsAddNewCount);
            $this->Viewer_Assign('TestomaniaQuestionsAddNew', 1);
        } elseif(isPost('testomania_questions_delete')) {
            $aQuestions = getRequest('questions', array(), 'post');
            $aSelected = array();
            foreach($aQuestions as $key => $aQuestion) {
                if(isset($aQuestion['selected']) && $aQuestion['selected'] == 'on' && isset($aQuestion['id'])) {
                    $aSelected[] = $aQuestion['id'];
                }
            }
            if(!empty($aSelected)) {
                $this->PluginTestomania_Testomania_DeleteQuestions($aSelected);
            }
            unset($aSelected);
            unset($aQuestions);
        } elseif(isPost('testomania_questions_save')) {
            $aQuestions = getRequest('questions', array(), 'post');
            // простенькая проверка параметров @todo: нормальную проверку
            foreach($aQuestions as $id => $aQuestion) {
                //@todo: нормальную проверку параметров
                $aQuestions[$id]['id'] = isset($aQuestion['id']) ? (int)$aQuestion['id'] : null;
                $aQuestions[$id]['test_id'] = isset($aQuestion['test_id']) ? $aQuestion['test_id'] : $iTestId;
            }
            $this->PluginTestomania_Testomania_SetQuestions($aQuestions);
            unset($aQuestions);
        }

        $aTest = $this->PluginTestomania_Testomania_GetTest($iTestId);
        $aQuestions = $this->PluginTestomania_Testomania_GetTestQuestions($iTestId);

        $this->Viewer_Assign('aTest', $aTest);
        $this->Viewer_Assign('TestomaniaTestId', $iTestId);
        $this->Viewer_Assign('aQuestions', $aQuestions);
        $this->SetTemplateAction('managequestions');
    }

    protected function ManageVariants() {

        if (!LS::Adm()) {
            return parent::EventNotFound();
        }

        $iQuestionId = isset($this->aParams[0]) ? $this->aParams[0] : getRequest('testomania_questionid');
        if(!$iQuestionId) {
            return parent::EventNotFound();
        }

        if(isPost('testomania_variants_add')) {

            $TestomaniaAddNewCount = (int)getRequest('testomania_addcount', 1, 'post');
            if($TestomaniaAddNewCount <= 0) {
                $TestomaniaAddNewCount = 1;
            } elseif($TestomaniaAddNewCount > Config::Get('plugin.testomania.variants.max_per_addition')) {
                $TestomaniaAddNewCount = Config::Get('plugin.testomania.variants.max_per_addition');
            }

            $this->Viewer_Assign('TestomaniaAddNewCount', $TestomaniaAddNewCount);
            $this->Viewer_Assign('TestomaniaVariantsAddNew', 1);
        } elseif(isPost('testomania_variants_delete')) {
            $aVariants = getRequest('variants', array(), 'post');
            $aSelected = array();
            foreach($aVariants as $key => $aVariant) {
                if(isset($aVariant['selected']) && $aVariant['selected'] == 'on' && isset($aVariant['id'])) {
                    $aSelected[] = $aVariant['id'];
                }
            }
            if(!empty($aSelected)) {
                $this->PluginTestomania_Testomania_DeleteVariants($aSelected);
            }
            unset($aSelected);
            unset($aVariants);
        } elseif(isPost('testomania_variants_save')) {
            $aVariants = getRequest('variants', array(), 'post');

            // простенькая проверка параметров @todo: нормальную проверку
            foreach($aVariants as $id => $aVariant) {
                //@todo: нормальную проверку параметров
                $aVariants[$id]['id'] = isset($aVariant['id']) ? (int)$aVariant['id'] : null;
                $aVariants[$id]['question_id'] = isset($aVariant['question_id']) ? $aVariant['question_id'] : $iQuestionId;
            }
            $this->PluginTestomania_Testomania_SetVariants($aVariants);
            unset($aVariants);
        } elseif(isPost('testomania_variants_copytoall')) {
            $aVariants = getRequest('variants', array(), 'post');
            foreach($aVariants as $id => $aVariant) {
                //@todo: нормальную проверку параметров
                $aVariants[$id]['id'] = isset($aVariant['id']) ? (int)$aVariant['id'] : null;
            }
            if(!empty($aVariants)) {
                $aQuestion = $this->PluginTestomania_Testomania_GetQuestion($iQuestionId);
                $aQuestions = $this->PluginTestomania_Testomania_GetTestQuestions($aQuestion['test_id']);
                foreach($aQuestions as $aQuestion) {
                    $this->PluginTestomania_Testomania_DeleteQuestionVariants($aQuestion['id']);
                    foreach($aVariants as $id => $aVariant) {
                        $aVariants[$id]['question_id'] = $aQuestion['id'];
                    }
                    $this->PluginTestomania_Testomania_SetVariants($aVariants);
                }

                unset($aQuestion);
                unset($aQuestions);
            }
            unset($aVariants);
        }

        $aVariants = $this->PluginTestomania_Testomania_GetQuestionVariants($iQuestionId);
        $aQuestion = $this->PluginTestomania_Testomania_GetQuestion($iQuestionId);
        $aTest = $this->PluginTestomania_Testomania_GetTest($aQuestion['test_id']);

        $this->Viewer_Assign('TestomaniaQuestionId', $iQuestionId);
        $this->Viewer_Assign('aVariants', $aVariants);
        $this->Viewer_Assign('aQuestion', $aQuestion);
        $this->Viewer_Assign('aTest', $aTest);
        $this->SetTemplateAction('managevariants');
    }

    protected function ManageResults() {

        if (!LS::Adm()) {
            return parent::EventNotFound();
        }

        $iTestId = isset($this->aParams[0]) ? $this->aParams[0] : getRequest('testomania_testid');
        if(!$iTestId) {
            return parent::EventNotFound();
        }

        if(isPost('testomania_results_add')) {
            $this->Viewer_Assign('TestomaniaResultsAddNew', 1);
        } elseif(isPost('testomania_results_delete')) {
            $aResults = getRequest('results', array(), 'post');
            $aSelected = array();
            foreach($aResults as $key => $aResult) {
                if(isset($aResult['selected']) && $aResult['selected'] == 'on' && isset($aResult['id'])) {
                    $aSelected[] = $aResult['id'];
                }
            }
            if(!empty($aSelected)) {
                $this->PluginTestomania_Testomania_DeleteResults($aSelected);
            }
            unset($aSelected);
            unset($aResults);
        } elseif(isPost('testomania_results_save')) {
            $aResults = getRequest('results', array(), 'post');
            // простенькая проверка параметров @todo: нормальную проверку
            foreach($aResults as $id => $aResult) {
                //@todo: нормальную проверку параметров
                $aResults[$id]['id'] = isset($aResult['id']) ? (int)$aResult['id'] : null;
                $aResults[$id]['test_id'] = isset($aResult['test_id']) ? $aResult['test_id'] : $iTestId;
            }
            $this->PluginTestomania_Testomania_SetResults($aResults);
            unset($aResults);
        }

        $aTest = $this->PluginTestomania_Testomania_GetTest($iTestId);
        $aResults = $this->PluginTestomania_Testomania_GetTestResults($iTestId);

        $this->Viewer_Assign('aTest', $aTest);
        $this->Viewer_Assign('TestomaniaTestId', $iTestId);
        $this->Viewer_Assign('aResults', $aResults);
        $this->SetTemplateAction('manageresults');
    }


}
