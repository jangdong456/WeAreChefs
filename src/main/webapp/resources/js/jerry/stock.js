fetch("http://www.kamis.or.kr/service/price/xml.do?action=dailyPriceByCategoryList")
.then((r)=>r.json())
.then((json)=>console.log(json));