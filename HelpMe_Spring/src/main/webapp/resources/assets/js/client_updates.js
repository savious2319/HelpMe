/**
 * 고객 예약 / 포인트 / 업데이트
 */

function update(clientId) {
	console.log("entered");
	console.log("clientId : " + clientId);

	var frm = document.updateForm;
	var pw = document.updateForm.pw.value;
	var vf_pw = document.updateForm.vf_pw.value;
	var email = document.updateForm.email.value;
	var phone = document.updateForm.phone.value;
	var loginAs = document.updateForm.loginAs.value;

	//var loginAs = "loginAsClient";
	
	console.log("pw : " + pw);
	console.log("vf_pw : " + vf_pw);
	console.log("email : " + email);
	console.log("phone : " + phone);

	if (pw == "" && vf_pw == "" && email == "" && phone == "") {
		alert("Please enter information");
		return false;
	}

	var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	// var hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

	if (pw != "" || vf_pw != "") {

		if (pw != vf_pw) {
			alert("Please check password");
			frm.vf_pw.focus();
			return false;
		}
		if (!reg.test(pw)) {
			alert('Your password should be more than 8 letters. Also, your password must include upper cases, lower cases, numbers, and special characters');
			return false;
		}
		// 같은 문자를 4번 이상 사용할 수 없다.
		else if (/(\w)\1\1\1/.test(pw)) {
			alert("You can't use same letters more than 4 times for your passowrd.");
			return false;
		}
		// 비밀번호에 아이디가 포함되어 있을 수 없다.
		else if (pw.search(clientId) > -1) {
			alert("Your password cannot include id.");
			return false;
		}
		// 비밀번호에 공백을 포함할 수 없다.
		else if (pw.search(/\s/) != -1) {
			alert("Please don't use spaces in your password.");
			return false;
		}
	}

	if (pw != "" && email != "" && phone != "") {

		clientService.updateInfo({
			password : pw,
			email : email,
			phoneNumber : phone,
			loginAs : loginAs,
			clientId : clientId
		}, function(result) {

			alert("Password, email and phone number have been successfully updated!");
			location.replace("/helpme/client/updates?loginAs="+loginAs);

		});
	}
	else if(pw != "" && email == "" && phone == ""){
		
		clientService.updateInfo({
			password : pw,
			loginAs : loginAs,
			clientId : clientId
		}, function(result) {
			
			alert("Password has been successfully updated!");
			location.replace("/helpme/client/updates?loginAs="+loginAs);
			
		});
		
	}
	else if(pw == ""	 && email != "" && phone == ""){
		
		clientService.updateInfo({
			email : email,
			loginAs : loginAs,
			clientId : clientId
		}, function(result) {
			
			alert("Email has been successfully updated!");
			location.replace("/helpme/client/updates?loginAs="+loginAs);
			
		});
		
	}
	else if(pw == "" && email == "" && phone != ""){
		
		clientService.updateInfo({
			phoneNumber : phone,
			loginAs : loginAs,
			clientId : clientId
		}, function(result) {
			
			alert("Phone number has been successfully updated!");
			location.replace("/helpme/client/updates?loginAs="+loginAs);
			
		});
	}
	else if(pw != "" && email != "" && phone == ""){
		
		clientService.updateInfo({
			password : pw,
			email : email,
			loginAs : loginAs,
			clientId : clientId
		}, function(result) {
			
			alert("Password and email have been successfully updated!");
			location.replace("/helpme/client/updates?loginAs="+loginAs);
			
		});
	}
	else if(pw != "" && email == "" && phone != ""){
		
		clientService.updateInfo({
			password : pw,
			phoneNumber : phone,
			loginAs : loginAs,
			clientId : clientId
		}, function(result) {
			
			alert("Password and phone number have been successfully updated!");
			location.replace("/helpme/client/updates?loginAs="+loginAs);
			
		});
	}
	else if(pw == "" && email != "" && phone != ""){
		
		clientService.updateInfo({
			email : email,
			phoneNumber : phone,
			loginAs : loginAs,
			clientId : clientId
		}, function(result) {
			
			alert("Email and phone number have been successfully updated!");
			location.replace("/helpme/client/updates?loginAs="+loginAs);
			
		});
	}
	

}

var clientService = (function() {

	function updateInfo(info, callback, error) {

		$.ajax({
			type : 'PATCH',
			url : "/helpme/client/updates/" + info.clientId,
			data : JSON.stringify(info),
			contentType : "application/json;charset=utf-8",
			success : function(result, status, xhr) {
				// var loginAs = data.trim();

				if (callback) {
					callback(result);
				}
			},
			error : function(status, xhr, er) {
				if (error) {
					// 외부에서 전달받은 값이 있다면 er객체를 전달하여 사용한다.
					error(er);
				}
			}
		})
	}

	return {
		updateInfo : updateInfo
	};
})();


function deleteAccount(){
	
	var deleteOk = confirm("Are you sure you want to delete your account?");
	 
	 if(!deleteOk){
		 return false;
	 }
	
	
$.ajax({
		url : "/helpme/client/deleteAccount",
		type : 'DELETE',
		dataType : 'text',
		success : function(data) {
			
			alert("Your account has been successfully deleted");
			location.replace("/helpme/home");
			

		},
		error : function() {
			console.log("오류");
		}
	})			
}
