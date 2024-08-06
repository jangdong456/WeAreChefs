const memberId = document.getElementById("member_id"); 
const memberPwd = document.getElementById("member_pwd");
const loginBtn = document.getElementById("login_btn");


loginBtn.addEventListener("click", () => {

    fetch("login", {
        method: "POST",
        headers:{
            "Content-type":"application/x-www-form-urlencoded"
        },
        body : "member_id="+memberId.value+"&"+"member_pwd="+memberPwd.value
        })
        .then(res => res.json())
        .then(res => {
            
            if(res>0) {
                alert("로그인 성공");
                location.href="/";
            } else {
                alert("비밀번호가 일치하지 않습니다");
            }
        })
        .catch(()=> {
            alert("오류발생");
        })
   
})

