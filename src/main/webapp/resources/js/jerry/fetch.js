testBTN.addEventListener("click", () => {
  console.log('누름');
  let categoryNum = 100;
  let url = 'http://www.kamis.or.kr/service/price/xml.do?action=dailyPriceByCategoryList';
  let productCls = '&p_product_cls_code=02';
  let itemCategory = '&p_item_category_code=';
  let countryCode = '&p_country_code='
  let regday = '&p_regday=2024-08-23'
  let kg = '&p_convert_kg_yn=Y'
  let keyId = '&p_cert_key=2e9c9e0a-557a-42ba-9828-1ad76672f5be&p_cert_id=4643&p_returntype=json';
  url = url + productCls + itemCategory + categoryNum + countryCode + regday + kg + keyId
  
  // 식량작물
  fetch(url, {
    method: "GET",
    headers: { "Content-type": 'application/x-www-form-urlencoded;charset=utf-8' }
  })
  .then(r => r.json())
  .then(r => {
    console.log(r.data.item);

    const items = r.data.item;  // r.data.item 배열을 가져옵니다.
    const printedItems = new Set(); // 이미 출력된 item_name을 저장할 Set
    let ar = [];
    items.forEach(item => {
      let form = new FormData();

      // 축산 외의 것들은 이 코드를 사용하면 되는데, 축산은 적용이 안됨.
      if (item.rank === '상품' || item.rank === '' && !printedItems.has(item.item_name)) {
        let combinedName;

        // item_name과 kind_name의 공통 부분을 찾아 제거 후 결합
        if (item.kind_name.includes(item.item_name)) {
          combinedName = item.kind_name;  // kind_name에 이미 item_name이 포함된 경우
        } else {
          combinedName = `${item.item_name} ${item.kind_name}`;  // 포함되지 않은 경우
        }

        let categoryName = '';
        if(categoryNum == 100){
          categoryName ='식량작물';
        }else if(categoryNum == 200){
          categoryName ='채소류'
        }else if(categoryNum == 400){
          categoryName ='과일류'
        }else if(categoryNum == 500){
          categoryName ='축산물'
        }else if(categoryNum == 600){
          categoryName = '수산물'
        }
        // 이름
        console.log(combinedName);
        // buying
        console.log(isNaN(Number(item.dpr1.replace(/,/g, ''))) ? 0 : Number(item.dpr1.replace(/,/g, '')));
        let price = isNaN(Number(item.dpr1.replace(/,/g, ''))) ? 0 : Number(item.dpr1.replace(/,/g, ''))
        // price
        console.log(isNaN(Number(item.dpr1.replace(/,/g, '')))? 0:Number(item.dpr1.replace(/,/g, '')) * 1.5)
        let adjustedPrice = price * 1.7;

        printedItems.add(item.item_name); // 출력된 item_name을 Set에 추가

        form.food_category = categoryName;
        form.food_name = combinedName
        form.food_buying = price;
        form.food_price = adjustedPrice;
        ar.push(form);
      }
    });

    const jsonAr = JSON.stringify(ar); // 여기에서 "JSON"을 올바르게 사용해야 합니다.
  
    // 위 반복문이 끝나고 한꺼번에 controller로 값을 보낼 예정
    fetch("/manager/addItems", {
      method: "POST",
      headers: { 'Content-Type': 'application/json' }, // JSON 데이터를 전송할 때 헤더를 설정합니다.
      body: jsonAr
    });
  })

  .catch(error => {
    console.error('Error:', error);
  });
});