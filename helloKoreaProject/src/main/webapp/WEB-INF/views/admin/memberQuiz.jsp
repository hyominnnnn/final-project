<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자회원퀴즈랭킹페이지</title>
    
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
                <h1>회원 퀴즈 랭킹</h1>
                <br>
                  <table class="rwd-table">
                    <tbody>
                      <tr>
                        <th>레벨</th>
                        <th>이메일</th>
                        <th>닉네임</th>
                        <th></th>
                        <th>국가</th>
                        <th>점수</th>
                      </tr>
                      <tr>
                        <td data-th="Supplier Code">
                          	1
                        </td>
                        <td data-th="Invoice Number">
                          	12
                        </td>
                        <td data-th="Supplier Name">
                            zzangu01
                        </td>
                        <td data-th="Invoice Date">
                                                       짱구
                        </td>
                        <td data-th="Due Date">
                          	한국
                        </td>
                        <td data-th="Net Amount">
                          850
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  
                </div>
	        </div>
    	</div>
    
</body>
</html>