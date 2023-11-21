<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한국인 회원가입</title>
 <style>
        body {
            font-family: 'Nanum Gothic', sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #signupForm {
            background-color: #fff;
            margin : auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input {
            width: calc(100% - 16px);
            padding: 8px;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        small {
            display: block;
            margin-top: 4px;
            color: #888 ;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<!-- 
한국인
이메일 (필수값),
닉네임 (필수값 최대 10글자),
패스워드 (최대 20글자(영어,숫자,특수문자 섞어서 만들기)) - 안내 문구 나오기,
회원 이름 (최대 6글자),
생년월일 (숫자만, 무조건 6글자),
주민번호 (숫자만, 무조건 7글자),
 -->

<div id="signupForm">
	<form id="logonForm" action="Logon">
	    <label for="email">이메일  :</label>
	    <input type="email" id="email" name="email" placeholder="Please Enter E-mail" required>
	    <button type="button" id="emailBtn" disabled onclick="idCheck();">중복확인</button> 
	    <button type="button" id="certRequest" disabled onclick="certRequestBtn();">인증번호요청</button>
	    <input type="text" name="cert" id="cert"/> <button type="button" id="certBtn" disabled onclick="certCheck();">인증하기</button>
	    <br>
	
	    <label for="nickname">닉네임  :</label>
	    <input type="text" id="nickname" name="memberNickname" maxlength="20" disabled required>
        <button type="button" id="nickBtn" disabled onclick="nickCheck();">중복확인</button>
	    <br>
	
	    <label for="password">패스워드 :</label>
	    <input type="password" id="password" name="memberPwd" maxlength="20" placeholder="Please Enter Password" required>
	    <small>영어, 숫자, 특수문자를 섞어서 최대 20자로 만들어주세요.</small>
	    <div id="checkResultPwd" style="font-size:0.8em; display:none;"></div>
	    <br>
	    
	    <label for="password">패스워드 확인 :</label>
		<input type="password" class="form-control" id="checkPwd" placeholder="Please Enter Password" required> 
        <div id="checkResult" style="font-size:0.8em; display:none;"></div>
		<br>
		
	    <label for="fullName">회원 이름 (최대 6글자) :</label>
	    <input type="text" id="fullName" name="memberName" maxlength="6">
	    <br>
	    <c:choose>
	    	<c:when test="${param.status eq 'K' }">
				<!-- 한국인일 경우 -->
			    <label for="dob">생년월일 (숫자만, 무조건 6글자) :</label>
			    <input type="text" id="dob" name="birthday" minlength="6" maxlength="6" pattern="\d{6}" title="숫자 6글자를 입력하세요">
			    <div id="checkResultDob" style="font-size:0.8em; display:none;"></div>
			    <br>
			
			    <label for="ssn">주민번호 (숫자만, 무조건 7글자) :</label>
			    <input type="text" id="ssn" name="idCardNumber" minlength="7" maxlength="7" pattern="\d{7}" title="숫자 7글자를 입력하세요">
			    <div id="checkResultSsn" style="font-size:0.8em; display:none;"></div>
			    <br>
			    <input type="hidden" name="nationNo" value="410"/>
		    </c:when>
		    <c:otherwise>
			    <!-- 외국인일 경우 -->
			    <label for="nation">국가 선택 : </label>
			    <select name="nationNo">
			    	<option value="562">Niger</option>
			    	<option value="840">USA</option>
			    	
			    </select>
		    </c:otherwise>
	   </c:choose> 
	    
	    <input type="hidden" name="status" value="${param.status }" />
        <button type="submit"  disabled>회원가입</button>
	    
	</form>
</div>
<script>
	function certRequestBtn(){
		const $email = $('#logonForm #email');
		
		$.ajax({
			url : 'cert',
			data : {email : $email.val()},
			success : function(ok){
				console.log(ok);
				alert('이메일로 인증번호를 전송했습니다. 3분안에 인증번호를 입력해주세요.');
			},
			error : function(){
				alert('이메일 인증 요청에 실패했습니다. 회원가입을 다시 진행해주세요.');
			}
				
		});
	}
	
	function certCheck(){
		const $certNo = $('#cert');
		const $email = $('#logonForm #email');
		$.ajax({
			url : 'certCheck',
			data : {certNo : $certNo.val(),
					email : $email.val()	
			},
			success : function(ok){
				console.log(ok);
				if(ok == true){
					alert('인증이 완료되었습니다. 다음단계를 진행해주세요.');
					$('#logonForm #nickname').removeAttr('disabled');
				}
				else{
					alert('인증이 실패되었습니다. 다시 시도해주세요.');
					$('#logonForm #nickname').attr('disabled', true);
				}
				
				
			},
			error : function(){
				
			}
		})
	}
	
    function idCheck(){
        //먼저 사용자가 입력한 memberId 확인
        const $userEmail = $('#logonForm #email');
        //AJAX로 요청하기
        $.ajax({
        	url : 'idCheck',
        	data : {checkId : $userEmail.val()},
        	success : function(ok){
        		// 중복이면 NNN 중복아니면 NNY
        		if(ok == 'NNN'){
        			alert('이미 존재하는 이메일입니다. 다른 이메일을 입력해주세요.');
        			$userEmail.val('').focus();
                    
                    $('#logonForm #certRequest').attr('disabled', true);
        		}
        		else{
        			alert('사용가능한 이메일입니다. 회원가입을 계속 진행해주세요.');
                    $('#logonForm #certRequest').removeAttr('disabled');
        		}
        	},
        	error : function(){
        		alert('중복확인에 실패했습니다. 회원가입을 다시 진행해주세요.');
        	}
        })
    }

    function nickCheck(){
        const $userNick = $('#logonForm #nickname');
        $.ajax({
            url : 'nickCheck',
            data : {checkNick : $userNick.val()},
            success : function(ok){
        		// 중복이면 NNN 중복아니면 NNY
        		if(ok == 'NNN'){
        			alert('이미 존재하는 닉네임입니다. 다른 닉네임을 입력해주세요.');
        			$userNick.val('').focus();
                    $('#logonForm :submit').attr('disabled', true);
        		}
        		else{
        			alert('사용가능한 닉네임입니다. 회원가입을 계속 진행해주세요.');
                    $('#logonForm :submit').removeAttr('disabled');
        		}
        	},
        	error : function(){
        		alert('중복확인에 실패했습니다. 회원가입을 다시 진행해주세요.');
        	}
        })
    }

    $(function(){
    	$('#logonForm #email').keyup(function(){
    		var $email = $('#logonForm #email');
    		if($email.val().length == 0){
	    		$('#emailBtn').attr('disabled', true);
    		}
    		else{
    			$('#emailBtn').removeAttr('disabled');
    		}
    	})
    })
    
    $(function(){
    	$('#logonForm #cert').keyup(function(){
    		var $cert = $('#logonForm #cert');
    		if($cert.val().length == 0){
    			$('#certBtn').attr('disabled', true);
    		}
    		else{
    			$('#certBtn').removeAttr('disabled');
    		}
    	})
    })
    
    $(function(){
    	$('#logonForm #nickname').keyup(function(){
    		var $nickname = $('#logonForm #nickname');
    		if($nickname.val().length == 0){
	    		$('#nickBtn').attr('disabled', true);
    		}
    		else{
    			$('#nickBtn').removeAttr('disabled');
    		}
    	})
    })
    
    $(function(){
    	$('#logonForm #password').keyup(function(){
    		var $pwd = $('#logonForm #password');
        	var $regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
        	
        	if($pwd.val().length >= 8){
	        	if(!$regExp.test($pwd.val())){
	        		//console.log('다시해');
	        		$('#checkResultPwd').show().css('color', 'red').text('문자, 숫자, 특수기호[@$!%*?&] 모두 다 사용해서 만들어주세요.')
	        	}
	        	else{
	        		$('#checkResultPwd').show().css('color', 'chartreuse').text('사용가능한 패스워드입니다.')
	        	}
        	}	
    	})
    	
    })
    
    $(function(){
    	
        const $originPwd = $('#logonForm #password');
        const $checkPwd = $('#logonForm #checkPwd');
        $checkPwd.keyup(function(){
            if ($originPwd.val() != $checkPwd.val()){
                $('#checkResult').show().css('color', 'red').text('비밀번호가 일치하지 않습니다. 다시 확인해주세요.')
                $('#logonForm :submit').attr('disabled', true);
            }
            else{
                $('#checkResult').show().css('color', 'chartreuse').text('비밀번호가 일치합니다.')
                $('#logonForm :submit').removeAttr('disabled');
            }
        })
        
    })
        
    $(function(){
    	$('#dob').keyup(function(){
    		//숫자만 여섯자리
    		var $regExp = /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
    		var $checkDob = $('#dob');
    			
    		if($checkDob.val().length === 6){
    			if($regExp.test($checkDob.val()) ){
    				$('#checkResultDob').show().css('color', 'chartreuse').text('정상')
    				
    			}
    			else{
    				$checkDob.val('').focus();
    				$('#checkResultDob').show().css('color', 'red').text('정상적인 생년월일을 입력해주세요.')
    			}
    		}
    		
    	})
    	
    	$('#ssn').keyup(function(){
    		//숫자만 7자리
    		var $regExp = /^[1-4]\d{6}$/;
    		var $checkSsn = $('#ssn');
    		
    		if($checkSsn.val().length === 7){
    			if($regExp.test($checkSsn.val())){
    				$('#checkResultSsn').show().css('color', 'chartreuse').text('정상')
    			}
    			else{
    				$checkSsn.val('').focus();
    				$('#checkResultSsn').show().css('color', 'red').text('정상적인 주민번호를 입력해주세요.')
    			}
    		}
    	})
    })
    

    
</script>



</body>
</html>