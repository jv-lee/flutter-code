//使用dart定义一个函数 调用
printInt(int number) {
  print('The number is $number.');
}

/**
 * 1.调用函数
 * 函数无返回值使用void修饰，也可以直接省略void
 */
testFun() {
  var number = 32;
  //调用函数
  printInt(number);
}

/**
 * 2.定义变量的区别
 * 在dart语言中 变量类型可以写定，也可以使用var 来声明。使用var来声明变量，dart语言可以自动推导出变量的类型
 */
testParams() {
  int a = 10;
  var b = 10;
  double c = 1.2;
  var d = 1.2;
}

/**
 * 3.字符串引用定义
 */
testString() {
  var s1 = 'abcd';
  var s2 = "abcd";
  var s3 = "abcd'";
  var s4 = 'abcd\'';
  var s5 = "ab" + "cd";
  var s6 = "ab" "cd";
  var s7 = '''
  aaaaa
  bbbbb
  ccccc
  ''';
  var number1 = 12;
  var s8 = "this is append int = $number1";
  var s9 = "this is append int =" + number1.toString();

  //常量
  const s10 = "const string";
}

/**
 * 4.List 
 */
testList() {
  var list = [1, 2, 3];
  List list1 = new List(); // dart1 必须写new
  List list2 = List(); // dart2开始可以省略 new

  list2.add(1);
  list2.add(2);
  list2.add(3);
  list2.add(4);
  list2.add(5);
  list2.add(6);
  list2.add(7);
  list2.add(123);
  var temp = list2[1];
  printInt(temp);

  //删除指定对象的元素
  list2.remove(1);

  //删除指定下标的元素
  list2.removeAt(0);

  //删除指定区域的元素
  list2.removeRange(0, 1);

  //下面这个方法是将列表List中的toString之后的字符串的长度等于3的元素全部删除
  list2.removeWhere((item) => item.toString().length == 3);

  for (int i = 0; i < list2.length; i++) {
    printInt(list2[i]);
  }

  var list3 = [0, ...list]; // [0,1,2,3];
  var list4 = [0, ...?list]; // 如果list为空则不赋值

  const list5 = [1, 5, 7]; // const常量 该list中的值不可在更改
}

/**
 * 5.Set
 */
testSet() {
  var set1 = {'a'};
  var set2 = <int>{}; //不指定类型为 <dynamic>{};  单独使用{}为map

  Set<int> set3 = Set();
  set3.add(1);
}

/**
 * 6.Map
 */
testMap() {
  var map1 = {0: 'a', 1: 'b'};
  var map2 = Map();
  map2[0] = 'a';

  Map<int, String> map3 = Map(); //指定类型的map

  final map4 = const {0: 'a', 1: 'b'}; //无法修改的map
}

/**
 * 6.参数
 * 固定参数 - add(int a,int b) 
 * 
 * 可选参数 - add(int a,int b,{int c,int d,int e = 0}) c为可选参数 -> add(2,3,c:4)调用时必须指定命名参数
 * 使用未设置默认值的可选参数 ，使用?? 来选定使用 c ?? ''
 * 
 * 位置参数 - add(int a,int b,[int c = 0,int d = 0, int e = 0]) 位置参数必须按顺序传入
 */
int add(int a, int b) {
  return a + b;
}

printParams(int params) {
  print("这是一个匿名函数 打印参数：$params");
}

/**
 * 7.函数作为参数 / 箭头函数-只能有一行代码 / 匿名函数-多行
 */
testParamsFunction() {
  var fun1 = (e) => print("这是一个匿名函数 打印参数:$e");
  var fun2 = (int e) {
    print("这是一个匿名函数 打印参数：$e");
  };
  var fun3 = printParams;
  var list = [1, 2, 3, 4];
  list.forEach(fun2);
}

/**
 * 8.词法闭包
 * 返回一个函数 作为返回值
 */
Function testParamsFunctionClose(int basicValue) {
  return (int j) => basicValue + j;
}

testParamsFunctionClose2() {
  var fun = testParamsFunctionClose(5);
  var value = fun(4);
  print('最终结果 :$value'); // 为9
}

class Person {
  String name;
  int age;
  String brithday;
}

/**
 * 9.级连运算符
 * .. 返回对象本身 类似 build模式
 */
testClass() {
  Person person = Person();
  person
    ..name = "jv.lee"
    ..age = 25
    ..brithday = "1995-06-05";
}

/**
 * 10.条件控制及for循环 
 */
testCondition() {
  var condition = true;
  if (condition) {
    condition;
  } else {
    condition;
  }

// var value = '1'

// return value == null ? ‘1’ : ‘2’
// return value ?? ‘1'

  var collection = [0, 1, 2];
  for (int i = 0; i < collection.length; ++i) {
    print(collection[i]);
  }

  collection.forEach((v) => print(v));

  for (var x in collection) {
    print(x);
  }
}

/**
 * 11.class 常量对象 以及语法糖构造函数
 */
class Point {
  final num x, y;
  const Point(this.x, this.y);
}

testPoint() {
  //a == b != c
  var a = const Point(1, 2);
  var b = const Point(1, 2);
  var c = Point(1, 2);
}

/**
 * 12.getter / setter
 */
class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  //定义两个计算生产值的属性： right 和 bottom
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

testRectangle() {
  var rect = Rectangle(3, 4, 20, 15);
  rect.right = 12;
}

/**
 * 13.抽象类 - 抽象方法
 */
abstract class Doer {
  //定义实例变量和方法等等

  void doSomething(); //定义一个抽象方法
}

class EffectiveDoer extends Doer {
  @override
  void doSomething() {}
}

/**
 * 14.接口类
 */
class PersonInterface {
  //因为是final修饰 一旦赋值 其他实现接口类的 实现类 必然会使用第一次初始化的_name的值
  final _name;
  PersonInterface(this._name);
  String greet(String who) => '你好 $who,我是 $_name';
}

class Impostor implements PersonInterface {
  @override
  get _name => '';

  @override
  String greet(String who) {
    return '你好 $who,你知道我是谁吗？';
  }
}

/**
 * 15.类的继承
 */
class Television {
  void turnOn() {
    // _illuminateDisplay();
  }
}

class SmartTelevision extends Television {
  @override
  void turnOn() {
    super.turnOn();
    // _bootNetworkInterface();
    // _upgradeApps();
  }
}

/**
 * 16.mixin 机制   为类实现某些特定的功能 , 将特定的功能定义在mixin中 通过 with 关键字引用 
 */
abstract class Animal {}

abstract class Bird extends Animal {}

mixin Walker {
  void walk() {
    print("i'm walking");
  }
}

mixin Fly {
  void fly() {
    print("i'm flying");
  }
}

class Parrot extends Bird with Walker, Fly {}

testMixin() {
  var parrot = Parrot();
  parrot.walk();
  parrot.fly();
}

/**
 * 17.泛型
 */
abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}

/**
 * 18.使用集合字面量
 */
testTvalue() {
  var names = <String>['A', 'B', 'C'];
  var uniqueNames = <String>{'A', 'B', 'C'};
  var pages = <String, String>{'A': '页面A'};

  var nameSet = Set<String>.from(names);
  var views = Map<int, Object>(); //Object -> View
}

/**
 * 19.限定泛型类型范围
 * class Button<T extends View>{}
 */

/**
 * 泛型方法
 */
T first<T>(List<T> list) {
  T temp = list[0];
  return temp;
}

void main() {
  testParamsFunction();
}
