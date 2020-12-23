/**
 * 헬퍼 스케줄 수정
 */

//스케줄 변경
function changeSchedule() {

	var dayId = document.getElementById("change_day"); //변경하는 요일 가져오기
	var startTimeId = document.getElementById("change_startTime"); //변경한 시작 시간 가져오기
	var endTimeId = document.getElementById("change_endTime"); //변경한 끝 시간 가져오기

	var change_day = dayId.options[dayId.selectedIndex].value; // 선택한 요일 가져오기
	var change_startTime = startTimeId.options[startTimeId.selectedIndex].value; //선택한 시작 시간 가져오기
	var change_endTime = endTimeId.options[endTimeId.selectedIndex].value; //선택한 끝 시간 가져오기

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
	
	var start = Number(change_startTime); //시작 시작 정수로 변환
	var end = Number(change_endTime); //끝 시간 정수로 변환
	
	var diff = end - start; // 차 구하기
	
	//시작 시간이 끝 시간보다 클때
	if(start > end){
		alert("Start time must be less than end time");
		return false;
	}
	
	//적어도 시작 시간과 끝 시간은 5시간 차이가 있어야 한다
	if(diff < 5){
		alert("The daily minimum working hour is 5");
		return false;
	}

	//변경한 시간을 ajax로 전송한다
	$.ajax({
				url : contextPath
						+ "/schedule/HelperScheduleChangeOk.sc?changeDay="
						+ change_day + "&changeStartTime=" + change_startTime
						+ "&changeEndTime=" + change_endTime,
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
					
					//변경한 시간을 페이지에서 바꿔주는 작업
					for (var i = 0; i < days.length; i++) {
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

//스케줄 추가
function addSchedule() {

	var dayId = document.getElementById("add_day");
	var startTimeId = document.getElementById("add_startTime");
	var endTimeId = document.getElementById("add_endTime");

	var add_day = dayId.options[dayId.selectedIndex].value; //선택한 추가 요일 가져오기
	var add_startTime = startTimeId.options[startTimeId.selectedIndex].value; //선택한 시작 시간 가져오기
	var add_endTime = endTimeId.options[endTimeId.selectedIndex].value; //선택한 끝 시간 가져오기

	
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
	
	$.ajax({
		url :contextPath+"/schedule/HelperScheduleAddOk.sc?addDay="
				+ add_day + "&addStartTime=" + add_startTime + "&addEndTime="
				+ add_endTime,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			
			//스케줄 추가가 완료되면 아래 경로로 이동한다
			location.replace(contextPath+ "/schedule/HelperScheduleOk.sc");
						
		},
		error : function() {
			console.log("오류");
		}
	})
}

//스케줄 삭제
function removeSchedule() {

	var dayId = document.getElementById("remove_day");

	var remove_day = dayId.options[dayId.selectedIndex].value; //선택한 요일 가져오기

	if (remove_day == "") {
		alert("Please select day");
		return false;
	}

	$.ajax({
		url : contextPath + "/schedule/HelperScheduleDeleteOk.sc?removeDay="
				+ remove_day,
		type : 'get',
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
