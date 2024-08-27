let orderDetail = document.getElementById("orderDetail");

orderDetail.addEventListener("click", (e)=>{
  let id = e.target.getAttribute("id");
  let targetData = e.target.getAttribute("data-orderNum")
  console.log(targetData);

  let form = new FormData();
  form.append("order_num", targetData);

  // 삭제 버튼
  if(id == 'orderDetailDelete'){
    swal({
      title: "※ 경고 ※",
      text: "주문&배송 정보를 삭제하시겠습니까?",
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
        // 수정한다고 하면 발생
        location.href="/manager/orderList"
      }
    })
  }

  // 수정 버튼
  if(id == 'orderDetailUpdate'){
    swal({
      title: "알림",
      text: "주문&배송 정보를 수정하시겠습니까?",
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
        fetch("orderDetailUpdate", {
          method:"POST",
          body:form
        })
        .then(r=>r.text())
        .then(r=>{
          orderDetail.innerHTML = r;
        })
      }
    });
  }

  // 수정 완료 버튼
  if(id == 'completeOrderDetailUpdate'){
    let selectOrderStatusValue = document.getElementById("selectOrderStatus").value;
    let selectDeliveryStatusValue = document.getElementById("selectDeliveryStatus").value;
    let orderName = document.getElementById("inputUpdateOrderName").value;
    let orderPhone = document.getElementById("inputUpdateOrderPhone").value;
    let orderPost = document.getElementById("inputUpdateOrderPost").value;
    let deliveryAddress = document.getElementById("inputUpdateDeliveryAddress").value;

    console.log('하이' + orderPost);

    form.append("order_status", selectOrderStatusValue);
    form.append("delivery_status", selectDeliveryStatusValue);
    form.append("order_name", orderName);
    form.append("order_phone", orderPhone);
    form.append("order_post", orderPost);
    form.append("delivery_address", deliveryAddress);

    swal({
      title: "알림",
      text: "수정을 완료하시겠습니까?",
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
        // 수정한다고 하면 발생
        if(selectOrderStatusValue == '결제취소'){
          //결제 취소로 바뀐 경우 
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
                  merchant_uid: targetData
                })
              });
            } 
          })
          .then(r => r.json())  // 취소 요청의 응답을 JSON으로 변환
          .then(r => {
            if (r.code === 0) {
              // 주문 취소가 성공 했으면 발생.
              console.log('orderDetail.js 103 주문 취소 성공')
            }
          })
        }

        // DB 수정 정보를 보내는 것
        fetch("completeOrderDetailUpdate", {
          method:"POST",
          body:form
        })
        .then(r=>r.text())
        .then(r=>{
          // update 실패하면 발생
          if(r == 0){
            swal({
              title: "알림",
              text: "수정을 실패하였습니다.",
              type: "warning",
              buttons: {
                confirm: {
                  text: "OK",
                  className: "btn btn-success",
                }
              }
            })
          // update 성공하면 발생
          }else{
            orderDetail.innerHTML = r;
            swal({
              title: "알림",
              text: "수정을 완료하였습니다.",
              type: "warning",
              buttons: {
                confirm: {
                  text: "OK",
                  className: "btn btn-success",
                }
              }
            })
          }
        })
      }
    });
  }

  // 수정 취소 버튼
  if(id == "cancelOrderDetailUpdate"){
    swal({
      title: "알림",
      text: "수정을 취소하시겠습니까?",
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
        // 수정한다고 하면 발생
        fetch("cancelOrderDetailUpdate?order_num="+targetData, {
          method:"GET"
        })
        .then(r=>r.text())
        .then(r=>{
          orderDetail.innerHTML = r;
        })
      }
    })
  }
})