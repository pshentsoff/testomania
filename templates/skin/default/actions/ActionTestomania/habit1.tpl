{include file='header.tpl' menu=''}
<script type="text/javascript">
function count(){
	var sum=0;
	for (var i=1; i<=20; i++){
		var val=jQuery("input[name='q"+i+"']:checked").val();
		if (!val) val=0;
		sum+=parseInt(val);
		console.log(jQuery("input[name='q"+i+"']:checked").val());
	}
	if (sum<=6) show_results("Средняя степень риска"); 
	if (sum>7 && sum<=13) show_results("Повышенная степень риска"); 
	if (sum>13 && sum<=17) show_results("Высокая степень риска"); 
	if (sum>17) show_results("Крайне высокая степень риска"); 
}
function show_results(msg){
	jQuery('.test-results p').html(msg);
	jQuery('.test-results').fadeIn('normal');
}
</script>
<div class="title news_title">Тест на склонность ребенка к алкоголю, табаку и наркотикам</div>
<div class="news topic_list">
	<div class="col-item-title">Около вашего дома есть магазины, торгующие алкогольными напитками?</div>
	<p>
		<input name="q1" type="radio" value="1"> Да<br>
		<input name="q1" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">В магазинах вашего района продают алкоголь несовершеннолетним?</div>
	<p>
		<input name="q2" type="radio" value="1"> Да<br>
		<input name="q2" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">Ваш ребенок может купить себе алкогольные напитки (пиво, вино, водку)?</div>
	<p>
		<input name="q3" type="radio" value="1"> Да<br>
		<input name="q3" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">Вы даете ребенку полную свободу в отношении алкоголя и наркотиков?</div>
	<p>
		<input name="q4" type="radio" value="1"> Да<br>
		<input name="q4" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">Друзья и подруги вашего ребенка курят, выпивают, пробуют наркотики?</div>
	<p>
		<input name="q5" type="radio" value="1"> Да<br>
		<input name="q5" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">У вас в семье есть родственники, зависимые от алкоголя или наркотиков?</div>
	<p>
		<input name="q6" type="radio" value="1"> Да<br>
		<input name="q6" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">В вашей семье кто-либо пьет (употребляет наркотики) хотя бы время от времени?</div>
	<p>
		<input name="q7" type="radio" value="1"> Да<br>
		<input name="q7" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">Ваши соседи напиваются, нарушают закон, хулиганят в пьяном виде?</div>
	<p>
		<input name="q8" type="radio" value="1"> Да<br>
		<input name="q8" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">Взрослые, окружающие вашего ребенка, считают, что пить, курить, принимать лекарства в больших количествах – вполне нормально?</div>
	<p>
		<input name="q9" type="radio" value="1"> Да<br>
		<input name="q9" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">У вас крайне тяжелые материальные условия (постоянные долги, недоедание) или, напротив, материальные условия значительно лучше, чем у окружающих (в этом случае тоже отвечайте «да»)?</div>
	<p>
		<input name="q10" type="radio" value="1"> Да<br>
		<input name="q10" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">В вашей семье есть серьезный конфликт (постоянные ссоры, дни молчания, отсутствие согласия в решении важных вопросов)?</div>
	<p>
		<input name="q11" type="radio" value="1"> Да<br>
		<input name="q11" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">Ваш ребенок проводит с вами время неохотно (мало разговаривает, избегает контактов, замыкается в себе)?</div>
	<p>
		<input name="q12" type="radio" value="1"> Да<br>
		<input name="q12" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">Ваш ребенок бывал агрессивен в раннем детстве (до 10 лет)?</div>
	<p>
		<input name="q13" type="radio" value="1"> Да<br>
		<input name="q13" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">В раннем детстве вашего ребенка не принимали в свою компанию ровесники?</div>
	<p>
		<input name="q14" type="radio" value="1"> Да<br>
		<input name="q14" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">Ваш ребенок испытывает чувство одиночества, он изолирован, у него нет друзей?</div>
	<p>
		<input name="q15" type="radio" value="1"> Да<br>
		<input name="q15" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">У вашего ребенка постоянные неудачи в школе?</div>
	<p>
		<input name="q16" type="radio" value="1"> Да<br>
		<input name="q16" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">Ваш ребенок пренебрежительно относится к своему будущему, обучению, профессии?</div>
	<p>
		<input name="q17" type="radio" value="1"> Да<br>
		<input name="q17" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">Вы замечали, что ваш ребенок положительно отзывается о курении или алкоголе?</div>
	<p>
		<input name="q18" type="radio" value="1"> Да<br>
		<input name="q18" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">Ваш ребенок пробовал до 14-15 лет алкоголь, сигареты, наркотики?</div>
	<p>
		<input name="q19" type="radio" value="1"> Да<br>
		<input name="q19" type="radio" value="0"> Нет<br>
	</p>
	
	<div class="col-item-title">Испытывали ли вы трудности при ответах на эти вопросы?</div>
	<p>
		<input name="q20" type="radio" value="1"> Да<br>
		<input name="q20" type="radio" value="0"> Нет<br>
	</p>
	
	
	
	<input type="button" onclick="count()" value="Расчитать">
	<div class="test-results" style="display: none;">
		<div class="col-item-title">Результаты теста:</div>
		<p>
			
		</p>
	</div>
</div>
{include file='footer.tpl'}