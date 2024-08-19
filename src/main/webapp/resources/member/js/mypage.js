
const commentContents = document.getElementById("commentContents");
const introductionAdd = document.getElementById("introduction_add");
const introductionDelete = document.getElementById("introduction_delete");
const introduces_text = document.getElementById("introduces_text");

let id = introductionAdd.getAttribute("data-member-id");

introductionAdd.addEventListener("click", () =>{
    
    console.log(commentContents.value);
    console.log(id)

    // introduces_text.style.display="none";

    fetch("mypage", {
        method : "POST",
        headers : { "Content-type":"application/x-www-form-urlencoded" },
        body : "profile_about_me="+commentContents.value+"&member_id="+id
        
    })
    .then(res => res.text())
    .then(res => {
        console.log("반환값 확인: "+ res)
        location.href = "/member/mypage";
    }).catch(error => {
        console.log("오류발생 :" + error);
    })
})

introductionDelete.addEventListener("click", () => {
    console.log(id)
    fetch("introducesDelete?member_id="+id, {
        method : "GET"
    })
    .then(res => res.text())
    .then(res => {
        console.log("반환값 확인: "+ res)
        location.href = "/member/mypage";
    }).catch(error => {
        console.log("오류발생 :" + error);
    })
    
})


