{include file='header.tpl' menu=''}
<script type="text/javascript">
function count(){
	var sum=0;
	for (var i=1; i<=13; i++){
		var val=jQuery("input[name='q"+i+"']:checked").val();
		if (!val) val=0;
		sum+=parseInt(val);
		console.log(jQuery("input[name='q"+i+"']:checked").val());
	}
	if (sum<=20) show_results("Малый риск развития сердечно-сосудистых заболеваний"); 
	if (sum>20 && sum<=50) show_results("Средний риск развития сердечно-сосудистых заболеваний"); 
	if (sum>50 && sum<=74) show_results("Высокий риск развития сердечно-сосудистых заболеваний"); 
	if (sum>74) show_results("Очень высокий риск развития сердечно-сосудистых заболеваний"); 
}
function show_results(msg){
	jQuery('.test-results p').html(msg);
	jQuery('.test-results').fadeIn('normal');
}
</script>
<div class="title news_title">Расчет суммарного риска развития сердечно-сосудистых заболеваний THIS IS SPARTA!!!!</div>
<div class="news topic_list">
	<div class="col-item-title">1. Ваши пол и возраст:</div>
	<p>
		<input name="q1" type="radio" value="0"> Ж. Менее 55 лет<br>
		<input name="q1" type="radio" value="2"> Ж. 55 лет и более<br>
		<input name="q1" type="radio" value="1"> М. Менее 55 лет <br>
		<input name="q1" type="radio" value="3"> М. 55-65 лет <br>
		<input name="q1" type="radio" value="4"> М. 65 лет и более<br>
	</p>
	
	<div class="col-item-title">2. Был ли у родителей, тети и дяди, дедушки и бабушки инфаркт миокарда (сердечный приступ)?</div>
	<p>
		<input name="q2" type="radio" value="0"> Не было до 60 лет <br>
		<input name="q2" type="radio" value="1"> У 1 или более после 60 лет<br>
		<input name="q2" type="radio" value="2"> У 1 до 60 лет <br>
		<input name="q2" type="radio" value="3"> У двух до 60 лет <br>
		<input name="q2" type="radio" value="4"> Более, чем у двух до 60 лет<br>
	</p>
	
	<div class="col-item-title">3. Были ли у тех же родственников гипертония, диабет, повышение концентрации холестерина в крови?</div>
	<p>
		<input name="q3" type="radio" value="0"> Не было <br>
		<input name="q3" type="radio" value="1"> У одного<br>
		<input name="q3" type="radio" value="2"> У двух <br>
		<input name="q3" type="radio" value="3"> Более, чем у двух <br>
	</p>
	
	<div class="col-item-title">4. Каков уровень холестерина у вас в крови (ммоль/л)?</div>
	<p>
		<input name="q4" type="radio" value="2"> 191-230 <br>
		<input name="q4" type="radio" value="6"> 231-289 <br>
		<input name="q4" type="radio" value="12"> 290-319 <br>
		<input name="q4" type="radio" value="16"> 320 и более  <br>
	</p>
	
	<div class="col-item-title">5. Курите ли вы или курили в прошлом?</div>
	<p>
		<input name="q5" type="radio" value="0"> Не курил или бросил более 5 лет назад <br>
		<input name="q5" type="radio" value="1"> Бросил 2-4 года назад<br>
		<input name="q5" type="radio" value="3"> Бросил год назад <br>
		<input name="q5" type="radio" value="6"> Бросил несколько месяцев назад <br>
	</p>
	
	<div class="col-item-title">6. Сколько сигарет курите ежедневно?</div>
	<p>
		<input name="q6" type="radio" value="0"> Не курю <br>
		<input name="q6" type="radio" value="1"> Половину пачки<br>
		<input name="q6" type="radio" value="9"> Пачку <br>
		<input name="q6" type="radio" value="12"> 1-2 пачки <br>
		<input name="q6" type="radio" value="15"> Более двух пачек<br>
	</p>
	
	<div class="col-item-title">7. Каким воздухом дышите?</div>
	<p>
		<input name="q7" type="radio" value="0"> Чистым и дома, и на работе <br>
		<input name="q7" type="radio" value="2"> Загрязненным сигаретным дымом либо на работе, либо дома<br>
		<input name="q7" type="radio" value="4"> Загрязненным сигаретным дымом и на работе, и дома <br>
		<input name="q7" type="radio" value="6"> Загрязненным сигаретным дымом либо на работе, либо дома + грязный воздух (химия, выхлопные газы) <br>
		<input name="q7" type="radio" value="8"> Загрязненным сигаретным дымом и на работе, и дома + грязный воздух (химия, выхлопные газы) <br>
	</p>
	
	<div class="col-item-title">8. Какое у вас АД (мм. ртутного столба)?</div>
	<p>
		<input name="q8" type="radio" value="0"> Меньше 120/75 <br>
		<input name="q8" type="radio" value="2"> 120/75-140/85<br>
		<input name="q8" type="radio" value="6"> 140/85-150/90 <br>
		<input name="q8" type="radio" value="8"> 150/90-175/100 <br>
		<input name="q8" type="radio" value="10"> 175/100-190/100<br>
		<input name="q8" type="radio" value="12"> Более 190<br>
	</p>
	
	<div class="col-item-title">9. Как часто вы занимаетесь физкультурой?</div>
	<p>
		<input name="q9" type="radio" value="0"> 4-5 раз в неделю <br>
		<input name="q9" type="radio" value="2"> Без напряжения 4-5 раз в неделю<br>
		<input name="q9" type="radio" value="4"> Без напряжения по субботам и воскресеньям <br>
		<input name="q9" type="radio" value="6"> Без напряжения изредка <br>
		<input name="q9" type="radio" value="8"> Почти никогда или никогда<br>
	</p>
	
	<div class="col-item-title">10. Ваш вес?</div>
	<p>
		<input name="q10" type="radio" value="0"> Нормальный <br>
		<input name="q10" type="radio" value="1"> Повышен на 10%<br>
		<input name="q10" type="radio" value="2"> Повышен на 11-20%<br>
		<input name="q10" type="radio" value="3"> Повышен более чем на 20%<br>
		<input name="q10" type="radio" value="4"> Повышен более чем на 20% сейчас и был таким до 30 лет <br>
	</p>
	
	<div class="col-item-title">11. Часто ли вы нервничаете?</div>
	<p>
		<input name="q11" type="radio" value="0"> Редко<br>
		<input name="q11" type="radio" value="3"> Иногда дома, но не на работе <br>
		<input name="q11" type="radio" value="5"> Иногда на работе, но не дома<br>
		<input name="q11" type="radio" value="7"> Иногда дома и на работе<br>
		<input name="q11" type="radio" value="9"> Обычно или дома, или на работе <br>
		<input name="q11" type="radio" value="12"> Обычно и дома, и на работе<br>
	</p>
	
	<div class="col-item-title">12. Болеете ли вы диабетом?</div>
	<p>
		<input name="q12" type="radio" value="0"> Сахар в норме<br>
		<input name="q12" type="radio" value="2"> Имеется гипер или гипогликемия<br>
		<input name="q12" type="radio" value="4"> Появился диабет после 40 лет, соблюдаю диету <br>
		<input name="q12" type="radio" value="5"> То же до 40 лет<br>
	</p>
	
	<div class="col-item-title">13. Употребляете ли алкогольные напитки (в том числе, пиво)?</div>
	<p>
		<input name="q13" type="radio" value="0"> Нет или употребляю не более 2 раз в месяц <br>
		<input name="q13" type="radio" value="2"> Не более 5 раз в неделю небольшими порциями<br>
		<input name="q13" type="radio" value="4"> Почти ежедневно более 3 бокалов вина, либо 1 л. пива, либо 100 мл. крепких напитков – 4<br>
	</p>
	<input type="button" onclick="count()" value="Расчитать">
	<div class="test-results" style="display: none;">
		<div class="col-item-title">Результаты теста:</div>
		<p>
			
		</p>
	</div>
</div>
{include file='footer.tpl'}