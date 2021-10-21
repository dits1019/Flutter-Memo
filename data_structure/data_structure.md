# 자료구조[JAVA]

## Java Collections FrameWork
> 일정 타입의 데이터들이 모여 수비게 가공할 수 있도록 지원하는 자료구조들의 뼈대(기본구조)다.
> `JAVA에서 제공하는 Collection은 크게 List(리스트), Queue(큐), Set(집합)으로 나뉘어 있다.`
- List Interface를 구현하는 클래스
  - ArrayList
    - Object[] 배열을 사용하면서 내부 구현을 통해 동적으로 관리. 우리가 흔히 쓰는 primitive 배열(ex int[])과 유사한 형태
    - `요소 접근`에서는 탁월한 성능을 보여줌
    - 중간에 요소가 삽입, 삭제가 일어나는 경우 그 뒤의 요소들은 한 칸씩 밀어야 하거나 당겨야 하기 때문에 `삽입, 삭제`에서는 비효율적
  - LinkedList
    - 데이터(item)와 주소로 이루어진 클래스를 만들어 서로 연결하는 방식
    - 데이터와 주소로 이루어진 클래스를 Node라고 하는데, 각 노드는 이전의 노드와 다음 노드를 연결하는 방식(즉, 객체끼리 연결한 방식)
    - `검색`을 할 때 연결된 노드들을 모두 방문해야하는 상황때문에 성능이 떨어짐
    - Node를 삽입, 삭제해야 할 경우 해당 노드의 링크를 끊거나 연결만 해주면 되기 때문에 `삽입, 삭제`에서는 효율적
  - Vector
    - 기본적으로 ArrayList와 거의 같다고 보면 됨
    - Object[] 배열을 사용하여 요소 접근에서 빠른 성능을 보임.
    - 항상 `동기화`를 지원(여러 쓰레드가 동시에 데이터에 접근하려하면 순차적으로 처리)
    - `멀티 쓰레드`에서는 안전
    - `단일 쓰레드`에서는 ArrayList에 비해 성능이 떨어짐
  - Stack
    - LIFO(후입선출)방식
    - 대표적인 예시는 `뒤로가기`
- Queue/Deque Interface를 구현하는 클래스
  - LinkedList
    - 사실상 List, Deque, Queue로 3가지 용도로 사용 가능
    - Deque 또는 Queue를 LinkedList처럼 Node 객체로 연결해서 관리하길 원한다면 사용 가능
  - PriorityQueue
    - `데이터 우선순위`에 기반하여 우선순위가 높은 데이터가 먼저 나오는 원리(우선순위 큐)
    - 따로 정렬방식을 지정하지 않는다면 `낮은 숫자가 우선순위를 갖음`
    - 주어진 데이터들 중 최댓값, 혹은 최솟값을 꺼내올 때 매우 유용함
    - 사용자가 정의한 객체를 타입으로 쓸 경우 반드시 Comparator 또는 Comparable을 통해 정렬 방식을 구현
- Set
  - 집합이라는 뜻
  - 데이터를 중복해서 저장할 수 없음
  - 입력 순서대로의 저장 순서를 보장하지 않음
- Set/SortedSet Interface를 구현하는 클래스
  - HashSet
    - Set 컬렉션의 가장 기본적인 클래스     
    - 입력 순서를 보장하지 않음
    - 순서도 보장하지 않음
    - 게임에서 아이디 중복확인같은 경우 사용하기 좋음
    - 삽입, 삭제, 색인이 매우 빠름
  - LinkedHashSet
    - 중복은 허용하지 않지만 순서를 보장
    - 오래된 캐시를 비울 때 사용
  - TreeSet
    - 가중치에 따른 순서대로 정렬되어 보장
    - 중복되지 않음
    - 특정 규칙에 의해 정렬된 형태의 집합을 쓰고 싶을 때 사용
    - 정렬된 형태로 있다보니 특정 구간의 집합 요소를 탐색할 때 매우 유용
    - 정렬된 형태로 있다보니 특정 구간의 집합 요소들을 탐색할 때 매우 유용

## ArrayList 구현
- ArrayList는 다른 자료구조와 달리 Object[] 배열(객체 배열)을 두고 사용함
- 또한 모든 자료구조는 동적 할당을 전제로 함
- https://github.com/dits1019/Data-Structure-Ex/tree/main/src/ArrayList

## Singly LinkedList
- ArrayList와 가장 큰 차이점은 바로 `노드`라는 객체를 이용하여 연결함
- 배열을 이용하는 것이 아닌 하나의 객체를 두고 그 안에 데이터와 다른 노드를 가리키는 래퍼런스 데이터로 구성하여
여러 노드를 하나의 체인처럼 연결하는 것
- https://github.com/dits1019/Data-Structure-Ex/tree/main/src/Singly_LinkedList

## Stack 구현
- https://github.com/dits1019/Data-Structure-Ex/tree/main/src/Stack
참고 : [Stranger's lab](https://st-lab.tistory.com/)