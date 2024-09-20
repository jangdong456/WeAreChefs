const img = document.getElementById("img");
const redirectUrl2 = "http://localhost/member/login";

let value = window.location.search

const param = new URLSearchParams(value);
let code = param.get('code'); // 파람 값 확인


let a = "authorization_code";

window.onpageshow = function(event) {
  if (event.persisted == true) {
      location.reload(); // js - 새로고침
  }
}

let restKey = "";
let adminKey = ""; 

img.addEventListener("click", ()=> {
  
  // 서버에서 저장된 key값들 가져오는 메서드
  fetch("kakaologin", {
    method : "GET"
  })
  .then(res => res.json())
  .then(res => {
    restKey = res.rest;
    adminKey =res.admin;

    try {
      Kakao.init(res.appKey); // 내 앱 키번호 -> 이걸로 등록된 앱인지 확인
      if(Kakao.isInitialized()) { //SDK 초기화 여부 판단 함수
  
        // 방법 1  url로 get방식
        location.href = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id="
              +restKey+"&redirect_uri="+redirectUrl2+"&prompt=login"
  
        // 방법 2 함수 호출
          // Kakao.Auth.authorize({
          //     redirectUri: redirectUrl2
          // });
      }
    } catch (error) {
      console.log(error);
    }
  })
});

if(code != null) {

  fetch("kakaologin", {
    method : "GET"
  })
  .then(res => res.json())
  .then(res => {
    restKey = res.rest;
    adminKey =res.admin;

    try {
      // 토큰 받아오는 메서드
      fetch("https://kauth.kakao.com/oauth/token", {
  
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded;charset=utf-8"
        },
        body:
          "grant_type=" + a + "&" + "client_id=" + restKey + "&" + "redirect_uri=" + redirectUrl2 + "&" + "code=" + code
  
      })
        .then(res => res.json())
        .then(res => {
          let token = res.access_token;
          console.log("토큰발급확인 :" + token);
          localStorage.setItem("token", token);
  
          // 토큰으로 사용자 정보 받오는 코드
          return fetch("https://kapi.kakao.com/v2/user/me", {
            method: "GET",
            headers: {
              "Content-type": "application/x-www-form-urlencoded;charset=utf-8",
              "Authorization": "Bearer " + `${token}`
            }
          })
            .then(res => res.json())
            .then(res => {
              let kakaoId = res.id
              let member_nickname = res.properties.nickname
              let kakaoImage = res.properties.profile_image
              let member_type = "카카오톡"
              // id와 nickname, profile_image를 db에 저장한다.
  
              fetch("kakaologin", {
                method: "POST",
                headers: { "Content-type": "application/x-www-form-urlencoded" },
                body: "member_id=" + kakaoId + "&member_nickname=" + member_nickname + "&kakao_profile_img=" + kakaoImage + "&token=" + token + "&member_type=" + member_type
              })
                .then(res => res.text())
                .then(res => {
                  if (res > 0) {
                    location.href = "/";
                  }
                })
            })
  
        }).catch((error) => {
          console.log("에러발생 : " + error);
        })
    } catch (error) {
      console.log(error);
    }

  })
}

