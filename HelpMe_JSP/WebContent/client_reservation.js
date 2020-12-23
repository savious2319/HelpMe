/**
 * 	  고객 평점 추가
 */


function sendRating(helper_name, num){
	
	//선택한 점수 가져오기
	var rating = $("#"+num+" option:selected").val();
	
	//점수가 없으면 아래 경고 메세지를 보이게 한다
	if(rating == ""){
		alert("Please select number first");
		return false;
	}
	
	//고객이 선택한 점수와 헬퍼 이름을 ajax로 전송한다
	$.ajax({
		url :contextPath+"/helper/HelperRateOk.he?rating="
				+ rating+"&helper_name="+helper_name,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			
			//최초로 점수를 매기면 나오는 메세지
			if(data.trim() == "ok"){
				alert("Thank you for rating this helper");
			}else{
				//한번 이상 점수를 매기면 나오는 메세지
				alert("You can only rate once");
			}
		},
		error : function() {
			console.log("오류");
		}
	})
	
}