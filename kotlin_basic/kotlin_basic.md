# Kotlin 개념
## 변수 선언
1. val
    - 변경 불가능한 참조를 저장하는 변수(Value)
    - val로 선언하면 초기화 이후 '변수의 재 대입'이 불가
    - Java에서 'final' 키워드로 선언하는 것과 같음
2. var
    - 변경 가능한 참조(Variable)
    - Java의 일반적인 변수에 해당

## 정적 ˙ 동적 타입 언어
1. 정적 타입 언어
    - 컴파일 시에 타입이 결정
    - 컴파일 시에 타입 캐스팅 문제를 확인할 수 있음
    - 실행이 빠름
    - 반드시 변수를 선언할 때 타입을 적어야 하므로  
    코드 작성 시에 타입을 신경 써야 함
    - 코틀린
2. 동적 타입 언어
    - 프로그램 실행(런타임) 시에 타입을 결정
    - 변수의 타입에 상관없이 코딩하기 때문에 코드 작성이 쉬움
    - 사전에 타입을 체크하지 않기 때문에 프로그램 실행 중  
    타입으로 인한 에러가 발생할 수 있음

## if, else, when
- if, else의 사용법은 Java와 같음
```kotlin
// 예시
when(numberEx) {
    1 -> println("1번 출력")
    2 -> {
        println("2번 출력")
    }
    // numberEx가 3 ~ 6까지인 경우 실행
    in 3..6 -> println("3 ~ 6번 출력")
    7, 9 -> {
        println("7, 9번 출력")
    }
    else -> println("나머지 출력")
}
```

## 반복문
- while과 do ~ while, continue의 사용법은 Java와 같음
```kotlin
// 예시

// collection의 길이만큼 실행, item이 하나하나에 해당됨
val array: Array<String> = arrayOf("a", "b", "c")
for(item in array) {
    println(item)
}

// 특정 숫자값을 반복
for(i in 1..10) {
    println(i)
}

// 인덱스(순서)가 필요한 경우
val collection = mutableList<String>("a", "b", "c")
for((index, value) in collection.withIndex()) {
    println("${index} : ${value}")
}

// break를 사용할 때 어디까지가 반복인지 알기 쉽게 해줌(마킹과 같은 개념)
loop1@ while(true) {
    var x = retrieveData()
    if(x == null) break@loop1
    else {
        loop2@ while(true) {
            var y = getData()
            if(y == null) break@loop2
        }
    }
}
```

## 함수
```kotlin
// 예시

// Java
// public void function1() { }
fun function1() {} // void와 같은 형태로 Unit 타입이 있지만 생략 가능

// Java
// public void function2(int i) { }
fun function2(i: int) { }

// Java
// public int function3(int i) { return 0; }
fun function3(i: int): int { return 0 }
```

## Kotlin 함수를 Java에서 쓰기
- 가장 상단에 `@file:JvmName(Java에서 쓸 이름)`으로 사용
- Java에서 클래스 안에 함수를 사용하듯이 사용

## 함수의 파라미터
```kotlin
// 예시

// 함수의 파라미터의 기본값을 설정 가능
fun toast(message: String, length: Int = Toast.LENGTH_SHORT) {
    Toast.makeText(applicationContext, message, length).show()
}

// 파라미터의 이름을 써 지정한 파라미터값만 변경 가능
fun printText(p1: int, p2: int = 2, p3: int) {
    println(p1 + p2 + p3)
}
printText(p1 = 1, p3 = 3)
```

## Getter, Setter
```kotlin
class Person {
    // Getter와 Setter를 기본적으로 지원

    // var로 선언된 변수는 Getter와 Setter 전부 생성
    var age: Int = 0
    // val로 선언된 변수는 Getter만 생성
    val name: String
    // 생성자에서 이름을 받음(생성자 부분)
    constructor(name: String) {
        this.name = name
    }
}

// constructor 대신 이름 옆에 써도 가능
class Person2(val name: String) {
    var age: Int = 0
}
```
```kotlin
class Person(val name: String) {
    var age: Int = 0

    // 전달된 값을 그대로 사용하지 않을 때(자동으로 생성된 Setter로는 안 됨)
    var nickname: String = ""
        set(value) {
            // field는 Setter의 대상이 되는 field를 의미
            // field는 Setter 메소드 내의 '값을 적용할 영역'을 의미
            // field 대신 this.nickname을 사용하면 setNickname()을 호출해 재귀호출이 됨
            field = value.toLowerCase()

            // custom Setter(set(value))에서는 필드에 접근하고자 위 코드같이  
            // field 키워드로 접근했으므로 Backing Field
            // Backing Field는 프로퍼티를 뒷받침하는 필드라는 의미  
            // (클래스 내부의 접근자에서만 사용 가능)
        }
    
    // Java
    // public void setNickname(String nickname) {
    //     this.nickname = nickname.toLowerCase();
    // }
}
```

## 프로퍼티(Property)와 필드(Field)
1. 필드(Field)
    - 클래스에 선언되어 있는, `클래스 변수`가 아닌 `인스턴스 변수`를 의미
    - 필드는 외부에서 접근할 수 있는 Getter, Setter 메소드가 반드시 존재할 필요 X
    - 코틀린은 기본적으로 필드를 사용하지 않음
    ```java
    // Java
    public class FieldJava {
        // 인스턴스에서 사용하는 변수이므로 Field
        public int field1;

        // 접근 제어자와 상관없이 모두 Field
        private double field2;
        protected String field3;

        // Getter, Setter가 있어도 Field
        private int field4;

        public int getField4() { return field4; }
        public void setField4(int field4) { this.field4 = field4; }

        // 클래스 변수는 Field가 아님
        static int notField1;

        void func1() {
            // 함수 내의 변수들은 Field가 아닌 지역변수
            int notField2 = 0;
        }
    }
    ```
2. 프로퍼티(Property)
    - 필드(Field)와 외부에서 접근 가능한 Getter 또는 Setter가 있는 경우  
    -> 필드(Field)와 접근 가능한 Getter, Setter의 조합
    - 코틀린은 Getter와 Setter가 자동으로 생성되므로 Property
    - 코틀린은 Field를 사용하지 않음
    ```java
    // Java
    public class PropertyJava() {
        // Field가 선언되어 있고 Getter, Setter가 있는 경우 Property
        private int property1 = 0;

        public int getProperty1() { return property1; }
        public void setProperty1(int property1) { this.property1 = property1; }

        // 변수의 값을 읽을수만 있는 경우도 Property라 할 수 있음
        private property2 = "";

        public String getProperty2() { return property2; }

        // 단순 Field는 Property가 아님
        private int notProperty1 = 0;

        // 클래스 변수 역시 property가 아님
        private static int notProperty2;
    }
    ```

## 상속
- 상속은 `2가지 측면으로 접근 가능`, `코드 구현애 대한 상속`과 `인터페이스 집합에 대한 상속`
- 코틀린의 클래스는 `기본적으로 상속이 불가`
1. 코드 구현의 상속 = 코드의 복사와 붙여넣기를 줄여 주는 역할
```java
public class Foo {
    int field1 = 0;

    public int getField1() { return field1; }
    public void setField1(int field1) { this.field1 = field1; }
}

// extends 키워드로 상속 받은 경우 코드의 구현을 상속 받는 것이 됨

public class Bar extends Foo {
    int field1 = 0;

    public int getField1() { return field1; }
    public void setField1(int field1) { this.field1 = field1; }
}
```
2. 인터페이스 상속 = 코드 구현이 아닌 메소드의 집합을 상속받음
    - 인터페이스를 사용하는 객체에서 인터페이스에 정의한 코드를 신경 쓰지 않고 호출할 수 있도록 하는 데에 의의가 있음

3. 취약한 기반 클래스 문제(fragile base class)
    - 하위 클래스에서 상위 클래스의 메소드를 오버라이딩하면서 발생
    - 클래스를 사용하는 코드에서는 클래스의 실제 구현에는 관심을 가지지 않아야 하기 때문에 발생
    ```java
    // 예시

    // 이동 가능한 객체를 클래스화
    public class MoveObject {
        // 이동 스피드
        protected int speed;

        public void addSpeed(int param) {
            this.speed = speed + param;
        }

        public int getSpeed() { return speed; }

        // 좌표
        public int x, y;
    }

    /* MoveObject가 선언한 x, y좌표 속성은 필요하지만, 이동 속도는 항상 '0'인 새 오브젝트가 필요해져서 코드를 재사용하기 위해 CantMoveObject를 MoveObject의 상속을 받아 만들었다고 가정 */

    public class CantMoveObject extends MoveObject {
        // 생성자에서 speed를 0으로 만듬
        public CantMoveObject() { this.speed = 0; }

        // addSpeed 메소드를 오버라이드
        @Override
        public void addSpeed(int param) {
            // 움직일 수 없는 오브젝트이므로 아무것도 하지 않음
        }
    }

    // 위에 상속은 객체 지향의 주요 개념을 위반함
    public class Calculator {
        // 명중률 계산 함수, 파라미터로 MoveObject 객체와 공격자의 명중률을 받음
        public static int calcAccuracy(MoveObject moveObject, int attackerAccuracy) {
            // moveObject의 speed가 0인 경우 잘못된 상황으로 판단하여 스피드 1을 추가
            if(moveObject.getSpeed() == 0) {
                moveObject.addSpeed(1);
            }

            // 위의 코드로 moveObject.getSpeed()가 0이 나오지 않는다고 나눗셈을 함
            double resultAccuracy = attackerAccuracy / moveObject.getSpeed();
            return (int) resultAccuracy;
        }
    }

    /* 위의 클래스는 calcAccuracy() 함수에서 moveObject의 스피드가 '0'인 경우 뭔가가 잘못되어 꼬인 상황으로 판단하고 'moveObject.addSpeed()' 함수로 속도를 '1'로 만듬. 이 경우 MoveObject 클래스만 있는 경우에는 문제가 되지 않지만 MoveObject가 사실 'CantMoveObject'라면 '0'값을 나누게 되어 에러가 발생 */

    /* 한 번은 MoveObject의 실제 인스턴스를  MoveObject 클래스로 하고 다음에는 CantMoveObject로 하고 있음. MoveObject를 사용하는 Calcurator 입장에서는 MoveObject가 실제로는 어느 클래스인지 상관없이 사용할 수 있어야 함. 그런데 상속으로 오버라이딩을 하면서 Calcurator는 MoveObject가 실제로 어떤 클래스인지 알 수 없어 에러 발생  
    -> 객체 지향의 주요 원칙인 캡슐화의 주요 목적 중 하나는 클래스를 사용하는 측면에서 해당 클래스의 구체적인 사항을 모르게 하는 것. 하지만 구체적인 구현 클래스를 알아야만 하므로 캡슐화가 깨졌다고 볼 수 있음 */
    ```

4. 상속을 금지
- Java분야에서 유명한 책인 'Effective Java'에서 `상속을 위한 설계와 문서를 갖추거나, 그렇지 않은 경우 상속을 금지하라`라고 함.  
(상속 = 코드의 구현을 상속받는 경우)
- Java에 경우 금지하는 방법은 메소드나 클래스 앞에 final을 쓰면 됨.
- 코틀린은 기본적으로 상속이 불가능함.  
하지만 클래스나 메소드 앞에 `open`을 사용하면 상속 가능

프로퍼티 위임과 collection의 함수형 APi, 확장 함수, 널 안정성 추가 
## 클래스 위임
- 객체 지향에서 위임 = 클래스의 특정 기능들을 대신 처리해 주는 것
- 위임을 사용하는 대표적인 패턴은 데코레이터(Decorator) 패턴
- 데코레이터 패턴 = 특정 클래스의 기능에 추가 기능을 덧붙이는 방법
```java
// 예제

// 캐릭터에 장학을 하면 '검의 이름으로 장착되었다'는 메세지를 출력하는 클래스

// 검 객체 클래스
public final class Sword {
    // 검의 이름
    String name;

    // 생성자에서 이름을 받음
    public Sword(String name) { this.name = name; }

    // 장착 시 불리는 메소드
    public void equip() { System.out.println(name + " 이 장착되었다."); }
}

// 마법검일 때는 다른 사운드가 추가되게 하고 싶어함.
// 하지만 final로 인해 상속이 불가능한 상태일 때 데코레이터 패턴을 사용
// 아래와 같이 Sword 클래스의 메소드를 전부 포함하는 인터페이스 제작

public interface ISword {
    // 장착 시 불리는 메소드
    void equip();
}

// 그 후 기존의 Sword 클래스에 다음과 같이 인터페이스만 상속

public final class Sword implements ISword {
    // 검의 이름
    String name;

    // 생성자에서 이름을 받음
    public Sword(String name) { this.name = name; }

    // 장착 시 불리는 메소드
    public void equip() { System.out.println(name + " 이 장착되었다."); }
}

// 이제 Sword 클래스는 상속을 하지 않고도 기능 확장할 수 있는 밑준비가 끝남.
// 아래는 마법검에 해당하는 클래스

// ISword 인터페이스를 상속받음
public class MagicSwordDelegate implements ISword {
    // ISword 타입의 객체를 필드로 가지고 있음
    // 단지 Sword 클래스를 확장하려면 Sword 타입으로 해도 되지만 
    // ISword 타입으로 하면 확장성이 더욱 증가
    ISword iSword;

    // 생성자에서 ISword 타입의 객체를 생성자에서 받음
    public MagicSwordDelegate(ISword iSword) {
        this.iSword = iSword;
    }
    // 확장 기능을 실행한 뒤 필드로 가지고 있는 iSword 클래스의 equip() 함수를 호출
    // 아래와 같이 '기존에 설계된 객체에게 책임을 전달하는 것'이 위임

    // 장착 시 불리는 메소드
    @Oevrride
    public void equip() {
        // 멋진 사운드를 플레이한다.
        playWonderfulSound();

        // 기존 기능은 iSword에 위임
        iSword.equip();
    }

    // 확장기능 - 멋진 사운드를 플레이하는 메소드
    public void playWonderfunSwound() {
        // 멋진 사운드를 플레이
        System.out.println("짜잔");
    }
}

// 위 클래스는 ISword 인터페이스를 필드로 가지고 있음.
// 단지 Sword 클래스의 기능에 추가 기능을 덧붙이는 경우면 Sword 타입을 필드로 가져도 상관없지만
// 인터페이스를 필드로 가지면 이후 인터페이스를 상속받은 모든 클래스에 대하여 확장 기능 사용 가능
```

## 프로퍼티 위임
- 코틀린은 클래스와 프로퍼티 위임 제공  
프로퍼티 위임은 Getter, Setter 연산자를 위임할 수 있게 하고, 3가지 방법을 제공
    1. lazy properties = 값의 초기화를 처음 프로퍼티를 사용할 때 초기화
    2. observable properties = 프로퍼티에 값이 변경되면 옵저버에 알려줌
    3. storing properties = 필드가 아닌 맵에 속성을 저장

```kotlin
// 예제

// 프로퍼티에 Getter, Setter를 위임하는 방법
// 코틀린은 Custom Getter, Setter를 활용해 자동으로 생성되는 Getter, Setter를 변경할 수 있지만
// 종종 여러 클래스에서 같은 동작을 해야 할 경우가 있을 수도 있음
// (String 문자열 프로퍼티의 Setter가 호출될 때 자동으로 문자열을 대문자로 변경해야 하는 경우)
// 그 때 위임을 사용하면 편리함

class DelegateString {
    // Setter에서 호출된 값을 저장할 변수
    var text = ""

    // operator는 연산자를 의미
    // 붙인 이뉴는 Getter, Setter 메소드가 연산자로 취급되기 때문에
    operator fun getValue(thisRef: Any?, property: KProperty<*>): String {
        return text
    }

    operator fun setValue(thisRef: Any, property: KProperty<*>, value: String) {
        // 대문자로 변경하여 저장
        text = value.toUpperCase()
        // Setter에 호출될 때의 문자열과 변경 후 문자열을 프린트
        println("$value ==> ${text}")
    }
}

// 이제 어디서든 위임 클래스를 사용 가능
class User {
    // 닉네임은 DelegateString클래스에 위임
    var nickname by DelegateString()
}

// User 클래스는 nickname이라는 속성(property)이 있는데 이것은 DelegateString에 위임됨
// 이게 가능한 이유는 코틀린에서 속성(property)은 Field로 정해지는 것이 아니라 
// 접근자인 Getter, Setter에 의해 결정되기 때문
// 프로퍼티 위임 클래스에 요구사항으로는 var 선언된 변수는 getValue, setValue 둘 다 구현
// 하지만 val 선언된 변수는 getValue만 있어야 함
```
1. lazy 위임
    - 프로퍼티의 초기화를 인스턴스 생성 시점이 아니라 프로퍼티를 사용하는 시점에 초기화
    - 초기화가 오래 걸리는 속성이 있는 경우, 인스턴스 생성 시점에 모든 초기화를 진행한다면 전체적인 성능이 매우 저하됨
    - 따라서 초기화를 하지 않고 사용하다가 실제로 사용하는 시점에 초기화를 함
    ```kotlin
    // 예제

    // 위의 코드를 수정

    class User {
        // 닉네임은 DelegateString 클래스에 위임
        var nickname by DelegateString()

        // lazy 위임은 val 키워드로 선언되어야만 가능함
        // 네트워크에서 받은 텍스트는 시간이 걸리므로 실제로 사용할 때 초기화
        val httpText by lazy {
            println("lazy init start")
            InputStreamReader(URL("http://www.naver.com").openConnection()).readText()
        }
    }

    // User 클래스의 httpText는 네트워크에서 데이터를 읽어야 초기화.
    // 보통 네트워크에서 데이터를 읽어 오는 경우 속도가 매우 느려짐
    // 이런 경우 인스턴스 생성 시점 httpText의 초기화가 진행되면 실제로는 
    // httpText를 사용하지 않는다고 해도 초기화가 느려짐
    // 약간 비동기 느낌
    ```

2. observable 위임
    - `옵저버`를 사용하는 패턴은 주로 관찰하고자 하는 대상에 변경 사항이 생길 때,  
    변경된 사실을 관측자에게 알려 주는 것, 여기서 관찰 대상은 프로퍼티
    ```kotlin
    // 예제

    // 위의 코드를 수정

    class User {
        // 닉네임은 DelegateString클래스에 위임 O
        var nickname by DelegateString()

        // lazy 위임은 val 키워드로 선언되어야만 가능함
        // 네트워크에서 받은 텍스트는 시간이 걸리므로 실제로 사용할 때 초기화
        val httpText by lazy {
            println("lazy init start")
            InputStreamReader(URL("http://www.naver.com").openConnection()).readText()
        }

        // name 프로퍼티 값이 변결될 때마다 자동으로 observale의 코드가 실행
        var name: String by Delegates.observale("") {
            property, oldValue, newValue ->
            println("기존값: ${oldValue}, 새로적용될값: ${newValue}")
        }
    }
    ```
3. 프로퍼티를 Map 객체에 위임













