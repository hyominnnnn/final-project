<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="resources/css/logon.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>

    

</style>


</head>
<body>
    <div id="frame">
        <div>
            <h2>회윈가입</h2>
        </div>
        <br><br>
        <div id="top">
            <div class="choice" id="korean">
                
                    <div class="image">
                        <a href="LogonForm?status=K"><img src="https://svgsilh.com/svg/1633249.svg" width="150" height="150"></a>
                    </div>
                    <div>
                        <a href="LogonForm?status=K"><span class="kofo">한국인</span></a>
                    </div>
                
            </div>
            
            <div class="choice" id="foreigner">
                <div class="image">
                    <a href="LogonForm?status=F"><img src="https://svgsilh.com/svg/1633249.svg" width="150" height="150"></a>
                </div>
                <div>
                    <a href="LogonForm?status=F"><span class="kofo">Foreigner</span></a>
                </div>
            </div>
        </div>

        <br><br>
        <!--간편가입 버튼-->
        <table>
        	<tr>
        		<td>
        			<a id="naver-login">
						<img src="resources/images/btnG_naver.png" width="100" heigth="100"/>
					</a>
        		</td>
        		<td>
        		 <a id="kakao-login">
					<img src="resources/images/kakao_btn_icon.png" width="100" heigth="100"/>
				</a>
        		</td>
        		<td>
       			 <a id="google-login">
					<img src="resources/images/google_btn.png" width="100" heigth="100"/>
				</a>
        		</td>
        	</tr>
        </table>
   






    </div>

	<script>
		$(function(){
			$('#kakao-login').click(function(){
				location.href = 'https://kauth.kakao.com/oauth/authorize?client_id=cffe893c81dfeaa4bdcec332321e0001&redirect_uri=http://localhost:9999/korea/code&response_type=code&scope=profile_image';
			});
		});
		
		$(function(){
			$('#naver-login').click(function(){
				location.href = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=Tf_XaxBirROlA8S513Ix&redirect_uri=http://localhost:9999/korea/ncode';
			});
		});
		
		$(function(){
			$('#google-login').click(function(){
				location.href = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=Tf_XaxBirROlA8S513Ix&redirect_uri=http://localhost:9999/korea/ncode';
			});
		});
	
	
	</script>



</body>
</html>