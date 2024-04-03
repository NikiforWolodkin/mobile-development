import 'package:cloud_firestore/cloud_firestore.dart';

import 'clothing.dart';

class ClothingService {
  final CollectionReference clothingCollection =
      FirebaseFirestore.instance.collection('clothing');

  // Add a new Clothing item
  Future<void> addClothing(Clothing clothing) async {
    await clothingCollection.add(clothing.toMap());
  }

  // Get all Clothing items
  Stream<List<Clothing>> getClothingStream() {
    return clothingCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Clothing.fromMap(doc.data() as Map<String, dynamic>)).toList();
    });
  }

  // Update a Clothing item
  Future<void> updateClothing(Clothing clothing) async {
    await clothingCollection.doc(clothing.id.toString()).update(clothing.toMap());
  }

  // Delete a Clothing item
  Future<void> deleteClothing(int id) async {
    await clothingCollection.doc(id.toString()).delete();
  }
}
