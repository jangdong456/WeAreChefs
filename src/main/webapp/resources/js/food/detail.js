const minusBtn = document.getElementById("minusBtn")
const plusBtn = document.getElementById("plusBtn")
const buyCount = document.getElementById("buyCount")
const buyPrice = document.getElementById("buyPrice")
const cartAdd = document.getElementById("cartAdd")
const cartFrm = document.getElementById("cartFrm")
const cartCount = document.getElementById("cartCount")

buyCount.value=1

// 마이너스 버튼 눌렀을때
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

// 플러스 버튼 눌렀을때
plusBtn.addEventListener("click",(e)=>{

    e.stopPropagation();

    let currentValue = parseInt(buyCount.value)
    let currentPrice = parseInt(buyPrice.getAttribute("data-buy-price"))

    buyCount.value = currentValue + 1
    buyPrice.innerHTML=parseInt(buyCount.value)*currentPrice+"원"

},true)

// 갯수 직접 바꿨을때
buyCount.addEventListener("change",()=>{

    let currentValue = parseInt(buyCount.value)
    let currentPrice = parseInt(buyPrice.getAttribute("data-buy-price"))

    buyPrice.innerHTML=parseInt(buyCount.value)*currentPrice+"원"

})

// 장바구니 추가버튼
cartAdd.addEventListener("click",()=>{
    cartCount.value=buyCount.value
    cartFrm.submit();
})