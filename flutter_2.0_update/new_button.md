# Flutter 2.0 New Buttons

## TextButton
FlatButton -> TextButton
```dart
TextButton({
    Key key,
    @required VoidCallback onPressed, 
    VoidCallback onLongPress, // 오래 클릭 시
    ButtonStyle style,
    FocusNode focusNode, // 버튼 클릭 후 focus 지정
    bool autofocus = false,
    Clip clipBehavior = Clip.none, // 콘텐츠가 잘리는 방식
    @required Widget child,
})

TextButton(
    onPressed: () {},
    child: Text('Button'),
    style: TextButton.styleFrom(
        primary: 기본 색깔 설정,
        backgroundColor: Button Background 색깔 설정,
        textStyle: TextStyle()로 textstyle 지정,
        elevation: z위치 설정,
        padding: EdgeInsets로 padding 설정,
        
    ),
)

```
TextButton.icon을 사용해서 text 옆에 icon이 있는 버튼을 구현 가능
  - label로 Text 넘기기
  - icon으로 icon 넘기기


## OutlinedButton

## ElevatedButton



## OutlinedButton


