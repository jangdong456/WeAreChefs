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
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body : 
                "grant_type="+a+"&"+"client_id="+b+"&"+"redirect_uri="+c+"&"+"code="+code
            
        })
        .then(res => res.json())
        .then(res =>  {
            console.log(res.access_token);
            console.log("확인");
            fetch("kakaologin", {
                method : "POST",
                headers:{
                    "Content-type":"application/x-www-form-urlencoded"
                },
                body : "token="+res.access_token

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