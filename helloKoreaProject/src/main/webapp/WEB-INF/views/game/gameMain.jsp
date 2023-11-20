<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게임학습 메인페이지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
	div {border : 1px solid red;}
		.content {
            background-color:rgb(247, 245, 245);
            width:80%;
            height: 800px;
            margin:auto;
            margin-top: 22px;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            height:90%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
        .game-upper, .game-middle, .game-lower {
        	width : 100%;
        	height : 10%;
        	background-color: rgb(247, 245, 245);
        }
        .low, .middle, .upper{
        	color : black;
        	text-decoration: none;
        	float : left;
        }
        .low:hover, .middle:hover, .upper:hover {
        	color : black;
        	font-size : 30px;
        	text-decoration: none;
        }
        .score, .img {
        	float : left;
        	width : 10%;
        	height : 80%;
        	border-radius : 500px;
        }
        
	</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="content">
		<br><br>
		<div class="innerOuter">
			<h2>🎮게임학습</h2>
			<p>
				게임 학습을 통해 한글 맞춤법과 어휘 등을 테스트할 수 있습니다. <br>
				초급/중급/고급 단계로 나누어져 있으며, 단계별 테스트는 한 번만 가능합니다.
				한 단계는 총 30문제로 구성되어 있습니다. <br>
				게임을 시작해보세요! <br><br>
			</p>
			
			<div class="game-lower">
				<h3><a href="#" class="low">초급 ⭐</a></h3>
					<div class="score">20</div>
					<div class="img">사진</div>
			</div>
			<br><hr><br>
			<div class="game-middle">
				<h3><a href="#" class="middle">중급 ⭐⭐⭐</a></h3>
			</div>
			<br><hr><br>
			<div class="game-upper">
				<h3><a href="#" class="upper">고급 ⭐⭐⭐⭐⭐</a></h3>
			</div>
			
			<%-- a태그 href 제거
			<script>
				document.querySelector('.low').removeAttribute('href');			
			</script>
			--%>
			
		</div>		
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>