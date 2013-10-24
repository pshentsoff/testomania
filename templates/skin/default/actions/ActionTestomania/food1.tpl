{include file='header.tpl' menu=''}
<script type="text/javascript">
function count(){
	var sum=0;
	for (var i=1; i<=6; i++){
		var val=jQuery("input[name='q"+i+"']:checked").val();
		if (!val) val=0;
		sum+=parseInt(val);
		console.log(jQuery("input[name='q"+i+"']:checked").val());
	}
	show_results("Вы ответили правильно на "+sum+" вопросов из 6"); 
}
function show_results(msg){
	jQuery('.test-results p').html(msg);
	jQuery('.test-results').fadeIn('normal');
}
</script>
<div class="title news_title">Тест на здоровое питание</div>
<div class="news topic_list">
	<div class="col-item-title">Как часто специалисты советуют есть рыбу? </div>
	<p>
		<input name="q1" type="radio" value="0"> Раз в неделю<br>
		<input name="q1" type="radio" value="1"> Два раза в неделю<br>
		<input name="q1" type="radio" value="0"> Каждый день<br>
	</p>
	
	<div class="col-item-title">В каком из следующих продуктов содержится больше витамина С? </div>
	<p>
		<input name="q2" type="radio" value="0"> Молоко<br>
		<input name="q2" type="radio" value="1"> Брюссельская капуста<br>
		<input name="q2" type="radio" value="0"> Апельсины<br>
	</p>
	
	<div class="col-item-title">Сколько воды специалисты советуют выпивать в день? </div>
	<p>
		<input name="q3" type="radio" value="0"> 1 литр<br>
		<input name="q3" type="radio" value="1"> 2 литра<br>
		<input name="q3" type="radio" value="0"> 3 литра<br>
	</p>
	
	<div class="col-item-title">Сколько кальция нужно нашему организму?</div>
	<p>
		<input name="q4" type="radio" value="0"> 100 мг в день<br>
		<input name="q4" type="radio" value="0"> 400 мг в день<br>
		<input name="q4" type="radio" value="1"> 700 мг в день<br>
	</p>
	
	<div class="col-item-title">Какой жир вреднее всего для здоровья? </div>
	<p>
		<input name="q5" type="radio" value="0"> Полинасыщенный жир<br>
		<input name="q5" type="radio" value="1"> Насыщенный жир<br>
		<input name="q5" type="radio" value="0"> Мононасыщенный жир<br>
	</p>
	
	<div class="col-item-title">Какой процент ежедневной нормы калорий (энергии) должен приходить из углеводов?</div>
	<p>
		<input name="q6" type="radio" value="1"> 50 процентов<br>
		<input name="q6" type="radio" value="0"> 80 процентов<br>
		<input name="q6" type="radio" value="0"> 100 процентов<br>
	</p>
	
	<input type="button" onclick="count()" value="Расчитать">
	<div class="test-results" style="display: none;">
		<div class="col-item-title">Результаты теста:</div>
		<p>
			
		</p>
	</div>
</div>
{include file='footer.tpl'}