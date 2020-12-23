/**
 *  고객 정보 수정
 */

function updateInfo(clientId){
	
	console.log("clientId : "+clientId);
	
	var frm = document.updateForm;
	var pw = document.updateForm.pw.value; //패스워드 값 가져오기
	var vf_pw = document.updateForm.vf_pw.value; //패스워드 확인 값 가져오기
	var email = document.updateForm.email.value; //이메일 값 가져오기
	var phone = document.updateForm.phone.value; //핸드폰 번호 값 가져오기
	var loginAs = document.updateForm.loginAs.value; //로그인 판별하는 값 가져오기
	
	//비밀번호 정식규
	var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	
	//패스워드, 이메일, 핸드폰 번호 동시에 변경하고하 할때 나오는 경고 메세지
	if((pw != "" && vf_pw != "" && email != "" && phone != "") || (pw != "" && vf_pw != "" && email == "" && phone != "") 
			|| (pw == "" && vf_pw == "" && email != "" && phone != "") || (pw != "" && vf_pw != "" && email != "" && phone == "")){
		alert("Please update either password, email or phone first");
		return false;
	}
	
	//아무것도 입력안했을 때 나오는 경고 메세지
	if(pw == "" && vf_pw == "" && email == "" && phone == ""){
		alert("Please enter information");
		return false;
	}

//비밀변호 변경
if(pw != "" && vf_pw != "" && email == "" && phone == ""){	
	
	//8자리 이상, 대문자/소문자/숫자/특수문자 모두 포함되어 있는지 검사
	if(!reg.test(pw)){
		alert('Your password should be more than 8 letters. Also, your password must include upper cases, lower cases, numbers, and special characters');
		return false;
	} 
	//같은 문자를 4번 이상 사용할 수 없다.
	else if(/(\w)\1\1\1/.test(pw)){
		alert("You can't use same letters more than 4 times for your passowrd.");
		return false;
	}
	//비밀번호에 아이디가 포함되어 있을 수 없다.
	else if(pw.search(clientId) > -1){
		alert("Your password cannot include id.");
		return false;
	}
	//비밀번호에 공백을 포함할 수 없다.
	else if(pw.search(/\s/) != -1){
		alert("Please don't use spaces in your password.");
		return false;	
	}
	
	//비밀번호와 비밀번호 확인 값이 같지않으면 나오는 메세지
	if(pw != vf_pw){
		alert("Please check password");
		frm.vf_pw.focus();
		return false;
	}
	
//수정한 패스워드와 로그인 상태를 ajax로 전송한다	
$.ajax({
	url :contextPath+"/client/ClientUpdatePasswordOk.cl?password="
			+ pw+"&loginAs="+loginAs,
	type : 'get',
	dataType : 'text',
	success : function(data) {
		var loginAs = data.trim();
		
		//비밀번호가 변경되면 나오는 메세지
		alert("Your password has been successfully updated");
		location.replace(contextPath+ "/client_updates.jsp?loginAs="+loginAs);
		

	},
	error : function() {
		console.log("오류");
	}
})			
	
}

//이메일 변경
else if(pw == "" && vf_pw == "" && email != "" && phone == ""){	
	
	//수정된 이메일과 로그인 상태를 ajax로 전송한다
	$.ajax({
		url :contextPath+"/client/ClientUpdateEmailOk.cl?email="
		+ email+"&loginAs="+loginAs,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			
			var loginAs = data.trim();
			
			//이메일이 변경되면 나오는 메세지
			alert("Your email has been successfully updated");
			location.replace(contextPath+ "/client_updates.jsp?loginAs="+loginAs);
			

		},
		error : function() {
			console.log("오류");
		}
	})			
		
	}

//핸드폰 번호 변경
else if(pw == "" && vf_pw == "" && email == "" && phone != ""){	
	
	//수정된 핸드폰 번호와 로그인 상태를 ajax로 전송한다
	$.ajax({
		url :contextPath+"/client/ClientUpdatePhoneNumberOk.cl?phone="
				+ phone+"&loginAs="+loginAs,
		type : 'get',
		dataType : 'text',
		success : function(data) {
			
			var loginAs = data.trim();
			
			//핸드폰 번호가 변경되면 나오는 메세지
			alert("Your phone number has been successfully updated");
			location.replace(contextPath+ "/client_updates.jsp?loginAs="+loginAs);
			

		},
		error : function() {
			console.log("오류");
		}
	})			
		
	}
	
}

//고객 계정 삭제
function deleteAccount(){
	
	//계정 삭제 여부를 묻는 메세지
	var deleteOk = confirm("Are you sure you want to delete your account?");
	 
	//취소하면 페이지로 돌아간다
	 if(!deleteOk){
		 return false;
	 }
	

$.ajax({
		url :contextPath+"/client/ClientDeleteAccountOk.cl",
		type : 'get',
		dataType : 'text',
		success : function(data) {
			
			//계정이 삭제되면 나오는 메세지
			alert("Your account has been successfully deleted");
			
			//계정 삭제 이후 메인 화면으로 이동한다
			location.replace(contextPath+ "/main_Default.jsp");
			

		},
		error : function() {
			console.log("오류");
		}
	})			
	
	
	
}