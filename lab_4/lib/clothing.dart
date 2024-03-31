import 'package:hive/hive.dart';

part 'clothing.g.dart'; // Generated file for Hive serialization

@HiveType(typeId: 0) // Define a type ID for Hive
class Clothing {
  @HiveField(0) // Define field index for serialization
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String size;  

  Clothing({this.id, required this.name, required this.size});
}