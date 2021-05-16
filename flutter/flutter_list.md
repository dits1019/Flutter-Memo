# List
- 1. 상태바, 네비게이션 바 보이기 or 숨기기   
`import 'package:flutter/services.dart' 추가`   
    - 표시
        - FullScrean : `SystemChrome.setEnabledSystemUIOverlays([]);`
        - 모두 표시(기본) : `SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);`
        - 상태바 숨기기 : `SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);`
        - 내비게이션 바 숨기기 : `SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);`

- 2. 스플래쉬 화면(로딩 화면)
[링크](https://devmemory.tistory.com/3)