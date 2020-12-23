/**
 * 헬퍼 About
 */


function makeChanges() {

	var language = $("#language option:selected").val();
	var level = $("#language_level option:selected").val();
	var service = $("#service option:selected").val();

	if (language == "" && level == "" && service == "") {
		alert("Please select first");
		return false;
	} else if (language != "" && level != "" && service != "") {

		clientService.updateAbout({
			language : language,
			level : level,
			specializedField : service
		}

		, function(result) {
			alert("Language and specialty have been successfully added");
			location.replace("/helpme/helper/about");
		});

	} else if (language != "" && level == "" && service == "") {
		alert("Please select language level");
		return false;
	} else if (language != "" && level == "" && service != "") {
		alert("Please select language level");
		return false;
	} else if (language == "" && level != "" && service == "") {
		alert("Please select language");
		return false;
	} else if (language == "" && level != "" && service != "") {
		alert("Please select language");
		return false;
	} else if (language != "" && level != "" && service == "") {

		clientService.updateAbout({
			language : language,
			level : level
		}

		, function(result) {
			alert("Language has been successfully added");
			location.replace("/helpme/helper/about");
		});
	} else if (language == "" && level == "" && service != "") {

		clientService.updateAbout({
			specializedField : service
		}

		, function(result) {
			alert("Specialty has been successfully added");
			location.replace("/helpme/helper/about");
		});
	}

}

var clientService = (function() {

	function updateAbout(info, callback, error) {
		$.ajax({
			url : "/helpme/helper/aboutUpdates",
			type : 'PATCH',
			data : JSON.stringify(info),
			contentType : 'application/json; charset=utf-8',
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(status, xhr, er) {
				if (error) {
					error(er);
					console.log("오류");
				}
			}
		})
	}

	return {
		updateAbout : updateAbout
	};

})();

function deleteLanguage(language) {

	var deleteLanguage = $("#" + language + " option:selected").val();

	$.ajax({
		url : "/helpme/helper/deleteLanguage/" + deleteLanguage,
		type : 'delete',
		dataType : 'text',
		success : function(data) {

			console.log("data : " + data);

			var value = document.getElementById(data.trim());
			value.parentNode.removeChild(value);

			var remove = $("a#removelanguage");

			console.log($('#helperlanguagelevel option').length);

			// language가 하나일때 remove 버튼 없애기
			if ($('#helperlanguagelevel option').length == 1) {
				remove.css("display", "none");
			}

			// select option에 삭제한 언어 추가하기
			$("select#language").append(
					"<option value=" + "'" + data.trim() + "'" + ">"
							+ data.trim() + "</option>");

		},
		error : function() {
			console.log("오류");
		}
	})

}

function deleteSpecialty(service) {

	console.log("service : " +service);
	
	var data = service;

	dataSplit = data.split(" ");

	if (dataSplit[0] == "Tax") {
		var deleteService = "Tax Accounting";

	} else if (dataSplit[0] == "Government") {
		var deleteService = "Government Service";

	} else {

		var deleteService = $("#" + service + " option:selected").val();
	}

	console.log("deleteService : " + deleteService);
	
	$.ajax({
		url : "/helpme/helper/deleteService/" + deleteService,
		type : 'delete',
		dataType : 'text',
		success : function(data) {

			console.log("service : " + data);
			var value = document.getElementById(data.trim());
			value.parentNode.removeChild(value);

			var remove = $("a#removespecialty");

			console.log($('.helperservice option').length);

			// Specialties가 하나일때 remove 버튼 없애기
			if ($('.helperservice option').length == 1) {
				remove.css("display", "none");
			}

			// select option에 삭제한 서비스 추가하기
			$("select#service").append(
					"<option value=" + "'" + data.trim() + "'" + ">"
							+ data.trim() + "</option>");

		},
		error : function() {
			console.log("오류");
		}
	})
}
