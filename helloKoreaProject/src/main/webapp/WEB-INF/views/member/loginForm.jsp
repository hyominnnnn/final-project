<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="resources/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <h2>L O G I N</h2>
    <form action="login" method="post">
        <label for="email">E-mail:</label>
        <input type="email" id="email" name="email" required><br>
        
        <label for="memberPwd">Password:</label>
        <input type="password" id="memberPwd" name="memberPwd" required><br>
		<div id="checkResult">${errorMsg }</div>
        <input type="submit" value="L O G I N">
    </form>
	
	 <table>
        	<tr>
        		<td>
        			<a id="naver-login">
						<img src="resources/images/btnG_naver.png" width="100" heigth="100"/>
					</a>
        		</td>
        		<td>
        		 <a id="kakao-login">
					<img src="resources/images/kakao_btn_icon.png" width="100" heigth="100"/>
				</a>
        		</td>
        		<td>
        			구글
        		</td>
        	</tr>
        </table>
        
    <script>
		$(function(){
			$('#kakao-login').click(function(){
				location.href = 'https://kauth.kakao.com/oauth/authorize?client_id=cffe893c81dfeaa4bdcec332321e0001&redirect_uri=http://localhost:9999/korea/code&response_type=code&scope=profile_image';
			});
		});
		$(function(){
			$('#naver-login').click(function(){
				location.href = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=Tf_XaxBirROlA8S513Ix&redirect_uri=http://localhost:9999/korea/ncode';
			});
		});
	</script>
	
</body>
</html>