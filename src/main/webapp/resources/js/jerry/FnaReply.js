const FnaReply = document.getElementById("FnaReply");

let board_num = 34
let url = "/board/qna/detail?board_num=" + barod_num;

FnaReply.addEventListener("click", ()=>{
  fetch(url, {
  })
  .then(r=>r.text())

})