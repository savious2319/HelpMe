/**
 * 헬퍼 사진 업로드 / 삭제
 */
var check = false; //클릭한 사진 테두리 
var id; //선택한 사진 아이디를 저장할 변수
var path; // 선택한 사진 경로를 저장할 변수
var emptyPic; // 비어있는 사진 경로를 저장할 변수
var tmp;

//사진을 클릭했을 때 여기로 들어온다
$(document).on("click", "img", function(e) {

	//클릭한 사진의 아이디를 tmp 변수에 임시로 저장한다
	tmp = $(this).attr('id');

	if (check) {
		//테두리가 보이는 상태에서 다른 사진을 클릭했을 때 테두리가 중복되는 것을 방지하기 위한 조건문
		if (id != tmp) {
			return false;
		}

		//테두리가 있는 상태에서 다시 사진을 클릭하면 테두리가 없어지고 id와 path에 undefined를 대입한다
		$('#' + id).css('border', '0px solid #51CCA8');
		id = undefined;
		path = undefined;
		check = false;

	} else {
		id = $(this).attr('id')
		path = $(this).attr('src')
		//선택한 사진에 테두리를 보이게 한다
		$('#' + id).css('border', '3px solid #51CCA8');
		check = true;
	}

});

// 메인 사진으로 설정하기
function setAsMain() {

	//사진을 선택하지 않았을 때 나오는 메세지
	if (id == undefined) {
		alert("Please select picture to which you want to set as main picture");
		return false;
	}

	//메인 사진을 클릭하고 메인 사진으로 변경할려고 할때 나오는 메세지
	if (id == "main_pic") {
		alert("The picture you selected is already set as main picture.\nPlease select different picture");
		return false;

	}

	//비어있는 사진을 메인 사진으로 변경하고자 할때 나오는 메세지
	if (path.includes("add_picture.png")) {
		alert("The picture you selected cannot be set as main picture.\nPlease select different picture");
		return false;
	}
	
	//메인사진으로 바꾸기전에 메인사진 가이드 라인을 읽어보았는지 물어보는 confirm 메세지
	var changeOk = confirm("Have you read the guideline for main profile picture?\nIf not, please go back and read it." +
											"\nIt's important to upload the appropriate image for your main profile picture");

		if (!changeOk) {
			return false;
		}
	

	var mainSrc = document.getElementById("main_pic").getAttribute("src");
	
	//메인 사진 경로, 메인 사진으로 바꿀려는 사진 경로, 아이디를 ajax로 전송한다
	$.ajax({
		url : contextPath + "/helper/HelperSetAsMainPhotoOk.he?picId=" + id
				+ "&picSrc=" + path + "&mainSrc=" + mainSrc,
		type : 'get',
		dataType : 'text',

		success : function(data) {

			console.log("성공!");
			check = false;

			var dataSplit = data.split(",");

			var picId = dataSplit[0].trim();
			var picSrc = dataSplit[1].trim();
			var mainSrc = dataSplit[2].trim();

			//클릭한 사진을 테두리를 해제한다
			$('#' + picId).css('border', '0px solid #51CCA8');
			console.log("picId : " + picId);
			console.log("picSrc : " + picSrc);
			console.log("mainSrc : " + mainSrc);
			
			//메인사진과 클릭한 사진을 바꿔준다
			$("#" + picId).attr("src", contextPath + "/" + mainSrc);
			$("#main_pic").attr("src", contextPath + "/" + picSrc);

		},
		error : function() {
			console.log("오류");
		}
	})

}




// 사진 업데이트
$(function() {

	//Change Picture 버튼을 클릭했을 때 들어온다
	$("#change")
			.click(
					function() {
						
						//사진을 선택하지 않았을 때 나오는 메세지
						if (id == undefined) {
							alert("Please select picture to which you want to add");
							return false;
						}

						//메인사진을 바꿀려고 할때 나오는 메세지
						if (id == "main_pic") {
							var changeOk = confirm("Have you read the guideline for main profile picture?\nIf not, please go back and read it." +
																"\nIt's important to upload the appropriate image for your main profile picture");

							if (!changeOk) {
								return false;
							}
						}
						
						//이미지 파일 업로드
						$("#file").click();

					})

	// 업로드 파일체인지가 됐을경우 실행되는 이벤트
	$("#file").change(function(e) {

		picform.picId.value = id;
		picform.picSrc.value = path;
		
		var form = $("#picform")[0]; //form 태그를 가져온다
		var formData = new FormData(form); //form 태그안에 있는 정보들을 가져온다
				
		$.ajax({
			url : contextPath + "/helper/HelperChangePhotoOk.he",
			type : 'post',
			enctype : "multipart/form-data",
			//async : false,
			data : formData,
			contentType : false,
			processData : false,

			success : function(data) {

				console.log("성공!");
				check = false;

				setTimeout(function() {

					var dataSplit = data.split(",");
					var picId = dataSplit[0];
					var picSrc = dataSplit[1].trim();

					//테두리를 없애준다
					$('#' + picId).css('border', '0px solid #51CCA8');
					console.log("picId : " + picId);
					console.log("picSrc : " + picSrc);

					//5초 후에 변경된 사진이 페이지에 나온다
					$("#" + picId).attr("src", contextPath + "/" + picSrc);

				}, 5000);

			},
			error : function() {
				console.log("오류");
			}
		})
	})
})

// 선택한 사진 삭제하기
function deletePic() {

	if (id == undefined) {
		alert("Please select picture to which you want to delete");
		return false;
	}

	if (id == "main_pic") {
		alert("You cannot delete main picture");
		return false;

	}

	if (path.includes("add_picture.png")) {
		alert("The picture you selected cannot be deleted. You can only change to different pictures");
		return false;
	}

	//삭제한 사진을 emptyPic으로 바꿔준다
	emptyPic = "images/add_picture.png";

	$.ajax({
		url : contextPath + "/helper/HelperDeletePhotoOk.he?picId=" + id
				+ "&picSrc=" + path + "&emptyPic=" + emptyPic,
		type : 'get',
		dataType : 'text',

		success : function(data) {

			console.log("성공!");
			check = false;


			var dataSplit = data.split(",");
			var picId = dataSplit[0].trim();
			var emptyPic = dataSplit[1].trim();

			$('#' + picId).css('border', '0px solid #51CCA8');
			console.log("picId : " + picId);
			console.log("emptyPic : " + emptyPic);

			$("#" + picId).attr("src", contextPath + "/" + emptyPic);


		},
		error : function() {
			console.log("오류");
		}
	})

}
