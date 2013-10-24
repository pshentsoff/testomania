{include file='header.tpl' noSidebar=true}

<h3>{$aLang.plugin.testomania.title}&nbsp;:&nbsp;{$aLang.plugin.testomania.manage_questions}&nbsp;[{$aTest.name}]&nbsp;"{$aTest.title}"</h3>
<a class="testomania admin linksmall" href="/testomania/">{$aLang.plugin.testomania.manage_tests}</a>

<form method="post" action="{router page='testomania/questions'}">
    <input type="hidden" name="security_ls_key" value="{$LIVESTREET_SECURITY_KEY}" />
    <input type="hidden" name="testomania_testid" value="{$TestomaniaTestId}"/>

    <table class="testomania admin">
        <thead>
        <tr>
            <td>&nbsp;</td>
            <td>{$aLang.plugin.testomania.admin.questions.order}</td>
            <td>{$aLang.plugin.testomania.admin.questions.question}</td>
        </tr>
        </thead>
        <tbody>
        {foreach from=$aQuestions item=aQuestion}
        <tr>
            <td>
                <input type="hidden" name="questions[{$aQuestion.id}][id]" value="{$aQuestion.id}"/>
                <input type="checkbox" name="questions[{$aQuestion.id}][selected]"/><br/>
                <a href="/testomania/variants/{$aQuestion.id}">{$aLang.plugin.testomania.admin.questions.variants}</a>
            </td>
            <td>
                <input type="text" class="twodigits" name="questions[{$aQuestion.id}][order]" value="{$aQuestion.order}"/>
            </td>
            <td>
                <textarea class="testomania admin wide" name="questions[{$aQuestion.id}][question]">{$aQuestion.question}</textarea>
            </td>
        </tr>
        {foreachelse}
            {if !$TestomaniaQuestionsAddNew}
            <tr>
                <td class="message" colspan="3">
                    {$aLang.plugin.testomania.no_data}
                </td>
            </tr>
            {/if}
        {/foreach}
        {if $TestomaniaQuestionsAddNew}
        {section name=new loop=$TestomaniaQuestionsAddNewCount}
        <tr>
            <td>&nbsp;</td>
            <td>
                <input type="text" class="twodigits" name="questions[new_{$smarty.section.new.index}][order]" value="{$aQuestion.order+{$smarty.section.new.index}+1}"/>
            </td>
            <td>
                <textarea class="testomania admin wide" name="questions[new_{$smarty.section.new.index}][question]"></textarea>
            </td>
        </tr>
        {/section}
        {/if}
        </tbody>
        <tfoot>
        <tr>
            <td colspan="3">
                <input class="twodigits" type="text" name="testomania_questions_addcount" value="{if $TestomaniaQuestionsAddNewCount}{$TestomaniaQuestionsAddNewCount}{else}1{/if}" {if $TestomaniaQuestionsAddNew}disabled="disabled"{/if}/>
                <input type="submit" name="testomania_questions_add" value="Add" {if $TestomaniaQuestionsAddNew}disabled="disabled"{/if}/>
                <input type="submit" name="testomania_questions_delete" value="Delete (selected)"/>
                <input type="submit" name="testomania_questions_save" value="Save" />
            </td>
        </tr>
        </tfoot>
    </table>
</form>

{include file='footer.tpl'}