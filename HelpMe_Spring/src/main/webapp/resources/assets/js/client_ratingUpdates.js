/**
 * 	  고객 평점 추가
 */


function sendRating(helper_id, num){
	
	
	var rating_str = $("#"+num+" option:selected").val();
	
	var rating = parseInt(rating_str);
	
	if(rating == ""){
		alert("Please select number first");
		return false;
	}

	console.log("helper_id : " + helper_id);
	console.log("rating : " + rating);
	
	$.ajax({
		url : "/helpme/updateRateCnt/"+ rating+"/"+ helper_id,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			
			if(data.trim() == "ok"){
				alert("Thank you for rating this helper");
			}else{
				alert("You can only rate once");
			}
		},
		error : function() {
			console.log("오류");
		}
	})
	
}