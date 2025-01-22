import 'package:dev_toolkit/dev_toolkit.dart';

Future<void> main() async {
  boolExample();
}

void boolExample() {
  bool? nullableBool = null;

  print(nullableBool); // null
  print(nullableBool.value); // false

  List<bool> listOfBools = [true, false];

  print(listOfBools.anyFalse()); // true
  print(listOfBools.anyTrue()); // true
  print(listOfBools.allFalse()); // false
  print(listOfBools.allTrue()); // false
}
