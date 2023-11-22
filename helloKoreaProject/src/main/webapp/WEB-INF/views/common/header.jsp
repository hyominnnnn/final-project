<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더+네비</title>
<style>
	    div{
            box-sizing: border-box;
        }

        .header1{
            width: 1850px;
            height: 115px;
            margin: auto;
        }

        .header1 > div {
            width: 100%;
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
         
        /*-----------------------------------------------*/
		
		#header1_1 > img{
        	margin-top: 15px;
        	width: 150px;
        	height: 80px;
        }
		
        #logo{
        	display: inline-block;
            font-size: 25px;
            text-align: center;
            text-decoration: none;
            color: black;
        }

        #a1{
            padding-left : 50px;
        }

        #a1, #a2, #a3{
            font-size: 15px;
            text-align: center;
            text-decoration: none;
            color: gray;
            margin-left: 10px;
        }
        
        .headerlogon{
        	text-align: center;
        }

        /*-----------------------------------------------------------------*/
        .navi{
       		width: 1850px;
            height: 100px;
            background-color: #bbe9d7;
            margin: 0 auto;
        }
        #navi_1{
            list-style: none;
            margin: center;
            height: 100%;
        }

        #navi_1 > li{
            float: left;
            height: 100%;
            width: 13%;
            text-align: center;
            margin-left: 90px;
        }

        #navi_1 a{
            text-decoration: none;
            font-weight: 800;
            width: 100%;
            height: 100%; 
            display: block;
            line-height: 100px;
            color: black;
            font-size: 20px;
        }
        
        .navi_2 a{
			background-color: #bbe9d7;
        	margin-top: -30px;
        	margin-bottom: -50px;
        }

        #navi_1 a:hover{
            font-size: 23px;
        }

        #navi_1 > li > ul{
            list-style: none;
            padding: 0;
          	display: none;
        }

        #navi_1 > li > a:hover + ul{
            display: block;
        }

        #navi_1 > li >ul:hover{
            display: block;
        }
        
        #navi_1 > li > ul a{font-size: 17px;}
        #navi_1 > li > ul a:hover{font-size: 20px;}

        #header1_3{
            border : 1px solid red;
        }
        #header1_3 div{
            border : 1px solid red;
            
        }
        /*로그인시 프로필 이미지*/
        #profile{
            width : 100%;
            height: 80%;
            
        }
        #inform{
            width : 100%;
            height: 20%;
        }
        #profile_img{
            width : 85px;
            height: 85px;
            border-radius: 50%;
        }  
      
        #profile div{
            float: left;
            height: 100%;
        }
        #pro1{
            width: 30%;
            text-align: center;
        }
        #pro2{
            width: 70%;
            text-align: center;
            line-height: 500%;
        }
        #nick{
            color: darkviolet;
            font-weight: bold;
        }
        

</style>
</head>
<body>
		
        <div class="header1">
            <div id="header1_1">
            	<img src="https://t1.daumcdn.net/cfile/blog/2254404256D3ED562F">
                <a id="logo" href="main">어서와 한국은<br>처음이지?</a>
                <!-- 이부분은 최종적으론 지우기 -->
                <a href="logonForm" id="a1">회원가입</a>
                <a href="loginForm" id="a2">로그인</a>
                <a href="myPageForm" id="a1">마이페이지</a>
            </div>
            <div id="header1_2"></div>
            <div id="header1_3">
            	<c:choose>
	            	<c:when test="${empty loginUser }">
	            	<!-- 로그인 전 -->
	                <a href="logonForm" id="a1" class="headerlogon">회원가입</a>
	                <a href="loginForm" id="a2" class="headerlogon">로그인</a>
	                </c:when>
	                <c:otherwise>
	                <!-- 로그인 후 -->
                    <div id="profile">
                    	<c:choose>
	                        <c:when test="${empty loginUser.socialProfile}">
	                        	<div id="pro1"><img src="resources/images/nonImage.png" id="profile_img"></div>
	                        </c:when>
	                        <c:otherwise>
	                       	 <div id="pro1"><img src="${sessionScope.loginUser.socialProfile}" id="profile_img"></div>
	                       	 
							</c:otherwise>
						</c:choose>
                        <div id="pro2"><label id="nick">${sessionScope.loginUser.memberNickname }</label>님 환영합니다</div>
                        
                    </div>
                    <div id="inform">

                        <a href="myPageForm" id="a1">마이페이지</a>
                        <a href="logout" id="a2">로그아웃</a>

						<!-- 관리자 로그인 상태일 경우(status='A')에만 보여짐 -->
                     	<c:if test="${ sessionScope.loginUser.status eq 'A'}">
                        <a href="admin" id="a3" class="headerlogon">관리자페이지</a>
                        </c:if>                        
                        

                    </div>
	                </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="navi">

            <ul id="navi_1">
                <li><a href="#">체험</a>
                    <ul class="navi_2">
                        <li><a href="list.kf">한식체험</a></li>
                        <li><a href="#">전통혼례</a></li>
                        <li><a href="#">전통예술공연</a></li>
                        <li><a href="#">전통문화체험</a></li>
                    </ul>
                </li>
                <li><a href="#">채팅학습</a>
                    <ul class="navi_2">
                        <li><a href="#">1:1채팅방</a></li>
                        <li><a href="#">단체채팅방</a></li>
                     
                    </ul>
                </li>
                <li>
                    <a href="main.ga">게임학습</a>
                </li>
                <li>
                    <a href="#">커뮤니티</a>
                    <ul class="navi_2">
                        <li><a href="list.fbo">자유게시판</a></li>
                        <li><a href="list.ibo">정보게시판</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">여행지도</a>
                </li>
            </ul>
        </div>

</body>
</html>