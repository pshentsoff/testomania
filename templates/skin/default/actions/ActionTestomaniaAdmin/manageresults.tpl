{include file='header.tpl' noSidebar=true}

<h3>{$aLang.plugin.testomania.title}&nbsp;:&nbsp;{$aLang.plugin.testomania.manage_results}&nbsp;[{$aTest.name}]&nbsp;"{$aTest.title}"</h3>
<a class="testomania admin linksmall" href="/testomania/">{$aLang.plugin.testomania.manage_tests}</a>

<form method="post" action="{router page='testomania/results'}">
    <input type="hidden" name="security_ls_key" value="{$LIVESTREET_SECURITY_KEY}" />
    <input type="hidden" name="testomania_testid" value="{$TestomaniaTestId}"/>

    <table class="testomania admin">
        <thead>
        <tr>
            <td>&nbsp;</td>
            <td>{$aLang.plugin.testomania.admin.results.weights_low}</td>
            <td>{$aLang.plugin.testomania.admin.results.result}</td>
        </tr>
        </thead>
        <tbody>
        {foreach from=$aResults item=aResult}
        <tr>
            <td>
                <input type="hidden" name="results[{$aResult.id}][id]" value="{$aResult.id}"/>
                <input type="checkbox" name="results[{$aResult.id}][selected]"/><br/>
            </td>
            <td>
                <label for="results[{$aResult.id}][weights_low]">{$aLang.plugin.testomania.admin.results.weights_low}:&nbsp;</label><input type="text" class="twodigits" name="results[{$aResult.id}][weights_low]" value="{$aResult.weights_low}"/>
            </td>
            <td>
                <textarea class="testomania admin wide" name="results[{$aResult.id}][result]">{$aResult.result}</textarea>
            </td>
        </tr>
        {foreachelse}
            {if !$TestomaniaResultsAddNew}
            <tr>
                <td class="message" colspan="3">
                    {$aLang.plugin.testomania.no_data}
                </td>
            </tr>
            {/if}
        {/foreach}
        {if $TestomaniaResultsAddNew}
        <tr>
            <td>&nbsp;</td>
            <td>
                <label for="results[{$aResult.id}][weights_low]">{$aLang.plugin.testomania.admin.results.weights_low}:&nbsp;</label><input type="text" class="twodigits" name="results[new][weights_low]" value=""/>
            </td>
            <td>
                <textarea class="testomania admin wide" name="results[new][result]"></textarea>
            </td>
        </tr>
        {/if}
        </tbody>
        <tfoot>
        <tr>
            <td colspan="3">
                <input type="submit" name="testomania_results_add" value="{$aLang.plugin.testomania.add}" {if $TestomaniaResultsAddNew}disabled="disabled"{/if}/>
                <input type="submit" name="testomania_results_delete" value="{$aLang.plugin.testomania.delete}"/>
                <input type="submit" name="testomania_results_save" value="{$aLang.plugin.testomania.save}" />
            </td>
        </tr>
        </tfoot>
    </table>
</form>

{include file='footer.tpl'}