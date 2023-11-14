<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
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


        /*-------------이미지 부분-----------*/
        #imgp{
            text-align: center;
            margin-top: 300px;
        }

         /*-------------아이콘 부분-----------*/
         .display-test{
             width: 220px;
             height: 220px;
             border-radius: 50%;
             margin-left: 122px;
             margin-top: 85px;
         }
        .inline-block{
            display : inline-block;

        }

        .circle{background-color: rgb(240, 240, 240);}

        .display-test2{
             width: 450px;
             height: 220px;
             margin-left: 122px;
             margin-top: 50px;
             text-align: center;
             line-height: 220px;
             color: white;
         }
        .square1 {background-color: rgb(245, 107, 107);}
        .square2 {background-color: rgb(79, 81, 132);}
        .square3 {background-color: rgb(129, 129, 129);}
</style>
</head>
<body>
		<div id="wrap">
	        <div id="header1">
	            <div id="header1_1">
	                <jsp:include page="common/header.jsp"></jsp:include>
	            </div>
	            <div id="header1_2"></div>
	            <div id="header1_3">
	                
	            </div>
	        </div>
	
	        <div id="navi">
	
	            <ul id="navi_1"></ul>
	
	        <div id="content">
	            <div id="content_1">
	                <p id="imgp">이미지</p>
	            </div>
	            <div id="content_2">
	                <div class="display-test inline-block circle"></div>
	                <div class="display-test inline-block circle"></div>
	                <div class="display-test inline-block circle"></div>
	                <div class="display-test inline-block circle"></div>
	                <div class="display-test inline-block circle"></div>
	            </div>
	            <div id="content_3">
	                <div id="content3_1">
	                    <h2 class="h2">알림사항</h2>
	                </div>
	                <div id="content3_2">
	                    <h2 class="h2">이벤트</h2>
	                </div>
	            </div>
	            <div id="content_4">
	                <h2 class="h2">프로모션</h2>
	                <div class="display-test2 inline-block square1">예약문의</div>
	                <div class="display-test2 inline-block square2">QUIZ TOP 10</div>
	                <div class="display-test2 inline-block square3">어서와 한국은 처음이지? 소개</div>
	            </div>
	        </div>
	    </div>
 	 </div>
</body>
</html>