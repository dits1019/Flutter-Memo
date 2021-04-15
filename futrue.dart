//은행 데이터베이스에 접속해서 사용자의 통장 잔액을 가져온다는 예제
import 'dart:io';

void main() {
  showData();
}

//값이 할당될 때까지 기다려야 함으로
void showData() async {
  startTask();
  //accessData에서 String값을 리턴해주기 때문에 사용 가능
  //accessData가 끝날 때까지 기다리라는 의미
  String account = await accessData();
  fetchData(account);
}

void startTask() {
  String info1 = '요청수행 시작!';
  print(info1);
}

// void accessData() {
//   //시간 간격
//   Duration time = Duration(seconds: 3);
//   sleep(time);
//   if (time.inSeconds > 2) {
//     //일정 시간 후 동작을 실행함
//     //accessData함수가 실행되기 전에 fetchData함수가 실행됨
//     Future.delayed(time, () {
//       String info2 = '데이터 처리 완료';
//       print(info2);
//     });
//   } else {
//     String info2 = '데이터를 가져왔습니다.';
//     print(info2);
//   }
// }

// //accessData에 실행이 지연된다는 전제 하에 async방식으로 변경
// void fetchData() {
//   String info3 = '잔액은 8,500만원입니다.';
//   print(info3);
// }

//<>안에 반환할 타입 선택 가능
Future<String> accessData() async {
  //async는 항상 중괄호 앞에 붙고 await을 사용 가능하게 함
  String account = '';

  //시간 간격
  Duration time = Duration(seconds: 3);
  // sleep(time);
  if (time.inSeconds > 2) {
    //일정 시간 후 동작을 실행함
    //accessData함수가 실행되기 전에 fetchData함수가 실행됨

    //Future.delayed가 끝날 때까지 기다리라는 의미
    await Future.delayed(time, () {
      account = '8500만원';
      print(account);
    });
  } else {
    String info2 = '데이터를 가져왔습니다.';
    print(info2);
  }
  return account;
}

//accessData에 실행이 지연된다는 전제 하에 async방식으로 변경
void fetchData(String account) {
  String info3 = '잔액은 ${account}입니다.';
  print(info3);
}
