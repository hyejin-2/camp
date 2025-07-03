<h1 align="center">
전투 RPG 게임
</h1>
<p align="center">
</p>
</p>

## 과제 시나리오
### 아래의 기능을 활용한 전투 RPG 게임 프로그램 만들기

> 랜덤으로 값을 뽑아내는 기능
> 

> 파일 입출력을 처리하는 기능
> 

> 객체 지향을 활용한 전체 구조 생각하기
> 
<br/>

## 작성자

| **hyejin-2** | 
| :----------: |  

<br/>

## 과제 일정
25/07/02~25/07/04

<br/>

## Hint: 과제 요소 (필수 정의)
### 게임을 정의하기 위한 Game 클래스
속성 (Property)
- 캐릭터 (`Character`)
- 몬스터 리스트 (`List<Monster>`)
- 물리친 몬스터 개수(`int`): 몬스터의 리스트의 개수보다 클 수 없음

메서드 (Method)
- 게임을 시작하는 메서드 (`startGame()`)  
캐릭터의 체력이 0 이하가 되면 게임 종료  
몬스터를 물리칠 때마다 다음 몬스터와 대결할 건지 선택 가능  
(예) `다음 몬스터와 대결하시겠습니까? (y/n)`  
설정한 물리친 몬스터 개수만큼 몬스터를 물리치면 게임에서 승리  
- 전투를 진행하는 메서드 (`battle()`)  
게임 중에 사용자는 매 턴마다 행동을 선택할 수 있음  
(예) 공격하기(1), 방어하기(2)  
매 턴마다 몬스터는 사용자에게 공격만 가함  
캐릭터는 몬스터 리스트에 있는 몬스터들 중 랜덤으로 뽑혀서 대결 함  
처치한 몬스터는 몬스터 리스트에서 삭제  
캐릭터의 체력은 대결 간에 누적  
- 랜덤으로 몬스터를 불러오는 메서드(`getRandomMonster()`)  
`Random()` 을 사용하여 몬스터 리스트에서 랜덤으로 몬스터를 반환하여 대결

힌트
- 반복문을 사용하여 몬스터를 랜덤으로 뽑으며 순회하면서 대결 진행  

### 캐릭터를 정의하기 위한 Character 클래스
속성 (Property)
- 이름 (`String`)
- 체력 (`int`)
- 공격력 (`int`)
- 방어력 (`int`)

메서드 (Method)
- 공격 메서드 (`attackMonster(Monster monster)`)  
몬스터에게 공격을 가하여 피해를 입힙니다.
- 방어 메서드 (`defend()`)  
방어 시 특정 행동 수행  
(예) 대결 상대인 몬스터가 입힌 데미지만큼 캐릭터의 체력을 상승시킴  
- 상태를 출력하는 메서드 (`showStatus()`)  
캐릭터의 현재 체력, 공격력, 방어력을 매 턴마다 출력

### 몬스터를 정의하기 위한 Monster 클래스
속성 (Property)
- 이름 (`String`)
- 체력 (`int`)
- 랜덤으로 지정할 공격력 범위 최대값 (`int`)  
몬스터의 공격력은 캐릭터의 방어력보다 작을 수 없음  
랜덤으로 지정하여 캐릭터의 방어력과 랜덤 값 중 최대값으로 설정해  
- 방어력(`int`) = 0  
몬스터의 방어력은 0이라고 가정

메서드 (Method)
- 공격 메서드 (`attackCharacter(Character character)`)  
캐릭터에게 공격을 가하여 피해를 입힘  
캐릭터에게 입히는 데미지는 몬스터의 공격력에서 캐릭터의 방어력을 뺀 값이며, 최소 데미지는 0 이상임  
- 상태를 출력하는 메서드 (`showStatus()`)  
몬스터의 현재 체력과 공격력을 매 턴마다 출력합니다.

<br/>

## 필수 기능 가이드

### 1. 파일로부터 데이터 읽어오기 기능
설명  
- 게임(`Game` 클래스) 시작 시 캐릭터와 몬스터의 스탯을 파일에서 읽어옵니다
  <img alt="txt이미지" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdna%2Fdel0d3%2FbtsO2kC4IAh%2FAAAAAAAAAAAAAAAAAAAAAKXAUewK3KPpSlrt694DST1XPabwuML8a1cW7eNd9LyV%2Fimg.png%3Fcredential%3DyqXZFxpELC7KVnFOS48ylbz2pIh7yKj8%26expires%3D1753973999%26allow_ip%3D%26allow_referer%3D%26signature%3D69O3at%252BeZrp1denchx1wOYDAYWU%253D"/>

조건
- 캐릭터의 스탯은 `characters.txt` 파일에서 읽어옵니다.  
- 몬스터들의 스탯은 `monsters.txt` 파일에서 읽어옵니다.  
- 파일의 데이터는 CSV 형식으로 되어 있습니다.  
- 예시  
캐릭터 → 체력, 공격력, 방어력  
몬스터 →이름, 체력, 공격력 최대값(설정된 최대값에서 `Random()` 을 사용하여 공격력 지정)

힌트
- dart:io 라이브러리의 File 클래스를 사용하여 파일을 읽습니다.  
- `Rsplit()`R 메서드를 사용하여 CSV 데이터를 분리한 후 변수(health, attack, defense)에 선언해줍니다.  
- 심화: 동기/비동기 두가지 방식으로 파일을 불러올 수 있습니다.

### 2. 사용자로부터 캐릭터 이름 입력받기 기능
설명
- 게임 시작 시 사용자가 캐릭터의 이름을 입력합니다.

조건
- 이름은 빈 문자열이 아니어야 합니다.
- 이름에는 특수문자나 숫자가 포함되지 않아야 합니다.
- 허용 문자: 한글, 영문 대소문자

힌트
- (도전) 정규표현식 등을 사용하면 조금 더 편하게 제한된 이름만 입력받을 수 있습니다.  
`RegExp(r'^[a-zA-Z가-힣]+$')`
  
### 3. 게임 종료 후 결과를 파일에 저장하는 기능
설명
- 게임 종료 후 결과를 파일에 저장합니다.

조건
- `결과를 저장하시겠습니까? (y/n)`를 출력합니다.  
- 사용자의 입력에 따라 결과를 result.txt 파일에 저장합니다.  
- 저장되는 내용은 캐릭터의 이름, 남은 체력, 게임 결과(승리/패배)*입니다.

힌트
- File 클래스의 `writeAsStringSync()` 을 이용하여 파일을 저장할 수 있습니다.

### 4. 캐릭터와 몬스터의 공통되는 부분을 추상화하여, 추상 클래스 구현
설명
- Character 클래스와 Monster 클래스에서 공통되는 부분을 추상화하여, 이를 추상 클래스로 만들고,  
두 클래스가 이 추상 클래스를 상속받도록 코드를 구현합니다.

조건
- 추상 클래스에서 공통으로 사용되는 변수 선언
- 상속 받는 클래스에서 함수 재정의 하기. 함수 재정의는 아래와 같은 형식
  <img alt="4_조건이미지" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdna%2F0Erhw%2FbtsO4jJcUBT%2FAAAAAAAAAAAAAAAAAAAAAO6uUFarXLpM71AKtb19wGszmxbSQov5pWKYpQb2NGCl%2Fimg.png%3Fcredential%3DyqXZFxpELC7KVnFOS48ylbz2pIh7yKj8%26expires%3D1753973999%26allow_ip%3D%26allow_referer%3D%26signature%3Dw2GHXRSzjOWMV6%252FNNwxI1QnGYpk%253D"/>

힌트
- abstract class 키워드를 사용하여 추상 클래스를 선언
- extends 키워드를 사용하여 클래스를 상속
- @override 어노테이션을 사용하여 메서드를 재정의
- 몬스터 클래스의 경우 방어력을 0으로 설정

<br/>

## 주의 사항
- 예외 처리를 통해 파일이 없거나 잘못된 형식의 데이터를 읽었을 때 프로그램이 종료되지 않도록 합니다.
- 사용자 입력에 대한 검증을 철저히 하여 예상치 못한 입력으로 인한 오류를 방지합니다.
- 코드의 재사용성과 가독성을 높이기 위해 함수와 클래스를 적절히 활용합니다.

<br/>

## 코드 실행 예시
  <img alt="전투 RPG 게임 이미지" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdna%2FlTVq5%2FbtsO41BiWpJ%2FAAAAAAAAAAAAAAAAAAAAAAKfqU7LLQbzNwJdmIhxdgWaIEyLu2mBiGByuMJ5v0Xu%2Fimg.png%3Fcredential%3DyqXZFxpELC7KVnFOS48ylbz2pIh7yKj8%26expires%3D1753973999%26allow_ip%3D%26allow_referer%3D%26signature%3D3sQPKvMlxnyg0xn6NkGONMQpKlY%253D"/>

<br/>

## 도전 기능 가이드
모든 정답 코드는 기존의 필수 기능 정답 코드를 반영합니다.  
### 1. 캐릭터의 체력 증가 기능 추가
[설명]  
- 30%의 확률로 캐릭터에게 보너스 체력을 제공합니다.  

[조건]
- 게임이 시작되고 캐릭터의 데이터를 불러온 후 해당 기능을 호출합니다.
- 30%의 확률로 `character`의 `health`를 `10` 증가 시킵니다.
- 보너스 체력을 얻었을 시 아래와 같이 출력합니다.  
출력 예시 `'보너스 체력을 얻었습니다! 현재 체력: ${character.health}'`

[힌트]
- Random 함수를 이용하여 확률 기능을 제공할 수 있습니다.

### 2. 장바구니를 초기화할 수 있는 기능
6을 입력하면 `장바구니를 초기화합니다.` 출력 후 장바구니를 초기화합니다.
- 장바구니가 비어있는 상태에서 6을 입력 시 `이미 장바구니가 비어있습니다.` 출력  

방법
-  6을 입력 했을 때 total 변수의 값에 따라 조건문을 두어 처리

### 3. 장바구니에 담은 상품들의 목록과 가격을 볼 수 있는 기능
3을 입력 시 장바구니에 담긴 상품 목록과 장바구니에 담긴 상품들의 금액 총합을 출력합니다.
- 장바구니가 비어있을 경우 `장바구니에 담긴 상품이 없습니다.` 출력
- 출력 형태 : `장바구니에 셔츠, 청바지, 넥타이가 담겨있네요. 총 가격원 입니다!`

방법
-  장바구니에 담길 상품 이름을 담을 변수를 List 타입의 변수로 새로 생성하고, 리스트 내 요소를 한번에 출력할 수 있는 join 함수 이용

### 4. 자유롭게 기능 추가
3 입력시 장바구니에 담긴 각 상품의 갯수도 함께 출력
- 출력 형태: `장바구니에 셔츠 3개, 원피스 1개 담겨있네요. 총 가격원 입니다!`  

7 입력시 장바구니 목록 출력
- 출력 형태: `장바구니 목록: 셔츠 X 1개 = 45000원 총합: 45000원`

<br/>

## Trouble Shooting
문제 상황
- 기본 로직, 전체 구조 설계 및 예외 처리 구현 어려움  

원인 분석
- 프로그래밍에 대한 이해 부족, 초기 로직 구현 진행 어려움  

해결 방법
- 코드 이해, 작성, 수정하는 전 과정 chat GPT 도움으로 단계적 해결  

개선 방향
- Study hard &ensp;🚀&ensp;  문제 중심 실습, 꾸준한 코드 리뷰 병행

<br/>
