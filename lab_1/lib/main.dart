import 'package:flutter/material.dart';

abstract class Fashionable {
  void wear();
}

abstract class Clothing {
  String name;

  Clothing(this.name);

  void putOn();
}

class Dress extends Clothing implements Fashionable {
  Dress(String name) : super(name);

  @override
  void wear() {
    print('$name is now in fashion!');
  }

  @override
  void putOn() {
    print('Putting on the $name.');
  }
}

class Accessory {
  static const String type = 'Accessory';

  String name;

  Accessory(this.name);

  Accessory.named({this.name = 'Unnamed'});

  String get getName => name;

  set setName(String name) => this.name = name;

  static void showType() {
    print('Type: $type');
  }

  void printName({String prefix = 'Accessory', Function? callback, String? postfix}) {
    print('$prefix: $name ${postfix ?? ''}');
    callback?.call();
  }
}

void main() {
  var myDress = Dress('Red Dress');
  myDress.wear();
  myDress.putOn();

  var myAccessory = Accessory.named(name: 'Earrings');
  print(myAccessory.getName);
  myAccessory.setName = 'Necklace';
  print(myAccessory.getName);

  Accessory.showType();

  myAccessory.printName(
    prefix: 'My Accessory',
    callback: () => print('Callback executed!'),
    postfix: '(postfix)',
  );

  var array = [1, 2, 3, 4, 5];
  print('Array: $array');
  array.add(6);
  print('Array after adding an element: $array');

  var list = List<int>.filled(5, 0);
  print('List: $list');
  list[0] = 1;
  print('List after modifying an element: $list');

  var set = {1, 2, 2, 3, 3};
  print('Set: $set');

  for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) {
      continue;
    }
    if (i > 5) {
      break;
    }
    print(i);
  }

  try {
    var result = 100 ~/ 0;
  } catch (e) {
    print('Caught an exception: $e');
  } finally {
    print('This is the finally block');
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
