const attach = document.getElementById("attach")
const imgDiv = document.getElementById("imgDiv")

attach.addEventListener("change",()=>{
    
    let attachv = attach.value;

    if(!attachv.match(/(.*?)\.(jpg|jpeg|png|gif)$/)){
        alert('이미지 파일만 업로드 가능합니다')
        attach.value=null
    }

    const reader = new FileReader();
  reader.onload = ({ target }) => {
    imgDiv.innerHTML=''
    imgDiv.innerHTML = `<img id="viewImg" src="${target.result}"/>`;
  };
  reader.readAsDataURL(attach.files[0]);

})