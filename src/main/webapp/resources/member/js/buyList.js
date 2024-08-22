const deliveryFee = document.getElementsByClassName("deliveryFee")
const foodPrice = document.getElementsByClassName("foodPrice")

for(let d of deliveryFee) {
    let sumPrice = 0
    for(let f of foodPrice){
        if(d.getAttribute("data-order-num")==f.getAttribute("data-order-num")){
            let sumIng = parseInt(f.getAttribute("data-order-price"));
            sumPrice += sumIng
        }
    }

    if(sumPrice>=50000){

        d.innerHTML = "무료";

    }else{

        d.innerHTML = "3000원";

    }

}