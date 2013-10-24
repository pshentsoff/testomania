<?php

class PluginTestomania_ActionTestomania extends Action {
	/**
	 * Инициализация
	 *
	 */
	public function Init() {
        $this->SetDefaultEvent('index');
	}
	
	/**
	 * Регистрируем необходимые евенты
	 *
	 */
	protected function RegisterEvent() {
		$this->AddEvent('index', 'EventDefault');
		$this->AddEventPreg('/^[\w\-\_]+$/i','EventType');
	}
		
	
	/**********************************************************************************
	 ************************ РЕАЛИЗАЦИЯ ЭКШЕНА ***************************************
	 **********************************************************************************
	 */
	/**
	 * Показ топиков
	 *
	 */
	protected function EventType() {

//		$this->SetTemplateAction($this->sCurrentEvent);

        $aTest = $this->PluginTestomania_Testomania_GetTestDataByName($this->sCurrentEvent);

        if(empty($aTest) || $aTest === false) {
            return parent::EventNotFound();
        }

        if(empty($aTest['template'])) $aTest['template'] = Config::Get('plugin.testomania.default.template');

        PluginFirephp::GetLog('Testomania on load to smarty - ');
        PluginFirephp::GetLog($aTest);
        $this->Viewer_Assign('aTestomania', $aTest);
        $this->SetTemplateAction($aTest['template']);

	}

	protected function EventDefault() {
        $aTests = $this->PluginTestomania_Testomania_GetTests();
        $this->Viewer_Assign('aTests', $aTests);
		$this->SetTemplateAction('index');
	}	
	/**
	 * При завершении экшена загружаем в шаблон необходимые переменные
	 *
	 */
	public function EventShutdown() {
		
	}
}
?>