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

let sumPrice = 0

function calculateTotalPrice(){

    sumPrice = 0;

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

}

calculateTotalPrice();

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
                        }
                    }

                    calculateTotalPrice();

                }
            }
            
    },true);
}


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
                        }
                    }


                    calculateTotalPrice();

                }
            }
            
    },true);
}

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

payBtn.addEventListener("click",()=>{

    let dataToSend = [];

    for (let c of buyCount) {

        let fnum = c.getAttribute("data-food-num");
        let fvalue = c.value;

        dataToSend.push({food_num: fnum, cart_count: fvalue});
    }
    console.log(dataToSend.length)

    fetch("/food/finalCart",{
        method:"POST",
        headers:{"Content-Type": "application/json"},
        body:JSON.stringify(dataToSend)
    })

    .then(r=>r.text())
    .then(r=>{
        location.href=r
    })

})