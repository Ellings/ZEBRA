## ZEBRA
<blockquote>의류 쇼핑몰 구현</blockquote>

### Service Goals
1. 해외 쇼핑몰에서 자주 사용하는 컬러 검색 필터링 제공
2. 관리자의 편의성을 위한 ajax 데이터 도출 및 다운로드 기능

### Challenge Goals
1. 결제 REST API 활용
2. JavaMail API를 활용한 스케쥴링 메일 발송

### Explore the Project
서비스 및 기능 피드백 적극적으로 수용하고 있습니다!

<img src="https://github.com/Ellings/ZEBRA/assets/108660734/69d6a385-7d5a-451f-a81a-eda83ccd641b" width="600">


## 기능 소개
<blockquote>이미지를 클릭하면 큰 화면으로 볼 수 있습니다.</blockquote>

1. [유저]선택한 컬러, 가격 정렬 및 검색값 ajax 호출<br>
<img src="https://github.com/Ellings/ZEBRA/assets/108660734/819a812e-cf15-42b7-9639-29b18d884bee" width="600"><br>

2. [유저]장바구니 CRUD 및 체크박스 기능<br>
<img src="https://github.com/Ellings/ZEBRA/assets/108660734/72e3cc1f-07d9-4384-8df7-571c25f9dbb2" width="600"><br>

3. [유저]가입 회원만 이용 가능한 댓글 CRUD 기능<br>
<img src="https://github.com/Ellings/ZEBRA/assets/108660734/e706d1a4-50c1-4790-a05b-312ae24cc302" width="600"><br>

4. [유저]회원가입 및 우편 API<br>
<img src="https://github.com/Ellings/ZEBRA/assets/108660734/dee442b5-bbc6-46ed-ba3b-013341463818" width="600"><br>

5. [유저]주문 및 결제 API<br>
<img src="https://github.com/Ellings/ZEBRA/assets/108660734/274bf36c-ce4a-47a3-9558-58069102dc66" width="600"><br>
  
6. [관리자]회원 관리 데이터 ajax 호출<br>
<img src="https://github.com/Ellings/ZEBRA/assets/108660734/0e72ed7f-b622-4853-a6c5-f10cd2e48598" width="600"><br>

7. [관리자]회원 목록 CRUD 및 CSV, XLSX 파일 다운로드 기능<br>
<img src="https://github.com/Ellings/ZEBRA/assets/108660734/22815df2-ac2c-4deb-b033-5c97fda23525" width="600"><br>

8. [관리자]상품 관리 CRUD<br>
<img src="https://github.com/Ellings/ZEBRA/assets/108660734/26b1b076-1a93-43cf-8a5b-5db37d965d49" width="600"><br>

9. [관리자]주문 관리 - 배송 상태 수정 및 검색 기능<br>
<img src="https://github.com/Ellings/ZEBRA/assets/108660734/fcb8a6b9-afa6-4bc5-b3a6-bca4a54aaf93" width="600"><br>

📚 STACKS<br>
https://github.com/Ellings/

## Updating...
    
<!--

    

📁 Foldering

📁 libraryService _ 
                    |_ 📁 commons _ 
                    |              |_ 📁 api (Open API 관련) ⭐
                    |              |_ 📁 async (비동기 처리 support)
                    |              |_ 📁 caching (통합 Caching 관리) ⭐
                    |              |_ 📁 circuitBreaker (Open Api 장애 대책) ⭐
                    |              |_ 📁 reporter (slack bot을 통한 slow query 보고)
                    |              |_ 📁 tester (search 성능 테스트)
                    |              |_ 📁 timer (내부 응답 속도 체크)
                    |              |_ 📁 updater (도서 최신화)
                    |
                    |_ 📁 batch     _    📁 aop
                    |                  |_ 📁 bookUpdate (Book 상세정보 최신화) 
                    |                  |_ 📁 jobController
                    |                  |_ 📁 keyword (명사 사전)
                    |                  |_ 📁 loanCnt (장서 목록 File 기반 대출 횟수 최신화)
                    |                  |_ 📁 preSortBook
                    |_ 📁 logging_ _
                    |               |_ 📁 logger
                    |               |_ 📁 util
                    |               |_ 📁 parser
                    |               |_ 📁 service
                    |
                    |_ 📁 mapBook_ _
                    |              |_ 📁 cacheKey
                    |              |_ 📁 controller
                    |              |_ 📁 dto
                    |              |_ 📁 entity
                    |              |_ 📁 exception
                    |              |_ 📁 repository
                    |              |_ 📁 service (도서관 찾기 및 매핑) ⭐
                    |_ 📋 search _ _
                    |              |_ 📁 advice (exception handler)
                    |              |_ 📁 controller
                    |              |_ 📁 dto
                    |              |_ 📁 engine (검색 엔진) ⭐
                    |              |_ 📁 entity
                    |              |_ 📁 exception
                    |              |_ 📁 repository ⭐
                    |              |_ 📁 service (책 찾기 & 단어 유효성 검사) ⭐
                    |              |_ 📁 util (도서 검색 알고리즘 및 filter,converter)  ⭐

Project Duration & Team
Duration: 2023.03.31 - 2023.05.12
Team: 4 Backend Developers
Backend Technology
Java
Spring Boot
Spring JPA
Thymeleaf
QueryDsl
Spring Batch
eunjeon (자연어 분석)
Junit5
WireMock
Mockito
Infrastructure
AWS EC2
Github CI/CD
AWS RDS (Mysql 8.0)
Open API
Kakao Map
Library Information System (for book availability check)
Thanks
convert 코드 : https://github.com/javacafe-project/elasticsearch-plugin
Book Data
3,740,754 raws
~ 23년 4월 도서 데이터 최신화 완료
-->
