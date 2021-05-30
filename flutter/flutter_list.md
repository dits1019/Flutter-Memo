# List
- 1. 상태바, 네비게이션 바 보이기 or 숨기기   
`import 'package:flutter/services.dart' 추가`   
    - 표시
        - FullScrean : `SystemChrome.setEnabledSystemUIOverlays([]);`
        - 모두 표시(기본) : `SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);`
        - 상태바 숨기기 : `SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);`
        - 내비게이션 바 숨기기 : `SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);`

- 2. 스플래쉬 화면(로딩 화면)
```dart
@override 
void initState() {
    super.initState(); 
    initLoading(); 
}

void initLoading() async {
    // await를 사용해 오래 걸리는 작업을 수행

    // 보통 Navigator.push와 다르게 전 화면(로딩 화면)을 삭제시켜줌
    // 뒤로가기를 할 때 로딩 화면이 뜨지만 제거시켜줌
    Navigator.pushAndRemoveUntil(context, 
    MaterialPageRoute(builder: (BuildContext context) => MainPage()),
    (route) => false);
}
```
[링크](https://devmemory.tistory.com/3)

- 3. 날씨 포맷   
`intl 라이브러리 추가`   
```dart
DateFormat(포맷 형식).format(날짜)
```
[데이터 포맷 반환 리스트](https://reasley.com/?p=3914)

- 4. 인코딩과 암호화   
    - utf-8로 인코딩&디코딩   
    ```dart
    // 인코딩
    utf8.encode(인코딩할 것);
    // 디코딩
    utf8.decode(디코딩할 것);
    // 서버에서 받아온 값을 utf-8로 바꿀 때
    utf8.decode(response.bodyBytes); 
    ```
    - 암호화
    `crypto 라이브러리 추가`
    ```dart
    // Ex
    // utf8로 인코딩을 먼저 해줘야 한다
    var bytes = utf8.encode(인코딩할 것);
    
    // sha512로 암호화
    sha512.convert(bytes)
    ```