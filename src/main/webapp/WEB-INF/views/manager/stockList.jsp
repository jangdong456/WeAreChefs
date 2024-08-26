<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8">
            <c:import url="/WEB-INF/views/managerCommons/cssScript.jsp"></c:import>
            <style>
                .quantity-input {
                    width: 50px;
                    text-align: center;
                    color: black;
                    /* 기본 텍스트 색상 */
                }

                .container {
                    max-width: 1200px;
                    margin: auto;
                }

                .scrollable-div {
                    overflow-y: auto;
                }

                #stockOrderTable {
                    height: 900px;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    text-align: center;
                }

                table thead {
                    position: sticky;
                    top: 0;
                    background-color: #f8f9fa;
                    z-index: 1;
                }

                th,
                td {
                    padding: 12px;
                    text-align: center;
                    vertical-align: middle;
                }

                th {
                    background-color: gainsboro;
                    color: rgb(0, 0, 0);
                }

                tbody tr:nth-child(even) {
                    background-color: #f2f2f2;
                }

                .header-text {
                    font-size: 24px;
                    font-weight: bold;
                    margin-bottom: 20px;
                }

                .flex-container {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 10px;
                }

                #stockOrderTotalP {
                    margin-right: 10px;
                }

                /* stockOrderTable 열 너비 설정 */
                .stockOrderTable-checkbox {
                    width: 5%;
                }

                .stockOrderTable-category {
                    width: 10%;
                }

                .stockOrderTable-name {
                    width: 40%;
                }

                .stockOrderTable-price {
                    width: 15%;
                }

                .stockOrderTable-quantity {
                    width: 15%;
                }

                .stockOrderTable-total {
                    width: 15%;
                }

                /* 수량 입력 필드 너비 조절 */
                .quantity-input {
                    width: 50px;
                    text-align: center;
                }

                /* stockLackTable 열 너비 설정 */
                .stockLackTable-checkbox {
                    width: 5%;
                }

                .stockLackTable-category {
                    width: 10%;
                }

                .stockLackTable-name {
                    width: 40%;
                }

                .stockLackTable-price {
                    width: 15%;
                }

                .stockLackTable-quantity {
                    width: 15%;
                }

                .stockLackTable-total {
                    width: 15%;
                }

                .totalSumPrice {
                    font-size: 25px;
                    font-weight: bold;
                    margin-left: auto;
                    margin-right: 100px;
                }

                .total-price {
                    text-align: center;
                    width: 70px;
                }
            </style>
        </head>

        <body>
            <c:import url="/WEB-INF/views/managerCommons/sidebar.jsp"></c:import>
            <c:import url="/WEB-INF/views/managerCommons/header.jsp"></c:import>
            <div class="container">
                <div class="page-inner">
                    <div class="page-header">
                        <h3 class="fw-bold mb-3">재고 목록</h3>
                        <ul class="breadcrumbs mb-3">
                            <li class="nav-home">
                                <a href="/manager/index">
                                    <i class="icon-home"></i>
                                </a>
                            </li>
                            <li class="separator">
                                <i class="icon-arrow-right"></i>
                            </li>
                            <li class="nav-item">
                                <a href="#">재고</a>
                            </li>
                            <li class="separator">
                                <i class="icon-arrow-right"></i>
                            </li>
                            <li class="nav-item">
                                <a href="#">재고 목록</a>
                            </li>
                        </ul>
                    </div>

                    <!-- 재고 주문 목록 시작 -->
                    <div class="header-text">재고 주문 목록</div>
                    <div class="flex-container">
                        <span class="totalSumPrice">가격 총합 : <span id="stockOrderTotalPrice">0</span></span>
                        <span id="stockOrderTotalBtn">
                            <button id="goCart">장바구니 담기</button>
                            <button id="goOrder" class="btn btn-success">주문하기</button>
                        </span>
                    </div>
                    <hr>
                    <div class="scrollable-div">
                        <table>
                            <h2>재고 부족 품목</h2>
                            <thead>
                                <tr>
                                    <th class="stockLackTable-checkbox"><input type="checkbox" id="selectAllLack"></th>
                                    <th class="stockLackTable-category">종류</th>
                                    <th class="stockLackTable-name">이름</th>
                                    <th class="stockLackTable-price">가격(개당)</th>
                                    <th class="stockLackTable-quantity">수량</th>
                                    <th class="stockLackTable-total">가격합</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${stockLackList}" var="lackList">
                                    <tr>
                                        <td><input type="checkbox" class="row-lack-checkbox stockFoodCheck"></td>
                                        <td class="stockFoodCategory">${lackList.food_category}</td>
                                        <input type="hidden" value="${lackList.food_num}" class="stockFoodNum">
                                        <td class="stockFoodName">${lackList.food_name}</td>
                                        <td class="lack-price stockFoodOnePrice">${lackList.food_buying}</td>
                                        <td>
                                            <button class="stockLackMinus"><i class="fas fa-minus-circle"></i></button>
                                            <input type="text" class="quantity-input stockFoodCount"
                                                placeholder="${lackList.food_stock}" data-original-value="0">
                                            <button class="stockLackPlus"><i class="fas fa-plus-circle"></i></button>
                                        </td>
                                        <td>
                                            <input id="LackTotalPrice" type="text"
                                                class="total-price stockFoodTotalPrice" disabled>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="scrollable-div" id="stockOrderTable">
                        <h2>주문 가능 품목</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th class="stockOrderTable-checkbox"><input type="checkbox" id="selectAllOrder">
                                    </th>
                                    <th class="stockOrderTable-category">종류</th>
                                    <th class="stockOrderTable-name">이름</th>
                                    <th class="stockOrderTable-price">가격(개당)</th>
                                    <th class="stockOrderTable-quantity">수량</th>
                                    <th class="stockOrderTable-total">가격합</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${stockList}" var="list">
                                    <tr>
                                        <td><input type="checkbox" class="row-order-checkbox stockFoodCheck"></td>
                                        <td class="stockFoodCategory">${list.food_category}</td>
                                        <input type="hidden" value="${list.food_num}" class="stockFoodNum">
                                        <td class="stockFoodName">${list.food_name}</td>
                                        <td class="order-price stockFoodOnePrice">${list.food_buying}</td>
                                        <td>
                                            <button class="stockOrderMinus"><i class="fas fa-minus-circle"></i></button>
                                            <input type="text" class="quantity-input stockFoodCount"
                                                placeholder="${list.food_stock}" data-original-value="0">
                                            <button class="stockOrderPlus"><i class="fas fa-plus-circle"></i></button>
                                        </td>
                                        <td>
                                            <input id="stockTotalPrice" type="text"
                                                class="total-price stockFoodTotalPrice" disabled>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- 재고 주문 목록 끝 -->
                </div>
            </div>
            <!-- 공통 footer 삽입 -->
            <c:import url="/WEB-INF/views/managerCommons/footer.jsp"></c:import>
            <!-- Sweet Alert -->
            <script src="/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>
            <!-- orderList Js -->
            <script src="/resources/js/jerry/orderList.js"></script>

            <script>
                document.addEventListener("DOMContentLoaded", function () {

                    // true인 값을 배열에 담는 함수
                    let goOrderBtn = document.getElementById("goOrder");

                    goOrderBtn.addEventListener("click", function () {
                        // 대기중
                        showSpinner();

                        // 클래스 값들을 담을 배열 생성
                        let stockFoodCheck = Array.from(document.querySelectorAll(".stockFoodCheck")).map(input => input.checked);
                        let stockFoodCategory = Array.from(document.querySelectorAll(".stockFoodCategory")).map(td => td.textContent);
                        let stockFoodNum = Array.from(document.querySelectorAll(".stockFoodNum")).map(input => input.value);
                        let stockFoodName = Array.from(document.querySelectorAll(".stockFoodName")).map(td => td.textContent);
                        let stockFoodOnePrice = Array.from(document.querySelectorAll(".stockFoodOnePrice")).map(td => parseFloat(td.textContent));
                        let stockFoodCount = Array.from(document.querySelectorAll(".stockFoodCount")).map(input => parseInt(input.value));
                        let stockFoodTotalPrice = Array.from(document.querySelectorAll(".stockFoodTotalPrice")).map(input => parseFloat(input.value) || 0);

                        // 새로운 배열을 생성하여 체크된 값들만 저장
                        let selectedCategories = [];
                        let selectedNums = [];
                        let selectedNames = [];
                        let selectedPrices = [];
                        let selectedCounts = [];
                        let selectedTotalPrices = [];

                        for (let i = 0; i < stockFoodCheck.length; i++) {
                            if (stockFoodCheck[i]) { // 체크된 값이 true인 경우에만 값을 담음.
                                selectedCategories.push(stockFoodCategory[i]);
                                selectedNums.push(stockFoodNum[i]);
                                selectedNames.push(stockFoodName[i]);
                                selectedPrices.push(stockFoodOnePrice[i]);
                                selectedCounts.push(stockFoodCount[i]);
                                selectedTotalPrices.push(stockFoodTotalPrice[i]);
                            }
                        }

                        let ar = [];

                        for (let i = 0; i < selectedCategories.length; i++) {
                            let form = new FormData();
                            form.food_category = selectedCategories[i];
                            form.food_num = selectedNums[i];
                            form.food_name = selectedNames[i];
                            form.food_count = selectedCounts[i];
                            form.food_one_price = selectedPrices[i];
                            form.food_price = selectedTotalPrices[i];
                            ar.push(form);
                        }

                        fetch("/manager/buyingStock", {
                            method: "POST",
                            headers: {
                                'Content-Type': 'application/json'  // JSON 데이터 전송을 위한 헤더 설정
                            },
                            body: JSON.stringify(ar)
                        })
                            .then(r => r.text())
                            .then(r => {
                                hideSpinner();
                                if (r > 0) {
                                    alert("성공");
                                    showSmailCat();
                                } else {
                                    alert("실패");
                                    showSadCat();
                                }
                                location.href = "/manager/stockList";
                            })
                    });

                    // 가격합 업데이트 함수
                    function updateTotalPrice(row, priceClass, totalPriceClass) {
                        const price = parseFloat(row.querySelector(priceClass).textContent) || 0;
                        const quantity = parseInt(row.querySelector(".quantity-input").value) || 0;
                        const totalPrice = price * quantity;
                        row.querySelector(totalPriceClass).value = totalPrice; // 가격합 업데이트

                        updateOverallTotalPrice(); // 전체 가격합 업데이트
                    }

                    // 전체 가격합 계산 및 업데이트
                    function updateOverallTotalPrice() {
                        let overallTotal = 0;
                        document.querySelectorAll(".total-price").forEach(function (input) {
                            overallTotal += parseFloat(input.value) || 0;
                        });
                        document.getElementById("stockOrderTotalPrice").textContent = overallTotal;
                    }

                    // 체크박스 자동 체크 함수
                    function autoCheck(row, checkboxClass) {
                        const quantityInput = row.querySelector(".quantity-input");
                        const checkbox = row.querySelector(checkboxClass);
                        if (parseInt(quantityInput.value) > 0) {
                            checkbox.checked = true; // 수량이 1 이상이면 체크박스 체크
                        } else {
                            checkbox.checked = false; // 수량이 0이면 체크박스 해제
                        }
                        updateSelectAllCheckbox(checkboxClass); // 전체 선택 체크박스 상태 업데이트
                    }

                    // 수량 증가/감소 버튼 클릭시 이벤트 처리
                    function adjustQuantity(buttonClass, isIncreasing, priceClass, totalPriceClass, checkboxClass) {
                        document.querySelectorAll(buttonClass).forEach(function (button) {
                            button.addEventListener("click", function () {
                                const row = this.closest("tr");
                                const quantityInput = row.querySelector(".quantity-input");
                                let currentValue = parseInt(quantityInput.value) || 0;

                                if (isIncreasing) {
                                    quantityInput.value = currentValue + 1;
                                } else {
                                    if (currentValue > 1) {
                                        quantityInput.value = currentValue - 1;
                                    }
                                }
                                updateTotalPrice(row, priceClass, totalPriceClass);
                                autoCheck(row, checkboxClass);
                            });
                        });
                    }

                    // 수량 입력시 체크박스 자동 체크 및 가격 업데이트
                    function handleQuantityInputChange(priceClass, totalPriceClass, checkboxClass) {
                        document.querySelectorAll(".quantity-input").forEach(function (input) {
                            input.addEventListener("input", function () {
                                const row = this.closest("tr");
                                updateTotalPrice(row, priceClass, totalPriceClass);
                                autoCheck(row, checkboxClass);
                            });
                        });
                    }

                    // 체크박스 선택/해제시 수량 및 가격 업데이트
                    function handleCheckboxChange(checkboxClass, priceClass, totalPriceClass) {
                        document.querySelectorAll(checkboxClass).forEach(function (checkbox) {
                            checkbox.addEventListener("change", function () {
                                const row = this.closest("tr");
                                const quantityInput = row.querySelector(".quantity-input");
                                if (this.checked) {
                                    quantityInput.value = 1; // 수량을 1로 설정
                                } else {
                                    quantityInput.value = quantityInput.getAttribute('data-original-value'); // 원래 값으로 복원
                                }
                                updateTotalPrice(row, priceClass, totalPriceClass);
                                updateSelectAllCheckbox(checkboxClass); // 전체 선택 체크박스 상태 업데이트
                            });
                        });
                    }

                    // 전체 선택/해제시 모든 체크박스 처리
                    function handleSelectAll(selectAllId, checkboxClass, priceClass, totalPriceClass) {
                        document.getElementById(selectAllId).addEventListener("change", function () {
                            const isChecked = this.checked;
                            document.querySelectorAll(checkboxClass).forEach(function (checkbox) {
                                checkbox.checked = isChecked;
                                const row = checkbox.closest("tr");
                                const quantityInput = row.querySelector(".quantity-input");
                                if (isChecked) {
                                    quantityInput.value = 1; // 수량을 1로 설정
                                } else {
                                    quantityInput.value = quantityInput.getAttribute('data-original-value'); // 원래 값으로 복원
                                }
                                updateTotalPrice(row, priceClass, totalPriceClass);
                            });
                        });
                    }

                    // 전체 선택 체크박스 상태 업데이트
                    function updateSelectAllCheckbox(checkboxClass) {
                        const checkboxes = document.querySelectorAll(checkboxClass);
                        const selectAllCheckbox = checkboxClass.includes("lack") ? document.getElementById("selectAllLack") : document.getElementById("selectAllOrder");

                        const allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
                        selectAllCheckbox.checked = allChecked;
                    }
                    // 대기중 보여주는 로딩창    
                    function showSpinner() {
                        document.getElementById('loadingSpinner').style.display = 'block';
                    }

                    function hideSpinner() {
                        document.getElementById('loadingSpinner').style.display = 'none';
                    }

                    // 성공했을 때 웃는 고양이
                    function showSmailCat(){
                        document.getElementById('loadingSmailCat').style.display = 'block';
                    }
                    function hideSmailCat(){
                        document.getElementById('loadingSmailCat').style.display = 'none';
                    }

                    // 실패했을 때 억울한 고양이
                    function showSadCat(){
                        document.getElementById('loadingSadCat').style.display = 'block';
                    }
                    function hideSadCat(){
                        document.getElementById('loadingSadCat').style.display = 'none';
                    }

                    // Stock Lack List 수량 조절 및 가격합 업데이트
                    adjustQuantity(".stockLackPlus", true, ".lack-price", ".total-price", ".row-lack-checkbox");  // 수량 증가
                    adjustQuantity(".stockLackMinus", false, ".lack-price", ".total-price", ".row-lack-checkbox");  // 수량 감소

                    // Stock Order List 수량 조절 및 가격합 업데이트
                    adjustQuantity(".stockOrderPlus", true, ".order-price", ".total-price", ".row-order-checkbox");  // 수량 증가
                    adjustQuantity(".stockOrderMinus", false, ".order-price", ".total-price", ".row-order-checkbox");  // 수량 감소

                    // 각 테이블의 체크박스 선택/해제 이벤트 처리
                    handleCheckboxChange(".row-lack-checkbox", ".lack-price", ".total-price");
                    handleCheckboxChange(".row-order-checkbox", ".order-price", ".total-price");

                    // 각 테이블의 수량 입력시 이벤트 처리
                    handleQuantityInputChange(".lack-price", ".total-price", ".row-lack-checkbox");
                    handleQuantityInputChange(".order-price", ".total-price", ".row-order-checkbox");

                    // 전체 선택/해제 이벤트 처리
                    handleSelectAll("selectAllLack", ".row-lack-checkbox", ".lack-price", ".total-price");
                    handleSelectAll("selectAllOrder", ".row-order-checkbox", ".order-price", ".total-price");

                });
            </script>
            <div id="loadingSpinner" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); z-index:1000;">
                <img src="/resources/assets/img/catReloading.gif" alt="Loading...">
            </div>
            <div id="loadingSmailCat" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); z-index:1000;">
                <img src="/resources/assets/img/smailCat.jpg" alt="Loading...">
            </div>
            <div id="loadingSadCat" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); z-index:1000;">
                <img src="/resources/assets/img/sadCat.jpg" alt="Loading...">
            </div>
        </body>

        </html>