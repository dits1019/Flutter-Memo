# 네트워크 지식

- 프로토콜 : 일종의 약속   
EX.HTTP, SMTP(이메일로 전송할 때), POP3(이메일로 전송받을 때)등
- 이더넷 : 통신 규격
- HTTPS로 암호화 통신을 함
- Cookies VS Session
    - 둘 다 어떠한 변수들을 저장하는 개념
    - `Cookies`는 `클라이언트`에 특정 위치에 저장(구워진다고 해서 쿠키라고 함), 파일이 남음
    - `Session`은 `서버`에 저장(웹서버나 WAS서버 수준에 저장, DB와 다름)
    - Session은 시간을 가지고 있고 일정 시간 후에 다 지움
- `IP`는 주소(naver.com)를 DNS서버에서 숫자로 바꿔줌, `TCP`는 데이터 전달
- 주소가 DNS서버에서 `IP를 찾아가는 경로`를 `라우팅`이라고 함
- 다음 4개로 DOS창에서 네트워크 관련된 것을 확인할 수 있음
    - ipconfig : 자신의 컴퓨터에 IP같은 주소를 알 수 있음
    - ping : 컴퓨터에서 주소가 살아있다면(?) 응답해줌(ping + IP주소)
    - tracert : 해당 URL로 가는 라우팅 정보를 줌(tracert + URL)
    - nslookup : 해당하는 도메인에 해당하는 IP를 응답시켜줌(DNS 서버 조회, nslookup + 도메인 or IP주소)

<br>
<br>
<br>

[참고 링크](https://www.inflearn.com/course/%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C-%EC%95%B1%EA%B0%9C%EB%B0%9C-%EA%B8%B0%EC%88%A0%EB%85%B8%ED%8A%B8/dashboard)   
[AWS책 링크](https://pyrasis.com/aws.html)