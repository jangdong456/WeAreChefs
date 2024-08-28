const recipeAddBtn = document.getElementById("recipeAddBtn");
const recipe_time = document.getElementById("recipe_time");
const recipe_level = document.getElementById("recipe_level");
const recipe_category = document.getElementById("recipe_category");
const addForm = document.getElementById("addForm");


recipeAddBtn.addEventListener("click",()=>{
    
    if(recipe_time.value =="" || recipe_level.value =="" || recipe_category.value==""){
        
        alert("모든항목을 입력해주세요.");
        return;
    }
    addForm.submit();

});