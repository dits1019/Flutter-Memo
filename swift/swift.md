# Swift

## 변수
- var : 값이 변할 수 있는 변수   
- let : 값이 변하지 못하는 상수   
<br>

- kotlin과 같이 변수를 선언   
ex) var a: Int = 10, let b: Bool = true   
<br>

- var와 let만 써도 가능(타입 추론)   
ex) var a = 10, let b = true   
<br>

- UInt vs Int : UInt는 0부터 양의 정수, Int는 음의 정수, 0, 양의 정수까지 가능   

## 튜플
- 여러 값을 하나의 개체에 일시적으로 묶는 방법   
ex) let tuple1 = (10, 2.5, "Hello") 
<br>  

- 이름을 붙일 수도 있음    
  - let tuple2 = (age: 10, name: "Jang")   
  - let tuple2: (age: Int, name: String) = (age: 10, name: "Jang")

## Optional(옵셔널)
- 값이 없을 경우 nil(null과 같음)을 사용
- 값이 있을 수도 없을 수도 있는 변수를 옵셔널이라고 하고 끝에 물음표(?)를 붙임(코틀린과 비슷)   
ex) var name: String?
- 값이 확실하게 있는 경우 느낌표(!)를 붙임   
ex) var name: String! = "Jang"

## Optional Binding(옵셔널 바인딩)
- 옵셔널 바인딩은 옵셔널의 값이 존재하는지를 검사한 뒤, 존재한다면 그 값을 다른 변수에 대입   
ex)
``` swift
var optionalName: String? = "Jang"
var optionalAge: Int? = 20
if let name = optionalName {
    print(name) // optionalName의 값이 존재한다면 해당 값이 출력
} // optionalName의 값이 존재하지 않는다면 if문을 그냥 지나침

// 두 개 이상도 가능
if var name = optionalName, var age = optionalAge {
	print("\(age) : \(name)")
}

// 조건도 설정 가능
if var name = optionalName, var age = optionalAge, age >= 20 {
	print("\(age) : \(name)")
}
```

## Type Casting(타입 캐스팅)
- Upcasting, Downcasting 
    - Upcasting : 자식 클래스가 부모 클래스 타입으로 캐스팅
    - Downcasting : 부모 클래스가 자식 클래스 타입으로 캐스팅
- is
    - 표현식 is Type
    - 타입을 체크하는 연산자, 반환 값은 Bool
    - ex) str(표현식) is String(Type)
- as
    - 표현식 as 변환 할 Type, 표현식 as? 변환 할 Type, 표현식 as! 변환 할 Type 
    - 표현식의 타입이 변환할 Type과 호환된다면, 변환할 Type으로 캐스팅된 인스턴스를 리턴
    - Upcasting을 할 때는 as, Downcasting을 할 때는 as?, as!
    - as?는 실패할 경우 nil을 리턴, as!는 실패할 경우 에러 발생

## self
- 현재 클래스 내 메서드나 프로퍼티(필드)를 가리킬 때 메서드나 프로퍼티(필드) 앞에 self를 붙임
- 다른 언어에 this와 같음