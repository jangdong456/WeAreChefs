const minusBtn = document.getElementById("minusBtn")
const plusBtn = document.getElementById("plusBtn")
const buyCount = document.getElementById("buyCount")
const buyPrice = document.getElementById("buyPrice")
const cartAdd = document.getElementById("cartAdd")
const cartFrm = document.getElementById("cartFrm")
const cartCount = document.getElementById("cartCount")

buyCount.value=1

minusBtn.addEventListener("click", (e) => {

        e.stopPropagation();
 
        let currentValue = parseInt(buyCount.value)
        let currentPrice = parseInt(buyPrice.getAttribute("data-buy-price"))
    
        if (currentValue > 1) {
            buyCount.value = currentValue - 1
            buyPrice.innerHTML=parseInt(buyCount.value)*currentPrice+"원"
            
        } else {
            buyCount.value = 1
            buyPrice.innerHTML=parseInt(buyCount.value)*currentPrice+"원"
        }

},true);

plusBtn.addEventListener("click",(e)=>{

    e.stopPropagation();

    let currentValue = parseInt(buyCount.value)
    let currentPrice = parseInt(buyPrice.getAttribute("data-buy-price"))

    buyCount.value = currentValue + 1
    buyPrice.innerHTML=parseInt(buyCount.value)*currentPrice+"원"

},true)

cartAdd.addEventListener("click",()=>{
    cartCount.value=buyCount.value
    cartFrm.submit();
})