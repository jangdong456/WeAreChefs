const token = localStorage.getItem('token');

fetch("https://kapi.kakao.com/v1/user/unlink", {
    method : "POST",
    headers :  { Authorization: "Bearer " + `${token}` },        
})
.then(res => res.json())
.then(res => {
    console.log("어떤게 넘어올까?")
    console.log(res)
    localStorage.removeItem('token');
    location.href = "/";
})





 
