const replyBtn = document.getElementById("replyBtn");

// const replyList = document.getElementsByClassName("replyList");
let count=0;
let max=1;

function setMax(m){
  max=m;
}
replyBtn.addEventListener("click",function() {
  if(count>=max){
    return;
}
    let div = document.createElement("div");
    div.className="input-group mb-3";
    
    let textarea = document.createElement("textarea");
    textarea.name="board_content";
    textarea.id="replyTextarea"
    textarea.className="form-control";
    textarea.style.width = "650px";
    textarea.style.height = "70px";

     let btn = document.createElement("button");
     btn.type="button";
     btn.className="btn btn-outline-secondary";
     btn.id="replySave"
     let t = document.createTextNode("등록");


    //let a = document.createElement("a");
    //a.className="btn btn-outline-secondary";
   // a.id="replySave"
   // a.type="button";
    //a.href = "#";
    //a.textContent = "등록";

    btn.appendChild(t);    
    div.append(textarea);
    div.append(btn);

    this.closest(".replyListParent").closest(".replyListParent").querySelector(".replyList").append(div);
  //가장 가까운것의 replyList를 찾아서 추가
  count++;

  //댓글 서버로 보내기
 const replySave = document.getElementById("replySave");
 replySave.addEventListener("click",function(){
     console.log(textarea.value);

     fetch("comment"),{
          method:"POST",
          headers:{
            "Content-type":"application/x-www-form-urlencoded"
        },
        body:"num=123&contents=test"
     }




  //   let form = document.createElement("form");
  //   form.method = "POST";
  //   form.action = "/recipe/comment"; 

  //   let textareaValue = textarea.value;
  //   let input = document.createElement("input");
  //   input.type = "hidden";
  //   input.name = "board_content";
  //   input.value = textareaValue;

  //   form.appendChild(input);
  //   document.body.appendChild(form);

  //   // Submit the form
  //   form.submit();
 
 });

  //console.log("test");
});




