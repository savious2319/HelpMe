/**
 * 회원가입
 * 
 * 잠깐! 아이디가 중복되도 회원가입 되는 건 아니겠지?
*/

var check = false;

/*
function formSubmit(){
	var form = document.joinForm;
	if(form.client_id.value==''||!check){
		alert('Please check your ID.');
		form.ID.focus();
		return false;
	}
	form.submit();
}
 * 
 * 
 */
function checkId(){
	check = false;
	var id = document.getElementById("client_id").value;
	if(id==""){
		$("#idCheck_text").text("Please input your ID.");
	}else{
		$.ajax({
			url: contextPath + "/client/ClientCheckIdOk.cl?client_id=" + id,
			type: 'get',
			dataType: 'text',
			success: function(data){
				if(data.trim() == "ok"){
					check = true;
					$("#idCheck_text").text("Usable ID.");
				}else{
					$("#idCheck_text").text("You can't use this ID.");
				}
			},
			error: function(){
				console.log("오류");
			}
		})
	}
}

//이런;; 모든 항목을 써넣어야 회원가입 되도록 해야겠다
//특정 값을 가지고 오고 싶으면
//var 변수이름 = document.getElementById("id이름").value;
function formSubmit(){
	var form = document.joinForm;
	var checkAgree = document.acceptTheTerms.agree.checked;
	var name = document.getElementById("client_name").value;
	var phoneNum = document.getElementById("client_phone_number").value;
	var id = document.getElementById("client_id").value;
	var pw = document.getElementById("client_password").value;
	var verifyPw = document.getElementById("verify_client_password").value;
	var email = document.getElementById("client_email").value;
	var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
//	alert('name : '+name);
//	alert('pw : '+pw);
//	alert('verifyPw : '+verifyPw);
	
	if(name==""||phoneNum==""||id==""||pw==""||email==""){
		alert('Please fill in the necessary elements(*)');
		return false;
	}else if(!checkAgree){
		alert('Pleace accept the terms');
		return false;
	}else if(check == false){
		alert('You should use another id.');
		return false;	
	}else if(pw!=verifyPw){
		alert('You should fill in same letters in password and verify password.')
		return false;	
	}else if(id.length<4||id.length>16){	//아이디 길이
		alert('Your length of id should be over than 4 letters, less than 16 letters');
		return false;
	}else if(!reg.test(pw)){				//비밀번호는 대문자, 소문자, 숫자, 특수문자를 모두 포함하여 8글자 이상
		alert('Your length of password should be over than 8 letters. Also your password must include upper cases, lower cases, numbers, and special characters');
		return false;
	}else if(/(\w)\1\1\1/.test(pw)){		//같은 글자는 4번 이상 사용 못함.
		alert("You can't use same letters over than 4 times to make passowrd.");
		return false;
	}else if(pw.search(id) > -1){			//아이디가 비밀번호에 들어가면 안 된다.
		alert("Your password cannot include id.");
		return false;
	}
	else if(pw.search(/\s/) != -1){			//비밀번호에 공백을 포함할 수 없다.
		alert("Please don't use spaces in your password.");
		return false;	
	}else{
		form.submit();
	}
	
}
$("input[name='client_id']").keyup(function(event){
	var id = $("input[name='client_id']").val();
	checkId(id);
});
$("form[name='joinForm']").keyup(function(event){
	if(event.keyCode==13){
		formSubmit();
	}
});
