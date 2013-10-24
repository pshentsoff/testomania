{include file='header.tpl' noSidebar=true}

<h3>{$aLang.plugin.testomania.title}&nbsp;:&nbsp;{$aLang.plugin.testomania.manage_tests}</h3>

<a href="{router page='testomania/description'}">{$aLang.plugin.testomania.description}</a>
&nbsp;|&nbsp;<a href="{router page='testomania/license'}">{$aLang.plugin.testomania.license}</a>
{if $bShowDonateLink}
&nbsp;|&nbsp;<a href="{router page='testomania/donate'}">{$aLang.plugin.testomania.donate}</a><br/><br/>
{/if}

<form method="post" action="{router page='testomania/tests'}">
    <input type="hidden" name="security_ls_key" value="{$LIVESTREET_SECURITY_KEY}" />

    <table class="testomania admin">
    <thead>
    <tr>
        <td>&nbsp;</td>
        <td>
            {$aLang.plugin.testomania.admin.tests.name}/<br/>
            {$aLang.plugin.testomania.admin.tests.title}/<br/>
            {$aLang.plugin.testomania.admin.tests.description_short}/<br/>
            {$aLang.plugin.testomania.admin.tests.template}
        </td>
        <td>{$aLang.plugin.testomania.admin.tests.logo}</td>
        <td>{$aLang.plugin.testomania.admin.tests.order}</td>
        <td>{$aLang.plugin.testomania.admin.tests.published}</td>
        <td>
            {$aLang.plugin.testomania.admin.tests.description}/<br/>
            {$aLang.plugin.testomania.admin.tests.js_result_func}
        </td>
    </tr>
    </thead>
    <tbody>
    {foreach from=$aTests item=aTest}
    <tr>
        <td>
            <input type="hidden" name="tests[{$aTest.id}][id]" value="{$aTest.id}"><br/>
            <input type="checkbox" name="tests[{$aTest.id}][selected]"><br/>
            <a href="/testomania/questions/{$aTest.id}">{$aLang.plugin.testomania.admin.tests.questions}</a>
            <br/>
            <a href="/testomania/results/{$aTest.id}">{$aLang.plugin.testomania.admin.tests.results}</a>
        </td>
        <td>
            <input class="longer" type="text" name="tests[{$aTest.id}][name]" value="{$aTest.name}" /><br />
            <input class="longer" type="text" name="tests[{$aTest.id}][title]" value="{$aTest.title}"/><br />
            <input class="longer" type="text" name="tests[{$aTest.id}][description_short]" value="{$aTest.description_short}"/><br />
            <input class="longer" type="text" name="tests[{$aTest.id}][template]" value="{$aTest.template}"/>
        </td>
        <td>
            <img src="{$aTest.logo_url}" alt="{$aLang.plugin.testomania.admin.tests.logo}" /><br/>
            <input class="shorter" type="text" name="tests[{$aTest.id}][logo_url]" value="{$aTest.logo_url}"/>
        </td>
        <td><input class="twodigits" type="text" name="tests[{$aTest.id}][order]" value="{$aTest.order}"/></td>
        <td><input type="checkbox" name="tests[{$aTest.id}][published]" {if $aTest.published}checked="checked"{/if}/></td>
        <td>
            <textarea name="tests[{$aTest.id}][description]">{$aTest.description}</textarea><br/>
            <textarea name="tests[{$aTest.id}][js_result_func]">{$aTest.js_result_func}</textarea>
        </td>
    </tr>
    {foreachelse}
        {if !$TestomaniaTestsAddNew}
        <tr>
            <td class="message" colspan="3">
                {$aLang.plugin.testomania.no_data}
            </td>
        </tr>
        {/if}
    {/foreach}
    {if $TestomaniaTestsAddNew}
    <tr>
        <td>&nbsp;</td>
        <td>
            <input class="longer" type="text" name="tests[new][name]" value="" /><br />
            <input class="longer" type="text" name="tests[new][title]" value=""/><br />
            <input class="longer" type="text" name="tests[new][description_short]" value=""/><br />
            <input class="longer" type="text" name="tests[new][template]" value=""/>
        </td>
        <td>
            <input class="shorter" type="text" name="tests[new][logo_url]" value=""/>
        </td>
        <td><input class="twodigits" type="text" name="tests[new][order]" value=""/></td>
        <td><input type="checkbox" name="tests[new][published]" /></td>
        <td>
            <textarea name="tests[new][description]"></textarea><br/>
            <textarea name="tests[new][js_result_func]"></textarea>
        </td>
    </tr>
    {/if}

    <tfoot>
    <tr>
        <td colspan="6">
            <input type="submit" name="testomania_tests_add" value="Add" {if $TestomaniaTestsAddNew}disabled="disabled"{/if}/>
            <input type="submit" name="testomania_tests_delete" value="Delete (selected)"/>
            <input type="submit" name="testomania_tests_save" value="Save" />
        </td>
    </tr>
    </tfoot>
    </tbody>
</table>
</form>

{include file='footer.tpl'}