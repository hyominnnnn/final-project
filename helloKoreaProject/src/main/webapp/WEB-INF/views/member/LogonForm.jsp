<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            color: #888;
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
	<form id="logonForm" onsubmit="return validateForm()" action="Logon">
	    <label for="email">이메일 (필수값) :</label>
	    <input type="email" id="email" name="email" required>
	    <br>
	
	    <label for="nickname">닉네임 (필수값 최대 10글자) :</label>
	    <input type="text" id="nickname" name="memberNickname" maxlength="10" required>
	    <br>
	
	    <label for="password">패스워드 (최대 20글자(영어,숫자,특수문자 섞어서 만들기)) :</label>
	    <input type="password" id="password" name="memberPwd" maxlength="20" required>
	    <small>영어, 숫자, 특수문자를 섞어서 만들어주세요.</small>
	    <br>
	    
	    <label for="password">패스워드 확인 :</label>
		<input type="password" class="form-control" id="checkPwd" placeholder="Please Enter Password" required> 
		<small>패스워드를 똑같이 입력해주세요.</small>
		<br>
		
	    <label for="fullName">회원 이름 (최대 6글자) :</label>
	    <input type="text" id="fullName" name="memberName" maxlength="6">
	    <br>
		<!-- 한국인일 경우 -->
	    <label for="dob">생년월일 (숫자만, 무조건 6글자) :</label>
	    <input type="text" id="dob" name="birthday" pattern="\d{6}" title="숫자 6글자를 입력하세요">
	    <br>
	
	    <label for="ssn">주민번호 (숫자만, 무조건 7글자) :</label>
	    <input type="text" id="ssn" name="idCardNumber" pattern="\d{7}" title="숫자 7글자를 입력하세요">
	    <br>
	    <input type="hidden" name="nationNo" value="82"/>
	    
	    <!-- 외국인일 경우 -->
	    <label for="nation">국가 선택 : </label>
	    
	    
	    
	    <input type="hidden" name="status" value=${param.status }/>
	
	    <input type="submit" value="가입하기">
	</form>
</div>
<script>
    function validateForm() {
        // 여기에 추가적인 유효성 검사를 추가할 수 있습니다.
        return true; // 폼 제출 허용
    }
</script>



</body>
</html>