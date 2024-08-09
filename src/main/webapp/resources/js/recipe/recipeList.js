const frm = document.getElementById("frm");
const search_icon = document.getElementById("search_icon");
const order = document.getElementById("order");
const order_frm = document.getElementById("order_frm");


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

// Set the selected option based on the query parameter
const selectedOrder = getQueryParameter('order');
if (selectedOrder) {
    order.value = selectedOrder;
}

// Submit the form when the selected option changes
order.addEventListener("change", function() {
    order_frm.submit();
});