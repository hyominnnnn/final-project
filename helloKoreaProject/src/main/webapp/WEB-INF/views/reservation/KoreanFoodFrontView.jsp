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

        #wrap > div{
            width : 100%;
        }

        #content1 {
        	height : 40%;
     
        }
        
        #content2 {
            height : 40%;
        
        }
        #content2_1, #content2_2 {
        	width : 50%;
        	height : 100%;
        	float : left;
        }
        
        #content2_1_1, #content2_1_2, #content2_2_1, #content2_2_2 {
        	height : 50%;
        	width : 100%;
        }
        
        #content3 {
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
		
        <div id="content1">
        		<!-- 
        			<c:if test="${ empty sessionScope.loginUser}">
        			
	        		</c:if>
	        		<else>
	        			<button class="btn btn-outline-light btn-block" id="reserv-hk">
						<h1>예약 하기</h1>
						</button>
						<br>
						<button class="btn btn-outline-light btn-block" id="reserv-list">
						<h1>예약 조회</h1>
						</button>
	        		</else>
        		-->
        	<h1>로그인 하려면 예약해주세요!</h1>
        	<button class="btn btn-outline-light btn-block" id="reserv-hk" onClick="location.href='rsvEnrollForm.kf'">
				<h1>예약 하기</h1>
			</button>
			<br>
			<button class="btn btn-outline-light btn-block" id="reserv-list" onClick="location.href='rsvlist.kf'">
				<h1>예약 조회</h1>
			</button>		
        		
        	
        
        
        
        </div>
        	
        		
        
        	
        
        
        
        
        <div id="content2">
        	<div id="content2_1">
        		<div id="content2_1_1"></div>
        		<div id="content2_1_2"></div>
        	</div>	
        	<div id="content2_2">
        		<div id="content2_2_1"></div>
        		<div id="content2_2_2"></div>
        	</div>
        
        
        </div>
        
        

        
        
        
        
        
        <div id="content3"></div>
        

    </div>
	
	
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>
	