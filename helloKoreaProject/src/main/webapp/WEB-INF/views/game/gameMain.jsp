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
        	line-height: 50px;
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
        	border-radius : 50%;
        	line-height: 40px;
        	text-align: center;
        	font-size : 25px;
        	color : crimson;
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
				<h3><a href="lower.ga" class="low game">초급 ⭐</a></h3>
				<div class="score" id="lowerScore"></div>
				<div class="img">사진</div>
			</div>
			<br><hr><br>
			<div class="game-middle">
				<h3><a href="#" class="middle game">중급 ⭐⭐⭐</a></h3>
				<div class="score" id="middleScore"></div>
				<div class="img">사진</div>
			</div>
			<br><hr><br>
			<div class="game-upper">
				<h3><a href="#" class="upper game">고급 ⭐⭐⭐⭐⭐</a></h3>
				<div class="score" id="upperScore"></div>
				<div class="img">사진</div>
			</div>
			
		</div>		
	</div>
	
	<script>
		// a태그 클릭 막고 alert 띄우기
		function noClick(str) {
			document.querySelector('.low').removeAttribute('href');
			document.querySelector('.middle').removeAttribute('href');
			document.querySelector('.upper').removeAttribute('href');
			alert(str);
		}
	</script>
	
	<c:if test="${ empty loginUser }">
		<script>
			noClick('로그인 후 이용해주세요.');
		</script>
	</c:if>
	
	<c:if test="${ loginUser.nationNo == 410 }">
		<script>
			noClick('외국인만 이용 가능한 서비스입니다.');
		</script>
	</c:if>
	
	<script>
		$(function(){
			userScore();
		});

		// 클래스가 score인 요소 배열
		const scores = $('.score');
		
		// 사용자의 난이도별 점수
		function userScore(){
			
			$.ajax({
				url : 'selectScore.ga',
				type : 'post',
				data : {
					memberNo : ${ sessionScope.loginUser.memberNo }
				},
				success : function(result){
					//console.log(result);
					// mapper에서 레벨넘버로 내림차순해서 인덱스 초급(0)-중급(1)-고급(2)순
					for(let i = 0; i < result.length; i++) {
						// 배열의 i번째 인덱스에 result의 i번째 점수 추가
						scores[i].append(result[i].score);
					}
				},
				error : function(){
					console.log('유저 점수 가져오기 실패');
				}
			});
		}
		
		const lower = $('#lowerScore')[0];
		const middle = document.getElementById('middleScore').innerHTML;
		const upper = document.getElementById('upperScore').innerHTML;
		
		console.log(lower);
		
		$('.low').click(function(){
			console.log(lower);
			if(lower != '') {
				$('.low').removeAttr('href');
				alert('다음 단계에 도전하세요!');
			}
		});
		
	
	// 이전 게 없으면 -> 초급 풀고 오세요
	// else if -> 지금 게 있으면 -> 다음 단계 어쩌고
	// else -> 풀기
	
	</script>
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>