import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Clothing {
  int? id;
  String name;
  String size;

  Clothing({this.id, required this.name, required this.size});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'size': size,
    };
  }

  static Clothing fromMap(Map<String, dynamic> map) {
    return Clothing(
      id: map['id'],
      name: map['name'],
      size: map['size'],
    );
  }
}

class ClothingDatabase {
  static final ClothingDatabase instance = ClothingDatabase._init();

  static Database? _database;

  ClothingDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('clothing.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE clothing ( 
  id $idType, 
  name $textType,
  size $textType
  )
''');
  }

  Future<Clothing> create(Clothing clothing) async {
    final db = await instance.database;

    final id = await db.insert('clothing', clothing.toMap());
    return clothing..id = id;
  }

  Future<List<Clothing>> readAllClothings() async {
    final db = await instance.database;

    final result = await db.query('clothing');

    return result.map((json) => Clothing.fromMap(json)).toList();
  }


  Future<Clothing> readClothing(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'clothing',
      columns: ['id', 'name', 'size'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Clothing.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> update(Clothing clothing) async {
    final db = await instance.database;

    return db.update(
      'clothing',
      clothing.toMap(),
      where: 'id = ?',
      whereArgs: [clothing.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      'clothing',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
