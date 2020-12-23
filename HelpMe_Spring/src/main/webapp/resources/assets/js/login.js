/**
 *  로그인 했을때 헬퍼인지 고객인지 판단
 */

function idIdentify(){
	
	console.log("entered");
	
	var form = document.loginForm;
	var id = document.loginForm.client_id.value;
	var pw = document.loginForm.client_password.value;
	
	var radioVal = $('input[name="loginAs"]:checked').val();
	
	if(radioVal == "loginAsClient"){
		
		if(id == ""){
			alert("Please enter id");
			form.client_id.focus();
			return false;
		}
		
		if(pw == ""){
			alert("Please enter password");
			form.client_password.focus();
			return false;
		}
		
		
		$.ajax({
			url : "/helpme/client/login/" + id + "/" + pw + "/" + radioVal,
			type : 'get',
			dataType : 'text',
			success : function(data, status, xhr) {
				
				if(data.trim() == "false"){
					location.replace("/helpme/login?login="+data);
				}else{
					location.replace("/helpme/main_LogIn?loginAs="+data);
				}
				
				
			
				
			},
			error : function() {
				console.log("오류");
			}
		})
		
		
	}else{
		
		if(id == ""){
			alert("Please enter id");
			form.client_id.focus();
			return false;
		}
		
		if(pw == ""){
			alert("Please enter password");
			form.client_password.focus();
			return false;
		}
		
		$.ajax({
			url :"/helpme/helper/login/" + id + "/" + pw + "/" + radioVal,
			type : 'get',
			dataType : 'text',
			success : function(data) {
				
				if(data.trim() == "false"){
					location.replace("/helpme/login?login="+data);
				}else{
					location.replace("/helpme/main_LogIn?loginAs="+data);
				}
			
			},
			error : function() {
				console.log("오류");
			}
		})
		
		
		
	}
}
