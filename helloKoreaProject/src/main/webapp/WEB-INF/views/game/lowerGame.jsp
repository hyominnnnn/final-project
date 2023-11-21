<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>초급 게임</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<style>
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
        #no {
        	width: 40px;
        	height: 10%;
        	text-align: center;
        	margin: auto;
        	font-size: 30px;
        	color: #00695C;
        }
        #quiz {
        	width: 100%;
        	height: auto;
        	margin: auto;
        	text-align: center;
        	font-size: 20px;
        	border: 1px solid #bbe9d7;
        	border-radius : 20px;
        	background-color: #bbe9d7;
        }
        #user-answer {
        	text-align: center;
        }
        #prev {
        	float: left;
        }
        #next {
        	float: right;
        }
        #prev-btn, #next-btn {
        	border-radius: 10px;
        }
	</style>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
	<jsp:include page="../common/header.jsp"></jsp:include>
	
		<div class="content">
			<br><br>
			<div class="innerOuter">
				<h2 align="center">초급게임</h2>
				<br><br>
				<div id="no">
					${ firstQuiz.quizNo }
				</div>
				<br>
				<div id="quiz">
					${ firstQuiz.quizContent }
				</div>
				<br><br>
				<form action="post" method="" id="user-answer">
					<input type="radio" class="btn-check" name="answer" id="option5" autocomplete="off">
					<label class="btn" for="option5" id="choice1">${ firstQuiz.firstChoice }</label>
					<br><br>
					<input type="radio" class="btn-check" name="answer" id="option6" autocomplete="off">
					<label class="btn" for="option6" id="choice2">${ firstQuiz.secondChoice }</label>
				</form>
				<br><br>
				<div id="prev"><button class="btn btn-secondary" id="prev-btn" onclick="prevQuiz();">이전 문제</button></div>
				<div id="next"><button class="btn btn-secondary" id="next-btn" onclick="nextQuiz();">다음 문제</button></div>
			</div>
		</div>
		
		<script>
			
			// 퀴즈 번호를 계속 1 증가시키기 위한 전역 변수
			let no = ${ firstQuiz.quizNo };
			
			// 다음 문제 클릭
			function nextQuiz(){
				
				$.ajax({
					url : 'nextQuiz.ga',
					data : {
						quizNo : no
					},
					success : function(quiz){
						$('#no').html(quiz.quizNo);
						$('#quiz').html(quiz.quizContent);
						$('#choice1').html(quiz.firstChoice);
						$('#choice2').html(quiz.secondChoice);
						
						no = quiz.quizNo;
					},
					error : function(){
						console.log('다음 문제로 넘기기 실패');
					}
				});
			}
			
			// 이전 문제 클릭
			function prevQuiz(){
				
				$.ajax({
					url : 'prevQuiz.ga',
					data : {
						quizNo : no
					},
					success : function(quiz){
						$('#no').html(quiz.quizNo);
						$('#quiz').html(quiz.quizContent);
						$('#choice1').html(quiz.firstChoice);
						$('#choice2').html(quiz.secondChoice);
						
						no = quiz.quizNo;
					},
					error : function(){
						console.log('이전 문제로 넘기기 실패');
					}
				});
				
			}
		</script>
		
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>