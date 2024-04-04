import 'package:flutter/material.dart';

import 'package:lab_6/models/clothing.dart';
import 'package:lab_6/services/clothing_service.dart';

class ClothingPage extends StatefulWidget {
  @override
  _ClothingPageState createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
  final ClothingService clothingService = ClothingService();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clothing List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(controller: idController, decoration: const InputDecoration(labelText: 'ID')),
                TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Name')),
                TextField(controller: sizeController, decoration: const InputDecoration(labelText: 'Size')),
                Row(children: [
                  ElevatedButton(
                    onPressed: () {
                      final newClothing = Clothing(
                        id: int.parse(idController.text),
                        name: nameController.text,
                        size: sizeController.text,
                      );
                      clothingService.addClothing(newClothing);
                    },
                    child: const Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final newClothing = Clothing(
                        id: int.parse(idController.text),
                        name: nameController.text,
                        size: sizeController.text,
                      );
                      clothingService.updateClothing(newClothing);
                    },
                    child: const Text('Update'),
                  ),
                ]),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Clothing>>(
              stream: clothingService.getClothingStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final clothingList = snapshot.data;
                  return ListView.builder(
                    itemCount: clothingList?.length,
                    itemBuilder: (context, index) {
                      final clothing = clothingList?[index];

                      if (clothing != null) {
                        return ListTile(
                          title: Text(clothing.name),
                          subtitle: Text(clothing.size),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              clothingService.deleteClothing(clothing.id);
                            },
                          ),
                        );
                      }

                      return const Text('Loading clothing error');
                    },
                  );
                }
                return const SizedBox(
                  width: 250.0, // Adjust these values to suit your needs
                  height: 250.0,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
