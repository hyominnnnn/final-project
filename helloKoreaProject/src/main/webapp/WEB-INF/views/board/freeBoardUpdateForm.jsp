<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
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

        #updateForm>table {width:100%;}
        #updateForm>table * {margin:5px;}
    </style>
</head>
<body>
        
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="content">
		<br><br>
		<div class="innerOuter">
		    <h2>게시글 수정하기</h2>
		    <br>
		    
		    <form id="updateFreeForm" method="post" action="update.fbo" enctype="multipart/form-data">
		    	<input type="hidden" name="boardNo"value="${ free.boardNo }" />
		    	<input type="hidden" name="fno" value="${ free.boardNo }">
			    <input type="hidden" name="filePath" value="${ free.uploadName }">
		        <table align="center">
		        	<tr>
		            	<th><label for="title">제목</label></th>
		                <td><input type="text" id="title" class="form-control" name="boardTitle" value="${ free.boardTitle }" required></td>
		            </tr>
		            <tr>
		                <th><label for="writer">작성자</label></th>
		                <td><input type="text" id="writer" class="form-control" value="${ free.boardWriter }" name="memberNickname" readonly></td>
		            </tr>
		            <tr>
		                <th><label for="upfile">첨부파일</label></th>
		                <td>
                            <input type="file" id="upfile" class="form-control-file border" name="reUpfile">
                            
                            <c:if test="${not empty free.originalName }"> <!-- 현재 업로드된 파일이 있었을 때 -->
                           		 현재 업로드된 파일 : 
                           	<!-- 업로드네임 경로, 다운로드 받았을 때는 파일의 원본명으로 -->
                            <a href="${free.uploadName }" download="${free.originalName }">${free.originalName}</a>
                            <!-- 기존에 첨부파일 있었을 경우에만 보내주기-->
                            <input type="hidden" value="${free.originalName}" name="originalName"/>
                            <input type="hidden" value="${free.uploadName}" name="uploadName"/>
                            </c:if>
                        </td>
		            </tr>
		            <tr>
		                <th><label for="content">내용</label></th>
		                <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="boardContent" required>${ free.boardContent }</textarea></td>
		            </tr>
		        </table>
		        <br>
		        
		        <div align="center">
		        	<button type="submit" class="btn btn-primary">수정하기</button>
		            <button type="reset" class="btn btn-danger">취소하기</button>
		        </div>
		    </form>
		</div>
		<br><br>
		
	</div>
	
	<jsp:include page="../common/footer.jsp" />
    
</body>
</html>