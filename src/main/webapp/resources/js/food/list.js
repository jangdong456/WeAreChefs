const searchIcon = document.getElementById("searchIcon");
const nameSearch = document.getElementById("nameSearch");
const listDiv = document.getElementById("listDiv");
const fruits = document.getElementById("fruits")
const frm = document.getElementById("frm")

searchIcon.addEventListener("click", () => {

    frm.submit()    

});

fruits.addEventListener("change",()=>{
    document.getElementById("k").getAttribute("data-");
    console.log("change")
    const fruitValue = fruits.value
    console.log(fruitValue)

    const url = new URL(window.location.href)
    const params = new URLSearchParams(url.search)
    const kindValue = params.get('kind')

  
    const searchValue = params.get('search')

        fetch("/food/list",{
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "order=" + fruitValue +"&kind="+kindValue + "&search="+searchValue
        })
    
        .then(r=>r.text())
        .then(r=>{
    
            listDiv.innerHTML = r
    
        })


})