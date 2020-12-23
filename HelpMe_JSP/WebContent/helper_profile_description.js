/**
 *  헬퍼 소개글
 */

function makeChange(){
	
	var title = document.getElementById("title").value; //수정한 제목 가져오기
	var content = $("textarea#description").val(); //수정한 소개글 가져오기

	//content를  DB에 INSERT할때 \n을 <br>로 바꾸는 작업
	for(let i = 0; i<content.length; i++){
		content = content.replace("\n", "<br>");
	}
	
	//제목의 길이가 공백을 포함해서 60이 넘었을 떄 나오는 메세지
	if(title.length > 60){
		alert("Please keep your title under 60 words including spaces");
		return false;
	}
	
	console.log("content : "+content);
	
	//수정한 제목과 소개글을 ajax로 전송한다
	$.ajax({
		url :contextPath+"/helper/HelperDescriptionModifyOk.he",
		type : 'post',
		data : "title="+title+"&content="+content,
		dataType : 'text',
		success : function(data) {
			
			//수정 완료 후 다시 페이지로 이동한다
			console.log("성공");
			location.replace(contextPath+ "/helper/HelperDescriptionOk.he");
			

		},
		error : function() {
			console.log("오류");
		}
	})
}