
const membere_mail = document.getElementById("membere_mail");
const emailNumCheck = document.getElementById("emailNumCheck");

console.log("asd");

emailNumCheck.addEventListener("click", ()=>{
    let email = membere_mail.value
    console.log(email);
    fetch("/member/sendEmail?member_mail="+email, {
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



