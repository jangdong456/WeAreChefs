const joinBtn = document.getElementById("join_btn");
const memberJoin = document.getElementsByClassName("member_join");

const memberName = document.getElementById("member_name");
const memberNickname = document.getElementById("member_nickname");
const memberId = document.getElementById("member_id");
const memberPwd = document.getElementById("member_pwd");
const memberEmail = document.getElementById("membere_mail");
const memberPhone = document.getElementById("member_phone");

const regexpName     = /^[가-힣a-zA-Z]+$/;
const regexpNickname = /^[가-힣|a-z|A-Z|0-9|]{2,10}$/;
const regexpId = /^[a-z|A-Z|0-9|]{2,12}$/;
const regexpPassword = /^(?=.*\d)(?=.*[a-z])(?=.*[a-zA-Z]).{8,12}$/;
const regexpEmail    = /^(\w{1,20})+@(\w{1,20})+\.([a-zA-Z]{2,4}$)+$/;
const regexpPhone    = /^[010|011|016|017|018|019]{3}-\d{3,4}-\d{4}$/;


joinBtn.addEventListener("click", ()=> {
    
    if(regexpName.test(memberName.value)) {
        
    } else {
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "한글 또는 영문으로 값을 입력해주세요";
        memberName.parentNode.append(span);
        memberName.focus();
        memberName.addEventListener("click", () =>{
            span.remove();
            return;
        });
    };


    if(regexpNickname.test(memberNickname.value)){
        
    } else {
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "한글 또는 영문 , 2~10자리로 입력해주세요";
        memberNickname.parentNode.append(span);
        memberNickname.focus();
        memberNickname.addEventListener("click", () =>{
            span.remove();
            return;
        });
    };

    if(regexpId.test(memberId.value)){
        
    } else {
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "영문으로만 2~12자리 입력해주세요";
        memberId.parentNode.append(span);
        memberId.focus();
        memberId.addEventListener("click", () =>{
            span.remove();
            return;
        });
    };

    if(regexpPassword.test(memberPwd.value)){
        
    } else {
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "영문 과 특수문자 8~12자리 조합으로 입력해주세요";
        memberPwd.parentNode.append(span);
        memberPwd.focus();
        memberPwd.addEventListener("click", () =>{
            span.remove();
            return;
        });
    };

    if(regexpEmail.test(memberEmail.value)){
        
    } else {
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "이메일 형식이 틀립니다";
        memberEmail.parentNode.append(span);
        memberEmail.focus();
        memberEmail.addEventListener("click", () =>{
            span.remove();
            return;
        });
    };

    if(regexpPhone.test(memberPhone.value)){
        
    } else {
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "전화번호 형식이 틀립니다";
        memberPhone.parentNode.append(span);
        memberPhone.focus();
        memberPhone.addEventListener("click", () =>{
            span.remove();
            return;
        });
    };
    
    // fetch("join", {
    //     method : "POST",
    //     // contentType: "application/json",
    //     body : JSON.stringify({
    //         member_name : memberName.value,
    //         member_nickname : memberNickname.value,
    //         member_id : memberId.value,
    //         member_pwd : memberPwd.value,
    //         member_mail : memberEmail.value,
    //         memberPhone : memberPhone.value
    //     })
    //     .then(res=> res.json())
    //     .then(res=> {
    //         console.log(res);
    //         if(res>0) {
    //             alert("회원가입 완료");
    //         } 
    //     })
    //     .catch(()=> {
    //         alert("오류발생");
    //     })

    //     });
    
});