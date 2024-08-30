const foodSearch = document.getElementById("foodSearch")
const searchName = document.getElementById("searchName")
const foodHouse = document.getElementById("foodHouse")
const nameList = document.getElementsByClassName("nameList")
const foodNum = document.getElementById("foodNum")
const foodAdd = document.getElementById("foodAdd")
const foodName = document.getElementById("foodName")
const foodCategory = document.getElementById("foodCategory")
const foodStock = document.getElementById("foodStock")
const foodPrice = document.getElementById("foodPrice")
const attach = document.getElementById("attach")
const imgDiv = document.getElementById("imgDiv")
const frm = document.getElementById("frm")

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

foodAdd.addEventListener("click",()=>{

    let foodv = foodName.value
    let catev = foodCategory.value
    let stockv = foodStock.value
    let pricev = foodPrice.value
    let attachv = attach.value
    let numv = foodNum.value

    if(foodv==""||catev==""||stockv==""||pricev==""||numv==""||numv==null){
        alert('모든 항목을 입력해주세요');
        searchName.focus()
    }else{
        frm.submit();
        }
    })

attach.addEventListener("change",()=>{
    
    let attachv = attach.value

    if(!attachv.match(/(.*?)\.(jpg|jpeg|png|gif)$/)){
        alert('이미지 파일만 업로드 가능합니다')
        attach.value=null
    }

    const reader = new FileReader();
  reader.onload = ({ target }) => {
    imgDiv.innerHTML=''
    imgDiv.innerHTML = `<img id="viewImg" src="${target.result}"/>`;
  };
  reader.readAsDataURL(attach.files[0]);

})
