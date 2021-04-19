# Null Safety

## Null Safety
Flutter 2.0부터 null safety를 지원합니다. 
> 개발되는 코드가 null 안정성을 보장한 상태로 개발되게 하고자 하는 개념

## ?
Nullable과 Non-Nullable을 구분해서 사용할 수 있게 해준다.
기본적으로 변수를 선언할 때 `Non-Nullable(null값 허용 X)`로 선언되지만 처음 변수를 선언할 때 변수 타입 앞에 `?`를 붙이면 `Nullable(null값 허용)`로 선언된다.<br>
~~Kotlin을 보는 것 같은 느낌?~~
```dart
String str1 = 'Null 테스트';
String? str2  = 'Null 테스트';

str1 = null; // error 발생
str2 = null;


// 클래스의 경우도 똑같음
Class TestClass {}

TestClass test1 = null; // error 발생
TestClass? test2 = null;

//Non-Nullable 변수는 선언과 동시에 초기값을 주어야 한다.
int a; // error 발생 -> int a = 0;(error 발생 X)
int? b;

//Non-Nullable 변수에 Nullable값을 담는 건 불가능하지만
//Nullable 변수에 Non-Nullable값을 넣는 건 가능
int c = 100;
int? d = 100;

c = d; // error 발생
d = c;
```

### var일 경우
var는 타입 유추이다. 변수에 넘는 값에 따라 타입이 결정되며 Nullable과 Non-Nullable도 자동 유추가 된다.
따라서 `var`타입 뒤에는 `?를 붙일 필요가 없다.`
```dart
var a = 10; // int, Non-Nullable
var b = null; // Nullable
var c; // Nullable
var? d = 4; // error 발생
```

### dynamic일 경우
dynamic은 값을 한정하지 않고 모든 타입의 데이터가 대입될 수 있다(Nullable도 포함).<br>
따라서 `dynamic`타입일 경우 `?를 써도 되고 안 써도 된다.`
```dart
// 모두 가능
dynamic a = 10;
dynamic b = null;
dynamic c;

a = null;
b = 10;
c = null;
```

## !
변수 뒤에 붙이며 그 변수의 값이 `null일 경우` runtime error(프로그램 실행 중 발생한 오류)를 발생
```dart
int? a = 10;
a!; // error X
a = null; // a값을 null로 변경
a!; // error 발생
```

## late
Non-Nullable로 변수를 선언하려면 초기값을 주어야 하지만 `late`를 사용해서 늦게 값을 지정해줄 수 있다.
```dart
String str1; // error 발생
late String str2;

print(str2); // error 발생
str2 = 'Hello World';
print(str2); // Hello World 출력
```

## 기타

### Null-aware operators
변수의 값이 `null일 경우`에만 변수에 값을 넣어준다.
```dart
int? a;
a ??= 3;
print(a); // 3 출력

// a의 값이 null이 아닌 3이기 때문에 값을 넣어주지 않음
a ??= 5;
print(a); // 3 출력

// ??를 이용하여 표현식의 값이 null일 경우 좌우에 표현식 중 왼쪽에 표현식을 반환하고
// 아닐 경우 오른쪽에 표현식을 반환 

int b?;
b = 1 ?? 3;
print(b); // 1 출력

// b의 값이 null이 아닌 1이기 때문에 오른쪽 표현식 반환
b = 10 ?? 11; 
print(b); // 11 출력
```

### Conditional property access
null 일 수도 있는 객체의 속성 또는 메소드일 경우 점(.) 앞에 `?`를 넣어준다.
```dart
myObject?.someProperty;
// 위에 코드는 아래와 같다.
//null이 아닌 경우는 그대로 실행 하지만 null일 경우 null을 반환
(myObject != null) ? myObject.someProperty : null;
```





