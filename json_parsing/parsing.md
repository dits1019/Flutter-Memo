# API
API = Application Programming Interface
> 응용 프로그램에서 사용할 수 있도록, 운영 체제나 프로그래밍 언어가 제공하는 기능을
> 제어할 수 있게 만든 인터페이스를 뜻한다. <br>
> -위키피디아-
일련의 표준화된 명령이나 기능<br>
매개 역할자로써의 API

# JSON
key값과 value값이 각각 매칭되는 것을 JSON format이라고 함.  
<br>

서버에서 값 가져오기
```dart
// Uri는 Url의 한 종류라고 할 수 있음
String uri = 링크;

var url = Uri.parse(uri);
Response response = await http.get(url);

var parsingData;

// 연결 상태를 코드로 표시
// Ex. 200(정상), 404(에러)...
if(response.statusCode == 200){
    // JSON의 본문 전체를 가져옴
    String jsonData = response.body
    // JSON형식으로 디코딩
    // 인코딩 : 동영상이나 문자 인코딩 뿐 아니라 사람이 인지할 수 있는 형태의 데이터를 약속된 규칙에 의해 컴퓨터가 사용하는 0과 1로 변환하는 과정
    // 디코딩 : 디코딩은 인코딩의 반대로서 사람이 이해 할 수 있도록 바꿔주는 것을 의미
    parsingData = jsonDecode(jsonData);
}

// JSON 데이터를 가져오기(비동기로 처리)
var jsonData = await parsingData.getJsonData();

// Ex. color 안에 red값을 가져옴
jsonData['color']['red'];
// Ex. id값을 가져옴
jsonData['id']
```   
