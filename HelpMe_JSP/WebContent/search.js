/**
 *  헬퍼서치
 */
var check = false;

function formSubmit(){
	var frm = document.helper_search;
		
	//서비스 all 클릭시
	if(frm.service.value == 'all'){	
		//frm.action = "http://localhost:8087/HelpMe_final/helper/all.he";
		//frm.action = "http://127.0.0.1/helper/all.he";
//		frm.action = "http://27.96.131.139/helper/all.he";
		frm.action = "http://helpme-korea.tk/helper/all.he";
		
		// /usr/local/apache-tomcat-8.5.59/webapps/ROOT/
		//http://helpme-korea.tk/images/sky/studysearch.jpg
		
		frm.submit();
	}else{
		//서비스 선택 여부	
		var radio = document.getElementsByName('service');
		var cnt = 0;
		for (var i = 0; i < radio.length; i++) {
			if(radio[i].checked == true){cnt++;}}
		if(cnt < 1){
			alert("Please select a service");
			return false;
		}
		//지역 선택 여부
		if(frm.Area.value == ''){
			alert("Please select a region");
			return false;
		}
		//날짜 선택여부
		if(frm.datepicker.value == ''){
			alert("Please enter a date");
			return flase;
		}
		//시간 선택
		if(frm.time1.value == ''){
			alert("Please set the time");
			return false;
		}
		
		frm.submit();
	}

}
