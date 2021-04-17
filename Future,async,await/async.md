# Future, async, await

## 동기, 비동기
- 동기
    - 순서대로 해야 할 일 한 가지만 하는 것을 `Synchronous(동기)`
    - 장점으로는 간단하지만 결과가 나올 때까지 아무것도 못한다.
- 비동기
    - 동시에 다른 일을 하는 것을 `Asynchronous(비동기)`
    - 복잡하지만 결과가 나오기 전까지 다른 작업을 할 수 있다.

#### Example
가게에서 알바가 서빙과 주문을 받는 역할을 해야 하는 경우<br>
**동기일 경우** 알바는 서빙을 끝낸 후 주문을 받는다.<br>
**비동기일 경우** 알바는 서빙을 하면서 주문을 받는다.

## Future
**비동기 방식으로 미래의 어느 시점에 완성되어서 실제적인 데이터가 되거나 에러를 반환하는 객체**<br>
비동기 작업을 할 때 사용된다.<br>
일정 소요시간 후에 실제 데이터나 에러를 반환한다.

#### Example
```dart
import 'dart:io';

// 다음과 같이 사용할 수 있다.
// Future<반환할 타입> 함수명 () {}

// 일정시간(duration)이 끝난 후 동작(함수)을 실행
// Future.delayed(duration, () {})

// 은행 데이터베이스에 접속해서 사용자의 통장 잔액을 가져온다는 예제

void main() {
    showData();
}

void showData() {
    startTask();
    // accessData에서 String값을 리턴해주기 때문에 사용 가능
    String account = accessData();
    fetchData(account);
}

void startTask() {
    String info1 = '요청수행 시작!';
    print(info1);
}

void accessData() {
    // 시간 간격
    Duration time = Duration(seconds: 3);
  
    // 일정 시간 후 동작을 실행함
    // accessData함수가 실행되기 전에 fetchData함수가 실행됨
    // Future.delayed가 끝날 때까지 기다리라는 의미
    Future.delayed(time, () {
        String info2 = '데이터 처리 완료';
        print(info2);
    });
  
}

void fetchData() {
    String info3 = '잔액은 8,500만원입니다.';
    print(info3);
}
```

## async, await
Future와 똑같이 비동기 작업을 할 때 사용된다.<br>
- async 클래스는 await 메소드를 가지고 있다.
    - await로 선언된 메소드는 응답이 처리될 때까지 대기한다.

#### Example

```dart
// 은행 데이터베이스에 접속해서 사용자의 통장 잔액을 가져온다는 예제
import 'dart:io';

void main() {
  showData();
}

// 값이 할당될 때까지 기다려야 함으로
void showData() async {
  startTask();
  // accessData에서 String값을 리턴해주기 때문에 사용 가능
  // accessData가 끝날 때까지 기다리라는 의미
  String account = await accessData();
  fetchData(account);
}

void startTask() {
  String info1 = '요청수행 시작!';
  print(info1);
}

Future<String> accessData() async {
  // async는 항상 중괄호 앞에 붙고 await을 사용 가능하게 함
  String account = '';

  // 시간 간격
  Duration time = Duration(seconds: 3);
  
    // 일정 시간 후 동작을 실행함
    // accessData함수가 실행되기 전에 fetchData함수가 실행됨
    // Future.delayed가 끝날 때까지 기다리라는 의미
    await Future.delayed(time, () {
      account = '8500만원';
      print(account);
    });
  
  return account;
}

// accessData에 실행이 지연된다는 전제 하에 async방식으로 변경
void fetchData(String account) {
  String info3 = '잔액은 ${account}입니다.';
  print(info3);
}
```
<br>
<br>
<br>
<br>

# 심화

## Thread
프로세스내에서 실행되는 흐름의 단위
Program = 생명이 없는 것(Ex. 포토샵 <u>프로그램</u>은 깔려만 있고 클릭하기 전까지 무언가를 하지 않는다.)
Process = 생명이 있는 것(Ex. 포토샵 프로그램이 시작된 순간부터, 핸드폰에서 실행중인 서비스를 확인해보면 프로세스라고 한다.)
dart는 싱글 스레드로 운영되는 언어이다(한 번에 오직 하나의 작업만 실행)

flutter 앱을 실행하는 순간 isolate라는 새로운 스레드가 생성되고 즉시 작업을 실행(앱 전체 운영을 총괄하는 단일 스레드)

스레드가 생성되는 순간 자동적으로 다음을 실행하게 된다.
1. First In First Out(FIFO)의 선입선출 방식으로 "`MicroTask`와 Event" 준비
    - 이벤트 큐로 넘어가기 전에 아주 짧은 시간동안 `비동기적`으로 먼저 실행되고 끝나는 작은 작업을 의미
    - 우선은 앱이 실행되고 event loop가 이벤트 큐에 있는 이벤트들을 처리하기 직전에 먼저 MicroTask를 처리한다고 생각하면 된다.
1. main 함수 실행
1. event loop 실행

<br>

MicroTask가 없다면 
event loop는 각종 이벤트(gesture, drawing, Reading files, Fetching data, Button Tap, Future, Stream 등)순서대로 처리
-> 외적인 이벤트가 발생하면 이벤트와 관련된 코드들이 이벤트 큐에 등록이 된다(<u>Future나 Stream도 event loop를 통해서 처리</u>)

## Future(심화)

코드 상에서 새로운 Future를 객체화시키면 
1. 다트에 의해서 future 객체가 내부적인 배열에 등록
1. Future관련해서 실행되어야 하는 코드들이 이벤트 큐(대기열)에 등록
1. 불완전한 future객체가 반환
1. **Synchronous(동기) 방식으로 실행되어야 할 코드 먼저 실행(중요)**
1. 최종적으로 실제적인 data값이 future 객체로 전환

```dart
// 실행 순서
void main(){
  print('Before the Future'); // 1
  Future((){
    // 곧바로 이벤트 코드에 관련된 아래 코드를 등록
    print('Running  the Future'); // 3 
  })
  //Future가 실행되고 나서 then이 가지고 있는 함수를 실행
  .then((_){
    print('Future is complete'); // 4
  });
  print('After the Future'); // 2
}
```

> **Future는 Synchronous(동기)방식으로 처리되지 않고 이벤트 루프를 통해서 이벤트 큐에서 선입선출방식으로 처리되는 하나의 이벤트다.**

## async method

async라는 키워드를 사용하는 순간 다트는
1. 메서드를 통해서 나오는 결과물은 future라는 것을 알게 됨
1. await 키워드를 만날 때까지 `synchronous(동기)` 방식으로 코드처리
1. await 키워드를 만나면 future가 완료될 때까지 대기
1. future가 완료 되자마자 그 다음 코드들을 실행

### Example. future와 async, await을 언제 써야할까?

```dart
String createOrderMessage(){
  var order = fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder(){
  return Future.delayed(Duration(seconds: 2), 
  () => 'Large Latte'
  );
}

void main(){
  print('Fetching user order...');
  print(createOrderMessage());
}

// 실행 결과
// Fetching user order...
// Your order is: Instate of '_Future<String>'
// 이유는 fetchUserOrder의 값이 들어가야 하는데 fetchUserOrder는 2초에 값을 뱉어내기 때문에
```

**위에 코드를 알맞게 수정했을 시**
```dart
// return값은 비동기 함수로 실행된 결과에 String값을 return해줘야 함으로 타입을 Future<String>으로 변경
Future<String> createOrderMessage() async {
  //async키워드를 만나면 await키워드를 만날 때까지 synchronous(동기)방식으로 처리되는 확인
  print('synchronous');
  // 값이 전달될 때까지 기다려야 함으로 async 추가
  var order = await fetchUserOrder();
  // 기다렸다가 값이 전달되면 할당되는 비동기 방식이어서 async 추가
  return 'Your order is: $order';
}

Future<String> fetchUserOrder(){
  return Future.delayed(Duration(seconds: 2), 
  () => 'Large Latte'
  );
}

void main() async{
  // createOrderMessage도 비동기이기 때문에 async 추가
  print('Fetching user order...');
  // order변수의 값이 할당될 때까지 기다려야 함으로 await 추가
   print(await createOrderMessage());
}

// 실행결과
// Fetching user order...
// synchronous
// 2초 후
// Your order is: Large Latte
```
> async키워드는 future자체를 대신하는 게 아니라 비동기 방식으로 실행되는 함수라는 것을 dart에게 알려주는 기능을 하는 것이며 await키워드와 함꼐 미래의 어느 시점의 전달될 값을 기다리는 것이다.

<br>

> 그리고 future는 하나의 객체로서 객체가 생성되는 순간에는 미완성으로 존재하다가 역시나 미래의 어느 시점에 데이터를 전달받은 온전한 객체가 되거나 아니면 데이터에 문제가 생긴다면 에러를 반환하는 객체가 된다.

## 연습
```dart
// 실행 순서
void main() async{
  methodA(); // 1
  await methodB(); // 3
  await methodC(); // 9
  methodD(); // 12
}

methodA(){
  print('A'); // 2
}

methodB() async{
  print('B start'); // 4
  await methodC('B'); // 5
  print('B end'); // 8
}

methodC(String from) async{
  print('C start from $from'); // 6, 10
  
  Future((){
    print('C running Future from $from'); // 12('B'), 14('main')
  }).then((_){
    print('C end of Future from $from'); // 13('B'), 15('main')
  });

  print('C end from $from'); // 7, 11
}

methodD(){
  print('D');
}
```

### ~~FutureBuilder~~

~~FutureBuilder에서 snapshot은 특정 시점에 데이터를 복사해서 보관하는 것~~

~~if안에 snapshot.connectionState == ConnectionState.done이라는 조건으로 데이터가 있을 때 반환할 위젯을 쓰고
if 밖에 데이터가 아직 오지 않았을 때의 화면을 그려줄 수 있다.(none은 없을 때, waiting은 대기 중일 때)~~

<br>
<br>

---

<br>

참고 : https://www.youtube.com/watch?v=oFXV4qSXNVs<br>
https://velog.io/@jintak0401/FlutterDart-%EC%97%90%EC%84%9C%EC%9D%98-Future-asyncawait<br>
https://www.youtube.com/watch?v=HjhPhAUPHos