## ZEBRA
<blockquote>의류 쇼핑몰 구현</blockquote>

### Service Goals
1. 해외 쇼핑몰에서 자주 사용하는 컬러 검색 필터링 제공
2. 관리자의 편의성을 위한 ajax 데이터 도출 및 다운로드 기능

### Challenge Goals
1. 결제 REST API 활용
2. JavaMail API를 활용한 스케쥴링 메일 발송

### Explore the Project
서비스 및 기능 피드백 적극적으로 수용하고 있습니다

![main](https://github.com/Ellings/ZEBRA/assets/108660734/69d6a385-7d5a-451f-a81a-eda83ccd641b)


## 기능 소개
1. 선택한 컬러, 가격 정렬 및 검색값 ajax 호출
![main1](https://github.com/Ellings/ZEBRA/assets/108660734/819a812e-cf15-42b7-9639-29b18d884bee)

### 업데이트 중입니다

<!--
mapbook

검색어 자동 완성

mapbook

한영 오타 자동 전환 검색 기능

mapbook

한글 영어 상호 보완 검색 기능

mapbook

클릭 한번에 내 주변 대출 가능 도서관 찾기

mapbook

📚 STACKS
    

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
