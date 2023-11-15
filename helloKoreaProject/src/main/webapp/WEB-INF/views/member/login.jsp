<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="resources/css/login.css">
    <style>
        
    </style>
</head>
<body>
    <h2>L O G I N</h2>
    <form action="login" method="post">
        <label for="email">E-mail:</label>
        <input type="email" id="email" name="email" required><br>
        
        <label for="memberPwd">Password:</label>
        <input type="password" id="memberPwd" name="memberPwd" required><br>

        <input type="submit" value="L O G I N">
    </form>

	
</body>
</html>