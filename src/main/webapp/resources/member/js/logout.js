const token = localStorage.getItem('token');

fetch("https://kapi.kakao.com/v1/user/logout", {
    method : "POST",
    headers :  { Authorization: "Bearer " + `${token}` },        
})
.then(res => res.json())
.then(res => {
    localStorage.removeItem('token');
    location.href = "/";
})




 
