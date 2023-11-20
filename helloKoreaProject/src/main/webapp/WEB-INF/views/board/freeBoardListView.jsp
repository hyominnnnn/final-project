<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>자유게시판</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            height: auto;
            margin:auto;
            margin-top: 22px;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
​
        #boardList {
        	text-align:center;
        }
        
        #boardList>tbody>tr:hover {cursor:pointer;}
​
        #pagingArea {width:fit-content; margin:auto;}
        
        #searchForm {
            width:80%;
            margin:auto;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}
        
        .pagination{
  			width: fit-content;
  			margin-left: auto;
  			margin-right: auto;
        }
    </style>
</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
        
	<div class="content">
		<br><br>
	    <div class="innerOuter">
			<h2>자유게시판</h2>
	        <br>
	        <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
	        <c:if test="${ not empty sessionScope.loginUser }">
	            <a class="btn btn-secondary" style="float:right;" href="enrollForm.fbo">글쓰기</a>
	        </c:if>
	        <br><br>
	        <table id="boardList" class="table table-hover" align="center">
	            <thead>
	            	<tr align="center">
	                	<th>게시글번호</th>
		                <th>제목</th>
		                <th>작성자</th>
		                <th>작성일자</th>
		                <th>조회수</th>
		                <th>첨부파일</th>
		            </tr>
		        </thead>
	            <tbody>
	               <c:choose>
	            		<c:when test="${ empty freeList }">
	            			<tr>
	            				<td colspan="6" align="center">조회된 게시글이 없습니다.</td>
	            			</tr>
	            		</c:when>
	            		<c:otherwise>
	            			<c:forEach items="${ freeList }" var="f">
				                <tr id="detail" align="center">
				                	<td class="fno">${ f.boardNo }</td>
				                	<td>${ f.boardTitle }</td>
				                	<td>${ f.boardWriter }</td>
				                	<td>${ f.modifyDate }</td>
				                	<td>${ f.count }</td>
				                	<td>
				                		<c:if test="${ not empty f.originalName }">
				                			${ f.originalName }
				                		</c:if>
				                	</td>
				                </tr>
				            </c:forEach>
	            		</c:otherwise>
	            	</c:choose>
	            </tbody>
	        </table>
	        <br>
	        
	        <script>
	        	$(function(){
	             	$('#boardList > tbody > #detail').click(function(){
	             		location.href='detail.fbo?fno=' + $(this).children('.fno').text();
	             	});
	             });
	        </script>
	        
 
	         <div id="pagingArea" align="center">
	        	<ul class="pagination">
	        		<c:choose>
		        		<c:when test="${ empty freeList }">
		        			<li class="page-item disabled"><a class="page-link" href="#">1</a></li>
		        		</c:when>
	        			<c:otherwise>
			        		<c:choose> 
			        			<c:when test="${ empty condition }"> 
			        				<c:choose>
				        				<c:when test="${infoPi.currentPage eq 1}">
											<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="list.fbo?fPage=${infoPi.currentPage - 1}">Previous</a></li>
										</c:otherwise>
									</c:choose>
			        			</c:when>
								<c:otherwise> 
									<c:choose>
										<c:when test="${infoPi.currentPage eq 1}">
											<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="search.fbo?fPage=${infoPi.currentPage-1}&condition=${condition}&keyword=${keyword}">Previous</a></li>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							
				            <c:forEach begin="${ infoPi.startPage }" end="${ infoPi.endPage }" var="p"> 
				            	<c:choose>
				            		<c:when test="${ empty condition }">
										<li class="page-item"><a class="page-link" href="list.fbo?fPage=${p}">${p}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="search.fbo?fPage=${p}&condition=${condition}&keyword=${keyword}">${p}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:choose> 
			        			<c:when test="${ empty condition }">
			        				<c:choose>
				        				<c:when test="${infoPi.currentPage eq infoPi.maxPage}">
											<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="list.ibo?iPage=${infoPi.currentPage + 1}">Next</a></li>
										</c:otherwise>
									</c:choose>
			        			</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${infoPi.currentPage eq infoPi.maxPage}">
											<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="search.fbo?fPage=${infoPi.currentPage+1}&condition=${condition}&keyword=${keyword}">Next</a></li>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>

	​			
	        <br clear="both"><br>
	        
			<form id="searchForm" action="search.fbo" method="get" align="center">
				
		    	<div class="select">
		        	<select class="custom-select" name="condition">
		            	<option value="writer">작성자</option>
		                <option value="title">제목</option>
		                <option value="content">내용</option>
	                </select>
	            </div>
	            <div class="text">
	                <input type="text" class="form-control" name="keyword" value="${ keyword }">
	            </div>
	            <button type="submit" class="searchBtn btn btn-secondary">검색</button>
	        </form>
	        <br><br>
	        
	        <c:if test="${ not empty condition }">
				<script>
					$(function(){
						$('#searchForm option[value=${condition}]').attr('selected', true);
					});
				</script>
			</c:if>
	        
	    </div>
	    <br><br>
	</div>

    <jsp:include page="../common/footer.jsp" />

</body>
</html>