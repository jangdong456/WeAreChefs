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
  }

  // 결제 취소 거절 버튼 클릭
  if(id == cancelNoBtn){
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