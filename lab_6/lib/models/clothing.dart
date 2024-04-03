class Clothing {
  int id;
  String name;
  String size;

  Clothing({required this.id, required  this.name, required  this.size});

  // Convert Clothing object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'size': size,
    };
  }

  // Create a Clothing object from a Firestore document
  factory Clothing.fromMap(Map<String, dynamic> map) {
    return Clothing(
      id: map['id'],
      name: map['name'],
      size: map['size'],
    );
  }
}
