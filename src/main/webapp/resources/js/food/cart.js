const minusBtn = document.getElementsByClassName("minusBtn")
const plusBtn = document.getElementsByClassName("plusBtn")
const buyCount = document.getElementsByClassName("buyCount")
const totalPrice = document.getElementsByClassName("totalPrice")
const delBtn = document.getElementsByClassName("delBtn")
const numFrm = document.getElementsByClassName("numFrm")
const totalNotice = document.getElementById("totalNotice")
const deliveryPrice = document.getElementById("deliveryPrice")
const finalPrice = document.getElementById("finalPrice")
const payBtn = document.getElementById("payBtn")
const allCheck = document.getElementById("allCheck")
const checkOther = document.getElementsByClassName("checkOther")

let sumPrice = 0

function calculateTotalPrice(){

    sumPrice = 0;

    for(let c of checkOther){
        for(let t of totalPrice){
            if(c.checked&&c.getAttribute("data-food-num")==t.getAttribute("data-food-num")){
                let sumIng = parseInt(t.getAttribute("data-total-notice"));
                sumPrice += sumIng;
            }
        }
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

}


// 페이지가 완전히 로드된 후 calculateTotalPrice 호출
document.addEventListener("DOMContentLoaded", () => {
    calculateTotalPrice();
})

// 홈페이지 들어오자마자는 전부 체크된거처럼 보이게 하기
let result = true;

for(let c of checkOther){
    c.checked = allCheck.checked
}

// 전부 체크 기능
allCheck.addEventListener("click",()=>{
    if(allCheck.checked){
        for(let c of checkOther){
            c.checked=allCheck.checked
        }
        calculateTotalPrice();
    }else{
        for(let c of checkOther){
            c.checked=allCheck.checked
        }
        calculateTotalPrice();
    }
})

// 각각 체크 기능
for(let c of checkOther){
    c.addEventListener("click",()=>{
        for(check of checkOther){
            result=true
            if(!check.checked){
                result=false
                break;
            }
        }
        allCheck.checked=result;
        calculateTotalPrice();
    })
}

// 마이너스 버튼 기능
for(let m of minusBtn) {
    m.addEventListener("click", (e) => {

            e.stopPropagation();

            let currentPrice = parseInt(e.currentTarget.getAttribute("data-buy-price"))
            let currentNum = e.currentTarget.getAttribute("data-food-num")

            for(let c of buyCount) {
                if(c.getAttribute("data-food-num")==currentNum&&parseInt(c.value)>1){
                    c.value=parseInt(c.value)-1
                    for(t of totalPrice){
                        if(t.getAttribute("data-food-num")==currentNum){
                            t.innerHTML=parseInt(c.value)*currentPrice+"원"
                            t.setAttribute("data-total-notice", parseInt(c.value) * currentPrice)

                            let fnum = c.getAttribute("data-food-num")
                            let fvalue = c.value;
            
                            fetch("/food/cartCountChange?food_num="+fnum+"&cart_count="+fvalue,{
                            method:"GET",   
                        })
                            .then(r=>r.text())
                   
                        }
                    }

                    calculateTotalPrice();

                }
            }
            
    },true);
}

// 플러스 버튼 기능
for(let m of plusBtn) {
    m.addEventListener("click", (e) => {
    
            e.stopPropagation();

            let currentPrice = parseInt(e.currentTarget.getAttribute("data-buy-price"))
            let currentNum = e.currentTarget.getAttribute("data-food-num")

            for(let c of buyCount) {
                if(c.getAttribute("data-food-num")==currentNum){
                    c.value=parseInt(c.value)+1
                    for(t of totalPrice){
                        if(t.getAttribute("data-food-num")==currentNum){
                            t.innerHTML=parseInt(c.value)*currentPrice+"원"
                            t.setAttribute("data-total-notice", parseInt(c.value) * currentPrice)

                            let fnum = c.getAttribute("data-food-num")
                            let fvalue = c.value;
            
                            fetch("/food/cartCountChange?food_num="+fnum+"&cart_count="+fvalue,{
                            method:"GET",   
                        })
                            .then(r=>r.text())
                        }
                    }

                    calculateTotalPrice();

                }
            }
            
    },true);
}

// 갯수 직접 입력했을 때 가격이랑 바뀌게 하는 기능
for(let b of buyCount){
    b.addEventListener("change",()=>{
        let currentPrice = parseInt(b.getAttribute("data-buy-price"))
        for(t of totalPrice){
            if(b.getAttribute("data-food-num")==t.getAttribute("data-food-num")){
                if(b.value<0||isNaN(b.value)){
                    alert("숫자만 입력할 수 있습니다")
                    b.value=1;
                }
                t.innerHTML=parseInt(b.value)*currentPrice+"원"
                t.setAttribute("data-total-notice", parseInt(b.value) * currentPrice)

                let fnum = b.getAttribute("data-food-num")
                let fvalue = b.value;

                fetch("/food/cartCountChange?food_num="+fnum+"&cart_count="+fvalue,{
                method:"GET",   
            })
                .then(r=>r.text())

            }
        }
        calculateTotalPrice();
    })
}


// 장바구니에서 삭제하기 기능
for(let d of delBtn) {

    d.addEventListener("click",()=>{

        let currentNum = d.getAttribute("data-food-num")

            for(let f of numFrm){

                let sendNum = f.getAttribute("data-food-num")

                if(currentNum==sendNum) {
                    f.submit();
                }
            }
    })
}

// 결제 진행하기 눌렀을 때 현 장바구니와 기존의 장바구니 똑같게 하기 위한 update sql문 실행하는 기능
payBtn.addEventListener("click",()=>{

    if(parseInt(totalNotice.innerHTML)==0){
        alert("결제 금액이 0원입니다. 장바구니를 다시 확인해주세요.")
        return;
    }

    let dataToSend = [];

    for(let ch of checkOther){
        for(let c of buyCount){
            if(ch.checked&&ch.getAttribute("data-food-num")==c.getAttribute("data-food-num")){
                let fnum = c.getAttribute("data-food-num")
                let fvalue = c.value;
                dataToSend.push({food_num: fnum, cart_count: fvalue});
            }
        }

    }

    fetch("/food/pay",{
        method:"POST",
        headers:{"Content-Type": "application/json"},
        body:JSON.stringify(dataToSend)
    })

    .then(r=>r.text())
    .then(r=>{
        location.href=r
    })

})