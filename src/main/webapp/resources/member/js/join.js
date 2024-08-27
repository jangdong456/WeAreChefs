const joinBtn = document.getElementById("join_btn");
const memberJoin = document.getElementsByClassName("member_join");

// value
const memberName = document.getElementById("member_name");
const memberNickname = document.getElementById("member_nickname");
const memberId = document.getElementById("member_id");
const memberPwd = document.getElementById("member_pwd");
const memberEmail = document.getElementById("membere_mail"); 
const memberPhone = document.getElementById("member_phone");

//중복체크
const joinForm = document.getElementById("joinForm");
const nickNameCheck = document.getElementById("nickNameCheck");
const idCheck = document.getElementById("idCheck");
const pwdCheck = document.getElementById("pwdCheck");
const phoneCheck = document.getElementById("phoneCheck");

//정규식
const regexpName     = /^[가-힣a-zA-Z]+$/;
const regexpNickname = /^[가-힣|a-z|A-Z|0-9|]{2,10}$/;
const regexpId = /^[a-z|A-Z|0-9|]{2,12}$/;
const regexpPassword = /^(?=.*\d)(?=.*[a-z])(?=.*[a-zA-Z]).{8,12}$/;
const regexpEmail    = /^(\w{1,20})+@(\w{1,20})+\.([a-zA-Z]{2,4}$)+$/;
const regexpPhone    = /^[010|011|016|017|018|019]{3}-\d{3,4}-\d{4}$/;

//이메일 관련                                  
const joinTopTag = document.getElementById("joinTopTag");

joinTopTag.addEventListener("click", (e) => {
    if(e.target.id == "emailNumCheckBtn"){
        //  생성된 element는 처음에 로드될때 없기에 test.addEventListener를 하면 email.js에서 만들어놓 element를 파악 가능 하기에 
        // 밑에 emailNumCheck.value를 가져올 수 있다. 
        const emailNumCheck = document.getElementById("emailNumCheck");
        const mailnum = localStorage.getItem("mailnum");
        const emailNumCheckBtn = document.getElementById("emailNumCheckBtn");
        const emailbtn = document.getElementById("emailbtn");

        if(emailNumCheck.value == mailnum) {
            emailNumCheck.remove();
            emailNumCheckBtn.remove();
            emailbtn.setAttribute('disabled', false)
            emailbtn.setAttribute('data-check', true)
        } else {
            alert("인증번호가 다릅니다.")
        }
    }
})

memberId.addEventListener("input", () =>{
    idCheck.disabled = false
})

memberNickname.addEventListener("input", () =>{
    nickNameCheck.disabled = false
})

memberPhone.addEventListener("input", () =>{
    phoneCheck.disabled = false
})

// memberEmail.addEventListener("input", () =>{
//     emailbtn.disabled = false
// })

// 휴대폰 중복체크
phoneCheck.addEventListener("click", ()=>{
    
    if(!regexpPhone.test(memberPhone.value)){
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "전화번호 형식이 틀립니다";
        memberPhone.parentNode.append(span);
        memberPhone.focus();

        memberPhone.addEventListener("click", () =>{
            span.remove();
        });
        joinBtn.addEventListener("click", ()=> {
            span.remove();
        })
        phoneCheck.addEventListener("click",()=> {
            console.log("중복확인 클릭시 사라져아함")
            span.remove();
        })
        return;
    } else {
        fetch("duplication?member_phone="+memberPhone.value, {
            method : "GET"
        })
        .then(res => res.text())
        .then(res => {
            if(res > 0) {
                let span = document.createElement('span');
                span.id = 'join_span';
                span.innerHTML = "이미 존재하는 휴대폰 번호 입니다.";
                memberPhone.parentNode.append(span);
                memberPhone.focus();
                memberPhone.addEventListener("click", () =>{
                    span.remove();
                });
                joinBtn.addEventListener("click", ()=> {
                    span.remove();
                })
                phoneCheck.addEventListener("click",()=> {
                    span.remove();
                })
                
            } else {
                let span = document.createElement('span');
                span.id = 'join_span';
                span.innerHTML = "사용 할 수 있는 휴대폰 번호 입니다.";
                memberPhone.parentNode.append(span);
                memberPhone.focus();
                memberPhone.addEventListener("click", () =>{
                    span.remove();
                });
                joinBtn.addEventListener("click", ()=> {
                    span.remove();
                })
                phoneCheck.addEventListener("click",()=> {
                    span.remove();
                })
                phoneCheck.disabled = true
                
            }
        })
    }
})


// 닉네임 중복체크
nickNameCheck.addEventListener("click", ()=>{
    
    if(!regexpNickname.test(memberNickname.value)){
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "한글 또는 영문 , 2~10자리로 입력해주세요";
        memberNickname.parentNode.append(span);
        memberNickname.focus();

        memberNickname.addEventListener("click", () =>{
            span.remove();
        });
        joinBtn.addEventListener("click", ()=> {
            span.remove();
        })
        nickNameCheck.addEventListener("click",()=> {
            console.log("중복확인 클릭시 사라져아함")
            span.remove();
        })
        return;
    } else {
        fetch("duplication?member_nickname="+memberNickname.value, {
            method : "GET"
        })
        .then(res => res.text())
        .then(res => {
            if(res > 0) {
                let span = document.createElement('span');
                span.id = 'join_span';
                span.innerHTML = "이미 존재하는 닉네임 입니다.";
                memberNickname.parentNode.append(span);
                memberNickname.focus();
                memberNickname.addEventListener("click", () =>{
                    span.remove();
                });
                joinBtn.addEventListener("click", ()=> {
                    span.remove();
                })
                nickNameCheck.addEventListener("click",()=> {
                    span.remove();
                })
                
            } else {
                let span = document.createElement('span');
                span.id = 'join_span';
                span.innerHTML = "사용 할 수 있는 닉네임 입니다.";
                memberNickname.parentNode.append(span);
                memberNickname.focus();
                memberNickname.addEventListener("click", () =>{
                    span.remove();
                });
                joinBtn.addEventListener("click", ()=> {
                    span.remove();
                })
                nickNameCheck.addEventListener("click",()=> {
                    span.remove();
                })
                nickNameCheck.disabled = true
                
            }
        })
    }
})

// 아이디 중복체크
idCheck.addEventListener("click", ()=>{
    if(!regexpId.test(memberId.value)){
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "한글 또는 영문 , 2~12자리로 입력해주세요";
        memberId.parentNode.append(span);
        memberId.focus();

        memberId.addEventListener("click", () =>{
            span.remove();
        });
        joinBtn.addEventListener("click", ()=> {
            span.remove();
        })
        idCheck.addEventListener("click",()=> {
            span.remove();
        })
        return;
        
    } else {
        fetch("duplication?member_id="+memberId.value, {
            method : "GET"
        })
        .then(res => res.text())
        .then(res => {
            if(res > 0) {
                let span = document.createElement('span');
                span.id = 'join_span';
                span.innerHTML = "이미 존재하는 아이디 입니다.";
                memberId.parentNode.append(span);
                memberId.focus();
                memberId.addEventListener("click", () =>{
                    span.remove();
                });
                joinBtn.addEventListener("click", ()=> {
                    span.remove();
                })
                idCheck.addEventListener("click",()=> {
                    span.remove();
                })
                
            } else {
                let span = document.createElement('span');
                span.id = 'join_span';
                span.innerHTML = "사용 할 수 있는 아이디 입니다.";
                memberId.parentNode.append(span);
                memberId.focus();
                memberId.addEventListener("click", () =>{
                    span.remove();
                });
                joinBtn.addEventListener("click", ()=> {
                    span.remove();
                })
                idCheck.addEventListener("click",()=> {
                    span.remove();
                })
                idCheck.disabled = true
                
            }
        })
    }
})

// 휴대폰 - (하이폰) 자동 넣기 
memberPhone.addEventListener("input", (e)=> {
    e.target.value = e.target.value.replace(/[^0-9]/g, "").replace(/^(010|011|016|017|018|019{3})(\d{3,4})(\d{4})$/, `$1-$2-$3`) 
});


joinBtn.addEventListener("click", ()=> {
    
    // 이름
    if(!regexpName.test(memberName.value)) {
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "한글 또는 영문으로 값을 입력해주세요";
        memberName.parentNode.append(span);
        memberName.focus();
        memberName.addEventListener("click", () =>{
            span.remove();
        });
        joinBtn.addEventListener("click", ()=> {
            span.remove();
        })
        return;
    }

    // 닉네임
    if(!regexpNickname.test(memberNickname.value)){
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "한글 또는 영문 , 2~10자리로 입력해주세요";
        memberNickname.parentNode.append(span);
        memberNickname.focus();
        memberNickname.addEventListener("click", () =>{
            span.remove();
        });
        joinBtn.addEventListener("click", ()=> {
            span.remove();
        })
        return;  
    }

    // 닉네임 중복확인 버튼 비활성화 체크
    if(!nickNameCheck.disabled) {

        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "중복확인 해주시길 바랍니다.";
        memberNickname.parentNode.append(span);
        memberNickname.focus();
        memberNickname.addEventListener("click", () =>{
            span.remove();
        });
        joinBtn.addEventListener("click", ()=> {
            span.remove();
        })
        return; 
    }

    // 아이디
    if(!regexpId.test(memberId.value)){
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "영문으로만 2~12자리 입력해주세요";
        memberId.parentNode.append(span);
        memberId.focus();
        memberId.addEventListener("click", () =>{
            span.remove();
        });
        joinBtn.addEventListener("click", ()=> {
            span.remove();
        })
        return;
    }

    // 아이디 중복확인 버튼 비활성화 체크
    if(!idCheck.disabled) {
        
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "중복확인 해주시길 바랍니다.";
        memberId.parentNode.append(span);
        memberId.focus();
        memberId.addEventListener("click", () =>{
            span.remove();
        });
        joinBtn.addEventListener("click", ()=> {
            span.remove();
        })
        return; 
    }

    // 비밀번호
    if(!regexpPassword.test(memberPwd.value)){
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "영문 과 숫자 8~12자리 조합으로 입력해주세요.(특수문자 사용가능)";
        memberPwd.parentNode.append(span);
        memberPwd.focus();
        memberPwd.addEventListener("click", () =>{
            span.remove();
        });
        joinBtn.addEventListener("click", ()=> {
            span.remove();
        })
        return;
    }

    //비밀번호 확인
    if(pwdCheck.value != memberPwd.value) {
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "패스워드가 일치하지 않습니다.";
        pwdCheck.parentNode.append(span);
        pwdCheck.focus();
        memberPwd.addEventListener("click", () =>{
            span.remove();
        });
        pwdCheck.addEventListener("click", () =>{
            span.remove();
        });
        joinBtn.addEventListener("click", ()=> {
            span.remove();
        })
        return;
    }

    // 이메일
    if(!regexpEmail.test(memberEmail.value)){
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "이메일 형식이 틀립니다";
        memberEmail.parentNode.append(span);
        memberEmail.focus();
        memberEmail.addEventListener("click", () =>{
            span.remove();
        });
        joinBtn.addEventListener("click", ()=> {
            span.remove();
        })
        return;
    }

    //이메일 중복확인 체크
    if(emailbtn.getAttribute("data-check") != 'true') {
        alert("이메일 중복확인 해주세요")
        return;
    }
   

    // 전화번호
    if(!regexpPhone.test(memberPhone.value)){
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "전화번호 형식이 틀립니다";
        memberPhone.parentNode.append(span);
        memberPhone.focus();
        memberPhone.addEventListener("click", () =>{
            span.remove();
        })
        joinBtn.addEventListener("click", ()=> {
            span.remove();
        })
        return;
    }

    // 전화번호 중복확인 버튼 비활성화 체크
    if(!phoneCheck.disabled) {
    
        let span = document.createElement('span');
        span.id = 'join_span';
        span.innerHTML = "중복확인 해주시길 바랍니다.";
        memberPhone.parentNode.append(span);
        memberPhone.focus();
        memberPhone.addEventListener("click", () =>{
            span.remove();
        });
        joinBtn.addEventListener("click", ()=> {
            span.remove();
        })
        return; 
    }

    fetch("join", {
        method : "POST",
        headers:{
            "Content-type":"application/x-www-form-urlencoded"
        },
        body : "member_id="+memberId.value + "&member_name="+memberName.value + "&member_mail="+memberEmail.value + "&member_pwd="+memberPwd.value
        + "&member_phone="+memberPhone.value + "&member_nickname="+memberNickname.value
    })
    .then(res => res.text())
    .then(res => {
        if(res > 0) {
            alert("회원가입이 되셨습니다. 로그인후 이용하시길 바랍니다.");
            location.href = "/member/login";
        } else {
            alert("회원가입 실패");
        }
    }).catch(()=> {
        alert("오류발생");
    });  
});