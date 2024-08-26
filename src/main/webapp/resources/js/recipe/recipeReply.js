
const replyBtn = document.getElementsByClassName("replyBtn");
const reviewUpBtn = document.getElementsByClassName("reviewUpBtn");

const recipe_num = document.getElementById("recipe_num");


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
      //  console.log(textarea.value);
      // let recipe_reply_num = parseInt(this.closest(".replyListParent").querySelector(".recipe_reply_num").value,10);
      //  console.log(recipe_reply_num);

      let recipe_reply_num = this.closest(".replyListParent").querySelector(".recipe_reply_num").value;
      //let parsedReplyNum = parseInt(recipe_reply_num, 10); // Ensure it's a number

      //let recipe_reply_num_element = this.closest(".replyListParent").querySelector(".recipe_reply_num");
      //let recipe_reply_num = recipe_reply_num_element ? parseInt(recipe_reply_num_element.value, 10) : null; // Convert to number or set to null
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
          } else {
            alert("답글 등록에 실패했습니다.");
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


// document.querySelectorAll('.reviewUpBtn').forEach(function(element) {
//   reviewUpBtn.addEventListener("click",function() {
//     console.log(this.closest(".reviewParent").querySelector(".reviewUpdateTextarea"));
//     // if(document.getElementsByClassName('replyTextarea') != null){

//    // if(this.closest(".reviewParent").querySelector(".reviewUpdateTextarea") != null){
//       // console.log("return");
//     //   return;
//     // }
//   //const uniqueId = "reply_" + count;
//     let div = document.createElement("div");
//     div.className="input-group mb-3";

//     let textarea = document.createElement("textarea");
//     textarea.name="board_content";
//     textarea.className="form-control reviewUpdateTextarea";
//     textarea.style.width = "650px";
//     textarea.style.height = "70px";

//     let btn = document.createElement("button");
//     btn.type="button";
//     btn.className="btn btn-outline-secondary";

//     let t = document.createTextNode("완료");

//     btn.appendChild(t);    
//     div.append(textarea);
//     div.append(btn);

//    // this.closest(".reviewParent").querySelector(".reviewUpdate").append(div);
//   })
// })
const navmission = document.getElementById("nav-mission")

navmission.addEventListener("click", (e) => {
  if (e.target.classList.contains('reviewUpdateBtn')) {
    alert("수정");

     let num = e.target.getAttribute("data-review-num");
     let conentup = e.target.getAttribute("data-review-content");
     console.log(num);
     console.log(conentup);

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

})
