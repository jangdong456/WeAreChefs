const img = document.getElementById("img");

const redirectUrl2 = "http://localhost/member/login";
const redirectUrl1 = "http://192.168.7.113/member/login";

let value = window.location.search

const param = new URLSearchParams(value);
let code = param.get('code');
console.log("파람 확인: " + code);

let a = "authorization_code";

// response_type=code&client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}
// const url = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id="
//               +key+"&redirect_uri="+redirectUrl1+"&prompt=login"



window.onpageshow = function(event) {
  if (event.persisted == true) {
      location.reload(); // js - 새로고침
  }
}

//간편로그인 카카오톡 함수 호출
// Kakao.Auth.authorize()

let restKey = "";
let adminKey = ""; 

img.addEventListener("click", ()=> {
  
  fetch("kakaologin", {
    method : "GET"
  })
  .then(res => res.json())
  .then(res => {
    console.log(res.rest);
    console.log(res.admin);
    console.log(res.appKey);
    restKey = res.rest;
    adminKey =res.admin;

    try {
      Kakao.init(res.appKey); // 내 앱 키번호 -> 이걸로 등록된 앱인지 확인
      console.log("확인 :" +Kakao.isInitialized()); // true나옴 | SDK 초기화 여부 판단 함수
      if(Kakao.isInitialized()) {
  
        // 방법 1  url로 get방식
        // location.href = url;
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
              console.log("사용자정보 진입");
              console.log("Bearer " + `${token}`);
              console.log(res)
              console.log(res.id)
              console.log(res.properties.nickname)
              console.log(res.properties.profile_image)
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

