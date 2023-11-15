<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	       margin:auto;
       }
       
      
    </style>
</head>
<body>
    <div id="wrap">
        <div id="header1">
            <div id="header1_1">
                <jsp:include page="../common/header.jsp"></jsp:include>
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
                  <table class="rwd-table" data-toggle="modal" data-target="#memberDetailForm">
                    <tbody>
                      <tr>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>닉네임</th>
                        <th>생년월일</th>
                        <th>국가</th>
                        <th>가입일자</th>
                      </tr>
                      <tr>
                        <td data-th="Supplier Code">
                          	신짱구
                        </td>
                        <td data-th="Supplier Name">
                            zzangu01
                        </td>
                        <td data-th="Invoice Number">
                          	부리부리
                        </td>
                        <td data-th="Invoice Date">
                          1990/01/01
                        </td>
                        <td data-th="Due Date">
                          	일본
                        </td>
                        <td data-th="Net Amount">
                          2023/11/14
                        </td>
                      </tr>
                     
                     <tr>
                        <td data-th="Supplier Code">
                          	철수
                        </td>
                        <td data-th="Supplier Name">
                            user111
                        </td>
                        <td data-th="Invoice Number">
                          	철수얼쑤
                        </td>
                        <td data-th="Invoice Date">
                          1990/01/01
                        </td>
                        <td data-th="Due Date">
                          	한국
                        </td>
                        <td data-th="Net Amount">
                          2023/11/14
                        </td>
                      </tr>
                      
                    </tbody>
                  </table>
                  
                </div>
        </div>
        
    		<div id="pagingArea">
                <ul class="pagination">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>
        
    </div>
    
    
    <script>
    	$(function(){
    		$('.rwd-table > tbody > tr').click(function(){
    			location.herf='detail.me?mno=' + $(this).children('.mno').text();
    		})
    	})
    </script>
    
   
    
    <!-- 회원정보 상세 모달 -->
     <div class="modal fade" id="memberDetailForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
​
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원 정보 상세 조회</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
​
                <form action="posting.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="center">
                        
                        </div>
                            <label for="memberName" class="memberbtn">이름</label>
                            <input type="text" class="form-control memberbtn" id="memberName" name="memberName" readonly> 
                            <br>
                            
                            <label for="memberId" class="memberbtn">아이디</label>
                            <input type="text" class="form-control memberbtn" id="memberId" name="memberId" readonly> 
                            <br>
                            
                            <label for="memberNickname" class="memberbtn">닉네임</label>
                            <input type="text" class="form-control memberbtn" id="memberNickname" name="memberNickname" readonly> 
                            <br>
                            
                            <label for="email" class="memberbtn">이메일</label>
                            <input type="text" class="form-control memberbtn" id="email" name="email" readonly> 
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
                        <button type="submit" id="posting-btn" class="model-footer-btn">게시물 조회</button>
                        <button id="reply-btn" class="model-footer-btn" onclick="reply();">댓글 조회</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    
</body>
</html>