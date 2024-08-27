
const replyBtn = document.getElementsByClassName("replyBtn");
const reviewUpBtn = document.getElementsByClassName("reviewUpBtn");

const recipe_num = document.getElementById("recipe_num");
const updateDiv = document.getElementsByClassName("updateDiv");
const updateDiv2 = document.getElementsByClassName("updateDiv2");

// const replyList = document.getElementsByClassName("replyList");
let count = 0;
let max = 1;

function setMax(m) {
  max = m;
}

//replyButtons.forEach(function(replyBtn) {
document.querySelectorAll('.replyBtn').forEach(function (element) {
  element.addEventListener("click", function () {
    // console.log(this.closest(".replyListParent").querySelector(".replyTextarea"));
    // if(document.getElementsByClassName('replyTextarea') != null){

    if (this.closest(".replyListParent").querySelector(".replyTextarea") != null) {
      // console.log("return");
      return;
    }
    //const uniqueId = "reply_" + count;
    let div = document.createElement("div");
    div.className = "input-group mb-3";

    let textarea = document.createElement("textarea");
    textarea.name = "board_content";
    textarea.className = "form-control replyTextarea";
    textarea.style.width = "650px";
    textarea.style.height = "70px";

    let btn = document.createElement("button");
    btn.type = "button";
    btn.className = "btn btn-outline-secondary";

    let t = document.createTextNode("등록");

    btn.appendChild(t);
    div.append(textarea);
    div.append(btn);

    this.closest(".replyListParent").querySelector(".replyList").append(div);
    //가장 가까운것의 replyList를 찾아서 추가
    count++;

    //댓글 서버로 보내기

    btn.addEventListener("click", function () {
 
      let recipe_reply_num = this.closest(".replyListParent").querySelector(".recipe_reply_num").value;
     
      console.log('recipe_reply_num:', recipe_reply_num);

      let recipe_num_value = parseInt(recipe_num.value, 10);
      fetch("comment", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          // "Content-type":"application/x-www-form-urlencoded"
        },
        body: JSON.stringify({
          "recipe_num": parseInt(recipe_num.value, 10),
          "board_content": textarea.value,
          "recipe_reply_num": recipe_reply_num ? parseInt(recipe_reply_num, 10) : null
        })
      })
        .then(response => response.json())
        .then(response => {
          if (response.success === true) {
            alert("답글 등록이 완료됐습니다.");
            loadReplies(recipe_reply_num, this.closest(".replyListParent").querySelector(".replyList"));
            location.reload()
          } else {
            alert("답글 등록에 실패했습니다.");
            location.reload()
          }
        })
        .catch(error => {
          console.error('Error:', error);
          alert("서버 오류. 다시 시도해주세요.");
        });
    });
  });
});

function loadReplies(parentId, container) {
  fetch(`getReplies?recipe_reply_num=${parentId}`)
    .then(response => response.json())
    .then(replies => {
      container.innerHTML = '';
      replies.forEach(reply => {
        let div = document.createElement("div");
        div.className = "reply";
        div.innerHTML = `<p>${reply.board_content}</p>`;
        container.appendChild(div);
      });
    })
    .catch(error => {
      console.error('Error:', error);
    });
}
document.querySelectorAll('.comment').forEach(comment => {
  const commentId = comment.id.split('_')[1];
  const replyList = comment.querySelector('.replyList');
  loadReplies(commentId, replyList);
});

const navmission = document.getElementById("nav-mission")

navmission.addEventListener("click", (e) => {
  if (e.target.classList.contains('reviewUpdateBtn')) {
   

     let num = e.target.getAttribute("data-review-num");
     let conentup = e.target.getAttribute("data-review-content");
    

     if (e.target.id == "updateReviwe" + num) {

      fetch("/recipe/reviewUpdate", {
        method: "POST",
        headers: { "Content-type": "application/x-www-form-urlencoded" },
        body: "review_num=" + num + "&board_content=" + conentup
      })
        .then(r => r.text())
        .then(r => {
          for (let div of updateDiv) {
            if (div.getAttribute("data-review-num") == num) {
              div.innerHTML = r;
            }
          }
        })

    }

  }

  if(e.target.id=='newUpdate'){

    let updateContent = document.getElementById("updateContent")
   
    let num = updateContent.getAttribute("data-review-num")
    console.log(num);
    console.log(updateContent);

    fetch("/recipe/reviewUpdateInsert", {
        method:"POST",
        headers:{"Content-type":"application/x-www-form-urlencoded"},
        body:"review_num=" + num +"&board_content="+updateContent.value+"&recipe_num="+navmission.getAttribute("data-recipe-num")
      })
  
      .then((r)=>{return r.text()})
      .then((r)=>{
        console.log(r)
        if(r>0){
            alert("리뷰 수정이 완료됐습니다.")
            location.reload()
        }else{
            alert("리뷰 수정에 실패했습니다.")
            location.reload()
        }
      })
  
  }

  if(e.target.classList.contains("reviewDeleteBtn")){
        
 
    let reviewNum = e.target.getAttribute("data-review-num");

    if(e.target.id=="deleteReviwe"+reviewNum){
      //alert("삭제");
        let check = confirm("리뷰를 삭제하시겠습니까?")
        
        if(check){
            fetch("/recipe/reviewDelete",{
                method:"POST",
                headers:{"Content-type":"application/x-www-form-urlencoded"},
                body:"review_num="+reviewNum
            })

            .then((r)=>{return r.text()})
            .then((r)=>{
              console.log(r)
              if(r>0){
                  alert("리뷰를 삭제했습니다.")
                  location.reload()
              }else{
                  alert("리뷰 삭제에 실패했습니다.")
                  location.reload()
              }
            })

       }
    }

}

})

const navmission2 = document.getElementById("nav-mission2")

navmission2.addEventListener("click", (e) => {
 
if (e.target.classList.contains('replyUpdateBtn')) {
   alert("수정");

  let num = e.target.getAttribute("data-reply-num");
  let conentup = e.target.getAttribute("data-reply-content");

  if (e.target.id == "updateReply" + num) {
   
   fetch("/recipe/replyUpdate", {
     method: "POST",
     headers: {"Content-type": "application/x-www-form-urlencoded"},
     body:"recipe_reply_num=" + num + "&board_content=" + conentup
   })
     .then(r => r.text())
     .then(r => {
       for (let div of updateDiv2) {
         if (div.getAttribute("data-reply-num") == num) {
           div.innerHTML = r;
         }
       }
     })

 }}

 if(e.target.id=='newUpdate2'){

  let updateContent2 = document.getElementById("updateContent2")
 
  let num = updateContent2.getAttribute("data-reply-num")
  console.log(num);
  console.log(updateContent2);

  fetch("/recipe/replyUpdateInsert", {
      method:"POST",
      headers:{"Content-type":"application/x-www-form-urlencoded"},
      body:"recipe_reply_num=" + num +"&board_content="+updateContent2.value+"&recipe_num="+navmission2.getAttribute("data-recipe-num")
    })

    .then((r)=>{return r.text()})
    .then((r)=>{
      console.log(r)
      if(r>0){
          alert("댓글 수정이 완료됐습니다.")
          location.reload()
      }else{
          alert("댓글 수정에 실패했습니다.")
          location.reload()
      }
    })

}

if(e.target.classList.contains("replyDeleteBtn")){
        
 
  let replyNum = e.target.getAttribute("data-reply-num");

  if(e.target.id=="deleteReply"+replyNum){
    //alert("삭제");
      let check = confirm("댓글을 삭제하시겠습니까?")
      
      if(check){
          fetch("/recipe/replyDelete",{
              method:"POST",
              headers:{"Content-type":"application/x-www-form-urlencoded"},
              body:"recipe_reply_num="+replyNum
          })

          .then((r)=>{return r.text()})
          .then((r)=>{
            console.log(r)
            if(r>0){
                alert("댓글을 삭제했습니다.")
                location.reload()
            }else{
                alert("댓글 삭제에 실패했습니다.")
                location.reload()
            }
          })

     }
  }

}
})





