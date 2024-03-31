import 'package:hive/hive.dart';
import 'clothing.dart';

class ClothingDatabase {
  static const String boxName = "clothingBox";

  Future<Box<Clothing>> openBox() async {
    // Initialize Hive if not already initialized
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ClothingAdapter());
    }
    return await Hive.openBox<Clothing>(boxName);
  }

  Future<Clothing> create(Clothing clothing) async {
    final box = await openBox();
    clothing.id = await box.add(clothing); // Add and get generated ID
    return clothing;
  }

  Future<List<Clothing>> readAllClothings() async {
    final box = await openBox();
    return box.values.toList();
  }

  Future<Clothing?> readClothing(int id) async {
    final box = await openBox();
    return box.get(id);
  }

  Future<void> update(Clothing clothing) async {
    final box = await openBox();
    await box.put(clothing.id, clothing);
  }

  Future<void> delete(int id) async {
    final box = await openBox();
    await box.delete(id);
  }
}