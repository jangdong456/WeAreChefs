const frm = document.getElementById("frm");
const search_icon = document.getElementById("search_icon");
const order = document.getElementById("order");
const order_frm = document.getElementById("order_frm");
const kindfrm = document.getElementById("kindfrm");

let kindOrd = kindfrm.getAttribute("data-kind-frm");
kindfrm.value=kindOrd;
console.log(kindfrm.value);

search_icon.addEventListener("click",function(){
     frm.submit();
});

order.addEventListener("change",function(){
    //console.log(order.value);
    //alert(order.value);
    order_frm.submit();
});

function getQueryParameter(name) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name);
}


const selectedOrder = getQueryParameter('order');
if (selectedOrder) {
    order.value = selectedOrder;
}

//console.log(kindfrm.getAttribute("data-kind-frm"));



