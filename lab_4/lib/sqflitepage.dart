import 'package:flutter/material.dart';
import 'sqflite.dart';

class ClothingPageSqfLite extends StatefulWidget {
  const ClothingPageSqfLite({Key? key}) : super(key: key);

  @override
  _ClothingPageState createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPageSqfLite> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _sizeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQFLite'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'ID'),
                    controller: _idController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an ID';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Size'),
                    controller: _sizeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a size';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            var clothing = Clothing(id: int.parse(_idController.text), name: _nameController.text, size: _sizeController.text);
                            ClothingDatabase.instance.create(clothing);
                            setState(() {});
                          }
                        },
                        child: const Text('Add'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            var clothing = Clothing(id: int.parse(_idController.text), name: _nameController.text, size: _sizeController.text);
                            ClothingDatabase.instance.update(clothing);
                            setState(() {});
                          }
                        },
                        child: const Text('Update'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: ClothingDatabase.instance.readAllClothings(),
              builder: (context, AsyncSnapshot<List<Clothing>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name),
                        subtitle: Text(snapshot.data![index].size),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            ClothingDatabase.instance.delete(snapshot.data![index].id!);
                            setState(() {});
                          },
                        ),
                        onTap: () {
                          _idController.text = snapshot.data![index].id.toString();
                          _nameController.text = snapshot.data![index].name;
                          _sizeController.text = snapshot.data![index].size;
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Failed to load data'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
