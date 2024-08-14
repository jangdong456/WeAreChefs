const totalPrice = document.getElementsByClassName("totalPrice")
const totalNotice = document.getElementById("totalNotice")
const deliveryPrice = document.getElementById("deliveryPrice")
const finalPrice = document.getElementById("finalPrice")
const postSearch = document.getElementById("postSearch")
const postInput = document.getElementById("postInput")
const firstAddress = document.getElementById("firstAddress")
const secondAddress = document.getElementById("secondAddress")
const nameInput = document.getElementById("nameInput")
const phoneInput = document.getElementById("phoneInput")
const mailInput = document.getElementById("mailInput")
const payGo = document.getElementById("payGo")
const foodName = document.getElementsByClassName("foodName")
const foodInfo = document.getElementsByClassName("foodInfo")

IMP.init("imp64654128")
postInput.value=""
firstAddress.value=""
let dataToSend = [];


for(let f of foodInfo) {

    let fnum = f.getAttribute("data-food-num");
    let fvalue = f.innerHTML;

    dataToSend.push({food_num: fnum, cart_count: fvalue});

}


let preName = foodName[0].innerHTML
let listLength = foodName.length-1

let orderPre = new Date().getTime()
let orderBack = Math.floor(Math.random() *1000000)

let orderNum = orderPre+"-"+orderBack

let sumPrice = 0

for (let t of totalPrice) {
        
    let sumIng = parseInt(t.getAttribute("data-total-notice"));
    sumPrice += sumIng;
}

if(sumPrice>=50000){

    totalNotice.innerHTML = sumPrice + "원";
    deliveryPrice.innerHTML = "무료";
    finalPrice.innerHTML = sumPrice + "원";

}else{

    totalNotice.innerHTML = sumPrice + "원";
    deliveryPrice.innerHTML = "3000원";
    finalPrice.innerHTML = (sumPrice + 3000) + "원";
}

let priceGo = parseInt(finalPrice.innerHTML.substring(0, finalPrice.innerHTML.length-1))

postSearch.addEventListener("click",()=>{
    
    new daum.Postcode({
        oncomplete: function(data) {

            postInput.value=data.zonecode
            firstAddress.value=data.address

            secondAddress.focus()

        }
    }).open();

})

payGo.addEventListener("click",()=>{

    if(nameInput.value==""||phoneInput.value==""||mailInput.value==""||postInput.value==""||firstAddress.value==""){
        alert("모든 항목을 입력해주세요")
        return;
    }

    if(nameInput.value!=""&&phoneInput.value!=""&&mailInput.value!=""&&postInput.value!=""&&firstAddress.value!=""&&secondAddress.value==""){
        let a = confirm("상세 주소를 입력하지 않았습니다. 이대로 진행하시겠습니까?")
            if(a){

                    IMP.request_pay(
                        {
                            pg: "html5_inicis.INIpayTest",
                            pay_method: "card",
                            merchant_uid: orderNum, // 주문 고유 번호
                            name: preName + " 외 " + listLength + "건",
                            amount: 1,
                            buyer_email: mailInput.value,
                            buyer_name: nameInput.value,
                            buyer_tel: phoneInput.value,
                            buyer_addr: firstAddress.value + secondAddress.value,
                            buyer_postcode: postInput.value,
                        },
                        function (response) {
                            if (response.error_code != null) {
                                return alert("결제에 실패했습니다");
                            }
                    
                            // 고객사 서버에서 /payment/complete 엔드포인트를 구현해야 합니다.
                            fetch("/food/payment/complete", {
                                method: "POST",
                                headers: {"Content-Type": "application/json"},
                                body: JSON.stringify({
                                    order_num: response.merchant_uid,
                                    order_price: response.amount,
                                    delivery_address: response.buyer_addr,
                                    order_name: response.buyer_name,
                                    order_phone: response.buyer_tel,
                                    order_mail: response.buyer_email,
                                    order_post: response.buyer_postcode,
                                    store_ar: dataToSend
                                }),
                            })
                            .then(r => r.text())
                            .then(r => alert(r))

                        }
                    );
                
            }
            return;
    }

    if(nameInput.value!=""&&phoneInput.value!=""&&mailInput.value!=""&&postInput.value!=""&&firstAddress.value!=""&&secondAddress.value!=""){


                    IMP.request_pay(
                        {
                            pg: "html5_inicis.INIpayTest",
                            pay_method: "card",
                            merchant_uid: orderNum, // 주문 고유 번호
                            name: preName + " 외 " + listLength + "건",
                            amount: 1,
                            buyer_email: mailInput.value,
                            buyer_name: nameInput.value,
                            buyer_tel: phoneInput.value,
                            buyer_addr: firstAddress.value + " "+ secondAddress.value,
                            buyer_postcode: postInput.value,
                        },
                        function (response) {
                            if (response.error_code != null) {
                                return alert("결제에 실패했습니다");
                            }
                    
                            // 고객사 서버에서 /payment/complete 엔드포인트를 구현해야 합니다.
                            fetch("/food/payment/complete", {
                                method: "POST",
                                headers: {"Content-Type": "application/json"},
                                body: JSON.stringify({
                                    order_num: response.merchant_uid,
                                    order_price: response.amount,
                                    delivery_address: response.buyer_addr,
                                    order_name: response.buyer_name,
                                    order_phone: response.buyer_tel,
                                    order_mail: response.buyer_email,
                                    order_post: response.buyer_postcode,
                                    store_ar: dataToSend
                                }),
                            })
                            .then(r => r.text())
                            .then(r => alert(r))

                        }
                    );
                
    }


})
