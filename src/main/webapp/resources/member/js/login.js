



const { Kakao } = window;
  useEffect(() => {
    if (!Kakao.isInitialized()) { //SDK 초기화 여부 판단 함수
     Kakao.init('504d6b8218f4cc3a051e12c617300d61'); //SDK 초기화 함수
    }  
  }, []);

  