<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한식 예약</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
<style>

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div id="content" class="page">
		<div class="page">
			<form action="rsvEnrollForm.kf" name="kfEnrollForm" id="kfEnrollForm">
				<input type="hidden" name="userNo">
				<!-- 
				<c:if test="${ empty sessionScope.loginUser}">
				</c:if>
				 -->
				<h2>한식 선택</h2> 
				<table class="table">
					<tr>
						<th>코스 종류</th>
						<th>예약 날짜</th>
						<th>예약 시간</th>
						<th>체험 인원</th>
						<th>가격</th>
					</tr>
					
					<tr id="reserv-info">
						
						<td>
						<select name="programNo" value="1">
								<option value="1">한정식</option>
								<option value="2">고호재</option>
						</select>
						</td>
						
						<td>
						<input type="date" value="reDate" name="reDate" id="today" required>
						<button type="submit" id="reserv_check">예약 가능 시간 확인</button>
						</td>
						
						<td>
						<select name="kfTime" id="kfTime">
								<option value="0">예약 날짜를 선택해주세요.</option>
								<option value="12:00" id="times1">12:00</option>
								<option value="13:00" id="times2">13:00</option>
								<option value="18:00" id="times3">18:00</option>
								<option value="19:00" id="times4">19:00</option>
						</select>
						</td>
						
						<td>
						<!-- <input type="hidden" name="table_price" value="70000"> -->
						<input type="text" name="personnel_count" value="1" size="1" max="4" id="personnel_count">
						
						<input type="button" value=" + " id="plus" >
						<input type="button" value=" - " id="minus">
						</td>
						
						<td>
						<input type="text" name="sum" id="sum" size="11" onclick=cal() readonly>원
						</td>
						
						<tr>
						<td></td>
						<td></td>
						<td><h6>※예약 가능시간 : </h6></td>
						<td><h6>4명 이상 단체는 문의주세요</h6></td>
						<tr>
						
					</tr>
					
				</table>
				
				<script>
					var today = new Date();   
					var year = today.getFullYear(); // 년도
					var month = today.getMonth() + 1;  // 월
					var date = today.getDate();  // 날짜
					var day = today.getDay();  // 요일

					var getDate = (year + '-' + month + '-' + date);
					//console.log(getDate);
					
					$('#today').attr("value", getDate);
					
				/*
				 function rsvcheck() {
					 location.href = "rsvcheck.kf";
				 }
				*/
				
						// 예약 가능 확인
						
						$(function(){
							$('#reserv_check').click(function(){
								//console.log('ㅇㅇ');
								
								$.ajax({
									
									url : 'rsvcheck.kf',
									data:{reDate : $('#today').val()},
									success : data => {
										//console.log(data[0].reTime);
										//console.log($('#times1').val());
										
										var times1 = $('#times1').val();
										var getTimes0 = data[0].reTime;
										/*
										var times2 = $('#times2').val();
										var getTimes1 = data[1].reTime;
										var times3 = $('#times3').val();
										var getTimes2 = data[2].reTime;
										var times4 = $('#times4').val();
										var getTimes3 = data[3].reTime;
										*/
										
										//console.log(getTimes);
										if(getTimes0){ 
											//console.log(getTimes2);
											if(times1 == getTimes0){
												$('#times1').attr("hidden", true);
											}
											/*
											if(times2 == getTimes1){
												$('#times2').attr("hidden", true);
											}
											if(times3 == getTimes2){
												$('#times3').attr("hidden", true);
											}
											if(times4 == getTimes3){
												$('#times4').attr("hidden", true);
											}
										/*	
										} else if(getTimes1){
											if(times1 == getTimes0){
												$('#times1').attr("hidden", true);
											}
											if(times2 == getTimes1){
												$('#times2').attr("hidden", true);
											}
											if(times3 == getTimes2){
												$('#times3').attr("hidden", true);
											}
											if(times4 == getTimes3){
												$('#times4').attr("hidden", true);
											}
											
										} else if(getTimes2) {
											if(times1 == getTimes0){
												$('#times1').attr("hidden", true);
											}
											if(times2 == getTimes1){
												$('#times2').attr("hidden", true);
											}
											if(times3 == getTimes2){
												$('#times3').attr("hidden", true);
											}
											if(times4 == getTimes3){
												$('#times4').attr("hidden", true);
											}
										} else {
											if(times1 == getTimes0){
												$('#times1').attr("hidden", true);
											}
											if(times2 == getTimes1){
												$('#times2').attr("hidden", true);
											}
											if(times3 == getTimes2){
												$('#times3').attr("hidden", true);
											}
											if(times4 == getTimes3){
												$('#times4').attr("hidden", true);
											}
											*/
										} 
										
										
									},
									error : () => {
			                        	//console.log('실패!');
		                            }
								})
							})
						})
						
						
						
						// 인원수
						var personnel_count = 1;
						
						document.getElementById('plus').onclick = () => {
							var countEl =
							document.getElementById("personnel_count");
							
							//alert('되냥');
							personnel_count++;
							//countEl.value = personnel_count;
							countEl.value = personnel_count;
						}
						
						
						document.getElementById('minus').onclick = () => {
							if(document.getElementById('personnel_count').value > 1) {
								console.log('엥')
								personnel_count--;	
								//countEl.value = personnel_count;
								$('#personnel_count').val(personnel_count);
							}
						}
						
						function cal(personnel_count, sum){
							
							if(personnel_count.value == "" ) {
								var count = 0;
							}
							else {
								var count = personnel_count.value;
							}
							
							
						}
						
						
						
						
				
				</script>
				
				<div id="clientInfo">
					<h2>예약자 정보 입력</h2>
					<table>
					
					<tr>
						<th>예약자 성함</th>
						<td><input type="text" name="userName" placeholder="" readonly></td>
						<input type="hidden" name="userNo" value="">
					</tr>
					
					<tr>
						<th>연락처</th>
						<td><input type="text" name="phone" placeholder="" readonly></td>
					</tr>
					<tr>
						<td colspan = "2">로그인 후 이용가능한 서비스입니다.</td>
					</tr>
				
					
				</table>
					
					
				</div>
				
				<div>
				<h4>체험 안내 및 주의사항</h4>
				<pre>
	어쩌구저쩌구 어쩌구저쩌구 아아아아 금요일인데 집가고싶다 두시간남았네
	퓨ㅜ핳
	푸핳
	푸핳
	여기는 c강의장 푸키
				</pre>
				</div>
				<div align="center">
				<input type="checkbox" required>주의사항을 읽었고 확인하였습니다. <br><br>
				<button type="submit">예약하기</button>
				</div>
			
			</form>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>