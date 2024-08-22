const replyBtn = document.getElementsByClassName("replyBtn");
const recipe_num = document.getElementById("recipe_num");


// const replyList = document.getElementsByClassName("replyList");
let count=0;
let max=1;

function setMax(m){
  max=m;
}

//replyButtons.forEach(function(replyBtn) {
document.querySelectorAll('.replyBtn').forEach(function(element) {
  element.addEventListener("click",function() {
    // console.log(this.closest(".replyListParent").querySelector(".replyTextarea"));
    // if(document.getElementsByClassName('replyTextarea') != null){

    if(this.closest(".replyListParent").querySelector(".replyTextarea") != null){
      // console.log("return");
      return;
    }
  //const uniqueId = "reply_" + count;
    let div = document.createElement("div");
    div.className="input-group mb-3";
    
    let textarea = document.createElement("textarea");
    textarea.name="board_content";
    textarea.className="form-control replyTextarea";
    textarea.style.width = "650px";
    textarea.style.height = "70px";
  
    let btn = document.createElement("button");
    btn.type="button";
    btn.className="btn btn-outline-secondary";
  
    let t = document.createTextNode("등록");
  
    btn.appendChild(t);    
    div.append(textarea);
    div.append(btn);
  
    this.closest(".replyListParent").querySelector(".replyList").append(div);
  //가장 가까운것의 replyList를 찾아서 추가
    count++;
  
    //댓글 서버로 보내기
  
   btn.addEventListener("click",function(){
      //  console.log(textarea.value);
       let recipe_reply_num = this.closest(".replyListParent").querySelector(".recipe_reply_num").value;
      //  console.log(recipe_reply_num);
       fetch("comment", {
            method:"POST",
            headers:{
              "Content-Type": "application/json",
              // "Content-type":"application/x-www-form-urlencoded"
          },
          // body:"recipe_num="+recipe_num//+"&board_content="+textarea.value
          body: JSON.stringify({
                "recipe_num": recipe_num.value
               , "board_content":textarea.value
               , "recipe_reply_num":recipe_reply_num
              })
       });
  
   
   });
  });
});
  

 



