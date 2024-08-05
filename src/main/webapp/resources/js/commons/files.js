const add =document.getElementById("add");
const result=document.getElementById("result");

// 부모의 id 값으로 사용
let idx=0;

// 최대 첨부파일 갯수 조정
let max=1;

// 첨부파일 버튼 만든 횟수
let count=0;

function setMax(m){
    max=m;
}

add.addEventListener("click",function(){

    if(count>=max){
        alert("첨부파일은 최대"+max+ "개입니다")
        return;
    }

    let parent = document.createElement("div");
    parent.id="file"+idx;
    parent.classList.add("mb-3","input-group");
    result.append(parent);
    
    let input = document.createElement("input");
    input.type="file";
    input.name="attach";
    input.classList.add("form-control");
    parent.append(input);
    
    let span = document.createElement("span");
    span.setAttribute("data-del-id","file"+idx);
    span.classList.add("input-group-text");
    span.id="basic-addon2";
    span.innerHTML="X";
    parent.append(span);

    idx++;
    count++;
});


const spanx = document.getElementById("basic-addon2");
result.addEventListener("click",function(e){
   if(e.target.id=='basic-addon2'){
    //    console.log(e.target.parentNode);
    //    e.target.parentNode.remove();

    let ids = e.target.getAttribute("data-del-id");
    document.getElementById(ids).remove();
    count--;

   }
})