/**
 *  로그인 했을때 헬퍼인지 고객인지 판단
 */

function idIdentify(){
	
	console.log("entered");
	
	var form = document.loginForm;
	var id = document.loginForm.client_id.value;
	var pw = document.loginForm.client_password.value;
	
	var radioVal = $('input[name="loginAs"]:checked').val(); //라디오 버튼 값 가져오기
	
	//고객으로 로그인 했을 때
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
			url :contextPath+"/client/ClientLoginOk.cl?client_id="+id+"&client_password="+pw+"&loginAs="+radioVal,
			type : 'get',
			dataType : 'text',
			success : function(data) {
				
				//실패하면 로그인 페이지로
				if(data.trim() == "false"){
					location.replace(contextPath+ "/login.jsp?login="+data);
				//로그인이 성공하면 로그인된 메인 페이지로
				}else{
					location.replace(contextPath+ "/main_LogIn.jsp?loginAs="+data);
				}
				
				
			
				
			},
			error : function() {
				console.log("오류");
			}
		})
		
	//헬퍼로 로그인 했을 때
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
			url :contextPath+"/helper/HelperLoginOk.he?helper_id="+id+"&helper_password="+pw+"&loginAs="+radioVal,
			type : 'get',
			dataType : 'text',
			success : function(data) {
				
				
				//실패하면 로그인 페이지로
				if(data.trim() == "false"){
					location.replace(contextPath+ "/login.jsp?login="+data);
				//로그인이 성공하면 로그인된 메인 페이지로
				}else{
					location.replace(contextPath+ "/main_LogIn.jsp?loginAs="+data);
				}
			
			},
			error : function() {
				console.log("오류");
			}
		})
		
		
		
	}
}