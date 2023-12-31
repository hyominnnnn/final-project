<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자회원관리페이지</title>
    
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
        .member-info-btn{
        	height: 50px;
        	width: 150px;
        	background-color: lightgray;
        	border: none;
        	border-radius: 3px;
        	text-decoration: none;
        	color: black;
        	padding-top: 5px;
        }
        
        .modal-content{
        	align: center;
        	width: 700px;
        }
       
       #pagingArea {
	       width:fit-content; 
	       margin-left:810px;
	       margin-top: 160px;
       }
       
       #list-select-btn{
       		margin-top: 50px;
       		width: 110px;
       		height: 35px;
       		border: none;
       		border-radius: 3px;
       }
       
       .member-detail-btn{
       		width: 110px;
       		height: 35px;
       		border: none;
       		border-radius: 3px;
       		
       		
       }
       
       .memberDetailBtn{
       		color: black;
       		text-decoration: none;
       		
       }
       
       .memberDetailBtn:hover{
       	text-decoration: none;
       }
       
       #model-footer-btn{
       		color: white;
       }
       
       a:hover{
       	text-decoration: none;
       	color: black;
       }
       
       .memberModelBtn{
       	width: 110px;
       	height: 35px;
       	border: none;
       	border-radius: 3px;
       	color: black;
       }
       
       #memberPostingBtn, #memberReplyBtn{
       color: black;
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
                <h1>회원 정보 관리</h1>
                <br>
				<form action="list.me" method="get">
				  <input type="hidden" name="cpage" value="1" />
                  <table class="rwd-table" data-toggle="modal" data-target="#memberDetailForm">
                    <tbody>
                      <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>이메일</th>
                        <th>닉네임</th>
                        <th>가입일자</th>
                      </tr>

                      <c:forEach items="${ list }" var="member">
	                      <tr>
	                        <td data-th="Supplier Code">
	                          	${member.memberNo}
	                        </td>
	                        <td data-th="Supplier Name">
	                        	${member.memberName}
	                        </td>
	                        <td data-th="Invoice Number">
	                        	${member.email}
	                        </td>
	                        <td data-th="Invoice Date">
	                        	${member.memberNickname}
	                        </td>
	                        <td data-th="Net Amount">
	                          ${member.memberEnrollDate}
	                        </td>
	                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                     <button type="submit" id="list-select-btn">리스트조회</button>
                   </form>
                </div>
        	</div>
		</div>        
        
        <!-- 페이징 처리 -->
    		<div id="pagingArea">
                <ul class="pagination">
                
                	<c:choose>
                	
                		<c:when test="${ pi.currentPage eq 1}">
                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                    	
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.me?cPage=${pi.currentPage-1}">Previous</a></li>
                    	</c:otherwise>
                    	
                    </c:choose>
                    
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<li class="page-item"><a class="page-link" href="list.me?cPage=${p}">${p}</a></li>
                    </c:forEach>
                    
                    <li class="page-item"><a class="page-link" href="list.me?cPage=${pi.currentPage+1}">Next</a></li>
                </ul>
            </div>
    
    <!-- 회원정보 상세 모달 -->
     <div class="modal fade" id="memberDetailForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
​
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">정보 상세 조회</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
​
                <form action="#" method="post" id="memberDetailModel">
                <input type="hidden" name="bPage" value="${member.memberNo}" />
                
                    <!-- Modal body -->
                    <div class="modal-body">
                    		
                    		<label for="memberNo" class="memberNo">회원번호</label>
                            <input type="text" class="form-control memberbtn" id="memberNo" name="memberNo" readonly> 
                            <br>
                            
                            <label for="memberName" class="memberbtn">이름</label>
                            <input type="text" class="form-control memberbtn" id="memberName" name="memberName" readonly> 
                            <br>
                            
                            <label for="email" class="memberbtn">이메일</label>
                            <input type="text" class="form-control memberbtn" id="email" name="email" readonly> 
                            <br>
                            
                            <label for="memberNickname" class="memberbtn">닉네임</label>
                            <input type="text" class="form-control memberbtn" id="memberNickname" name="memberNickname" readonly> 
                            <br>
                            
                            <label for="birthday" class="memberbtn">생년월일</label>
                            <input type="text" class="form-control memberbtn" id="birthday" name="birthday" readonly> 
                            <br>
                            
                            <label for="nationName" class="memberbtn">국가</label>
                            <input type="text" class="form-control memberbtn" id="nationName" name="nationName" readonly> 
                            <br>
                            
                            <label for="memberEnrollDate" class="memberbtn">가입일자</label>
                            <input type="text" class="form-control memberbtn" id="memberEnrollDate" name="memberEnrollDate" readonly> 
                            <br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                    	<button type="button" id="personalPostingBtn" class="memberModelBtn">게시글조회</button>
                    	<button type="button" id="personalReplyBtn" class="memberModelBtn">댓글조회</button>
                    	<button type="button" id="deleteBtn" class="btn btn-danger"><a href="#" id="model-footer-btn" data-toggle="modal" data-target="#deleteForm">회원삭제</a></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
   <script>
   		
   
   		$(function(){

   			$('#personalPostingBtn').click(function(){
   				const $memberNo = $('#memberNo');
   				location.href= 'personalPosting?bPage=' + $memberNo.val(); 
   			})
   		})
   		
   		$(function(){
   			
   			$('#personalReplyBtn').click(function(){
   				const $memberNo =  $('#memberNo');
   				location.href= 'personalReply?bPage=' + $memberNo.val();
   			})
   			
   		})
   </script>
    
     <div class="modal fade" id="deleteForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
​
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">관리자 비밀번호 확인!</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
​
                <form action="delete.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="center">
			                            회원삭제 후 복구가 불가능합니다. <br>
			                            정말로 회원을 삭제 하시겠습니까? <br>
                        </div>
                        <br>
                        	삭제할 회원의 이메일
                        	<input type="text" class="form-control memberbtn" id="targetEmail" name="email" value="" readonly> 
                            <br/>
                                                         관리자 비밀번호 확인
                            <input type="text" class="form-control memberbtn" id="adminEmail" name="memberPwd" value=""> 
                            <br/>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">확인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    
    
    <script>
    
	    // 비밀번호 확인 모달
	    $(function(){
	    	$('#deleteBtn').click(function(){
	    		var otherEmail = $('#targetEmail').val($('#email').val());
	    		//console.log(otherEmail);
	    		
	    		var adminPwd = $('#adminPwd').val();
	    		//console.log(adminPwd);
	    		
	    		//console.log($('#memberPwd').val());
	    		//console.log(targetEmail);
	    		
	    		/*
	    		$.ajax({
	    			url: 'delete.me',
	    			data: {targetEmail : otherEmail},
	    			success: data => {
	    				console.log(data);
	    				
	    			},
	    			error : () => {
	    				console.log('실패');
	    			}
	    		})
	    		*/
	    	})
	    	
	    })
	    
	    
	    </script>
	    <script>
		// 회원 상세 모달
	    $(function(){
	             		$('.rwd-table > tbody > tr').click(function(){
	             				//console.log($(this).children().eq(1).text());
	             				
	             				
	             				$.ajax({
							    	url : 'memberDetail.me',
							    	data : {email : $(this).children().eq(2).text().trim()},
							    	success : data => {

							    	   console.log(data);

							    	   //console.log(data.nationName);
							    		
							    	   const inputName = data.memberName;
							    	   const inputemail= data.email;
							    	   const inputnickname = data.memberNickname;
							    	   const inputbirthday = data.birthday;
							    	   const inputnationName = data.nationName;
							    	   const inputenrolldate = data.memberEnrollDate;
							    	   const inputNo = data.memberNo;
							    	   
							    	   
							    	   $('#memberName').val(inputName);
							    	   $('#email').val(inputemail);
							    	   $('#memberNickname').val(inputnickname);
							    	   $('#nationName').val(inputnationName);
							    	   $('#birthday').val(inputbirthday);
							    	   $('#memberEnrollDate').val(inputenrolldate);
							    	   $('#memberNo').val(inputNo);
							    	   
							    	
							    	    
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