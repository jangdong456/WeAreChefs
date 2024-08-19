const replyBtn = document.getElementById("replyBtn");
// const replyList = document.getElementsByClassName("replyList");

// replyBtn.addEventListener("click",()=>{
replyBtn.addEventListener("click",function() {
    let input = document.createElement("input");
    
    input.type="text";
    input.name="board_content";
    // console.log(this);
    this.closest(".replyListParent").closest(".replyListParent").querySelector(".replyList").append(input);
  //가장 가까운것의 replyList를 찾아서 추가
})