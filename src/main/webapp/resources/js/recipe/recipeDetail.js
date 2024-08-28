const reBtn = document.getElementById("reBtn");
const re_frm = document.getElementById("re_frm");
const review = document.getElementById("review");
const reply = document.getElementById("reply");
const rating = document.getElementById("rating");
const addWish = document.getElementById("addWish");
const wishResult = document.getElementById("wishResult");
const post_review =  document.getElementById("review");
const post_reply =  document.getElementById("reply");
const starRating = document.getElementById("starRating");
const board_content = document.getElementById("board_content");


reBtn.addEventListener("click", () => {
  
    if (review.checked) {
        re_frm.action = '/recipe/review'; 
    } else if (reply.checked) {
        re_frm.action = '/recipe/reply';
    }

    console.log('Form action:', re_frm.action); 


    re_frm.submit();
});

rating.addEventListener('change', function() {
    const selectedRating = document.querySelector('input[name="recipe_rating"]:checked').value; 
    //alert(selectedRating);
});

addWish.addEventListener("click",()=>{
    let num = addWish.getAttribute("data-recipe-num")
    console.log(num)
    fetch("/recipe/addWish?recipe_num="+num,{
                method:"GET"
            })
   
    .then((r)=>{return r.text()})
    .then((r)=>{
        if(r>0){
            alert("레시피를 저장했습니다.")
        }else{
            alert("레시피 저장에 실패했습니다.")
        }
    })
    // 예외(exception) 발생시 여기서도 처리 가능
    .catch(()=>{
        alert("오류 발생")
    });
})