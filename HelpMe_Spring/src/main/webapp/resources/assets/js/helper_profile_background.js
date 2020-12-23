/**
 * 헬퍼 학력, 경력, 자격증
 */


function makeChange() {

	var inst_name = $("#new_inst_name").val();
	var grad_year = $("#yearpicker option:selected").val();
	var position = $("#new_position").val();
	var startYear = $("#period1 option:selected").val();
	var endYear = $("#period2 option:selected").val();
	var license = $("#new_license_name").val();
	var date_obtained = $("input#datepicker").datepicker("getDate");

	console.log("inst_name : " + inst_name);
	console.log("grad_year : " + grad_year);
	console.log("position : " + position);
	console.log("startYear : " + startYear);
	console.log("endYear : " + endYear);
	console.log("license : " + license);
	console.log("date_obtained : " + date_obtained);

	if (inst_name == "" && position == "" && license == "") {
		alert("Please enter information");
		return false;
	}
	
	if (inst_name != "" && position != "" && license != "") {
		if(grad_year == ""){
			alert("Please select graduate year");
			return false;
		}
		
		if(startYear == ""){
			alert("Please select start year");
			return false;
		}
		else if(endYear == ""){
			alert("Please select end year");
			return false;
		}
		
		var start = Number(startYear);
		var end = Number(endYear);

		if (start > end || start == end) {
			alert("Start year must be less than end year");
			return false;
		}
		
		if (date_obtained == null) {
			alert("Please select the obtained date of certificate");
			return false;
		}
		
		helperBackground.updateBackground({
			
			school : inst_name,
			gradYear : grad_year,
			work : position,
			startYear : startYear,
			endYear : endYear,
			license : license,
			dateObtained : date_obtained
			
		}, function(result){
			alert("Education, work experience and certificate have been successfully added");
			location.replace("/helpme/helper/background");
		});
	}
	else if (inst_name != "" && position != "" && license == "") {
		if(grad_year == ""){
			alert("Please select graduate year");
			return false;
		}
		
		if(startYear == ""){
			alert("Please select start year");
			return false;
		}
		else if(endYear == ""){
			alert("Please select end year");
			return false;
		}
		
		var start = Number(startYear);
		var end = Number(endYear);

		if (start > end) {
			alert("Start year must be less than end year");
			return false;
		}
		
		helperBackground.updateBackground({
			
			school : inst_name,
			gradYear : grad_year,
			work : position,
			startYear : startYear,
			endYear : endYear,
			
		}, function(result){
			alert("Education and work experience have been successfully added");
			location.replace("/helpme/helper/background");
		});
	}
	else if (inst_name != "" && position == "" && license != "") {
		if(grad_year == ""){
			alert("Please select graduate year");
			return false;
		}
		if (date_obtained == null) {
			alert("Please select the obtained date of certificate");
			return false;
		}
		
		helperBackground.updateBackground({
			
			school : inst_name,
			gradYear : grad_year,
			license : license,
			dateObtained : date_obtained
			
		}, function(result){
			alert("Education and certificate have been successfully added");
			location.replace("/helpme/helper/background");
		});
		
	}
	else if (inst_name == "" && position != "" && license != "") {
		if(startYear == ""){
			alert("Please select start year");
			return false;
		}
		else if(endYear == ""){
			alert("Please select end year");
			return false;
		}
		
		var start = Number(startYear);
		var end = Number(endYear);

		if (start > end) {
			alert("Start year must be less than end year");
			return false;
		}
		
		if (date_obtained == null) {
			alert("Please select the obtained date of certificate");
			return false;
		}
		
		helperBackground.updateBackground({
			
			work : position,
			startYear : startYear,
			endYear : endYear,
			license : license,
			dateObtained : date_obtained
			
		}, function(result){
			alert("Work experience and certificate have been successfully added");
			location.replace("/helpme/helper/background");
		});
		
	}
	else if (inst_name != "" && position == "" && license == "") {
		if(grad_year == ""){
			alert("Please select graduate year");
			return false;
		}
		
		helperBackground.updateBackground({
			
			school : inst_name,
			gradYear : grad_year,
			
		}, function(result){
			alert("Education has been successfully added");
			location.replace("/helpme/helper/background");
		});

	}
	else if (inst_name == "" && position != "" && license == "") {
		if(startYear == ""){
			alert("Please select start year");
			return false;
		}
		else if(endYear == ""){
			alert("Please select end year");
			return false;
		}
		
		var start = Number(startYear);
		var end = Number(endYear);

		if (start > end) {
			alert("Start year must be less than end year");
			return false;
		}
		
		helperBackground.updateBackground({
			
			work : position,
			startYear : startYear,
			endYear : endYear,
			
		}, function(result){
			alert("Work experience has been successfully added");
			location.replace("/helpme/helper/background");
		});
		
	}
	else if ((inst_name == "" && position == "" && license != "")) {

		if (date_obtained == null) {
			alert("Please select the obtained date of certificate");
			return false;
		}
		
		helperBackground.updateBackground({
			
			license : license,
			dateObtained : date_obtained
			
		}, function(result){
			alert("Certificate has been successfully added");
			location.replace("/helpme/helper/background");
		});
	}

}

var helperBackground = (function() {

	function updateBackground(info, callback, error) {
		
		console.log("before info.dateObtained : " + info.dateObtained);
		
		if(info.dateObtained == undefined){
			info.dateObtained = "empty";
		}
		console.log("after info.dateObtained : " + info.dateObtained);
		
			$.ajax({
				url : "/helpme/helper/updateBackground/" + info.dateObtained,
				type : 'PATCH',
				data : JSON.stringify(info),
				contentType: 'application/json; charset=utf-8',
				success : function(result, status, xhr) {
					if (callback) {
						callback(result);
					}
				},
				error : function(status, xhr, er) {
					if(error){
						error(er);
						console.log("오류");
					}
				}
			});
		}
	
	return {updateBackground : updateBackground}
})();


function deleteEducation(inst_name) {

	// console.log("inst_name : "+inst_name);

	// alert("inst_name : "+inst_name);

	$.ajax({
		url : "/helpme/helper/deleteEducation/"+ inst_name,
		type : 'delete',
		dataType : 'text',
		success : function(data) {

			var value = document.getElementById(data.trim());
			value.parentNode.removeChild(value);

			var remove = $("a#removeEducation");

			// education이 하나일때 remove 버튼 없애기
			if ($("ul.education").length == 1) {
				remove.css("display", "none");
			}

		},
		error : function() {
			console.log("오류");
		}
	})

}

function deleteWork(work) {

	$.ajax({
		url : "/helpme/helper/deleteWork/" + work,
		type : 'delete',
		dataType : 'text',
		success : function(data) {

			var value = document.getElementById(data.trim());
			value.parentNode.removeChild(value);

			var remove = $("a#removeWork");

			console.log($("ul.actions").length);

			// education이 하나일때 remove 버튼 없애기
			if ($("ul.work").length == 1) {
				remove.css("display", "none");
			}

		},
		error : function() {
			console.log("오류");
		}
	})

}

function deleteCertificate(certificate) {

	// alert("certificate : "+certificate);

	$.ajax({
		url : "/helpme/helper/deleteCertificate/"+ certificate,
		type : 'delete',
		dataType : 'text',
		success : function(data) {

			var value = document.getElementById(data.trim());
			value.parentNode.removeChild(value);

			var remove = $("a#removeCertificate");

			console.log("ul.certificate length : " + $("ul.certificate").length);
			
			// education이 하나일때 remove 버튼 없애기
			if ($("ul.certificate").length == 1) {
				remove.css("display", "none");
			}
		},
		error : function() {
			console.log("오류");
		}
	})

}
