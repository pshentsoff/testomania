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
