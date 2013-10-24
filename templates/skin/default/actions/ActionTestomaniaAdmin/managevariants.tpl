{include file='header.tpl' noSidebar=true}

<h3>{$aLang.plugin.testomania.title}&nbsp;:&nbsp;{$aLang.plugin.testomania.manage_variants}&nbsp;{$aLang.plugin.testomania.admin.questions.question}&nbsp;#{$aQuestion.order}&nbsp;{$aLang.plugin.testomania.manage_test}&nbsp;[{$aTest.name}]&nbsp;"{$aTest.title}"</h3>
<a class="testomania admin linksmall" href="/testomania/">{$aLang.plugin.testomania.manage_tests}</a>&nbsp;&rarr;&nbsp;<a class="testomania admin linksmall" href="/testomania/questions/{$aTest.id}">{$aLang.plugin.testomania.manage_questions}</a>
<div class="col-item-desc"><p>{$aQuestion.question}</p></div>

{if $aTestomania.test.title}<div class="title news_title">{$aTestomania.test.title}</div>{/if}
<form method="post" action="{router page='testomania/variants'}">
    <input type="hidden" name="security_ls_key" value="{$LIVESTREET_SECURITY_KEY}" />
    <input type="hidden" name="testomania_questionid" value="{$TestomaniaQuestionId}"/>

    <table class="testomania admin">
        <thead>
        <tr>
            <td>&nbsp;</td>
            <td>
                {$aLang.plugin.testomania.admin.variants.order}/
                {$aLang.plugin.testomania.admin.variants.weight}
            </td>
            <td>{$aLang.plugin.testomania.admin.variants.variant}</td>
        </tr>
        </thead>
        <tbody>
        {foreach from=$aVariants item=aVariant}
        <tr>
            <td>
                <input type="checkbox" name="variants[{$aVariant.id}][selected]"/>
                <input type="hidden" name="variants[{$aVariant.id}][id]" value="{$aVariant.id}"/>
            </td>
            <td>
                <label for="variants[{$aVariant.id}][order]">{$aLang.plugin.testomania.admin.variants.order}:&nbsp;</label><input type="text" class="twodigits" name="variants[{$aVariant.id}][order]" value="{$aVariant.order}"/><br/>
                <label for="variants[{$aVariant.id}][weight]">{$aLang.plugin.testomania.admin.variants.weight}:&nbsp;</label><input type="text" class="twodigits" name="variants[{$aVariant.id}][weight]" value="{$aVariant.weight}"/>
            </td>
            <td>
                <textarea class="testomania admin wide" name="variants[{$aVariant.id}][variant]">{$aVariant.variant}</textarea>
            </td>
        </tr>
        {foreachelse}
            {if !$TestomaniaVariantsAddNew}
            <tr>
                <td class="message" colspan="3">
                    {$aLang.plugin.testomania.no_data}
                </td>
            </tr>
            {/if}
        {/foreach}
        {if $TestomaniaVariantsAddNew}
        {section name=new loop=$TestomaniaAddNewCount}
        <tr>
            <td>&nbsp;</td>
            <td>
                <label for="variants[{$aVariant.id}][order]">{$aLang.plugin.testomania.admin.variants.order}:&nbsp;</label>
                <input type="text" class="twodigits" name="variants[new_{$smarty.section.new.index}][order]" value="{$aVariant.order+1+$smarty.section.new.index}"/><br/>
                <label for="variants[{$aVariant.id}][weight]">{$aLang.plugin.testomania.admin.variants.weight}:&nbsp;</label>
                <input type="text" class="twodigits" name="variants[new_{$smarty.section.new.index}][weight]" value="{$aVariant.weight+1+$smarty.section.new.index}"/>
            </td>
            <td>
                <textarea class="testomania admin wide" name="variants[new_{$smarty.section.new.index}][variant]"></textarea>
            </td>
        </tr>
        {/section}
        {/if}
        </tbody>
        <tfoot>
        <tr>
            <td colspan="3">
                <input class="twodigits" type="text" name="testomania_addcount" value="{if $TestomaniaAddNewCount}{$TestomaniaAddNewCount}{else}1{/if}" {if $TestomaniaQuestionsAddNew}disabled="disabled"{/if}/>
                <input type="submit" name="testomania_variants_add" value="{$aLang.plugin.testomania.add}" {if $TestomaniaVariantsAddNew}disabled="disabled"{/if}/>
                <input type="submit" name="testomania_variants_delete" value="{$aLang.plugin.testomania.delete}"/>
                <input type="submit" name="testomania_variants_copytoall" value="{$aLang.plugin.testomania.copytoall}"/>
                <input type="submit" name="testomania_variants_save" value="{$aLang.plugin.testomania.save}" />
            </td>
        </tr>
        </tfoot>
    </table>
</form>

{include file='footer.tpl'}