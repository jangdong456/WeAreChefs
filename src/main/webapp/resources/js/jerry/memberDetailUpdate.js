// 루트 div
let divDetail = document.getElementById("divDetail");
// 수정 완료 및 취소 버튼
let compeleteBtn = document.getElementById("completeBtn");
let cancelBtn = document.getElementById("cancelBtn");
// 초기 input태그 값
let oriMemberId = document.getElementById("inputMemberId").value;
let oriMemberNickname = document.getElementById("inputMemberNickname").value;
let oriMemberName = document.getElementById("inputMemberName").value;
let oriMemberMail = document.getElementById("inputMemberMail").value;
let oriMemberPhone = document.getElementById("inputMemberPhone").value;
// 제약조건
const regexpName     = /^[가-힣a-zA-Z]+$/;
const regexpNickname = /^[가-힣|a-z|A-Z|0-9|]{2,10}$/;
const regexpId = /^[a-zA-Z0-9]+$/;
const regexpPassword = /^(?=.*\d)(?=.*[a-z])(?=.*[a-zA-Z]).{8,12}$/;
const regexpEmail    = /^(\w{1,20})+@(\w{1,20})+\.([a-zA-Z]{2,4}$)+$/;
const regexpPhone    = /^[010|011|016|017|018|019]{3}-\d{3,4}-\d{4}$/;
// 제약조건 충족 불충족 구분
let bMemberNickname = false;
let bMemberName = false;
let bMemberMail = false;
let bMemberPhone = false;


// 키보드를 눌렀을 때 작동하는 기능--------------------------------------------------------------------------------------------------------

divDetail.addEventListener('keyup',()=>{
  
  let memberNickname = document.getElementById("inputMemberNickname");
  let memberName = document.getElementById("inputMemberName");
  let memberMail = document.getElementById("inputMemberMail");
  let memberPhone = document.getElementById("inputMemberPhone");
  
  // 제약조건 검사 시작
  let confirmMemberNickname = document.getElementById("confirmMemberNickname");
  let confirmMemberName = document.getElementById("confirmMemberName");
  let confirmMemberMail = document.getElementById("confirmMemberMail");
  let confirmMemberPhone = document.getElementById("confirmMemberPhone");

  // MemberNickname
  if(document.activeElement === memberNickname || bMemberNickname == true){
    if(memberNickname.value.length < 2 || memberNickname.value.length > 10){
      confirmMemberNickname.classList.replace("afterHtag","foreHtag");
      confirmMemberNickname.textContent = '값을 2 ~ 10자 이내로 입력해주세요.';
      bMemberNickname = true;
      memberNickname.focus();
    }else if(!regexpNickname.test(memberNickname.value)){
      confirmMemberNickname.classList.replace("afterHtag","foreHtag");
      confirmMemberNickname.textContent = '한글, 영문, 숫자만 입력 가능합니다.';
      bMemberNickname = true;
      memberNickname.focus();
    }else if(regexpNickname.test(memberNickname.value)){
      let form = new FormData();
      form.append("member_nickname", memberNickname.value);
      form.append("oriMember_nickname", oriMemberNickname);
      fetch("memberNicknameConfirm",{
        method:"POST",
        body:form
      })
      .then(r=>r.text())
      .then(r=>{
        if(r>0){
          confirmMemberNickname.classList.replace("afterHtag","foreHtag");
          confirmMemberNickname.textContent = '중복된 닉네임입니다.';
          bMemberNickname = true;
          memberNickname.focus();
        }else if(r==0){
          confirmMemberNickname.classList.replace("foreHtag", "afterHtag");
          confirmMemberNickname.textContent = '사용 가능한 닉네임입니다.'
          bMemberNickname = false;
        }
      })
    }
  }

  //MemberName
  if(document.activeElement === memberName || bMemberName == true){
    if(!regexpName.test(memberName.value)){
      confirmMemberName.classList.replace("afterHtag","foreHtag");
      confirmMemberName.textContent = '한글, 영어만 사용할 수 있습니다.';
      bMemberName = true;
      memberName.focus();
    }else if(regexpName.test(memberName.value)){
      confirmMemberName.classList.replace("foreHtag", "afterHtag");
      confirmMemberName.textContent = '사용 가능한 이름입니다.'
      bMemberName = false;
    }
  }

  // Member Mail
  if(document.activeElement === memberMail || bMemberMail == true){
    if(!regexpEmail.test(memberMail.value)){
      confirmMemberMail.classList.replace("afterHtag","foreHtag");
      confirmMemberMail.textContent = '이메일 형식에 맞게 입력해주세요.';
      bMemberMail = true;
      memberMail.focus();
    }else if(regexpEmail.test(memberMail.value)){
      let form = new FormData();
      form.append("member_mail", memberMail.value);
      form.append("oriMember_mail", oriMemberMail);
      fetch("memberMailConfirm",{
        method:"POST",
        body:form
      })
      .then(r=>r.text())
      .then(r=>{
        if(r>0){
          confirmMemberMail.classList.replace("afterHtag","foreHtag");
          confirmMemberMail.textContent = '중복된 이메일입니다.';
          bMemberMail = true;
          memberMail.focus();
        }else if(r==0){
          confirmMemberMail.classList.replace("foreHtag", "afterHtag");
          confirmMemberMail.textContent = '사용 가능한 이메일입니다.'
          bMemberMail = false;
        }
      })
    }
  }

  // Member phone
  if(document.activeElement === memberPhone || bMemberPhone == true){
    memberPhone.addEventListener("input", (e)=> {
      e.target.value = e.target.value.replace(/[^0-9]/g, "").replace(/^(010|011|016|017|018|019{3})(\d{3,4})(\d{4})$/, `$1-$2-$3`) 
    });
    if(!regexpPhone.test(memberPhone.value)){
      confirmMemberPhone.classList.replace("afterHtag","foreHtag");
      confirmMemberPhone.textContent = '전화번호 형식에 맞게 입력해주세요.';
      bMemberPhone = true;
      memberPhone.focus();
    }else if(regexpPhone.test(memberPhone.value)){
      let form = new FormData();
      form.append("member_phone", memberPhone.value);
      form.append("oriMember_phone", oriMemberPhone);
      fetch("memberPhoneConfirm",{
        method:"POST",
        body:form
      })
      .then(r=>r.text())
      .then(r=>{
        if(r>0){
          confirmMemberPhone.classList.replace("afterHtag","foreHtag");
          confirmMemberPhone.textContent = '중복된 전화번호입니다.';
          bMemberPhone = true;
          memberPhone.focus();
        }else if(r==0){
          confirmMemberPhone.classList.replace("foreHtag", "afterHtag");
          confirmMemberPhone.textContent = '사용 가능한 전화번호입니다.'
          bMemberPhone = false;
        }
      })
    }
  }

  
})


// 마우스로 클릭했을 경우 작동하는 기능--------------------------------------------------------------------------------------------------------
divDetail.addEventListener("click", (e)=>{
  let id = e.target.getAttribute("id");

  let memberId = document.getElementById("inputMemberId");
  let memberPw = document.getElementById("inputMemberPwd");
  let memberNickname = document.getElementById("inputMemberNickname");
  let memberName = document.getElementById("inputMemberName");
  let memberMail = document.getElementById("inputMemberMail");
  let memberPhone = document.getElementById("inputMemberPhone");
  let memberLev = document.getElementById("inputMemberLev");
  
  // 제약조건 검사 시작
  let confirmMemberNickname = document.getElementById("confirmMemberNickname");
  let confirmMemberName = document.getElementById("confirmMemberName");
  let confirmMemberMail = document.getElementById("confirmMemberMail");
  let confirmMemberPhone = document.getElementById("confirmMemberPhone");

  // MemberNickname
  if(document.activeElement === memberNickname || bMemberNickname == true){
    if(memberNickname.value.length < 2 || memberNickname.value.length > 10){
      confirmMemberNickname.classList.replace("afterHtag","foreHtag");
      confirmMemberNickname.textContent = '값을 2 ~ 10자 이내로 입력해주세요.';
      bMemberNickname = true;
      memberNickname.focus();
    }else if(!regexpNickname.test(memberNickname.value)){
      confirmMemberNickname.classList.replace("afterHtag","foreHtag");
      confirmMemberNickname.textContent = '한글, 영문, 숫자만 입력 가능합니다.';
      bMemberNickname = true;
      memberNickname.focus();
    }else if(regexpNickname.test(memberNickname.value)){
      let form = new FormData();
      form.append("member_nickname", memberNickname.value);
      form.append("oriMember_nickname", oriMemberNickname);
      fetch("memberNicknameConfirm",{
        method:"POST",
        body:form
      })
      .then(r=>r.text())
      .then(r=>{
        if(r>0){
          confirmMemberNickname.classList.replace("afterHtag","foreHtag");
          confirmMemberNickname.textContent = '중복된 닉네임입니다.';
          bMemberNickname = true;
          memberNickname.focus();
        }else if(r==0){
          confirmMemberNickname.classList.replace("foreHtag", "afterHtag");
          confirmMemberNickname.textContent = '사용 가능한 닉네임입니다.'
          bMemberNickname = false;
        }
      })
    }
  }

  //MemberName
  if(document.activeElement === memberName || bMemberName == true){
    if(!regexpName.test(memberName.value)){
      confirmMemberName.classList.replace("afterHtag","foreHtag");
      confirmMemberName.textContent = '한글, 영어만 사용할 수 있습니다.';
      bMemberName = true;
      memberName.focus();
    }else if(regexpName.test(memberName.value)){
      confirmMemberName.classList.replace("foreHtag", "afterHtag");
      confirmMemberName.textContent = '사용 가능한 이름입니다.'
      bMemberName = false;
    }
  }

  // Member Mail
  if(document.activeElement === memberMail || bMemberMail == true){
    if(!regexpEmail.test(memberMail.value)){
      confirmMemberMail.classList.replace("afterHtag","foreHtag");
      confirmMemberMail.textContent = '이메일 형식에 맞게 입력해주세요.';
      bMemberMail = true;
      memberMail.focus();
    }else if(regexpEmail.test(memberMail.value)){
      let form = new FormData();
      form.append("member_mail", memberMail.value);
      form.append("oriMember_mail", oriMemberMail);
      fetch("memberMailConfirm",{
        method:"POST",
        body:form
      })
      .then(r=>r.text())
      .then(r=>{
        if(r>0){
          confirmMemberMail.classList.replace("afterHtag","foreHtag");
          confirmMemberMail.textContent = '중복된 이메일입니다.';
          bMemberMail = true;
          memberMail.focus();
        }else if(r==0){
          confirmMemberMail.classList.replace("foreHtag", "afterHtag");
          confirmMemberMail.textContent = '사용 가능한 이메일입니다.'
          bMemberMail = false;
        }
      })
    }
  }

  // Member phone
  if(document.activeElement === memberPhone || bMemberPhone == true){
    memberPhone.addEventListener("input", (e)=> {
      e.target.value = e.target.value.replace(/[^0-9]/g, "").replace(/^(010|011|016|017|018|019{3})(\d{3,4})(\d{4})$/, `$1-$2-$3`) 
    });
    if(!regexpPhone.test(memberPhone.value)){
      confirmMemberPhone.classList.replace("afterHtag","foreHtag");
      confirmMemberPhone.textContent = '전화번호 형식에 맞게 입력해주세요.';
      bMemberPhone = true;
      memberPhone.focus();
    }else if(regexpPhone.test(memberPhone.value)){
      let form = new FormData();
      form.append("member_phone", memberPhone.value);
      form.append("oriMember_phone", oriMemberPhone);
      fetch("memberPhoneConfirm",{
        method:"POST",
        body:form
      })
      .then(r=>r.text())
      .then(r=>{
        if(r>0){
          confirmMemberPhone.classList.replace("afterHtag","foreHtag");
          confirmMemberPhone.textContent = '중복된 전화번호입니다.';
          bMemberPhone = true;
          memberPhone.focus();
        }else if(r==0){
          confirmMemberPhone.classList.replace("foreHtag", "afterHtag");
          confirmMemberPhone.textContent = '사용 가능한 전화번호입니다.'
          bMemberPhone = false;
        }
      })
    }
  }

  // 수정 완료
  if(id == 'completeBtn'){
    console.log('비번' + memberPw.value);
    if(bMemberNickname == false && bMemberName == false && bMemberMail == false && bMemberPhone == false){
      let form = new FormData();
      form.append("member_id", memberId.value);
      form.append("member_pwd", memberPw.value);
      form.append("oriMember_id", oriMemberId);
      form.append("member_nickname", memberNickname.value);
      form.append("member_name", memberName.value);
      form.append("member_mail", memberMail.value);
      form.append("member_phone", memberPhone.value);
      form.append("member_lev", memberLev.value);
      fetch("memberDetailUpdate", {
        method: "POST",
        body: form
      })
      .then(r=>r.text())
      .then(r=>{
        console.log('r : ' + r);
        divDetail.innerHTML = r;
      })
      swal({
        title: "알림",
        text: "수정이 완료되었습니다.",
        type: "warning",
        buttons: {
          confirm: {
            text: "OK",
            className: "btn btn-success",
          }
        }
      })
    }else{
      swal({
        title: "※ 경고 ※",
        text: "작성 형식에 맞는 값들을 넣어주세요.",
        type: "warning",
        buttons: {
          confirm: {
            text: "OK",
            className: "btn btn-success",
          }
        }
      })
    }
  }

  // 수정 취소
  if(id == 'cancelBtn'){
    swal({
      title: "알림",
      text: "수정이 취소되었습니다.",
      type: "warning",
      buttons: {
        confirm: {
          text: "OK",
          className: "btn btn-success",
        }
      }
    })
    let memberId = document.getElementById("inputMemberId").value
    fetch("memberDetailSample?member_id=" + memberId,{
      method: "GET"
    })
    .then(r=>r.text())
    .then(r=>{
      divDetail.innerHTML = r;
    })
  }

  // 수정 버튼 눌렀을 때
  if(id == "updateBtn"){
    swal({
      title: "알림",
      text: "회원 정보를 수정하시겠습니까?",
      type: "warning",
      buttons: {
        confirm: {
          text: "Yes",
          className: "btn btn-success",
        },
        cancel: {
          visible: true,
          className: "btn btn-danger",
        },
      },
    }).then((Boolean) => {
      if(Boolean == true){
        let inputMemberId = document.getElementById("inputMemberId").value
        fetch("memberDetailUpdate?member_id="+inputMemberId, {
          method:"GET"
        })
        .then(r=>r.text())
        .then(r=>{
          divDetail.innerHTML = r;
        })
      }
    });
    // 삭제 버튼 눌렀을 때
  }else if(id=="deleteBtn"){
    swal({
      title: "경고",
      text: "회원 정보를 삭제하겠습니까?",
      type: "warning",
      buttons: {
        confirm: {
          text: "Yes",
          className: "btn btn-success",
        },
        cancel: {
          visible: true,
          className: "btn btn-danger",
        },
      },
    }).then((Delete) => {
      if (Delete) {
        swal({
          title: "삭제 성공",
          text: "회원 정보가 삭제되었습니다.",
          type: "success",
          buttons: {
            confirm: {
              className: "btn btn-success",
            },
          },
        });
        location.href='/manager/memberInfo'
      }
    });
  }
})