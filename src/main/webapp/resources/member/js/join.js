const joinBtn = document.getElementById("join_btn");
const memberJoin = document.getElementsByClassName("member_join");
const memberName = document.getElementById("test");


const nameRegexr = /[a-zA-Z][ㄱ-ㅎ가-힣]{3,12}/;
const idRegexr = /^[a-zA-Z0-9]{4,10}$/;


joinBtn.addEventListener("click", ()=> {
    
    for(let a of memberJoin) {
        if(a.id == "member_name") {
            let b = a.value
            console.log("name 결과 값 :"+ nameRegexr.test(b));

            if(a.value == "") {
                let span = document.createElement('span');
                span.id = 'join_span';
                span.innerHTML = "값을 입력하세요"
                memberName.append(span);
                a.focus();
                
            }
        }

        if(a.id == "member_id") {
            console.log(a.value);
            let b = a.value
            
            console.log("결과 값 :" + idRegexr.test(b));
            // if(a.value == id_regexr) {
            //     alert("정규식 통과");
            //     return;
            // } else {
            //     alert("정규식 실패");
            //     console.log("정규식 실패");
            //     return;
            // }
        }
    }


});