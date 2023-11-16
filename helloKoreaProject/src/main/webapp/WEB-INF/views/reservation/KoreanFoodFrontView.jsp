<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>한식 예약</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="box"></div>
	
	<div class="page" id="content">
		<div class="page">
			<div id="main-pic">
			<h2>한식</h2>
			<!-- 로그인 한 상태일 때만 보여지는 예약하기/예약조회 버튼  -->
			<!-- <c:if test="${ not empty sessionScope.loginUser }"></c:if> -->
				<button class="btn btn-outline-light btn-block" id="reserv-hk">
					<h1>예약 하기</h1>
				</button>
				<br>
				<button class="btn btn-outline-light btn-block" id="reserv-list">
					<h1>예약 조회</h1>
				</button>
				<!-- scpipt문 써야함 -->
			<!-- 로그인 안했으면 else 
					<h1>예약 하고 싶으면 로그인해주세요! </h1>
			-->
			
			
			</div>
			
			<!-- 한식코스 소개 -->
			<div id="intro-kh">
			<h1>dd</h1>
			
			</div>
			
			<!-- 이용 안내 -->
			
			<div id="info-kh">
			<h1>dd</h1>
			
			</div>
			
			
			
		</div>
			
		
	</div>
	
	
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>