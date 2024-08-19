const img = document.getElementById("img");

let value = window.location.search

const param = new URLSearchParams(value);
let code = param.get('code');
console.log("파람 확인: "+ code);


// curl -v -X POST "https://kauth.kakao.com/oauth/token" \
//  -H "Content-Type: application/x-www-form-urlencoded"  // key : value 형식
//  -d "grant_type=authorization_code" \
//  -d "client_id=${REST_API_KEY}" \
//  --data-urlencode "redirect_uri=${REDIRECT_URI}" \
//  -d "code=${AUTHORIZE_CODE}"

// 시크릿 키 : 6e2RlPpX0bNRVuRFRwnIFGagur1hvKg8

// Restful : 708dbde015c2691a1b7eeac5da0b8b47

let a = "authorization_code";
let b = "708dbde015c2691a1b7eeac5da0b8b47";
let c = "http://localhost/member/getcode";

// 토큰 받아오는 메서드
img.addEventListener("click", () => {
    try {
        fetch("https://kauth.kakao.com/oauth/token", {
            
            method : "POST",
            headers : {
                "Content-Type": "application/x-www-form-urlencoded;charset=utf-8"
            },
            body : 
                "grant_type="+a+"&"+"client_id="+b+"&"+"redirect_uri="+c+"&"+"code="+code
            
        })
        .then(res => res.json())
        .then(res =>  {
            let token = res.access_token;
            console.log("토큰발급확인 :"+ token);
            localStorage.setItem("token",token);

            // 토큰으로 사용자 정보 받오는 코드
            return fetch("https://kapi.kakao.com/v2/user/me", {
                method : "GET",
                headers:{
                    "Content-type":"application/x-www-form-urlencoded;charset=utf-8",
                    "Authorization":"Bearer " + `${token}`
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
                let kakaoNickname = res.properties.nickname
                let kakaoImage = res.properties.profile_image
                // id와 nickname, profile_image를 db에 저장한다.
                
                fetch("kakaologin", {
                    method : "POST",
                    headers : { "Content-type":"application/x-www-form-urlencoded" },
                    body: "member_id="+kakaoId+"&kakao_nickname="+kakaoNickname+"&kakao_profile_img="+kakaoImage+"&token="+token
                })  
            })
            
        }).catch((error) =>{
            console.log("에러발생 : " + error);
        })
    } catch (error) {
        console.log(error);
    }
})

// body : {
//     grant_type : "authorization_code",
//     client_id : "708dbde015c2691a1b7eeac5da0b8b47",
//     redirect_uri : "http://localhost/member/getcode",
//     code : code
// }


// Kakao.Auth.setAccessToken('${ACCESS_TOKEN}'); 을 호출을 해서 -> 서비스 서버에서 전달받은 액세스 토큰 값을 JavaScript SDK에서 사용하도록 할당할 수 있습니다.