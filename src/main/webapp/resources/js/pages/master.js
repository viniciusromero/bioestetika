//parseDate from dd/mm/yyyy to yyyy-mm-dd
function parseDateTo(val) {
	if (val=='h'){
		var today = new Date();
		val = parseDateFrom(today);
	}	
	if ((val != '') && (val != null)){
		var date = val.split('/');
		var newdate = new Date(date[2]+'-'+date[1]+'-'+date[0]);
		return newdate;
	}	
}

//parseDate from gmtObj to dd/mm/yyyy
function parseDateFrom(val) {
	if ((val != '') && (val != null)){		
		function pad(s) { return (s < 10) ? '0' + s : s; }
		var d = new Date(val);
		return [pad(d.getDate()), pad(d.getMonth()+1), d.getFullYear()].join('/');
	}
}

//parseTime from hh:mm to hh:mm:ss
function parseTimeTo(val){
	if (val=='a'){
		var today = new Date();
		val = today.getHours() + ':' + today.getMinutes();
	}
	if ((val != '') && (val != null)){
		val = val + ':00';	
		return val
	}	
}

//parseTime from hh:mm:ss to hh:mm
function parseTimeFrom(val){	
	
	if ((val != '') && (val != null)){
		var time = val.split(':');
		val = time[0] + ':' + time[1];
		return val;
	}	
}

function mascaraData(event, campo){
	if (event.keyCode ==8)
	{
		return true;
	}
	//rule for current day	
	if (campo.value=='h'){
		var today = new Date();
		campo.value = parseDateFrom(today);
		return true;
	}
	var data = campo.value;
	if (data.length == 2){
		data = data + '/';
		campo.value = data;
		return true;              
	}
	if (data.length == 5){
		data = data + '/';
		campo.value = data;
		return true;
	}
}
		 
function mascaraHora(event, campo){
	if (event.keyCode == 8)
	{
		return true;
	}
	//rule for current hour	
	if (campo.value=='a'){
		var today = new Date();
		campo.value = today.getHours() + ':' + today.getMinutes();
		return true;
	}		
	var hora = campo.value;
	var hora01 = '';
	hora01 = hora01 + hora;
	if (hora01.length == 2){
		hora01 = hora01 + ':';
		campo.value = hora01;
	}	
}
function verificaHora(campo){
	hrs = (campo.value.substring(0,2));
	min = (campo.value.substring(3,5));	
	if ((hrs < 00 ) || (hrs > 23) || ( min < 00) ||( min > 59)){
		campo.value='';
		campo.focus();	
	}
	else if(isNaN(hrs) || isNaN(min)){
		campo.value="";
	}
}
function verificaData(campo)
{
	var date = campo.value.split('/');
	var newdate = new Date(date[2]+'-'+date[1]+'-'+date[0]);		
	if (newdate=='Invalid Date')
	{
		campo.value='';
		campo.focus();
	}
}