import 'DartClass.dart';

int myRandomFunct(int a){
  return a;
}

int myNamedParam({int int1 = 0, int? int2}){
  if (int2 == null){
    return 0;
  }
  return int1 + int2;
}

int myReq({required int int1}){
  return int1;
}
int main(){
  MyClass p1 = MyClass();
  MyClass p2 = MyClass.alt();
  print('List of something: ${ListOfSomething.classDesc}');
  ListOfSomething<MyClass> myClassList = ListOfSomething(desc:'testing', myList: [p2]);
  print(myClassList.getMyList());
  myClassList.add(p1);
  print(myClassList.length);
  print(myClassList.getMyList());
  myClassList.getLastItem();
  print(myClassList.length);
  print(myClassList.getMyList());
  print('${p1.name}${p2.name}');
  return 0;
}
