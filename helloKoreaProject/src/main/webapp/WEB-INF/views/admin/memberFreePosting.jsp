<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자회원게시물페이지</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        div{
            box-sizing: border-box;
        }

        #wrap{
            width: 1850px;
            height: 2300px;
            margin: auto;
        }

        #wrap > div {
            width: 100%;
        }

        #header1, #navi{
            height: 5%;
           
        }

        #header1_1, #header1_3{
            height: 100%;
            width: 20%;
            float: left;
        }

        #header1_2{
            height: 100%;
            width: 60%;
            float: left;
        }

        #content{
            width: 70%;
        }

        #content_1{
            height: 700px;
        }

        #content_2, #content_3, #content_4 {height: 400px;}

        #content3_1, #content3_2{
            height: 100%;
            width: 50%;
            float: left;
        }

        /*테이블*/
        * {font-family: 'Open Sans', sans-serif;}

        .rwd-table {
        margin: auto;
        min-width: 300px;
        max-width: 100%;
        border-collapse: collapse;
        }

        .rwd-table tr:first-child {
        border-top: none;
        background: #428bca;
        color: #fff;
        }

        .rwd-table tr {
        border-top: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
        background-color: #f5f9fc;
        }

        .rwd-table tr:nth-child(odd):not(:first-child) {
        background-color: #ebf3f9;
        }

        .rwd-table th {
        display: none;
        }

        .rwd-table td {
        display: block;
        }

        .rwd-table td:first-child {
        margin-top: .5em;
        }

        .rwd-table td:last-child {
        margin-bottom: .5em;
        }

        .rwd-table td:before {
        content: attr(data-th) ": ";
        font-weight: bold;
        width: 120px;
        display: inline-block;
        color: #000;
        }

        .rwd-table th,
        .rwd-table td {
        text-align: left;
        }

        .rwd-table {
        color: #333;
        border-radius: .4em;
        overflow: hidden;
        }

        .rwd-table tr {
        border-color: #bfbfbf;
        }

        .rwd-table th,
        .rwd-table td {
        padding: .5em 1em;
        }
        @media screen and (max-width: 601px) {
        .rwd-table tr:nth-child(2) {
            border-top: none;
        }
        }
        @media screen and (min-width: 600px) {
        .rwd-table tr:hover:not(:first-child) {
            background-color: #d8e7f3;
        }
        .rwd-table td:before {
            display: none;
        }
        .rwd-table th,
        .rwd-table td {
            display: table-cell;
            padding: .25em .5em;
        }
        .rwd-table th:first-child,
        .rwd-table td:first-child {
            padding-left: 0;
        }
        .rwd-table th:last-child,
        .rwd-table td:last-child {
            padding-right: 0;
        }
        .rwd-table th,
        .rwd-table td {
            padding: 1em !important;
        }
        }

        h1{
            margin-top: 50px;
        }

        /* THE END OF THE IMPORTANT STUFF */

        /* Basic Styling */
        body {
        background: #4B79A1;
        background: -webkit-linear-gradient(to left, #4B79A1 , #283E51);
        background: linear-gradient(to left, #4B79A1 , #283E51);        
        }
        h1 {
        text-align: center;
        font-size: 2.4em;
        color: #f2f2f2;
        }
        .container {
        display: block;
        text-align: center;
        }
        h3 {
        display: inline-block;
        position: relative;
        text-align: center;
        font-size: 1.5em;
        color: #cecece;
        }
        h3:before {
        content: "\25C0";
        position: absolute;
        left: -50px;
        -webkit-animation: leftRight 2s linear infinite;
        animation: leftRight 2s linear infinite;
        }
        h3:after {
        content: "\25b6";
        position: absolute;
        right: -50px;
        -webkit-animation: leftRight 2s linear infinite reverse;
        animation: leftRight 2s linear infinite reverse;
        }
        @-webkit-keyframes leftRight {
        0%    { -webkit-transform: translateX(0)}
        25%   { -webkit-transform: translateX(-10px)}
        75%   { -webkit-transform: translateX(10px)}
        100%  { -webkit-transform: translateX(0)}
        }
        @keyframes leftRight {
        0%    { transform: translateX(0)}
        25%   { transform: translateX(-10px)}
        75%   { transform: translateX(10px)}
        100%  { transform: translateX(0)}
        }
        
        /*-------모달창-------*/
        .model-footer-btn{
        	height: 35px;
        	width: 120px;
        	background-color: lightgray;
        	border: none;
        	border-radius: 3px;
        }
        
        .modal-content{
        	align: center;
        	width: 700px;
        }
       
       #pagingArea {
	       width:fit-content; 
	       margin-left:780px;
	       margin-top: 200px;
	       
       }
       
       #boardTitle{
       	width: 200px;
       	height: 30px;
       }
       
       #boardContent{
       width: 600px;
       height: 300px;
       }
       
        #list-select-btn{
       		margin-top: 50px;
       		width: 110px;
       		height: 35px;
       		border: none;
       		border-radius: 3px;
       }
       
       .board-detail-btn{
       		width: 110px;
       		height: 35px;
       		border: none;
       		border-radius: 3px;
       		
       }
       
       .BoardDetailBtn{
       		color: black;
       		text-decoration: none;
       		
       }
       
       .BoardDetailBtn:hover{
       	text-decoration: none;
       }
       
       a:hover{
       	text-decoration: none;
       	color: black;
       }
       
       #deleteBtn{
       	width: 110px;
       	height: 35px;
       	border: none;
       	border-radius: 3px;
       }
       
       #modal-footer-btn{
       	color: white;
       }
      
    </style>
</head>
<body>
    <div id="wrap">
        <div id="header1">
            <div id="header1_1">
                <jsp:include page="../common/adminHeader.jsp"></jsp:include>
            </div>
            <div id="header1_2"></div>
            <div id="header1_3">
                
            </div>
        </div>

        <div id="navi">

            <ul id="navi_1"></ul>
                
        </div>
        
        <div id="content">
            <div class="container">
            	<br>
                <h1>자유게시판 관리</h1>
                <br>
                <form action="freeList.me" method="get">
                  <table class="rwd-table" data-toggle="modal" data-target="#memberPostingForm">
                    <tbody>
                      <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th></th>
                        <th></th>
                        <th>작성일</th>
                      </tr>
                      <c:forEach items="${ list }" var="b">
	                      <tr>
	                        <td data-th="Supplier Code">
	                        	${b.boardNo}
	                        </td>
	                        <td data-th="Supplier Name">
	                            ${b.boardTitle }
	                        </td>
	                        <td data-th="Invoice Number">
	                          	${b.boardWriter }
	                        </td>
	                        <td data-th="Invoice Date">
	                        	
	                        </td>
	                        <td data-th="Due Date">
	                        </td>
	                        <td data-th="Net Amount">
	                          ${b.createDate}
	                        </td>
	                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                  <button type="submit" id="list-select-btn">리스트조회</button>
                  <button class="board-detail-btn"><a href="reply.me" class="BoardDetailBtn">댓글조회</a></button>
                  </form>
                </div>
        </div>
        	
    		<div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1}">
                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="freeList.me?cPage=${pi.currentPage-1}">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<li class="page-item"><a class="page-link" href="freeList.me?cPage=${p}">${p}</a></li>
                    </c:forEach>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>
        
    </div>
    
    <!-- 회원정보 상세 모달 -->
     <div class="modal fade" id="memberPostingForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
​
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">자유게시글 상세 조회</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
​
                <form action="#" method="post" id="memberPostingDetailModel">
                    <!-- Modal body -->
                    <div class="modal-body">
                            <label for="boardTitle" class="boardTitleBtn">제목</label>
                            <input type="text" class="form-control boardTitleBtn" id="boardTitle" name="boardTitle" readonly> 
                            <br>
                            
                            <label for="boardContent" class="boardContentBtn">내용</label>
                            <input type="text" class="form-control boardContentBtn" id="boardContent" name="boardContent" readonly> 
                            <br>
                            
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
						<button id="deleteBtn" class="btn btn-danger"><a href="delete.bo" id="modal-footer-btn">삭제하기</a></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
     <script>
    	$(function(){
    		$('.rwd-table > tbody > tr').click(function(){
    			console.log($(this).children().eq(0).text());
    			
    			
    			$.ajax({
    				url: 'memberFreePosting.me',
    				data : {boardNo : $(this).children().eq(0).text().trim()},
    				success : data => {
    					console.log(data);
    					
    					const inputboardtitle = data.boardTitle;
    					const inputboardconent = data.boardContent;
    					
    					$('#boardTitle').val(inputboardtitle);
    					$('#boardContent').val(inputboardconent);
    				},
    				error : () => {
    					console.log('실패!');
    				}
    				
    			})
    		})
    	})
    </script>
    
  
    
    
    
    
</body>
</html>