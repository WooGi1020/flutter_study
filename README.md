# 1. Flutter's Variable

- 플러터는 기본적으로 변수를 선언하고 값을 할당하는 것이 당연시되며, (예외도 존재) TS와 달리 타입을 추론할 수 있다.

## var

- 타입을 지정하지 않아도 할당을 통해 값을 추론하는 키워드이다.

- Dart에서 되도록 사용하라고 권장한다. (`int`나 `String` 같은 타입 키워드는 클래스에서 사용)

- 메소드나 작은 함수 안에서 지역 함수 선언시 유리 (컴파일러가 타입 추론)

## final

- JS의 `const`와 같이 값을 한번만 할당 가능하도록 만들어주는 변수 키워드

## dynamic

- 어떤 데이터가 들어올지 모르며 조심해서 사용해야 한다.

- 야생의 자바스크립트같은 느낌 (하지만 한번씩 사용해야 하는 순간이 온다.)

## const

- 컴파일할 떄 (앱스토어로 보내기 전) 이미 값을 알고 있고 변하지 않을 값을 할당하는 키워드

- `final`과의 차이점은 `final`은 런타임 중에 할당될 수 있다는 것 (사용자 입력 등)

## null safety

- 기본적으로 `dart`의 모든 변수는 `nullable` 하지 않다.

- JS의 ? 연산자와 같이 사용하며 키워드 바로 뒤에 붙여 해당 변수는 `nullable` 할 수 있다고 지칭한다.

- 조건문을 통해 타입을 검사하고 해당 타입의 메서드를 사용할 수 있지만, 그냥 `name?.isEmpty` 와 같이 사용할 수도 있다.

## late

- `dart`에게 아직 어떤 데이터가 올지 모른다고 알려주는 키워드

- 맞는지 모르겠지만 JS로 치면 비동기같은 느낌인 듯 하다.

- API 등 나중에 데이터가 들어오는 경우 변수를 미리 정의해놓을 떄 사용한다.

# 2. Flutter's DataType

- 기본적으로 `String`, `int`, `bool`, `double` 등의 타입을 가지고, 정수형과 소수점까지 모두 포함하는 `num` 이라는 타입도 존재.

## Lists

- 배열 타입을 의미, 마지막 요소에 ',' 를 붙이면 자동 포매팅(vscode, dartPad 한정)

```dart
int num = [1,2,3,4];
// equal
List<int> num = [1,2,3,4];
```

- 메서드로 `last`, `first`, `length` 등 다양한 기능 제공

- ✅ 배열 내부의 요소 자리에서 직접 조건문을 삽입해 요소를 추가할 수 있다! (야무진 기능)

```dart
bool giveFive = true;
// giveFive가 true면 5를 삽입
List<int> num = [1,2,3,4,if (giveFive) 5];
```

## String interpolation

- `text`로 이루어진 변수에 값을 추가 (JS의 템플릿 문자열)

```dart
var name = 'woogi';
var hi = 'hi, $name!';
```

- 🚫 계산을 실행하는 문법은 다름

```dart
var age = 10;
var plusAge = 'age is ${age + 2}';
// age is 12
```

## Collection For

- 특정 배열을 다른 배열과 합치는 경우, 해당 배열의 값을 변경하여 합치는 것이 가능

```dart
var food1 = ['국밥', '돈까스'];
var food2 = ['고기', '김치전', for (var food in food1) "🤤 $food"];
// ['고기', '김치전', '🤤 국밥', '🤤 돈까스'];
```

## Maps

- JS의 `Object` 와 비슷함

```dart
var player = {
  'name': 'woogi',
  'str': 1,
  'dex': 1,
}
```

- 여기서 해당 키워드의 타입은 제네릭을 통해 정의되는데, `Object`의 경우는 `any`와 동일

- 결국 위 `player` 변수의 타입은 `Map<String, Object>` 와 같다.

## Sets

- 중괄호로 이루어진 배열이라고 생각하면 편함

```dart
var number = {1,2,3,4};
number.add(1);
number.add(1);
number.add(1);

// {1,2,3,4}
```

- 🚫 `Sets` 내부의 값들은 전부 유니크하므로, 중복되는 값이 있을 수 없다.

# 2. Flutter's Function

- 다른 언어들과 동일하게 파라미터를 받고, 이를 토대로 결과를 출력, 타입을 정의하여 `return` 유무 선택

- 꼭 `main` 함수 내부에 있을 필요 X

- 추가적으로 JS의 화살표 함수와 비슷하게 `fat arrow func`를 사용 가능하며, 이는 `return`을 대체(한줄 짜리 함수에서만 사용)

## Named Parameter

- 인수에 사용하는 함수의 파라미터 이름을 직접 할당하여 명확하게 정의하는 방법

- 리액트에서 객체를 할당받는 것처럼 함수의 파라미터를 중괄호로 감싸는 형태

- 🚫 만약 필요한 값을 인수로 할당하지 않을 경우, 파라미터의 기본값 지정 혹은 `required` 키워드를 파라미터에 지정(required된 값을 할당하지 않으면 컴파일 제외)

```dart
String sayHello ({String name, int age, String country}) {
  return "Hello $name, you're $age years old, you come from $country";
}

void main() {
  print(sayHello(
    age: 26,
    country: 'kor',
    name: 'woogi',
  ));
}
```

## Optional Positional Parameter

- JS의 옵셔널 연산자를 사용한 타입처럼 할당 여부가 의미없는 파라미터

- JS와 달리 파라미터를 대괄호로 감싸고 기본값을 필수로 지정해주어야 함

```dart
// country는 옵셔널 파라미터
String sayHello (String name, int age, [String? country = 'kor']) {
  return "Hello $name, you're $age years old, you come from $country";
}

void main() {
  print(sayHello('woogi', 12));
}
```

## QQ Operator

- 다른 언어들도 가지고 있는 `&&`, `||` 등의 오퍼레이터를 의미하나 Dart만의 특별한 오퍼레이터도 존재

- 삼항 연산자와 비슷하게 사용되지만 더 간결

```dart
// Equal => String capitalizeName (String? name) => name != null ? name.toUppercase() : 'no name!';
String capitalizeName (String? name) => name?.toUppercase() ?? 'no name!';

void main() {
  capitalizeName(null);

  // 값의 할당에도 사용 가능
  String? name;
  name ??= 'woogi';
}
```

## typedef

- 자료형에 `alias`를 붙일 수 있도록 설정

- TS의 타입 정의와 같은 기능

```dart
typedef ListOfInts = List<int>;

ListOfInts reverseList = (List<int> list) {
  var reversed = list.reversed;
  return reversed.toList();
}

void main () {
  print(reverseList([1,2,3]));
  // [3, 2, 1]
}
```

# Flutter's Class

- ✅ 플러터에서 가장 중요한 개념

```dart
class Player {
  final String name = 'woogi';
  int xp = 1500;

  // Dart에서 class 내부의 this 사용은 권장되지 않음
  void sayhello() {
    print("Hi my name is $name");
  }
}

void main() {
  var player = new Player(); // 인스턴스 생성
  player.name = 'not woogi'; // final 지정이므로 재할당 불가
  player.xp = 100000;
}
```

## Constructors

- 인스턴스에 인자를 직접 할당하여 값을 지정해줌

```dart
class Player {
  final String name;
  int xp;

  // this를 직접 사용 가능
  Player(this.name, this.xp);
}

void main() {
  var player = new Player("woogi", 10000);
}
```

## Named Constructor Parameters

- 위의 `Named Parameter` 처럼 `Constructor`의 파라미터를 명명하여 사용

```dart
class Player {
  final String name;
  int xp;

  // this를 직접 사용 가능
  Player({required this.name, required this.xp});
}

void main() {
  var player = new Player(
    name: 'woogi',
    xp: 10,
  );
}
```

## Named Constructor

- 클래스를 사용하는 곳에서 서로다른 각각의 `Constructor`를 만드는 방법

```dart
class Player {
  final String name;
  int xp;

  // this를 직접 사용 가능
  Player({required this.name, required this.xp});

  // : (콜론) 을 통해 직접 프로퍼티의 변수를 참조하여 필요한 값만 차용할 수 있도록 함
  Player.createBluePlayer({required String name}) :
  this.name = name,
  this.xp = 1000;
}

void main() {
  var bluePlayer = new Player.createBluePlayer(
    name: 'woogi',
  );

  var redPlayer = new Player.createRedPlayer(
    name: 'woogi',
  );
}
```

## Cascade Notation

- 클래스의 인스턴스를 가져와 각각의 변수를 변경하는 방법을 더 쉽게 만들어줌

```dart
class Player {
  String name;
  int xp;

  // this를 직접 사용 가능
  Player({required this.name, required this.xp});
}

void main() {
  var player = Player(name: 'woogi', xp: 1000)
  ..name = 'woooogi'
  ..xp = 10000;
}
```

## Enums

- 휴먼 에러 방지를 위해 사용되는 키워드 (ex. 플러터의 color 등)

- 내부 요소의 타입은 신경 쓸 필요 X

```dart
enum Team { red, blue }

class Player {
  String name;
  int xp;
  Team team;

  // this를 직접 사용 가능
  Player({required this.name, required this.xp, required this.team});
}

void main() {
  var player = Player(name: 'woogi', xp: 1000, team: Team.red)
  ..name = 'woooogi'
  ..xp = 10000
  ..team = Team.red;
}
```

## Abstract Class

- 다른 클래스가 구현해야 하는 메서드를 모아놓은 템플릿같은 느낌 (추상화)

- 메서드의 반환 타입과 이름만 지정해놓고 `extends` 를 통해 어디서든 사용이 가능

```dart
abstract class Human {
  void walk();
}

class Player extends Human {
  String name;
  int xp;

  void walk() {
    print('걷다');
  }

  Player({required this.name, required this.xp});
}

void main() {
}
```

## Inheritance

- 클래스를 다루는 객체 지향 언어에서 매우 중요한 개념 중 하나인 상속

- 생성자 함수를 통해 상속받은 클래스의 변수, 메서드 등을 사용할 수 있음

```dart
class Human {
  final String name;
  Human({required this.name});

  void sayHello(){
    print("Hi, my name is $name");
  }
}

enum Team { blue, red };

class Player extends Human {
  final Team team;

  Player({
    required this.team,
    required String name
  }) : super(name: name);

  @override
  void sayHello() {
    super.sayHello();
    print("and I play for ${team}")
  }
}

void main() {
  var player = Player(team: Team.red, name: "woogi");
}
```

- 위 코드의 경우 `var player` 로직에서 지정한 변수가 `Player` 클래스를 거쳐 `Human` 까지 전달

- 최종적으로 `name` 과 `sayHello()` 를 전부 사용 가능하게 함

## Mixins

- 생성자가 없는 클래스를 총칭 (프로퍼티 추가용도)

```dart
class Strong {
  final double strLevel = 1500.99;
}

class QuickRunner {
  void runQuick () {
    print("runnnn");
  }
}

class Tall {
  final double height = 1.99;
}

// extends를 복수형태로 확장 및 여러 형태에 재사용
class Player with Strong, QuickRunner, Tall {

}
```

- `extends` 와 `super` 등의 확장, 상속의 개념과 달리 단순히 가져오고 싶은 클래스들의 메서드를 사용하기 위한 형태
