
const commentContents = document.getElementById("commentContents");
const introductionAdd = document.getElementById("introduction_add");
const introductionDelete = document.getElementById("introduction_delete");
const introduces_text = document.getElementById("introduces_text");

const profileAdd = document.getElementById("profile_picture_add");

let introductionId = introductionAdd.getAttribute("data-member-id");

let profileId = profileAdd.getAttribute("data-member-id");



introductionAdd.addEventListener("click", () =>{
    
    console.log(commentContents.value);
    console.log(introductionId)

    introduces_text.style.display="none";

    fetch("mypage", {
        method : "POST",
        headers : { "Content-type":"application/x-www-form-urlencoded" },
        body : "profile_about_me="+commentContents.value+"&member_id="+introductionId
        
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
    console.log(introductionId)
    fetch("introducesDelete?member_id="+introductionId, {
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


