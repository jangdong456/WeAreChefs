const minusBtn = document.getElementsByClassName("minusBtn")
const plusBtn = document.getElementsByClassName("plusBtn")
const buyCount = document.getElementsByClassName("buyCount")
const totalPrice = document.getElementsByClassName("totalPrice")


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
                        }
                    }
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
                        }
                    }
                }
            }
            
    },true);
}