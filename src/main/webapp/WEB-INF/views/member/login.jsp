<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>login page</h1>
	<form action="">
		<script>
			const key = '504d6b8218f4cc3a051e12c617300d61';
			// 카카오 초기화
			Kakao.init(key);
			console.log(Kakao.isInitialized());
			Kakao.isInitialized();
		</script>
		<div>
			<input>
			<button>로그인</button>
		</div>	
	</form>
	<div>
		<script>
					function loginWithKakao() {
			Kakao.Auth.authorize({
			redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
			});
		}
		</script>
		<a href="#"> 
			<img src="/resources/images/kakao_login_medium_narrow.png"  width="200px" height="150px" alt="로그인">
		</a>
	</div>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js" 
		integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous">
</script>
<script src="/resources/js/member/member.js"></script>

</body>
</html>



<!-- <script src="https://t1.kakaocdn.net/kakao_js_sdk/${VERSION}/kakao.min.js"
		integrity="${INTEGRITY_VALUE}" crossorigin="anonymous">
</script> -->
<!-- <script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script> -->