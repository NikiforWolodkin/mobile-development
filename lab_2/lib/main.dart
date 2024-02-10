import 'package:flutter/material.dart';
import 'dart:convert';

abstract class Fashionable {
  void wear();
}

abstract class Clothing {
  String name;

  Clothing(this.name);

  void putOn();
}

mixin FashionItem {
  void showOff() {
    print('Showing off this item.');
  }
}

mixin Describable {
  String description = 'No description provided.';

  void describe() {
    print(description);
  }
}

class Dress extends Clothing with Describable implements Fashionable {
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

class Accessory with FashionItem implements Comparable<Accessory> {
  static const String type = 'Accessory';

  String name;
  int price;

  Accessory(this.name, this.price);

  Accessory.named({this.name = 'Unnamed', this.price = 0});

  String get getName => name;

  @override
  int compareTo(Accessory other) {
    return price.compareTo(other.price);
  } 

  String toJson() {
    return jsonEncode({'name': name, 'price': price});
  }

  static Accessory fromJson(String jsonString) {
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return Accessory(jsonData['name'], jsonData['price']);
  }

  Future<void> fetchInfo() async {
    return Future.delayed(Duration(seconds: 1), () => print('Information about this accessory: ...'));
  }

  set setName(String name) => this.name = name;

  static void showType() {
    print('Type: $type');
  }

  void printName({String prefix = 'Accessory', Function? callback, String? postfix}) {
    print('$prefix: $name ${postfix ?? ''}');
    callback?.call();
  }
}

class Countdown implements Iterable<int> {
  final int start;

  Countdown(this.start);

  @override
  Iterator<int> get iterator => _CountdownIterator(start);
  
  @override
  bool any(bool Function(int element) test) {
    // TODO: implement any
    throw UnimplementedError();
  }
  
  @override
  Iterable<R> cast<R>() {
    // TODO: implement cast
    throw UnimplementedError();
  }
  
  @override
  bool contains(Object? element) {
    // TODO: implement contains
    throw UnimplementedError();
  }
  
  @override
  int elementAt(int index) {
    // TODO: implement elementAt
    throw UnimplementedError();
  }
  
  @override
  bool every(bool Function(int element) test) {
    // TODO: implement every
    throw UnimplementedError();
  }
  
  @override
  Iterable<T> expand<T>(Iterable<T> Function(int element) toElements) {
    // TODO: implement expand
    throw UnimplementedError();
  }
  
  @override
  // TODO: implement first
  int get first => throw UnimplementedError();
  
  @override
  int firstWhere(bool Function(int element) test, {int Function()? orElse}) {
    // TODO: implement firstWhere
    throw UnimplementedError();
  }
  
  @override
  T fold<T>(T initialValue, T Function(T previousValue, int element) combine) {
    // TODO: implement fold
    throw UnimplementedError();
  }
  
  @override
  Iterable<int> followedBy(Iterable<int> other) {
    // TODO: implement followedBy
    throw UnimplementedError();
  }
  
  @override
  void forEach(void Function(int element) action) {
    // TODO: implement forEach
  }
  
  @override
  // TODO: implement isEmpty
  bool get isEmpty => throw UnimplementedError();
  
  @override
  // TODO: implement isNotEmpty
  bool get isNotEmpty => throw UnimplementedError();
  
  @override
  String join([String separator = ""]) {
    // TODO: implement join
    throw UnimplementedError();
  }
  
  @override
  // TODO: implement last
  int get last => throw UnimplementedError();
  
  @override
  int lastWhere(bool Function(int element) test, {int Function()? orElse}) {
    // TODO: implement lastWhere
    throw UnimplementedError();
  }
  
  @override
  // TODO: implement length
  int get length => throw UnimplementedError();
  
  @override
  Iterable<T> map<T>(T Function(int e) toElement) {
    // TODO: implement map
    throw UnimplementedError();
  }
  
  @override
  int reduce(int Function(int value, int element) combine) {
    // TODO: implement reduce
    throw UnimplementedError();
  }
  
  @override
  // TODO: implement single
  int get single => throw UnimplementedError();
  
  @override
  int singleWhere(bool Function(int element) test, {int Function()? orElse}) {
    // TODO: implement singleWhere
    throw UnimplementedError();
  }
  
  @override
  Iterable<int> skip(int count) {
    // TODO: implement skip
    throw UnimplementedError();
  }
  
  @override
  Iterable<int> skipWhile(bool Function(int value) test) {
    // TODO: implement skipWhile
    throw UnimplementedError();
  }
  
  @override
  Iterable<int> take(int count) {
    // TODO: implement take
    throw UnimplementedError();
  }
  
  @override
  Iterable<int> takeWhile(bool Function(int value) test) {
    // TODO: implement takeWhile
    throw UnimplementedError();
  }
  
  @override
  List<int> toList({bool growable = true}) {
    // TODO: implement toList
    throw UnimplementedError();
  }
  
  @override
  Set<int> toSet() {
    // TODO: implement toSet
    throw UnimplementedError();
  }
  
  @override
  Iterable<int> where(bool Function(int element) test) {
    // TODO: implement where
    throw UnimplementedError();
  }
  
  @override
  Iterable<T> whereType<T>() {
    // TODO: implement whereType
    throw UnimplementedError();
  }
}

class _CountdownIterator implements Iterator<int> {
  late int _current;

  _CountdownIterator(int start) {
    _current = start + 1;
  }

  @override
  int get current => _current;

  @override
  bool moveNext() {
    _current--;
    return _current >= 0;
  }
}


void main() async {
  var myAccessory = Accessory.named(name: 'Earrings');
  myAccessory.showOff();

  var myDress = Dress('Red Dress');
  myDress.describe();
  myDress.description = 'This is a red dress.';
  myDress.describe();

  var firstAccessory = Accessory('Accessory 1', 25);
  var secondAccessory = Accessory('Accessory 2', 50);

  var comparison = firstAccessory.compareTo(secondAccessory); 
  print('Comparison result: $comparison');

  var countdown = Countdown(5);
  print('Countdown:');
  for (var value in countdown) {
    print(value);
  }

  print(firstAccessory.toJson()); 

  await firstAccessory.fetchInfo();

  var singleSubscriptionStream = Stream<int>.periodic(Duration(seconds: 1), (x) => x).take(5);
  print('Single-subscription stream:');
  await for (var value in singleSubscriptionStream) {
    print(value);
  }

  var broadcastStream = Stream<int>.periodic(Duration(seconds: 1), (x) => x).take(5).asBroadcastStream();
  print('Broadcast stream:');
  broadcastStream.listen((value) => print('Listener 1: $value'));
  broadcastStream.listen((value) => print('Listener 2: $value'));

  await Future.delayed(Duration(seconds: 6));

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
