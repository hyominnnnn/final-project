<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한식 예약</title>
<style>
	div{
            border : 1px solid red;
            box-sizing : border-box;
        }

        #wrap{
            width : 70%;
            height : 1800px;
            margin : auto;
        }

        /* 크게 세가지 영역 */
        /* header, content, footer */
        #wrap > div{
            width : 100%;
        }

        #kfmain-pic {
        	height : 40%;
     
        }
        
        #intro-kf {
            height : 40%;
        
        }
        
        #info-kf {
        	height : 20%;
        
        }


    
    
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div id="wrap">
		
        <div id="kfmain-pic"></div>
        <div id="intro-kf"></div>
        <div id="info-kf"></div>
    </div>
	
	
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>