{include file='header.tpl' menu=''}
<div class="services" style="background: none; padding: 0 10px 0 0; box-shadow: none;">
	<div class="title orange">{$aLang.plugin.testomania.tests_title}</div>
	<ul>
        {foreach from=$aTests item=aTest}
            <li>
                <div class="testomania-icon">
                    <a href="{$oConfig->GetValue('plugin.testomania.tests.url')}{$aTest.name}/">
                        <img src="{$aTest.logo_url}">
                    </a>
                </div>
                {$aTest.title}
                <small><a href="{$oConfig->GetValue('plugin.testomania.tests.url')}{$aTest.name}/">
                    {$aTest.description_short}
                </a></small>
            </li>
        {/foreach}
	</ul>
	{hook run='imt'}
</div>
{include file='footer.tpl'}