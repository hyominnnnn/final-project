<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>자유게시글</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style> 
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            height: auto;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
​
        table * {margin:5px;}
        table {width:100%;}
        
        #scrap{
        	margin: auto;
        	display: block;
        }
    </style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"></jsp:include>
​	
	<div class="content">
		<br><br>
		<div class="innerOuter">
			<h2>자유 게시글</h2>
		    <br>
		    ​
		    <a class="btn btn-secondary" style="float:right;" href="list.fbo">목록으로</a>
		    <br><br>
		    ​
		    <table id="contentArea" align="center" class="table">
				<tr>
					<th width="100">제목</th>
		            <td colspan="3">${ free.boardTitle }</td>
		        </tr>
		        <tr>
		            <th>작성자</th>
		            <td>${ free.boardWriter }</td>
		            <th>작성일</th>
		            <td>${ free.modifyDate }</td>
		        </tr>
		        <tr>
		            <th>첨부파일</th>
		            <c:choose>
                    <c:when test="${not empty free.originalName }">
                    	<td colspan="3">${ free.originalName }</td>
                    </c:when>
                    <c:otherwise>
                    <td colspan="3">
                        <a href="${free.uploadName}" download="${free.originalName}">${free.originalName}</a>
                    </td>
                    </c:otherwise>
                    </c:choose>
		        </tr>
		        <tr>
		            <th>내용</th>
		            <td colspan="3"></td>
		        </tr>
		        <tr>
		            <td colspan="4"><p style="height:150px;">${ free.boardContent }</p></td>
		        </tr>
		    </table>
		    <br>
		    
		    <c:if test="${loginUser.memberNickname eq free.boardWriter }">
            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <a class="btn btn-primary" onclick="postFormSubmit(0);" >수정하기</a>
                <a class="btn btn-danger" onclick="postFormSubmit(1);" >삭제하기</a>
            </div>
            </c:if>
		    
		    <button id="scrap" class="btn btn-danger">스크랩</button>
			<br><br>
			
		    <form action="" method="post" id="postForm">
				<input type="hidden" name="fno" value="${ free.boardNo }">
			    <input type="hidden" name="filePath" value="${ free.uploadName }"/>
		    </form>
		    
		     <script>
            	function postFormSubmit(num){
            		if( num == 0){
            			$('#postForm').attr('action','updateForm.fbo').submit();//수정하기 클릭시
            		} else {
            			$('#postForm').attr('action','delete.fbo').submit();
            		}
            		
            	}
            </script>
            
            <br><br>
		    
		    <table id="replyArea" class="table" align="center">
				<thead>
					<tr>
						<th colspan="2">
							<textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
		                </th>
		                <th style="vertical-align:middle"><button class="btn btn-secondary">등록하기</button></th>
		            </tr>
		            <tr>
		                <td colspan="3">댓글(<span id="rcount">3</span>)</td>
		            </tr>
		        </thead>
		        <tbody>
		            <tr>
		                <th>user02</th>
		                <td>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ꿀잼</td>
		                <td>2023-03-12</td>
		            </tr>
		            <tr>
		                <th>user01</th>
		                <td>재밌어요</td>
		                <td>2023-03-11</td>
		            </tr>
		            <tr>
		                <th>admin</th>
		                <td>댓글입니다!!</td>
		                <td>2023-03-10</td>
		            </tr>
		        </tbody>
		    </table>
		</div>
		<br><br>
	​
	</div>

	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>