<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/myPage.css">
    

</head>
<body>

    <div id="mypage">
        <div id="profile-image">
            <c:choose>
                <c:when test="${empty loginUser.socialProfile}">
                    <div id="img"><img src="resources/images/nonImage.png" id="profile_img"></div>
                </c:when>
                <c:otherwise>
                    <div id="img"><img src="${sessionScope.loginUser.socialProfile}" id="profile_img"></div>
                </c:otherwise>
            </c:choose>
            
            
            
            <div id="img-btn">
            	<form action="updateProfile" method="post" enctype="multipart/form-data">
            		<input type="file" name="upfile">
            		<input type="hidden" name="memberNo" id="memberNo" value="${sessionScope.loginUser.memberNo }">
                	<button type="submit" id="img-change">사진 바꾸기</button>
                </form>
            </div>
            
            
            <div id="level">
                최고 등급
            </div>
        </div>
        <div id="profile-info">
            <div id="info">
                <span>E-mail : </span> <span>${sessionScope.loginUser.email }</span><br><br>
                <span>이름 : </span> <span>${sessionScope.loginUser.memberName }</span><br><br>
                <span>닉네임 : </span> <span>${sessionScope.loginUser.memberNickname }</span><br><br>
            </div>
            <div id="profile-btn">
                <button id="goodbye" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
                <button id="pwd-change">비밀번호 변경</button>
                <button id="home-btn" onclick="location.href='main'">홈으로</button>
                
            </div>
        </div>
    </div>
	
    <!-- 회원 탈퇴 모달 창-->
    <div class="modal fade" id="deleteForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
​
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원탈퇴</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
​
                <form action="delete" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="center">
                            진심으로 탈퇴 할 각인가요? <br>
                            이렇게 떠나가기엔 지금까지 우리가 함께한 시간이 너무 아깝지 않나요?<br>
                            잘 생각해보세요.<br>
                            당신은 무조건 다시 찾아오게 되어있습니다. 그러면 다시 가입하기 귀찮으시자나요?<br>
                            그러니 그냥 탈퇴 안하고 잠깐 쉬다 오는게 어떠세요?<br>
                            탈퇴 후 복구가 불가능합니다. <br>
                            정말로 탈퇴 하시겠습니까? <br>
                            탈퇴를 원하신다면 회원가입시 입력한 이메일을 입력해주세요.<br>
                        </div>
                        <br>
                            <label for="email" class="mr-sm-2">Email : </label>
                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter Email" id="email" name="email"> <br>
                            <input type="hidden" name="emailCheck" value="${sessionScope.loginUser.email}"/>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>



</body>
</html>