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
        #choices {
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
				<div id="choices">
					<input type="radio" class="btn-check" name="answer" value="1" id="option5" autocomplete="off" checked>
					<label class="btn" for="option5" id="choice1">${ firstQuiz.firstChoice }</label>
					<br><br>
					<input type="radio" class="btn-check" name="answer" value="2" id="option6" autocomplete="off">
					<label class="btn" for="option6" id="choice2">${ firstQuiz.secondChoice }</label>
				</div>
				<br><br>
				<div id="prev"><button class="btn btn-secondary" id="prev-btn" onclick="prevQuiz();">이전 문제</button></div>
				<div id="next"><button class="btn btn-secondary" id="next-btn" onclick="nextQuiz();">다음 문제</button></div>
			</div>
		</div>
		
		<script>
			
			// 마지막 문제 번호 담기 위한 변수
			let lastNo;
			
			// 퀴즈 번호를 계속 1 증가시키기 위한 전역 변수
			let no = ${ firstQuiz.quizNo };
			
			// 문제 번호와 사용자가 선택한 답을 저장하기 위한 배열
			let answers = [];
			
			// 현재 문제 번호와 사용자가 입력한 값을 담을 객체
			let userAnswer = {};
			
			$(function(){
				// 현재 DB에 저장된 게임 문제 중 가장 큰 문제 번호 가져옴
				$.ajax({
					url : 'lastNo.ga',
					success : function(num){
						lastNo = num;
					},
					error : function(){
						console.log('마지막 문제 번호 가져오기 실패');
					}
				});
			});
			
			// 다음 문제 클릭
			function nextQuiz(){
				// 현재 체크한 라디오 버튼의 value값 추출
				let answer = $('input:radio[name="answer"]:checked').val();
				// 객체의 no에 현재 문제 번호를 담고, answer에 사용자가 클릭한 답 담음
				userAnswer = {no : no, answer : answer};
				
				// 지금 보이는 문제의 다음 문제에 대한 데이터가 이미 있는 상태라면(이미 풀었던 문제라면)
				if(answers[no] != null) {
					// 다음 문제 클릭했을 때 예전에 선택했던 다음 문제에 대한 답이 클릭되어져 있는 상태로 나옴
					$('input:radio[name="answer"]:input[value=' + answers[no].answer + ']').prop('checked', true);
				}
				
				// 1번 문제의 정보는 answers[0]에 담겨있음 (그래서 현재 번호(no) - 1)
				// 현재 문제 번호에 대한 데이터가 이미 있다면
				if(answers[no - 1] != null) {
					// 배열에 새로 추가 X, 그 답을 변경
					answers[no - 1].answer = answer;
					// console.log(answer);
				} else { // 아니라면 (지금 문제가 처음 푸는 문제라면)
					// 배열에 객체 넣기
					answers.push(userAnswer);
				}
				// console.log(answers);
				
				// no는 현재 화면에 있는 번호이기 때문에 + 1 해서 현재 번호의 다음 번호가 30과 같을 때로 해야
				// 29 -> 30으로 넘어갈 때 버튼을 변경할 수 있음
				if(lastNo == (no + 1)){
					$('#next-btn').text('제출하기');
				}
				
				// 현재 화면에 있는 번호가 문제의 마지막 번호일 때 클릭했던 답 배열 넘김
				// data : 키 없이 value만 넘김 (Json 타입으로)
				if(lastNo == no) {
					console.log(answers);
					$.ajax({
						url : 'checkAnswer.ga',
			            dataType: 'json',
			            contentType: 'application/json; charset=UTF-8',
						data : JSON.stringify(answers),
						type : 'post',
						success : function(score){ // 점수 가져옴
							// console.log(score);
							insertScore(score);
						},
						error : function() {
							console.log('실패');
						}
					});
				}
				else { // 다음 문제 하나씩 가져옴
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
			}
			
			// 점수 insert
			function insertScore(score) {
				// console.log(score);
				// console.log(${ sessionScope.loginUser.memberNo });
				$.ajax({
					url : 'insertScore.ga',
					data : {
							memberNo : ${ sessionScope.loginUser.memberNo },
							score : score,
							levelNo : ${ firstQuiz.levelNo }
							},
					success : function(result){
						// console.log(result);
						if(result > 0) {
							insertBadge(score);
						}
						else {
							console.log('점수 insert 실패');
						}
					},
					error : function(){
						console.log('점수 입력 실패');
					}
				});
				
			}
			
			// 뱃지 insert
			function insertBadge(score){
				// console.log(score);
				if(score >= 20){
					$.ajax({
						url : 'insertBadge.ga',
						data : {
							memberNo : ${ sessionScope.loginUser.memberNo },
							badgeNo : ${ firstQuiz.levelNo } <%-- 뱃지 번호와 레벨 번호가 동일 (초급 : 3, 중급 : 2, 고급 : 1) --%>
						},
						success : function(result){
							// console.log(result);
						},
						error : function(){
							console.log('뱃지 insert 실패');
						}
					});
				}
				location.href = "main.ga";
			}
			
			// 이전 문제 클릭
			function prevQuiz(){
				// 4번에 갔을 때 3번 문제까지 저장(인덱스 0, 1, 2로 -> 3번 문제는 2번 인덱스로 가야 되니까 현재 번호 - 2)
				// console.log(answers[no - 2]);
				// 해당 문제에 사용자가 클릭한 답
				// console.log(answers[no - 2].answer);
				// name이 answer인 라디오버튼 중 value값이 해당 번호의 답인 버튼 checked된 상태로 보이게
				$('input:radio[name="answer"]:input[value=' + answers[no - 2].answer + ']').prop('checked', true);
				
				// console.log(answers);
				
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