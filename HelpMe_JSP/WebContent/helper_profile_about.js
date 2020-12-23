/**
 * 헬퍼 About
 */

function makeChanges() {

	var language = $("#language option:selected").val(); //언어를 가져온다
	var level = $("#language_level option:selected").val();//언어의 레벨을 가져온다
	var service = $("#service option:selected").val();//서비스 이름을 가져온다

	//아무것도 선택을 안했을 떄 나오는 메세지
	if (language == "" && level == "" && service == "") {
		alert("Please select first");
		return false;
	}

	//언어, 레벨, 서비스를 동시에 변경하고자 할때 나오는 메세지
	if (language != "" && level != "" && service != "") {
		alert("Please change either language or specialty first");
		return false;
	}

	//서비스 추가
	if (language == "" && level == "") {


		//추가하고자 하는 서비스를 ajax로 전송한다
		$.ajax({
			url : contextPath + "/helper/HelperSpecialtyAddOk.he?addSpecialty="
					+ service,
			type : 'get',
			dataType : 'text',
			success : function(data) {

				//추가가 완료되면 컨트롤러를 통해 해당 jsp페이지로 이동한다
				location.replace(contextPath + "/helper/HelperAboutOk.he");

			},
			error : function() {
				console.log("오류");
			}
		})

//언어, 레벨 추가
	} else {
		
		if (language == "") {
			alert("Please select language");
			return false;
		}

		if (level == "") {
			alert("Please select language level");
			return false;
		}

		
		console.log(language);
		console.log(level);

		//선택한 언어와 레벨을 전송한다
		$.ajax({
			url : contextPath + "/helper/HelperLanguageAddOk.he?language="
					+ language + "&level=" + level,
			type : 'get',
			dataType : 'text',
			success : function(data) {
				
				location.replace(contextPath + "/helper/HelperAboutOk.he");

			},
			error : function() {
				console.log("오류");
			}
		})

	}

}

//언어 삭제
function deleteLanguage(language) {

	var deleteLanguage = $("#" + language + " option:selected").val(); //삭제하고자 하는 언어 가져오기

	//삭제할려는 언어를 전송한다
	$.ajax({
		url : contextPath + "/helper/HelperLanguageDeleteOk.he?language="
				+ deleteLanguage,
		type : 'get',
		dataType : 'text',
		success : function(data) {

			var value = document.getElementById(data.trim());
			
			//삭제한 언어를 select태그에서 삭제한다
			value.parentNode.removeChild(value);

			var remove = $("a#removelanguage");


			// language가 하나일때 remove 버튼을 없앤다
			if ($('#helperlanguagelevel option').length == 1) {
				remove.css("display", "none");
			}

			// select option에 삭제한 언어를 추가한다
			 $("select#language").append("<option value="+"'"+data.trim()+"'"+">"+data.trim()+"</option>");
		},
		error : function() {
			console.log("오류");
		}
	})

}

//서비스 삭제
function deleteSpecialty(service) {
	
	//서비스중에 Tax Accounting과 Government Service는 문자 그대로 ajax로 전송이 안되서
	//아래와 같은 조치를 취했다
	var data = service;
	
	dataSplit = data.split(" ");
	
	if(dataSplit[0] == "Tax"){
		var deleteService = "Tax Accounting";
		
	}else if(dataSplit[0] == "Government"){
		var deleteService = "Government Service";
		
	}else{
		var deleteService = $("#" + service + " option:selected").val();
	
	}
	
	$.ajax({
		url : contextPath
				+ "/helper/HelperSpecialtyDeleteOk.he?deleteSpecialty="
				+ deleteService,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			
			var value = document.getElementById(data.trim());
			//삭제한 서비스의 select태그를 삭제한다
			value.parentNode.removeChild(value);

			var remove = $("a#removespecialty");

			// Specialties가 하나일때 remove 버튼 없애기
			if ($('.helperservice option').length == 1) {
				remove.css("display", "none");
			}

			// select option에 삭제한 서비스 추가하기
			 $("select#service").append("<option value="+"'"+data.trim()+"'"+">"+data.trim()+"</option>");
		},
		error : function() {
			console.log("오류");
		}
	})
}
