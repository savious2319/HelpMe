/**
 *  헬퍼 소개글
 */

function makeChange(){
	
	var title = document.getElementById("title").value;
	var content = $("textarea#description").val();
	
	//$("textarea#description").text("안\n녕\n하세요");
	
	
	var r;
	var br;
	r = content.indexOf("\n");
	br = content.indexOf("<br>");

	console.log("\n : "+r);
	console.log("br : "+br);
	
	//content를  DB에 INSERT
	for(let i = 0; i<content.length; i++){
		content = content.replace("\n", "<br>");
	}
	
	if(title.length > 60){
		alert("Please keep your title under 60 words including spaces");
		return false;
	}
	
	
	console.log("content : "+content);
	
	$.ajax({
		url :"/helpme/helper/updateDescription",
		type : 'post',
		data : "title="+title+"&content="+content,
		dataType : 'text',
		success : function(data) {
			
			console.log("성공");
			location.replace("/helpme/helper/description");
			

		},
		error : function() {
			console.log("오류");
		}
	})
}