/**
 * 고객 예약 신청
 */

function makeReservation() {

	var datepicker = $('#datepicker').datepicker('getDate'); //예약 날짜 가져오기
	var startTime = $("#startTime option:selected").val(); // 시작 시간 가져오기
	var endTime = $("#endTime option:selected").val(); // 끝 시간 가져오기
	var service = $("#service option:selected").val(); // 서비스 이름 가져오기
	var meetingArea = $("#meetingarea option:selected").val(); // 만날 지역 가져오기
	var name = $("#name").val(); // 고객 이름 가져오기
	var meetingPlace = $("#meetingplace").val(); //만날 장소 가져오기

	var form = document.reservationForm;

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

	$.ajax({
		url : contextPath + "/reservation/MakeReservationOk.rs?name=" + name
				+ "&service=" + service + "&meetingarea=" + meetingArea
				+ "&meetingplace=" + meetingPlace + "&datepicker=" + datepicker
				+ "&startTime=" + startTime + "&endTime=" + endTime,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			
			//DB에 등록된 고객이름과 매칭이 안되면 나오는 메세지
			if (data.trim() == "fail") {
				alert("Client name does not match the name on the record");
				return false;
			
			//아이디가 reservation이란 이름의 <tbody>에 ajax로 전송받은 데이터를 추가한다 
			} else {
				$("#reservation").append(data.trim());
			}
		},
		error : function() {
			console.log("오류");
		}

	})

}

//예약 삭제하기
function deleteReservation(resNo) {

	//삭제하고 싶은 예약의 예약번호를 전송한다
	$.ajax({
		url : contextPath + "/reservation/DeleteReservationOk.rs?resNo="
				+ resNo,
		type : 'get',
		dataType : 'text',
		success : function(data) {

			var resNo = document.getElementById(data.trim());
			
			//삭제된 예약 행을 페이지에서 삭제한다
			resNo.parentNode.removeChild(resNo);


		},
		error : function() {
			console.log("오류");
		}
	})

}
