/**
 * 		헬퍼 스케줄 변경 및 고객 예약
 */

function changeSchedule() {

	var dayId = document.getElementById("change_day");
	var startTimeId = document.getElementById("change_startTime");
	var endTimeId = document.getElementById("change_endTime");

	var change_day = dayId.options[dayId.selectedIndex].value;
	var change_startTime = startTimeId.options[startTimeId.selectedIndex].value;
	var change_endTime = endTimeId.options[endTimeId.selectedIndex].value;

	if (change_day == "") {
		alert("Please select day");
		return false;
	}

	if (change_startTime == "") {
		alert("Please select start time");
		return false;
	}

	if (change_endTime == "") {
		alert("Please select end time");
		return false;
	}
	
	var start = Number(change_startTime);
	var end = Number(change_endTime);
	
	var diff = end - start;
	
	if(start > end){
		alert("Start time must be less than end time");
		return false;
	}
	
	if(diff < 5){
		alert("The daily minimum working hour is 5");
		return false;
	}

	change_day = parseInt(change_day);

	$.ajax({
				url : "/helpme/schedule/changeSchedule/" + change_day + "/" + change_startTime + "/" + change_endTime + "/",
				type : 'get',
				dataType : 'text',
				success : function(data) {

					var dataSplit = data.split(",");

					var changeDay = dataSplit[0];
					var changeStartTime = dataSplit[1];
					var changeEndTime = dataSplit[2];

					console.log("changeDay : " + changeDay);
					console.log("changeStartTime : " + changeStartTime);
					console.log("changeEndTime : " + changeEndTime);

					var days = document.getElementsByClassName("day");
					var time = document.getElementsByClassName("time");
					
					
					for (var i = 0; i < days.length; i++) {
						//console.log("days : "+days[0].innerHTML.trim());
						if (days[i].innerHTML.trim() == changeDay) {
							time[i].innerHTML = changeStartTime + " ~ "
									+ changeEndTime;
						}
					}

				},
				error : function() {
					console.log("오류");
				}
			})
}

function addSchedule() {

	var dayId = document.getElementById("add_day");
	var startTimeId = document.getElementById("add_startTime");
	var endTimeId = document.getElementById("add_endTime");

	var add_day = dayId.options[dayId.selectedIndex].value;
	var add_startTime = startTimeId.options[startTimeId.selectedIndex].value;
	var add_endTime = endTimeId.options[endTimeId.selectedIndex].value;

	
	if (add_day == "") {
		alert("Please select day");
		return false;
	}

	if (add_startTime == "") {
		alert("Please select start time");
		return false;
	}

	if (add_endTime == "") {
		alert("Please select end time");
		return false;
	}
	
	var start = Number(add_startTime);
	var end = Number(add_endTime);
	
	var diff = end - start;
	
	if(start > end){
		alert("Start time must be less than end time");
		return false;
	}
	
	if(diff < 5){
		alert("The daily minimum working hour is 5");
		return false;
	}
	
	console.log(add_day);
	console.log(add_startTime);
	console.log(add_endTime);
	
	add_day = parseInt(add_day);
	
	$.ajax({
		url : "/helpme/schedule/addSchedule/" + add_day + "/" + add_startTime + "/" + add_endTime + "/",
		type : 'get',
		dataType : 'text',
		success : function(data) {
			
			location.replace("/helpme/helper/schedule");
			
		},
		error : function() {
			console.log("오류");
		}
	})
}

function removeSchedule() {

	var dayId = document.getElementById("remove_day");

	var remove_day = dayId.options[dayId.selectedIndex].value;

	if (remove_day == "") {
		alert("Please select day");
		return false;
	}
	
	remove_day = parseInt(remove_day);

	$.ajax({
		url : "/helpme/schedule/removeSchedule/" + remove_day,
		type : 'DELETE',
		dataType : 'text',
		success : function(data) {
			
			var removeDay = data;

			console.log("removeDay : " + removeDay);
			var schedule = document.getElementsByClassName("schedule");
			var days = document.getElementsByClassName("day");

			//페이지 view에서 선택한 요일을 삭제한다
			for (var i = 0; i < days.length; i++) {
				console.log(days[i].innerHTML.trim());
				if (days[i].innerHTML.trim() == removeDay.trim()) {
					schedule[i].parentNode.removeChild(schedule[i]);
				}
			}
			
			
			//remove working day에서 삭제한 요일 삭제
			removeDay = removeDay.trim();
			var removeDay_int = removeDay == "Monday" ? 2 :
				removeDay == "Tuesday" ? 3 :
					removeDay == "Wednesday" ? 4 :
						removeDay == "Thursday" ? 5 :
							removeDay == "Friday" ? 6 :
								removeDay == "Saturday" ? 7 :
									removeDay == "Sunday" ? 1 : -1;
			
			
			//add working hour에서 삭제한 요일 추가
			//$("select#아이디").append("<option value='option'>옵션추가</option>");
			$("select#add_day").append("<option value="+"'"+removeDay_int+"'"+">"+removeDay.trim()+"</option>");
			
			
			//change working hour에서 삭제한 요일 삭제
			$("select#change_day option[value="+"'"+removeDay_int+"'"+ "]").remove();
										
			$("select#remove_day option[value="+"'"+removeDay_int+"'"+ "]").remove();
			console.log($("select#remove_day option[value="+"'"+removeDay_int+"'"+ "]"));
			
			


		},
		error : function() {
			console.log("오류");
		}
	})

}




function makeReservation() {

	var datepicker = $('#datepicker').datepicker('getDate');
	var startTime = $("#startTime option:selected").val();
	var endTime = $("#endTime option:selected").val();
	var service = $("#service option:selected").val();
	var meetingArea = $("#meetingarea option:selected").val();
	var name = $("#name").val();
	var meetingPlace = $("#meetingplace").val();

	var form = document.reservationForm;
	// var datepicker = form.datepicker.value;

	if (name == "") {
		alert("Please enter name");
		form.name.focus();
		return false;
	}

	if (service == "") {
		alert("Please select service");
		return false;
	}

	if (meetingArea == "") {
		alert("Please select meeting area");
		return false;
	}

	if (meetingPlace == "") {
		alert("Please enter meeting place");
		form.meetingplace.focus();
		return false;
	}

	if (datepicker == null) {
		alert("Please select date");
		return false;
	}

	if (startTime == "") {
		alert("Please select start time");
		return false;
	}

	if (endTime == "") {
		alert("Please select end time");
		return false;
	}
	
	startTime = parseFloat(startTime);
	endTime = parseFloat(endTime);
	
	console.log("datepicker : " + datepicker);
	
	reserve(
	
	   {
		name : name,
		service : service,
		meetingArea : meetingArea,
		meetingPlace : meetingPlace,
		meetingDate : datepicker,
		startTime : startTime,
		endTime : endTime}, function(data){
			var json = JSON.parse(data);
			
			if(json.check == "fail"){
				alert("Client name does not match the name on the record");
				return false;
			}else{
			
			console.log("res_no : " + json.res_no);	
				
			var str = "";
			
			str += "<tr id=" + json.res_no + ">";
			str += "<td>" + json.res_no + "</td>";
			str += "<td>" + json.client_no + "</td>";
			str += "<td>" + json.clientName + "</td>";
			str += "<td>" + json.date + "    " + json.meetingStartTime + " ~ " + json.meetingEndTime + "</td>";
			str += "<td>" + json.service + "</td>";
			str += "<td>" + json.meetingArea + "</td>";
			str += "<td>" + json.pointsSpent + "</td>";
			str += "<td>" + json.res_status + "</td>";
			str += "<td><a href=javascript:deleteReservation(" + json.res_no + ") class='button small'>Delete</a></td>";
			str += "</tr>";
			
			$("#reservation").append(str);
			
			}
			
		});

}

function reserve(info, callback, error){
	
	$.ajax({
		url : "/helpme/reservation/makeReservation/" + info.name + "/" + info.meetingDate + "/",
		type : 'POST',
		data : JSON.stringify(info),
		contentType : "application/json; charset=utf-8",
		success : function(data, status, xhr) {
			if (callback) {
				callback(data);
			}			
		},
		error : function(status, xhr, er) {
			if (error) {
				// 외부에서 전달받은 값이 있다면 er객체를 전달하여 사용한다.
				error(er);
			}
			console.log("오류");
		}

	})
}

function deleteReservation(resNo) {

	console.log("resNo : " +resNo);

	$.ajax({
		url : "/helpme/reservation/deleteReservation/"+ resNo,
		type : 'DELETE',
		dataType : 'text',
		success : function(data) {

			var resNo = document.getElementById(data.trim());

			resNo.parentNode.removeChild(resNo);

			// location.replace(contextPath+ "/schedule/HelperScheduleOk.sc");

		},
		error : function() {
			console.log("오류");
		}
	})

}