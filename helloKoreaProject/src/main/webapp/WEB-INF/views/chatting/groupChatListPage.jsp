<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/groupChatList.css">
</head>
<body>
    
    <div id="chatting">
        <div id="chat-header">
            <div id="search-condition-area">
                <span>검색조건</span>
                <select id="search-condition" name="search-condition">
                    <option value="roomName">방 이름</option>
                    <option value="memberNickname">방장(닉네임)</option>
                </select>
            </div>
            <div id="serch-value-area">
                <input type="text" id="search-value" name="search-value">
            </div>
            <div id="room-create-btn-area">
                <button id="room-create-btn" data-toggle="modal" data-target="#createRoom">방 만들기</button>
            </div>
        </div>
        <div id="chat-list-area">
            <table>
                <thead>
                    <tr>
                        <th id="th1">방번호</th>
                        <th id="th2">방이름</th>
                        <th id="th3">방장(닉네임)</th>
                        <th id="th4">참여인원</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>한국에서 살아남기</td>
                        <td>김병만</td>
                        <td>21</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>한국에서 살아남기</td>
                        <td>김병만</td>
                        <td>21</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="page-btn"></div>
    </div>


     <!-- 방만들기 모달 창-->
     <div class="modal fade" id="createRoom">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
​
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">채팅방 만들기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
​
                <form action="createChat" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="center">
                            그룹 채팅방
                        </div>
                        <br>
                            <label for="chatTitle" class="mr-sm-2">채팅방 이름 : </label>
                            <input type="text" class="form-control mb-2 mr-sm-2" placeholder="채팅방 이름을 입력하세요" id="chatTitle" name="chatTitle"> <br>
                            <input type="hidden" name="memberNo" value="${sessionScope.loginUser.memberNo}"/>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">만들기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>