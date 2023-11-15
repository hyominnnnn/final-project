<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더+네비</title>
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
         
        /*-----------------------------------------------*/

        #p1{
            font-size: 25px;
            text-align: center;
            margin-top: 15px;
        }

        #a1{
            
            padding-left : 110px;
        }

        #a1, #a2{
            font-size: 15px;
            text-align: center;
            text-decoration: none;
            color: gray;
            margin-left: 10px;
            
        }

        #navigator{
            width: 1000px;
            height: 5%;
        }

        /*-----------------------------------------------------------------*/
        #navi{
            background-color: rgb(240, 240, 240);
            
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
</style>
</head>
<body>
	
	  <div id="wrap">
        <div id="header1">
            <div id="header1_1">
                <p id="p1">어서와 한국은<br>처음이지?</p>
            </div>
            <div id="header1_2"></div>
            <div id="header1_3">
                <a href="#" id="a1">마이페이지</a>
                <a href="#" id="a2">로그인</a>
            </div>
        </div>
        <div id="navi">

            <ul id="navi_1">
                <li><a href="#">체험</a>
                    <ul>
                        <li><a href="#">한식체험</a></li>
                        <li><a href="#">전통혼례</a></li>
                        <li><a href="#">전통예술공연</a></li>
                        <li><a href="#">전통문화체험</a></li>
                    </ul>
                </li>
                <li><a href="#">채팅학습</a>
                    <ul>
                        <li><a href="#">1:1채팅방</a></li>
                        <li><a href="#">단체채팅방</a></li>
                     
                    </ul>
                </li>
                <li>
                    <a href="#">게임학습</a>
                    <ul>
                        <il><a href="#">한식체험</a></il>
                        <il><a href="#">전통혼례</a></il>
                        <il><a href="#">전통예술공연</a></il>
                        <il><a href="#">전통문화체험</a></il>
                    </ul>
                </li>
                <li>
                    <a href="#">커뮤니티</a>
                    <ul>
                        <li><a href="#">자유게시판</a></li>
                        <li><a href="info">정보게시판</a></li>
                        
                    </ul>
                </li>
                <li>
                    <a href="">여행지도</a>
                </li>
            </ul>
        </div>
    </div>

</body>
</html>