/**
 * 헬퍼 사진 업로드 / 삭제
 */
var check = false;
var id;
var path;
var emptyPic;
var tmp;

$(document).on("click", "img", function(e) {

	tmp = $(this).attr('id');

	if (check) {
		if (id != tmp) {
			return false;
		}

		$('#' + id).css('border', '0px solid #51CCA8');
		id = undefined;
		path = undefined;
		check = false;

	} else {
		id = $(this).attr('id')
		path = $(this).attr('src')
		$('#' + id).css('border', '3px solid #51CCA8');
		check = true;
	}

});

// 메인 사진으로 설정하기
function setAsMain() {

	if (id == undefined) {
		alert("Please select picture to which you want to set as main picture");
		return false;
	}

	if (id == "main_pic") {
		alert("The picture you selected is already set as main picture.\nPlease select different picture");
		return false;

	}

	if (path.includes("add_picture.png")) {
		alert("The picture you selected cannot be set as main picture.\nPlease select different picture");
		return false;
	}
	
	
	var changeOk = confirm("Have you read the guideline for main profile picture?\nIf not, please go back and read it." +
											"\nIt's important to upload the appropriate image for your main profile picture");

		if (!changeOk) {
			return false;
		}
	

	var mainSrc = document.getElementById("main_pic").getAttribute("src");
	
	
	$.ajax({
		url : "/helpme/helper/setMainPhoto?picId=" + id + "&picSrc=" + path + "&mainSrc=" + mainSrc,
		type : 'get',
		dataType : 'text',

		success : function(data) {

			console.log("성공!");
			check = false;

			var dataSplit = data.split(",");

			var picId = dataSplit[0].trim();
			var picSrc = dataSplit[1].trim();
			var mainSrc = dataSplit[2].trim();

			$('#' + picId).css('border', '0px solid #51CCA8');
			console.log("picId : " + picId);
			console.log("picSrc : " + picSrc);
			console.log("mainSrc : " + mainSrc);

			$("#" + picId).attr("src", "/helpme/resources/" + mainSrc);
			$("#main_pic").attr("src", "/helpme/resources/" + picSrc);

		},
		error : function() {
			console.log("오류");
		}
	})

}




// 사진 업데이트
$(function() {

	$("#change")
			.click(
					function() {

						if (id == undefined) {
							alert("Please select picture to which you want to add");
							return false;
						}

						if (id == "main_pic") {
							var changeOk = confirm("Have you read the guideline for main profile picture?\nIf not, please go back and read it." +
																"\nIt's important to upload the appropriate image for your main profile picture");

							if (!changeOk) {
								return false;
							}
						}
						
						$("#file").click();

					})

	// 업로드 파일체인지가 됬을경우 실행되는 이벤트
	$("#file").change(function(e) {
		
		/*if(/\.(jpeg|jpg|png|gif|bmp)$/i.test(e.value)){ 

		        alert('이미지 파일만 업로드 가능합니다.'); 

		        e.value = ''; 
		        return false;
		    }*/


		
		picform.picId.value = id;
		picform.picSrc.value = path;
		
		var form = $("#picform")[0];
		var formData = new FormData(form);
				
		$.ajax({
			url : "/helpme/helper/changePhoto",
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

					$('#' + picId).css('border', '0px solid #51CCA8');
					console.log("picId : " + picId);
					console.log("picSrc : " + picSrc);
					//images/helperid/fileName
					$("#" + picId).attr("src", "/helpme/resources/" + picSrc);
				
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

	emptyPic = "images/add_picture.png";
	
	var data = {id, path, emptyPic}
	
	//deleteCurrentPic(data);

	//function deleteCurrentPic(info){
	
	$.ajax({
		url : "/helpme/helper/deletePhoto?picId="+id+"&picSrc="+path+"&emptyPic="+emptyPic,
		type : 'delete',
		//data : JSON.stringify(info),
		//contentType : 'application/json; charset=utf-8',
		//type : 'get',
		dataType : 'text',
		success : function(data) {

			console.log("성공!");
			check = false;

			// setTimeout(function() {

			var dataSplit = data.split(",");
			var picId = dataSplit[0].trim();
			var emptyPic = dataSplit[1].trim();

			$('#' + picId).css('border', '0px solid #51CCA8');
			console.log("picId : " + picId);
			console.log("emptyPic : " + emptyPic);

			$("#" + picId).attr("src", "/helpme/resources/" + emptyPic);

			// }, 5000);

		},
		error : function() {
			console.log("오류");
		}
	})
	
	//}	
}
