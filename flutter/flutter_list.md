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
    // Ex. base64로 인코딩
    base64.encode(utf8.encode(인코딩할 것));
    // 다시 디코딩할 때
    // 함수 실행은 스택으로 하기 때문에 utf8을 먼저 인코딩했으므로
    // 디코딩은 나중에 한다.
    utf8.decode(base64.decode(디코딩할 것));
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
- 5. 앱 아이콘 변경
`flutter_launcher_icons 라이브러리 추가`   
pubspec.yaml에   
```yaml
flutter_icons:
  android: true
  ios: true
  image_path: '사용할 이미지 경로'
```

- 6. 앱 이름 변경
`android/app/src/main/AndroidManifest.xml`   
```xml
<application
    android:label="이름 변경"
>
```

`android:label 검색`

<br> <br>

`ios/Runner/info.plist`   
```plist
<key>CFBundleName</key>
<string>이름 변경<string>
``` 

`CFBundleName 검색`

- 6. 뒤로가기 막기
```dart
    // WillPopScope를 이용해서 뒤로가기가 적용되지 않게 함
    WillPopScope(
        onWillPop: () async => false,
        child: ...
    );  
```

- 7. 키보드로 인한 위젯 밀림 막기
`Scaffold`에 `resizeToAvoidBottomInset: false`를 적으면   
키보드가 나왔을 때 위젯들이 밀리는 것을 막을 수 있다.