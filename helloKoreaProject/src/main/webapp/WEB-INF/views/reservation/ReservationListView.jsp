<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 조회</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>


</script>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="content">
		<br><br>
	    <div class="innerOuter">
			<h2>예약 전체 조회</h2>
	        <br><br>
	        <table id="boardList" class="table table-hover" align="center">
	            <thead>
	            	<tr>
	                	<th>한식 코스</th>
		                <th>예약 날짜</th>
		                <th>예약 시간</th>
		                <th>예약 인원</th>
		                <th>가격</th>
		                <th>예약 번호</th>
		                <th>예약변경/취소</th>
		            </tr>
		        </thead>
	            <tbody>
	                <!--<c:forEach items="${ list }" var="b">-->
		                <tr>
		                	<td>d</td>
		                	<td>d</td>
		                	<td>d</td>
		                	<td>d</td>
		                	<td>d</td>
		                	<td>d</td>
		                	<td>
		                	<button class="btn btn-warning">예약 변경</button>
							<button class="btn btn-danger">예약 취소</button>
		                	</td>
		                	
		                </tr>
		            <!--</c:forEach>-->
	                
	            </tbody>
	        </table>
	        <br>
	        
	        <script>
	        	$(function(){
	             	$('#boardList > tbody > tr').click(function(){
	             		location.href='detail.ibo?bno=' + $(this).children('.bno').text();
	             	});
	             });
	        </script>
	        
<!-- 
	        <div id="pagingArea" align="center">
	        	<ul class="pagination">
					<c:choose>
						<c:when test="${pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="list.bo?cPage=${pi.currentPage-1}">Previous</a></li>
						</c:otherwise>
					</c:choose>
					
		            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<li class="page-item"><a class="page-link" href="list.bo?cPage=${p}">${p}</a></li>
					</c:forEach>
					
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
-->
	​			
	        <br clear="both"><br>
	        
			
	        <br><br>
	        
	    </div>
	    <br><br>
	</div>



















	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>