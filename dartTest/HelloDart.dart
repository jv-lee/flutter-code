//使用dart定义一个函数 调用
printInt(int number){
  print('The number is $number.');
}

/**
 * 1.调用函数
 * 函数无返回值使用void修饰，也可以直接省略void
 */
testFun(){
  var number = 32;
  //调用函数
  printInt(number);
}

/**
 * 2.定义变量的区别
 * 在dart语言中 变量类型可以写定，也可以使用var 来声明。使用var来声明变量，dart语言可以自动推导出变量的类型
 */
testParams(){
  int a = 10;
  var b = 10;
  double c = 1.2;
  var d = 1.2;
}

/**
 * 3.字符串引用定义
 */
testString(){
  var s1 = 'abcd';
  var s2 = "abcd";
  var s3 = "abcd'";
  var s4 = 'abcd\'';
  var s5 = "ab"+"cd";
  var s6 = "ab" "cd";
  var s7 = '''
  aaaaa
  bbbbb
  ccccc
  ''';
  var number1 = 12;
  var s8 = "this is append int = $number1";
  var s9 = "this is append int ="+number1.toString();

  //常量
  const s10 = "const string";
}

/**
 * 4.List 
 */
testList(){
  var list = [1,2,3];
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
  list2.removeRange(0,1);

  //下面这个方法是将列表List中的toString之后的字符串的长度等于3的元素全部删除
  list2.removeWhere((item) => item.toString().length == 3);

  for(int i = 0;i<list2.length;i++){
    printInt(list2[i]);
  }

  var list3 = [0,...list]; // [0,1,2,3];
  var list4 = [0,...?list]; // 如果list为空则不赋值

  const list5 = [1,5,7]; // const常量 该list中的值不可在更改
}

/**
 * 5.Set
 */
testSet(){
  var set1 = {'a'};
  var set2 = <int>{}; //不指定类型为 <dynamic>{};  单独使用{}为map

  Set<int> set3 = Set();
  set3.add(1);
}

/**
 * 6.Map
 */
testMap(){
  var map1 = {0:'a',1:'b'};
  var map2 = Map();
  map2[0] = 'a';

  Map<int,String> map3 = Map(); //指定类型的map

  final map4 = const {0:'a',1:'b'};//无法修改的map
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
int add(int a,int b){
  return a + b;
}


void main(){
  testList();
}