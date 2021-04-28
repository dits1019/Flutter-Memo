# Flutter 2.0 New Buttons

## TextButton
텍스트만 있는 버튼(배경 색깔 채우기 등을 통해 꾸밀 수 있음)
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
테두리가 있는 버튼
```dart
const OutlineButton({
  Key? key,
  required VoidCallback? onPressed,
  VoidCallback? onLongPress,
  MouseCursor? mouseCursor,
  ButtonTextTheme? textTheme,
  Color? textColor,
  Color? disabledTextColor,
  Color? color,
  Color? focusColor,
  Color? hoverColor,
  Color? highlightColor,
  Color? splashColor,
  double? highlightElevation,
  this.borderSide,
  this.disabledBorderColor,
  this.highlightedBorderColor,
  EdgeInsetsGeometry? padding,
  VisualDensity? visualDensity,
  ShapeBorder? shape,
  Clip clipBehavior = Clip.none,
  FocusNode? focusNode,
  bool autofocus = false,
  MaterialTapTargetSize? materialTapTargetSize,
  Widget? child,
}) : assert(highlightElevation == null || highlightElevation >= 0.0),
     assert(clipBehavior != null),
     assert(autofocus != null),
     super(
       key: key,
       onPressed: onPressed,
       onLongPress: onLongPress,
       mouseCursor: mouseCursor,
       textTheme: textTheme,
       textColor: textColor,
       disabledTextColor: disabledTextColor,
       color: color,
       focusColor: focusColor,
       hoverColor: hoverColor,
       highlightColor: highlightColor,
       splashColor: splashColor,
       highlightElevation: highlightElevation,
       padding: padding,
       visualDensity: visualDensity,
       shape: shape,
       clipBehavior: clipBehavior,
       focusNode: focusNode,
       materialTapTargetSize: materialTapTargetSize,
       autofocus: autofocus,
       child: child,
     );

     // button style은 모두 비슷
```


## ElevatedButton
보통 버튼
```dart
const ElevatedButton({
  Key? key,
  required VoidCallback? onPressed,
  VoidCallback? onLongPress,
  ButtonStyle? style,
  FocusNode? focusNode,
  bool autofocus = false,
  Clip clipBehavior = Clip.none,
  required Widget? child,
}) : super(
  key: key,
  onPressed: onPressed,
  onLongPress: onLongPress,
  style: style,
  focusNode: focusNode,
  autofocus: autofocus,
  clipBehavior: clipBehavior,
  child: child,
);

// button style은 모두 비슷

```


