const img = document.getElementById("img");

const key = "708dbde015c2691a1b7eeac5da0b8b47";
const redirectUrl = "http://localhost/member/kakaologin";

const url = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id="
              +key+"&"+"redirect_uri="+redirectUrl

// 인가 번호 받아오는 메서드
img.addEventListener("click", ()=> {
  try {
    Kakao.init('504d6b8218f4cc3a051e12c617300d61');
    // console.log("확인 :" +Kakao.isInitialized()); : true나옴 //SDK 초기화 여부 판단 함수
    if(Kakao.isInitialized()) {
        Kakao.Auth.authorize({
        redirectUri: 'http://localhost/member/getcode'
        });
        
    }

  } catch (error) {
    console.log(error.code);
    console.log(error.msg);
  }

   


//   fetch(, {
//     method : "GET"
//   })
//   .then(res => res.json())
//   .then(res => {
//     if(res == "success"){
//       alert("성공");
//     }
//   }).catch(error => {
//     alert("오류발생");
//     console.log(error);
//   })
}) 