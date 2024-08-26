
const membere_mail = document.getElementById("membere_mail");
const emailNumCheck = document.getElementById("emailNumCheck");


console.log("asd");

emailNumCheck.addEventListener("click", ()=>{
    let email = membere_mail.value
    console.log(email);
    fetch("/member/sendEmail?member_mail="+email, {
        method : "GET"
    })
    .then(res => res.json())
    .then(res => {
        console.log(res)
        if(res > 0){
            console.log("성공");
            localStorage.setItem("mailnum", res)
            let input = document.createElement('input');
            let btn = document.createElement("button");
            membere_mail.parentNode.append(input);
            membere_mail.parentNode.append(btn);
            input.focus();
        } else {
           console.log("실패");
        }
    }).catch(() => {
        alert("오류발생");
    });
})



