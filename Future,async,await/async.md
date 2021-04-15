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

---
참고 : https://www.youtube.com/watch?v=oFXV4qSXNVs<br>
https://velog.io/@jintak0401/FlutterDart-%EC%97%90%EC%84%9C%EC%9D%98-Future-asyncawait