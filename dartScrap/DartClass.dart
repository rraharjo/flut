class MyClass {
  String? name;
  int? age;

  MyClass({this.name = '', this.age});
  MyClass.alt() {
    this.name = 'Joe';
    this.age = 10;
  }
}

class ListOfSomething<T> {
  static final String classDesc = 'This class create list of any type';
  List<T> _myList = [];
  int length = 0;
  String desc = '';

  List<T> getMyList(){
    return this._myList;
  }

  T? getLastItem() {
    if (length == 0) {
      return null;
    }
    this.length -= 1;
    return _myList.removeAt(length);
  }

  void add(T item) {
    this._myList.add(item);
    this.length += 1;
  }

  void append(List<T> items) {
    this._myList.addAll(items);
    this.length += items.length;
  }

  ListOfSomething({required String desc, List<T> myList = const []}) {
    this.desc = desc;
    this._myList = myList;
    this.length = myList.length;
  }
}


mixin NotDisabledAtAll{
  int limbs = 4;

  void wave(){
    print('hello there');
  }
}
class HealthyPerson with NotDisabledAtAll{
  String name = '';

  HealthyPerson(this.name);

  void speak() => print('Hello');
}

class HealthyKid implements HealthyPerson{
  @override
  String name = '';
  int limbs = 4;

  @override
  void speak(){
    print('I want mommy');
  }

  @override
  void wave(){
    print('Mommm');
  }
}

int main(){
  HealthyPerson p1 = HealthyPerson('John');
  p1.wave();
  return 0;
}
