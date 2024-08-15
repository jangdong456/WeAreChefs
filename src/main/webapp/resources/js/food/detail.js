const minusBtn = document.getElementById("minusBtn")
const plusBtn = document.getElementById("plusBtn")
const buyCount = document.getElementById("buyCount")

buyCount.value=1


minusBtn.addEventListener("click",()=>{

    buyCount.value = buyCount.value-1
    console.log(buyCount.value)

    // if(finalCount<1){
    //     buyCount.value=1
    // }
    // buyCount.value=buyCount.value-1

})

plusBtn.addEventListener("click",()=>{
    alert("플러스")
})