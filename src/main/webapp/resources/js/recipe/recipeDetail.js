const reBtn = document.getElementById("reBtn");
const re_frm = document.getElementById("re_frm");
const review = document.getElementById("review");
const reply = document.getElementById("reply");

//reBtn.addEventListener("click",()=>{
    //alert("test");
  //  re_frm.submit();

//})


reBtn.addEventListener("click", () => {
    if (review.checked) {
        re_frm.action = '/recipe/review'; 
    } else if (reply.checked) {
        re_frm.action = '/recipe/reply';
    }

    console.log('Form action:', re_frm.action); 


    re_frm.submit();
});
