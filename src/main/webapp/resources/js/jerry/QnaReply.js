const replyBtn = document.getElementById("qnaReplyBtn");
const boardNum = document.getElementById("qnaBoardNum");
const commentList = document.getElementById("commentList");

const qnaBoardNum = boardNum.getAttribute("data-qnaBoardNum");
    
// function getReply() {
//   fetch("/board/qna/commentList") // 서버의 API 엔드포인트로 변경하세요.
//     .then(response => response.json())
//     .then(inquiryDTOList => {
//       let content = '';
//       inquiryDTOList.forEach(list => {
//         content += `
//         <table>
//           <thead>
//             <tr>
//               <th>글번호 : ${list.step}</th>
//               <th>작성자 : ${list.member_id}</th>
//               <th>작성일 : ${list.create_date}</th>
//             </tr>
//           </thead>
//           <tbody>
//             <td>↳ ${list.board_content}</td>
//           </tbody>
//         </table>`;
//       });

//       document.getElementById('commentList').innerHTML = content;
//     })
//     .catch(error => {
//       console.error('Error fetching data:', error);
//     });
// }






replyBtn.addEventListener("click", function() {
  
  let replyInput = document.getElementById("replyInput").value;
  console.log(qnaBoardNum);
  console.log(replyInput);

  

  const form = new FormData();
  form.append("board_num", qnaBoardNum);
  form.append("board_content", replyInput);


  fetch("/borad/qna/reply", {
    method:"POST",
    body:form
  })
  .then(r=>r.text())
  .then(r=>{
    r=r.trim();
    if(r>0){
      getReply
    }else{
      alert("실패");
    }
    
  })
  alert("끝");

});
