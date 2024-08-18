let divDetail = document.getElementById("divDetail");


//== Class definition
var SweetAlert2Demo = (function () {
  //== Demos
  var initDemos = function () {
    $("#alert_demo_7").click(function (e) {
      swal({
        title: "알림",
        text: "회원 정보를 수정 하시겠습니까?",
        type: "warning",
        buttons: {
          confirm: {
            text: "Yes",
            className: "btn btn-success",
          },
          cancel: {
            visible: true,
            className: "btn btn-danger",
          },
        },
      }).then((Boolean) => {
        if(Boolean == true){
          let inputMemberId = document.getElementById("inputMemberId").value
          fetch("memberDetailUpdate?member_id="+inputMemberId, {
            method:"GET"
          })
          .then(r=>r.text())
          .then(r=>{
            divDetail.innerHTML = r;
          })
        }
      });
    });
  };

  $("#alert_demo_8").click(function (e) {
        swal({
          title: "경고",
          text: "회원 정보를 삭제하겠습니까?",
          type: "warning",
          buttons: {
            confirm: {
              text: "Yes",
              className: "btn btn-success",
            },
            cancel: {
              visible: true,
              className: "btn btn-danger",
            },
          },
        }).then((Delete) => {
          if (Delete) {
            swal({
              title: "삭제 성공",
              text: "회원 정보가 삭제되었습니다.",
              type: "success",
              buttons: {
                confirm: {
                  className: "btn btn-success",
                },
              },
            });
          } else {
            swal.close();
          }
        });
      });

  return {
    //== Init
    init: function () {
      initDemos();
    },
  };
})();

//== Class Initialization
jQuery(document).ready(function () {
  SweetAlert2Demo.init();
});