<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>정보게시글 작성</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color:rgb(247, 245, 245); 
            width:80%;
            height: auto;
            margin:auto;
            margin-top: 22px;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}
    </style>
</head>
<body>
        
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="content">
		<br><br>
		<div class="innerOuter">
		    <h2>게시글 작성하기</h2>
		    <br>
		    
		    <form id="enrollForm" method="post" action="insert.ibo" enctype="multipart/form-data">
		    	<input type="hidden" name="categoryNo" value="2"> <!-- 카테고리 구분(자유 : 1 / 정보 : 2) -->
		        <table align="center">
		        	<tr>
		            	<th><label for="title">제목</label></th>
		                <td><input type="text" id="title" class="form-control" name="boardTitle" required></td>
		            </tr>
		            <tr>
		                <th><label for="writer">작성자</label></th>
		                <td><input type="text" id="writer" class="form-control" value="${ sessionScope.loginUser.userId }" name="boardWriter" readonly></td>
		            </tr>
		            <tr>
		                <th><label for="upfile">첨부파일</label></th>
		                <td><input type="file" id="upfile" class="form-control-file border" name="upfile"></td>
		            </tr>
		            <tr>
		                <th><label for="content">내용</label></th>
		                <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="boardContent" required></textarea></td>
		            </tr>
		        </table>
		        <br>
		        
		        <div align="center">
		        	<button type="submit" class="btn btn-primary">등록하기</button>
		            <button type="reset" class="btn btn-danger">취소하기</button>
		        </div>
		    </form>
		</div>
		<br><br>
		
	</div>
	
	<jsp:include page="../common/footer.jsp" />
    
</body>
</html>