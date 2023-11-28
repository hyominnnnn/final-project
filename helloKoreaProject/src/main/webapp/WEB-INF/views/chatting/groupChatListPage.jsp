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
                        <th id="th5">생성날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="5">채팅방이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
               			<c:forEach var="c" items="${list }">
							<tr class="list">
								<td>${c.chatNo }</td>
								<td>${c.chatTitle }</td>
								<td>${c.memberNo }</td>
								<td><c:out value="참여인원"/></td>
								<td>${c.chatEnrollDate }</td>
							</tr>
						</c:forEach>
                 	</c:otherwise>
                 </c:choose>
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
                        <button type="submit" class="btn btn-danger" onclick="connect();">만들기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- 채팅방 -->
    <script>
    <!-- 헨드쉐이크 인터셉터 사용해서 들고오기 -->
    	var nickname = "<c:out value='${sessionScope.loginUser.memberNickname}' />";
    	console.log(nickname);
    	
    	
    	function connect(){
    		
        	location.href = 'getMemberInfo';
        	
    		const uri = 'ws://localhost:9999/korea/chat';
    		
    		socket = new WebSocket(uri);
    		socket.onopen = () => {
    			console.log('서버와 연결!!');
    		}
    	}
    </script>
    
    <!--페이징바-->
		<div class="paging-area" align="center">
			<c:if test="${pi.currentPage ne 1 }">
			<button onclick="location.href='groupChatList?cPage=${pi.currentPage -1 }'" class="btn btn-outline-secondary">&lt;</button>
			</c:if>
			
			
			<c:forEach var="i" begin="${pi.startPage }" end="${pi.endPage}">
				<c:choose>
					<c:when test="${pi.currentPage ne i }">
						<button onclick="location.href='groupChatList?cPage=${i}'" class="btn btn-outline-secondary">${i }</button>
					</c:when>
					<c:otherwise>
						<button disabled class="btn btn-outline-secondary">${i }</button>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${pi.currentPage ne pi.maxPage }">
				<button onclick="location.href='groupChatList?cPage=${pi.currentPage + 1 }'" class="btn btn-outline-secondary">&gt;</button>
			</c:if>
			
		</div>
    
</body>
</html>