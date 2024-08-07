const userEmail1 = document.getElementById("test");
const userEmail2 = document.getElementById("userEmail2");
const mailBtn = document.getElementById("mailBtn");

console.log("asd");

mailBtn.addEventListener("click", ()=>{
    let email = userEmail1.value + userEmail2.value
    console.log(email);
    fetch("/member/email?member_mail="+email, {
        method : "GET"
    })
    // .then(res => res.json())
    // .then(res => {
    //     console.log(res)
    //     if(res > 0){
    //         alert("성공");
    //         location.href="/member/email";
    //     } else {
    //         alert("실패");
    //     }
    // }).catch(() => {
    //     alert("오류발생");
    // });
})

