let cancelList = document.getElementById("cancelList");

cancelList.addEventListener("click", (e)=>{
  let id = e.target.getAttribute("id");
  let dataOrderNum = e.target.getAttribute("data-cancel");
  // 버튼의 아이디
  let cancelOkBtn = "cancelOk" + dataOrderNum;
  let cancelNoBtn = "cancelNo" + dataOrderNum;

  const form = new FormData();
  form.append("order_num", dataOrderNum)

  // 결제 취소 승인 버튼 클릭
  if(id == cancelOkBtn){
  console.log('결제 취소 승인 버튼 누름 : ' + dataOrderNum);
    //결제 취소 api
  fetch("https://api.iamport.kr/users/getToken", {
    method: "POST",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify({
        imp_key: "3263727700186016",
        imp_secret: "mvAj4LaoXOysRrLfFqSyZQtOmgAJjEopF4cWlvMYg5y8fFCeuaZD5wxMlUG5CKaalMU8dhFz1gJ7k3zJ"  
    })
  })
  .then(r => r.json())  
  .then(r => {
    if (r.code === 0) {  
      const accessToken = r.response.access_token;
      console.log("Access Token:", accessToken);

      // return은 비동기식 요청이 다 끝날때까지 기다리라는 의미이다.
      //다 끝나고 .then부분을 실행하라는 의미!
      return fetch("https://api.iamport.kr/payments/cancel", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${accessToken}`
        },
        body: JSON.stringify({
          // 주문번호
          merchant_uid: dataOrderNum
        })
      });
    } 
  })
  .then(r => r.json())  // 취소 요청의 응답을 JSON으로 변환
  .then(r => {
    if (r.code === 0) {
      fetch("cancelOk", {
        method:"POST",
        body:form
      })
      .then(r=>r.text())
      .then(r=>{
        cancelList.innerHTML = r;
        swal({
              title: "알림",
              text: "결제 취소 요청이 승인되었습니다.",
              type: "warning",
              buttons: {
                confirm: {
                  text: "OK",
                  className: "btn btn-success",
                }
              }
        })
      })
      }else {
        fetch("cancelOk", {
          method:"POST",
          body:form
        })
        .then(r=>r.text())
        .then(r=>{
          cancelList.innerHTML = r;
          swal({
            title: "알림",
            text: "결제 취소를 실패하였습니다..",
            type: "warning",
            buttons: {
              confirm: {
                text: "OK",
                className: "btn btn-success",
              }
            }
          })
        })
      }
  })


    //

  }

  // 결제 취소 거절 버튼 클릭
  if(id == cancelNoBtn){
    console.log('결제 취소 요청 클릭 : ' + dataOrderNum)
    fetch("cancelNo", {
      method:"POST",
      body:form
    })
    .then(r=>r.text())
    .then(r=>{
      cancelList.innerHTML = r;
      swal({
        title: "알림",
        text: "결제 취소 요청이 거절되었습니다.",
        type: "warning",
        buttons: {
          confirm: {
            text: "OK",
            className: "btn btn-success",
          }
        }
      })
    })
  }
})