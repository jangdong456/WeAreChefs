const img = document.getElementById("img");

const key = "708dbde015c2691a1b7eeac5da0b8b47";
const redirectUrl = "http://localhost/member/getcode";
const redirectUrl2 = "http://localhost/member/login";

let value = window.location.search

const param = new URLSearchParams(value);
let code = param.get('code');
console.log("파람 확인: " + code);

let a = "authorization_code";
let b = "708dbde015c2691a1b7eeac5da0b8b47";


// response_type=code&client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}
const url = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id="
  + key + "&" + "redirect_uri=" + redirectUrl

// 'http://localhost/member/getcode'
// 'http://localhost/member/getcode'
// 인가 번호 받아오는 메서드


//간편로그인 카카오톡 함수 호출
// Kakao.Auth.authorize()
img.addEventListener("click", () => {
  try {
    Kakao.init('504d6b8218f4cc3a051e12c617300d61'); // 내 앱 키번호 -> 이걸로 등록된 앱인지 확인
    console.log("확인 :" + Kakao.isInitialized()); // true나옴 | SDK 초기화 여부 판단 함수
    if (Kakao.isInitialized()) {
      // 방법 1  url로 get방식


      // 방법 2 함수 호출
      Kakao.Auth.authorize({
        redirectUri: redirectUrl2
      });
    }
  } catch (error) {
    console.log(error.code);
    console.log(error.msg);
  }
})

if (code != null) {
  console.log("토큰 받아오는 if문 실행@@@@@@@")
  try {
    // 토큰 받아오는 메서드
    fetch("https://kauth.kakao.com/oauth/token", {

      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded;charset=utf-8"
      },
      body:
        "grant_type=" + a + "&" + "client_id=" + b + "&" + "redirect_uri=" + redirectUrl2 + "&" + "code=" + code

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
}

