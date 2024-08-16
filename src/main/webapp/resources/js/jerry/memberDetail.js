let memberDetailTbody = document.getElementById("memberDetailTbody")

memberDetailTbody.addEventListener("click", (e)=>{
  let memberId = e.target.getAttribue("data-memberId");

  alert("하하" + memberId);
});