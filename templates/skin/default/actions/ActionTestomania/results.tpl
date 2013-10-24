<script type="text/javascript">
var testomania_questions_count = {$iQuestionsCount};
{literal}
function testomania_results(value) {
    {/literal}
    {foreach from=$aResults item=aResult}
    if(value >= {$aResult.weights_low}) return '{$aResult.result}';
    {/foreach}
    {literal}
}
{/literal}
</script>