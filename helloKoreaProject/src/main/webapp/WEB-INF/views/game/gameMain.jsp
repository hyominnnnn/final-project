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
				<h3><a href="middle.ga" class="middle game">중급 ⭐⭐⭐</a></h3>
				<div class="score" id="middleScore"></div>
				<div class="img">사진</div>
			</div>
			<br><hr><br>
			<div class="game-upper">
				<h3><a href="upper.ga" class="upper game">고급 ⭐⭐⭐⭐⭐</a></h3>
				<div class="score" id="upperScore"></div>
				<div class="img">사진</div>
			</div>
			
		</div>		
	</div>
	
	<script>
		function noClick(str) {
			alert(str);
			location.href = "main"; // 메인페이지로 이동
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
		
		// 현재 클릭한 요소의 href 비활성화 함수
		function removeLink(index, level) {
			// 초급이 아니고 이전 단계의 점수가 없다면
			if(index > 0 && scores[index - 1].innerHTML == '') {
				// 지금 클릭한 요소($(this))의 href 비활성화
				$(level).removeAttr('href');
				alert('이전 단계부터 도전하세요!');
			}
			
			// 현재 단계의 점수가 비어있지 않다면
			if(scores[index].innerHTML != '') {
				$(level).removeAttr('href');
				alert('이미 학습한 단계입니다.');
			}
		}
		
		$('.low').click(function(){
			// 초급의 점수가 scores[0]에 들어가니까 0과 지금 클릭한 자기자신(초급의 a태그) 넘김
			removeLink(0, this);
		});
		
		$('.middle').click(function(){
			removeLink(1, this);
		});
		
		$('.upper').click(function(){
			removeLink(2, this);
		});
	
	</script>
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>