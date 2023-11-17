<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한식 예약</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
<script type="text/javascript" src="resources/scripts/reservation/hanokScript.js"></script>
<style>

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div id="content" class="page">
		<div class="page">
			<form action="rsvEnrollForm.kf">
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
								<option value="2">고호정</option>
						</select>
						</td>
						
						<td>
						<input type="date" name="reservDate" id="reservDate" required>
						</td>
						
						<td>
						<select name="hkTime" id="hkTime">
								<option value="0">예약 날짜를 선택해주세요.</option>
								<input type="hidden">
								<button type = "button" id="date-check">예약 가능 확인</button>
						</select>
						</td>
						
						<td>
						<input type="hidden" name="table_price" value="70000">
						<input type="text" name="personnel" value="1" size="1" max="6">
						<input type="button" value=" + " name="add">
						<input type="button" value=" - " name="minus">
						</td>
						
						<td>
						<input type="text" name="sum" size="11" readonly>원
						</td>
						
						
						
					
					
					</tr>
					
				</table>
					
				
					
					
					
				
			
			
			</form>
		
		
		
		</div>
	
	
	
	</div>
	
	
	
	<jsp:include page="../common/footer.jsp" />


</body>
</html>