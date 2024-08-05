const foodSearch = document.getElementById("foodSearch")
const searchName = document.getElementById("searchName")
const foodHouse = document.getElementById("foodHouse")

foodSearch.addEventListener("click",()=>{
    console.log(searchName.value)
    fetch("./searchFood?food_name="+searchName.value,{
        method:"GET"
    })
    .then(r=>r.text())
    .then(r=>foodHouse.innerHTML)
})