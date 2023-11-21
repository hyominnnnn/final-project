<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 회원가입</title>
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
	<form id="logonForm" action="socialLogon">

		<label for="email">이메일  :</label>
	    <input type="email" id="email" name="email" placeholder="Please Enter E-mail" required>
	    <button type="button" onclick="idCheck();">중복확인</button>
	    <br>
	    
	    <label for="nickname">닉네임  :</label>
	    <input type="text" id="nickname" name="memberNickname" maxlength="20" disabled required>
        <button type="button" onclick="nickCheck();">중복확인</button>
	    <br>
		
	    <label for="fullName">회원 이름 (최대 6글자) :</label>
	    <input type="text" id="fullName" name="memberName" maxlength="6">
	    <br>
	    
	    <label for="nation">국가 선택 : </label>
			    <select name="nationNo">
			    	<option value="562">Niger</option>
			    	<option value="840">USA</option>
			    </select>
	    	   
	    <input type="hidden" name="socialId" value="${socialId }"/>
	    <input type="hidden" name="socialProfile" value="${socialProfile }"/>
	    <input type="hidden" name="status" value="${social }" />
	    <br>
        <button type="submit"  disabled>회원가입</button>
	    
	</form>
</div>
<script>
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
	                $('#logonForm #nickname').attr('disabled', true);
	    		}
	    		else{
	    			alert('사용가능한 이메일입니다. 회원가입을 계속 진행해주세요.');
	                $('#logonForm #nickname').removeAttr('disabled');
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

   
</script>



</body>
</html>