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