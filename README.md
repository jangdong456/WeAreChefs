1. 프로젝트명 : We Are Chef
2. 개발기간 : 2024.08.05 ~ 2024.08.29
3. 개발인원 : 4명
4. 소개 : 모든 사람들을 위한 레시피를 공유하고, 필요할 때 쉽게 재료를 구매할 수 있도록 커뮤니키 기반 웹 공간입니다.
5. 개발환경 및 시스템 구성
![image](https://github.com/user-attachments/assets/6a615327-5b42-4e9a-aa2b-c7183697362c)
6. ERD
<img width="849" alt="스크린샷 2024-12-13 오후 2 38 22" src="https://github.com/user-attachments/assets/448e6a4f-a76e-412d-8c6a-2774a9a7c258" />

***

7. 내가 구현한 기능
- 회원 가입 기능 구현
    - 회원가입시 javax.mail API 활용하여 Email 인증번호 기능 구현
    - 회원원가입시 Bycrpit API를 활용하여 비밀번호 암호화 기능 구현
    - 정규식을 활용하여 조건에 맞는 값 검증 기능 구현
    - ID, 닉네임, 전화번호 중복검사 기능 구현
- 일반 로그인 및 로그아웃 기능 구현
- 카카오 소셜로그인 API 활용하여 로그인 및 로그아웃 기능 구현
- 마이페이지 기능 구현
    - session의 정보를 활용하여 List 조회 및 페이징 처리 구현
    - 회원탈퇴 기능 구현
    - MultipartFile 활용하여 프로필 사진 추가,삭제 ,업데이트 기능 구현

8.프로젝트 대략적인 이미지
***
<img width="400" src="https://github.com/user-attachments/assets/a1325389-1428-4751-bcae-d11be999a9c9"/>
<img width="400" src="https://github.com/user-attachments/assets/59966a48-5c4f-47c1-9cf2-b8e92ebfb567"/>
<img width="400" src="https://github.com/user-attachments/assets/32c6729e-e419-4b26-9f77-22bfa0f9a8f1"/>
