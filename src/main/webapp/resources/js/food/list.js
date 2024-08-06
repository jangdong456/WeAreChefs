const searchIcon = document.getElementById("search-icon-1")
const nameSearch = document.getElementById("nameSearch")
const listDiv = document.getElementById("listDiv")

searchIcon.addEventListener("click",()=>{

    fetch("/food/list",{
        method:"POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body:"search="+nameSearch.value
    })
    .then(r=>r.text())
    .then(r=>{
        console.log(r)
        listDiv.innerHTML=r})

})
