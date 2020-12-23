/**
 *  헬퍼 학력, 경력, 자격증
 */

function makeChange(){
	
	var inst_name = $("#new_inst_name").val(); //교육기관 이름 가져오기
	var grad_year = $("#yearpicker option:selected").val(); //졸업연도 가져오기
	var position = $("#new_position").val(); //직장 직책 가져오기
	var startYear = $("#period1 option:selected").val(); //시작 연도 가져오기
	var endYear = $("#period2 option:selected").val(); //끝 연도 가져오기
	var license = $("#new_license_name").val(); //자격증 이름 가져오기
	var date_obtained = $("input#datepicker").datepicker("getDate");
	
	console.log("inst_name : "+inst_name);
	console.log("grad_year : "+grad_year);
	console.log("position : "+position);
	console.log("startYear : "+startYear);
	console.log("endYear : "+endYear);
	console.log("license : "+license);
	console.log("date_obtained : "+date_obtained);
	
	//동시에 학력, 경력, 자격증을 변경하고자할 때 나오는 메세지
	if(inst_name != "" && position != "" && license != ""){
		alert("Please update either Education, Work or Certificate first");
		return false;
	}
	
	//아무 값이 없을 떄 나오는 메세지
	if(inst_name == "" && position == "" && license == ""){
		alert("Please enter information");
		return false;
	}
	
	//두개의 항목을 동시에 변경하고자할 때 나오는 메세지
	if((inst_name == "" && position != "" && license != "") || (inst_name != "" && position != "" && license == "")
			|| (inst_name != "" && position == "" && license != "")){
		alert("Please update one category at a time");
		return false;
	}
	
	//학력 추가
	if(inst_name != "" && position == "" && license == ""){
		
	
		//추가한 교육기관명과 졸업연도를 ajax로 전송한다
		$.ajax({
			url :contextPath+"/helper/HelperEducationAddOk.he?inst_name="
					+ inst_name+"&grad_year="+grad_year,
			type : 'get',
			dataType : 'text',
			success : function(data) {
				
				//추가 완료 후 다시 페이지로 이동한다
				location.replace(contextPath+ "/helper/HelperBackgroundOk.he");
				

			},
			error : function() {
				console.log("오류");
			}
		})
		
		
	}
	
	//경력 추가
	else if(inst_name == "" && position != "" && license == ""){
		
		
		var start = Number(startYear);
		var end = Number(endYear);
		
		//시작연도가 끝 연도보다 클때 나오는 메세지
		if(start > end){
			alert("Start year must be less than end year");
			return false;
		}
		
		console.log("add work");
		
		//추가한 경력, 시작 연도, 끝 연도를 ajax로 전송한다
		$.ajax({
			url :contextPath+"/helper/HelperWorkAddOk.he?position="
					+ position+"&startYear="+startYear+"&endYear="+endYear,
			type : 'get',
			dataType : 'text',
			success : function(data) {
				
				//추가 완료 후 다시 페이지로 이동한다
				location.replace(contextPath+ "/helper/HelperBackgroundOk.he");
				

			},
			error : function() {
				console.log("오류");
			}
		})
	}
	
	
	//자격증 추가
	else if((inst_name == "" && position == "" && license != "")){
		
		//자격증 취득날짜가 널일 때 나오는 메세지
		if(date_obtained == null){
			alert("Please select the obtained date of certificate");
			return false;
		}
		
		//추가한 자격증, 자격증 취득일을 ajax로 전송한다
		$.ajax({
			url :contextPath+"/helper/HelperCertificateAddOk.he?license="
					+license+"&date_obtained="+date_obtained,
			type : 'get',
			dataType : 'text',
			success : function(data) {
				
				//추가 완료 후 다시 페이지로 이동한다
				location.replace(contextPath+ "/helper/HelperBackgroundOk.he");
				

			},
			error : function() {
				console.log("오류");
			}
		})
	}
	
}

//학력 삭제
function deleteEducation(inst_name){	
	
	//삭제할려는 교육기관명을 받아와서 ajax로 전송한다
	$.ajax({
		url :contextPath+"/helper/HelperEducationDeleteOk.he?inst_name="
				+ inst_name,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			
			//해당 학력을 페이지에서 삭제한다
			var value = document.getElementById(data.trim());
			value.parentNode.removeChild(value);
			
			var remove = $("a#removeEducation");
			
			
			//education이 하나일때 remove 버튼 없애기
			if ($("ul.education").length == 1) {
	            remove.css("display", "none");
	         }
			
		},
		error : function() {
			console.log("오류");
		}
	})
	
}

//경력 삭제
function deleteWork(work){
	
	//삭제할려는 직책명을 받아와 ajax로 전송한다
	$.ajax({
		url :contextPath+"/helper/HelperWorkDeleteOk.he?work="
				+ work,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			
			//해당 경력을 페이지에서 삭제한다
			var value = document.getElementById(data.trim());
			value.parentNode.removeChild(value);
			
			var remove = $("a#removeWork");
			
			
			//education이 하나일때 remove 버튼 없애기
			if ($("ul.work").length == 1) {
	            remove.css("display", "none");
	         }
			
		},
		error : function() {
			console.log("오류");
		}
	})
	
}

//자격증 삭제
function deleteCertificate(certificate){
	
	//삭제할려는 자격증명을 받아와 ajax로 전송한다
	$.ajax({
		url :contextPath+"/helper/HelperCertificateDeleteOk.he?certificate="
				+ certificate,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			
			//해당 자격증을 페이지에서 삭제한다
			var value = document.getElementById(data.trim());
			value.parentNode.removeChild(value);
			
			var remove = $("a#removeCertificate");
			
			
			//education이 하나일때 remove 버튼 없애기
			if ($("ul.certificate").length == 1) {
	            remove.css("display", "none");
	         }
		},
		error : function() {
			console.log("오류");
		}
	})
	
}