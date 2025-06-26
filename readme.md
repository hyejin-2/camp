<h1 align="center">
CampingMate
</h1>
<p align="center">
</p>
  <img alt="브로셔 이미지" src="https://github.com/CampingMate/CampingMate/assets/84883277/f368bebb-ae7b-4550-b13a-7fea3236048b"/>

## 프로젝트 개요
### “Camping Mate" 는 캠핑러들을 위한 전국 캠핑장 정보 제공 커뮤니티 플랫폼입니다.

#### 💡 '캠핑메이트'는 다음과 같은 분들을 위해 탄생되었습니다.

> 📸 나만의 캠핑 경험을 다른 이들과 공유하며, 그 순간들을 자랑하고 싶은 분들
> 

> 🌟 처음 캠핑을 시작하려는 초보자들로서, 어떤 장소가 좋은지 알고 싶은 분들
> 

> 🏞 아름다운 자연 속에서의 휴식을 꿈꾸지만, 어느 캠핑장이 좋을지 선택하기 어려워하는 분들
> 

<br/>

## 팀원 구성

| **김르탄** | **이르탄** | **박르탄** | **최르탄** | **정르탄** |
| :------: |  :------: | :------: | :------: | :------: |

### 프로젝트 일정
YY/MM/DD~YY/MM/DD

### 기술 스택
| 분류 | 이름 |
| --- | --- |
| Architecture | <img src="https://img.shields.io/badge/MVVM-FDECC8"> |
| Jetpack | <img src="https://img.shields.io/badge/ViewModel-2C593F"> <img src="https://img.shields.io/badge/LiveData-373737"> <img src="https://img.shields.io/badge/LifeCycle-373737"> <img src="https://img.shields.io/badge/ViewBinding-5A5A5A"> <img src="https://img.shields.io/badge/AAC-2C593F"> |
| 비동기 처리 | <img src="https://img.shields.io/badge/Coroutine-29456C"> |
| 데이터 처리 | <img src="https://img.shields.io/badge/EncryptedSharedPreferences-69314C"> <img src="https://img.shields.io/badge/Parcelize-89632A"> <img src="https://img.shields.io/badge/AES algorithm-89632A">     |
| Firebase | <img src="https://img.shields.io/badge/Storage-FFCA28"> <img src="https://img.shields.io/badge/Authentication-4285F4"> <img src="https://img.shields.io/badge/Firestore-854C1D"> <img src="https://img.shields.io/badge/Function-89632A">   |
| API통신 | <img src="https://img.shields.io/badge/Retrofit-373737">  |
| 활용API | <img src="https://img.shields.io/badge/Naver Map Api-03C75A"> <img src="https://img.shields.io/badge/Kakao Login-FFCD00"> <img src="https://img.shields.io/badge/Gocamping data Api-492F64"> <img src="https://img.shields.io/badge/Holiday data Api-373737"> <img src="https://img.shields.io/badge/OpenSearch(ElasticSearch)-492F64">      |
| 이미지 로더 | <img src="https://img.shields.io/badge/Glide-18BED4">  |
| UI Frameworks | <img src="https://img.shields.io/badge/Fragment-492f64"> <img src="https://img.shields.io/badge/RecyclerViewAdapter-6e3630"> <img src="https://img.shields.io/badge/ListAdapter-373737"> <img src="https://img.shields.io/badge/XML-89632a"> <img src="https://img.shields.io/badge/MaterialDesign-757575"> <img src="https://img.shields.io/badge/ViewPager-89632a"> <img src="https://img.shields.io/badge/Shimmer-28456c"> <img src="https://img.shields.io/badge/Bottomsheet-492f64"> <img src="https://img.shields.io/badge/Splash-28456c"> <img src="https://img.shields.io/badge/Custom Photo Picker-6e3630">     


### 앱 디자인 설계
<p align="center">
 <a href="https://www.figma.com/file/IVnrWziOCqXUAwTfcDAqV8/CampingMate-Design?type=design&node-id=1%3A25&mode=design&t=pBsDU44oIsPEdYvw-1">
<img width="802" alt="image" src="https://github.com/CampingMate/CampingMate/assets/84883277/2e6bd4f6-4f83-4d52-921f-4ce7235823b9">
</p>


  
### 역할 분담
**김르탄** : 게시물 검색, 게시판 목록 보기, 글쓰기/삭제, CustomPhotoPicker,
게시물 댓글 쓰기/삭제, 인터넷 연결 상태 대응, 앱 분석 도구

**이르탄** : DB검색 필터링, 캠핑장 이름검색, 캠핑장 정보 공유 및 댓글, 유저 정보 암호화

**박르탄** : 지도 전반의 기능, 캠핑장 마트 표시 기능

**최르탄** : 칩선택기능, 전체칩 기능 구현, 휴일정보 기능, 로그인, 스플래시

**정르탄** : 프로필 기능, 북마크 기능, 로그인/로그아웃 기능

<br/>

## 주요 기능(제목을 누르면 기능별 상세 설명 페이지로 이동합니다)

| [홈 화면] | [캠핑장 상세 화면] | [검색 화면] | [지역별 캠핑장 화면] |
| --- | --- | --- | --- |
| - 지역별 캠핑장 보기<br>- 댓글별 캠핑장 보기<br>- 반려동물 동반 캠핑장 보기<br>- 휴일정보 보기<br>- 테마별 칩 | - 캠핑장 상세 정보 보기<br>- 캠핑장 댓글 작성/삭제<br>- 캠핑장 경로 보기<br>- 주변 마트 위치 보기<br>- 북마크 기능 | - 검색화면 보기<br>- 캠핑장 이름 검색<br>- 카테고리별 필터링 | - 지역별 캠핑장 모아보기 |

| [게시판 화면] | [게시물 작성 화면] | [게시물 상세 화면] |
| --- | --- | --- |
| - 게시물 목록 보기<br>- 게시물 검색 | - 게시물 작성<br>- Custom Photo Picker | - 게시물 보기/삭제<br>- 댓글 작성/삭제 |

| [지도 화면] | [로그인 화면] | [프로필 화면] |
| --- | --- | --- |
| - 캠핑장 위치 보기<br>- 클러스터링<br>- 캠핑장 정보 확인<br>- 북마크된 캠핑장 보기<br>- 지도 타입 바꾸기 | - 구글/카카오 간편 로그인 | - 유저 정보 확인 및 수정<br>- 북마크 캠핑장/작성한 글 확인<br>- 로그아웃 |

<br/>

## TroubleShooting

#### Photopicker Custom View 개발
- 필요성: 이미지와 함께 게시물 올리기. 공식 포토피커는 선택한 이미지 상태 복원 기능 미제공
- 해결책: 상태복원, 다중 선택, 개수 제한 기능 제공 커스텀뷰 개발
- 개선점: 이미지 로딩 속도 Nm/s -> Nm/s(N% -> N%) 개선

#### 지도화면 내 마커 표시 최적화
- 문제: 캠프 개수가 3700개에 달하며, 모두 표시 시 성능 문제 발생
- 해결책: 클러스터링 적용과 현재 화면에만 마커 보이도록 최적화
- 개선점: 최적화 결과 기존 로딩 속도 Nm/s -> Nm/s

#### 개발단계에 맞는 키해시 등록
- 문제: 등록되지 않은 키해시로 인한 로그인 에러
- 해결책: 개발자의 키해시 등록 및 구글 콘솔 인증서 기반 키해시 등록으로 문제 해결

#### 회원가입 시 유저정보 등록 최적화
- 문제: 첫 유저데이터 생성 시간 소모적
- 해결책: 기본 프로필 이미지 URI 파이어스토어 저장 및 스토리지 별도 업로드로 로그인 시간 단축
- 개선점: 로그인 시간 단축 (개선 전 : Nm/s -> 개선 후 Nm/s)

#### Firestore 데이터 세분화
- 문제: Firestore NoSQL 형식으로 중복 필터링 적용 어려움
- 해결책: 리스트 형식 데이터를 단일항목으로 저장하여 필터링 적용
- 개선점: 검색 기능 최적화(자동 완성 기능에서의 네트워크 요청 처리 횟수 감소 - N회 -> N회)

#### 디바운싱 클래스 작성
- 문제: 게시물 업로드 시 중복 터치 문제
- 해결책: 코틀린 확장함수 사용해 디바운싱 적용한 클릭 리스너 개발
- 고려사항: 디바운싱과 쓰로틀링의 차이 이해
- 개선점: 디바운싱 적용으로 네트워크 요청 처리 횟수 감소. 메모리 과부하로 앱 강제 종료 횟수 감소(N% -> N%)


<br/>

## 유지보수 및 개선사항

### YYYY/MM/DD: 유저정보 암호화를 위한 키 값을 서버에서 가지고 오지 못하는 이슈
이슈 내용
- 문제 기기: OnePlus
- 이슈 상황: 앱 진입 시, 서버에 암호화되어있는 정보를 받아와 복호화하기 위한 키를 받아와야 하는데 일부 키를 정상적으로 받지 못하는 경우 발생
- 임시 대응: 암호화 키를 로컬 값으로 변경함
- 향후 계획: 서버에서 키를 가져오는 로직 변경


### YYYY/MM/DD: EncryptedSharedPreferences 라이브러리 이슈
이슈 내용
- 문제 기기: Galaxy23
- 이슈 상황: 앱 진입 시, 일부 기기에서 앱 크래시 발생. Issue Tracker [(Issue)](https://issuetracker.google.com/issues/164901843?pli=1) 를 찾아보니 수년전부터 있어온 고질적인 문제인 것으로 확인 
- 대응: EncryptedSharedPreferences 사용 시, 크래시가 나는 경우 새로 생성하는 로직을 추가함
