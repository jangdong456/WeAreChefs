const minusBtn = document.getElementById("minusBtn")
const plusBtn = document.getElementById("plusBtn")
const buyCount = document.getElementById("buyCount")
const buyPrice = document.getElementById("buyPrice")
const cartAdd = document.getElementById("cartAdd")
const cartFrm = document.getElementById("cartFrm")
const cartCount = document.getElementById("cartCount")
const firstStar = document.getElementById("firstStar")
const secondStar = document.getElementById("secondStar")
const thirdStar = document.getElementById("thirdStar")
const fourthStar = document.getElementById("fourthStar")
const fifthStar = document.getElementById("fifthStar")
const startValue = document.getElementById("startValue")
const updateReply = document.getElementsByClassName("updateReply")
const replyContent = document.getElementsByClassName("replyContent")
const updateDiv = document.getElementsByClassName("updateDiv")
const navmission = document.getElementById("navmission")


buyCount.value=1
startValue.value=5

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

firstStar.addEventListener("click",(e)=>{

    firstStar.classList.add("text-secondary")
    secondStar.classList.remove("text-secondary")
    thirdStar.classList.remove("text-secondary")
    fourthStar.classList.remove("text-secondary")
    fifthStar.classList.remove("text-secondary")

    startValue.value=1

})

secondStar.addEventListener("click",(e)=>{

    firstStar.classList.add("text-secondary")
    secondStar.classList.add("text-secondary")
    thirdStar.classList.remove("text-secondary")
    fourthStar.classList.remove("text-secondary")
    fifthStar.classList.remove("text-secondary")

    startValue.value=2

})

thirdStar.addEventListener("click",(e)=>{

    firstStar.classList.add("text-secondary")
    secondStar.classList.add("text-secondary")
    thirdStar.classList.add("text-secondary")
    fourthStar.classList.remove("text-secondary")
    fifthStar.classList.remove("text-secondary")

    startValue.value=3

})

fourthStar.addEventListener("click",(e)=>{

    firstStar.classList.add("text-secondary")
    secondStar.classList.add("text-secondary")
    thirdStar.classList.add("text-secondary")
    fourthStar.classList.add("text-secondary")
    fifthStar.classList.remove("text-secondary")

    startValue.value=4

})

fifthStar.addEventListener("click",(e)=>{

    firstStar.classList.add("text-secondary")
    secondStar.classList.add("text-secondary")
    thirdStar.classList.add("text-secondary")
    fourthStar.classList.add("text-secondary")
    fifthStar.classList.add("text-secondary")

    startValue.value=5

})

navmission.addEventListener("click",(e)=>{

// 수정 버튼 눌렀을때 수정 input 띄우기
    if(e.target.classList.contains('updateReply')){

        let num = e.target.getAttribute("data-reply-num");
        let memid = e.target.getAttribute("data-reply-writer");
        let conentup = e.target.getAttribute("data-reply-content");
        let starup = e.target.getAttribute("data-reply-start");

        if(e.target.id=="updateReply"+num){
            
            fetch("/food/replyUpdate", {
                method:"POST",
                headers:{"Content-type":"application/x-www-form-urlencoded"},
                body:"food_reply_num="+num+"&member_id="+memid+"&reply_content="+conentup+"&food_rating="+starup
              })
              
              .then(r=>r.text())
              .then(r=>{
                for(let div of updateDiv){
                    if(div.getAttribute("data-reply-num")==num){
                        div.innerHTML=r;
                    }
                }
              })
        }
    }


    let updateStarValue = document.getElementById("updateStarValue")

    if(e.target.classList.contains('stars')){

        let firstUpdate2 = document.getElementById("firstUpdate")
        let secondUpdate = document.getElementById("secondUpdate")
        let thirdUpdate = document.getElementById("thirdUpdate")
        let fourthUpdate = document.getElementById("fourthUpdate")
        let fifthUpdate = document.getElementById("fifthUpdate")

        if(e.target.id=='firstUpdate'){

            firstUpdate2.classList.add("text-secondary")
            secondUpdate.classList.remove("text-secondary")
            thirdUpdate.classList.remove("text-secondary")
            fourthUpdate.classList.remove("text-secondary")
            fifthUpdate.classList.remove("text-secondary")

            updateStarValue.value=1;
      
        }

        if(e.target.id=='secondUpdate'){

            firstUpdate2.classList.add("text-secondary")
            secondUpdate.classList.add("text-secondary")
            thirdUpdate.classList.remove("text-secondary")
            fourthUpdate.classList.remove("text-secondary")
            fifthUpdate.classList.remove("text-secondary")

            updateStarValue.value=2;
      
        }
                
        if(e.target.id=='thirdUpdate'){

            firstUpdate2.classList.add("text-secondary")
            secondUpdate.classList.add("text-secondary")
            thirdUpdate.classList.add("text-secondary")
            fourthUpdate.classList.remove("text-secondary")
            fifthUpdate.classList.remove("text-secondary")

            updateStarValue.value=3;
      
        }
                
        if(e.target.id=='fourthUpdate'){

            firstUpdate2.classList.add("text-secondary")
            secondUpdate.classList.add("text-secondary")
            thirdUpdate.classList.add("text-secondary")
            fourthUpdate.classList.add("text-secondary")
            fifthUpdate.classList.remove("text-secondary")

            updateStarValue.value=4;
      
        }
                
        if(e.target.id=='fifthUpdate'){

            firstUpdate2.classList.add("text-secondary")
            secondUpdate.classList.add("text-secondary")
            thirdUpdate.classList.add("text-secondary")
            fourthUpdate.classList.add("text-secondary")
            fifthUpdate.classList.add("text-secondary")

            updateStarValue.value=5;
      
        }

    }

    if(e.target.id=='newUpdate'){

        let updateContent = document.getElementById("updateContent")
        let memid = updateContent.getAttribute("data-reply-writer")
        let num = updateContent.getAttribute("data-reply-num")
    
        fetch("/food/replyUpdateInsert", {
            method:"POST",
            headers:{"Content-type":"application/x-www-form-urlencoded"},
            body:"food_reply_num="+num+"&member_id="+memid+"&reply_content="+updateContent.value+"&food_rating="+updateStarValue.value+"&food_num="+navmission.getAttribute("data-food-num")
          })

          .then((r)=>{return r.text()})
          .then((r)=>{
            console.log(r)
            if(r>0){
                alert("댓글 수정이 완료됐습니다")
                location.reload()
            }else{
                alert("댓글 수정에 실패했습니다")
                location.reload()
            }
          })

    }

    if(e.target.classList.contains('adminReply')){

            let foodnum = e.target.getAttribute("data-admin-num")
            let replynum = e.target.getAttribute("data-reply-num")
            
            console.log(replynum)

                fetch("/food/adminReplyAdd", {
                    method:"POST",
                    headers:{"Content-type":"application/x-www-form-urlencoded"},
                    body:"food_num="+foodnum+"&food_reply_num="+replynum
                  })
                  
                  .then(r=>r.text())
                  .then(r=>{
                    for(let div of updateDiv){
                        if(div.getAttribute("data-reply-num")==replynum){
                            div.innerHTML=r;
                        }
                    }
                  })
            
    }

    if(e.target.classList.contains('adminComplete')){

        let foodnum = e.target.getAttribute("data-admin-num")
        let replynum = e.target.getAttribute("data-reply-num")
        
        let area = document.getElementsByClassName("areaContext")

        for(let a of area){
            if(a.getAttribute("data-reply-num")==replynum){
                fetch("/food/adminReplySubmit", {
                    method:"POST",
                    headers:{"Content-type":"application/x-www-form-urlencoded"},
                    body:"food_num="+foodnum+"&food_reply_num="+replynum+"&reply_content="+a.value
                  })

                  .then((r)=>{return r.text()})
                  .then((r)=>{
                    console.log(r)
                    if(r>0){
                        alert("댓글 등록이 완료됐습니다")
                        location.reload()
                    }else{
                        alert("댓글 등록에 실패했습니다")
                        location.reload()
                    }
                  })
            }
        }
    }

    if(e.target.classList.contains("deleteReply")){
        
        let replynum = e.target.getAttribute("data-reply-num")

        if(e.target.id=='deleteReply'+replynum){

            let check = confirm("댓글을 삭제하시겠습니까?")
            
            if(check){
                fetch("/food/replyDelete",{
                    method:"POST",
                    headers:{"Content-type":"application/x-www-form-urlencoded"},
                    body:"food_reply_num="+replynum
                })

                .then((r)=>{return r.text()})
                .then((r)=>{
                  console.log(r)
                  if(r>0){
                      alert("댓글을 삭제했습니다")
                      location.reload()
                  }else{
                      alert("댓글 삭제에 실패했습니다")
                      location.reload()
                  }
                })

            }
        }

    }




})