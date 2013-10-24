{include file='header.tpl' menu=''}

<script type="text/javascript">
    var testomania_questions_count = {$aTestomania.questions_count};
    {literal}
    function testomania_results(value) {
    {/literal}
    {if $aTestomania.js_result_func}
        {$aTestomania.js_result_func}
    {else}
    {foreach from=$aTestomania.results item=aResult}
        if(value >= {$aResult.weights_low}) return "{$aResult.result}";
    {/foreach}
    {/if}
    {literal}
    }
    {/literal}
</script>

{if $aTestomania.title}<div class="title news_title">{$aTestomania.title}</div>{/if}
{if $oConfig->GetValue('plugin.testomania.tests.show_description_short') && $aTestomania.description_short}
<div class="col-item-desc">
    <p>
        {$aTestomania.description_short}
    </p>
</div>
{/if}
<div class="news topic_list">
    {assign var=iQuestionNum value=1}
    {foreach from=$aTestomania.questions item=aQuestion}
        <div class="col-item-title">{if $oConfig->GetValue('plugin.testomania.questions.show_order')}{$aQuestion.order}.&nbsp;{/if}{$aQuestion.question}</div>
        <p>
            {foreach from=$aQuestion.variants item=aVariants}
            <input class="testomania-variants" name="question_{$iQuestionNum}" type="radio" value="{$aVariants.weight}" />{$aVariants.variant}<br />
            {/foreach}
        </p>
    {assign var=iQuestionNum value=$iQuestionNum+1}
    {/foreach}
        <input type="hidden" id=""/>
        <input type="button" onclick="{$oConfig->GetValue('plugin.testomania.default.js_calculate_function')}" value="{$aLang.plugin.testomania.test_calculate}">
        <div class="test-results" style="display: none;">
            <div class="col-item-title">{$aLang.plugin.testomania.test_results}</div>
            <p>

            </p>
        </div>
</div>

<div class="testomania-links">
&larr;&nbsp;<a href="{$oConfig->GetValue('plugin.testomania.default.mainpage')}">{$aLang.plugin.testomania.goback.tests_page}</a>
</div>

{include file='footer.tpl'}