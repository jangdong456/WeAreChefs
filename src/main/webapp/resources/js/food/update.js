const foodNum = document.getElementById("foodNum")
const foodAdd = document.getElementById("foodAdd")
const foodName = document.getElementById("foodName")
const foodCategory = document.getElementById("foodCategory")
const foodStock = document.getElementById("foodStock")
const foodPrice = document.getElementById("foodPrice")
const attach = document.getElementById("attach")
const imgDiv = document.getElementById("imgDiv")


foodAdd.addEventListener("click",()=>{

    let foodv = foodName.value
    let catev = foodCategory.value
    let stockv = foodStock.value
    let pricev = foodPrice.value
    let attachv = attach.value
    let numv = foodNum.value

    if(foodv==""||catev==""||stockv==""||pricev==""||numv==""){
        alert('모든 항목을 입력해주세요');
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