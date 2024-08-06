const searchIcon = document.getElementById("search-icon-1");
const nameSearch = document.getElementById("nameSearch");
const listDiv = document.getElementById("listDiv");

searchIcon.addEventListener("click", () => {
    fetch("/food/list", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "search=" + encodeURIComponent(nameSearch.value)
    })
    .then(response => response.text())
    .then(html => {
        // listDiv의 내부 HTML을 새롭게 받은 HTML로 교체
        listDiv.innerHTML = html;

        // 동적으로 삽입된 요소들에 대해 추가적으로 해야 할 작업이 있다면 여기에 작성
        // 예: 이벤트 리스너를 다시 추가하거나, 특정 스타일을 강제 적용하는 작업 등
    })
    
});