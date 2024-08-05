const foodSearch = document.getElementById("foodSearch")
const searchName = document.getElementById("searchName")
const foodHouse = document.getElementById("foodHouse")
const nameList = document.getElementsByClassName("nameList")
const foodName = document.getElementById("foodName")
const foodCategory = document.getElementById("foodCategory")
const foodStock = document.getElementById("foodStock")
const foodPrice = document.getElementById("foodPrice")
const foodNum = document.getElementById("foodNum")

foodSearch.addEventListener("click",()=>{
    fetch("/food/searchFood?food_name="+searchName.value,{
        method:"GET"
    })
    .then(r=>r.text())
    .then(r=>foodHouse.innerHTML=r)
})

foodHouse.addEventListener("click",(e)=>{
    if(e.target.classList.contains('nameList')){

       let fname = e.target.getAttribute("data-name")
       let fcategory = e.target.getAttribute("data-category")
       let fstock = e.target.getAttribute("data-stock")
       let fprice = e.target.getAttribute("data-price")
       let fnum = e.target.getAttribute("data-num")

       foodName.value = fname
       foodCategory.value = fcategory
       foodStock.value = fstock
       foodPrice.value = fprice
       foodNum.value = fnum

    }
})