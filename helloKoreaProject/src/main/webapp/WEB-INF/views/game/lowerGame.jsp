<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>초급 게임</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
		div {border : 1px solid red;}
		.content {
            background-color:rgb(247, 245, 245);
            width:80%;
            height: 800px;
            margin:auto;
            margin-top: 22px;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            height:90%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
        #no {
        	width: 30px;
        	height: 10%;
        }
        
	</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"></jsp:include>
	
		<div class="content">
			<br><br>
			<div class="innerOuter">
				<h2 align="center">초급게임</h2>
				<div id="no">
					31.
				</div>
			</div>
		</div>
	
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>