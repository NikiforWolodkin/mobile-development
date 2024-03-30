import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Clothing {
  String name;
  String size;

  Clothing({required this.name, required this.size});

  Map<String, dynamic> toJson() => {
    'name': name,
    'size': size,
  };

  factory Clothing.fromJson(Map<String, dynamic> json) {
    return Clothing(
      name: json['name'],
      size: json['size'],
    );
  }
}

class FileOperationPage extends StatefulWidget {
  @override
  _FileOperationPageState createState() => _FileOperationPageState();
}

class _FileOperationPageState extends State<FileOperationPage> {
  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/my_file.txt');
  }

  Future<File> get _tempFile async {
    final directory = await getTemporaryDirectory();
    return File('${directory.path}/my_temp_file.txt');
  }

  Future<File> writeData(Clothing clothing, Future<File> futureFile) async {
    final file = await futureFile;
    return file.writeAsString(jsonEncode(clothing.toJson()));
  }

  Future<Clothing> readData(Future<File> futureFile) async {
    try {
      final file = await futureFile;
      String contents = await file.readAsString();
      return Clothing.fromJson(jsonDecode(contents));
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<void> deleteData(Future<File> futureFile) async {
    try {
      final file = await futureFile;
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      throw Exception('Failed to delete file: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File System'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Write Data to App Doc Dir'),
              onPressed: () {
                Clothing clothing = Clothing(name: 'T-Shirt', size: 'M');
                writeData(clothing, _localFile);
              },
            ),
            ElevatedButton(
              child: const Text('Read Data from App Doc Dir'),
              onPressed: () async {
                try {
                  Clothing clothing = await readData(_localFile);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Name: ${clothing.name}, Size: ${clothing.size}'),
                      );
                    },
                  );
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Error: $e'),
                      );
                    },
                  );
                }
              },
            ),
            ElevatedButton(
              child: const Text('Delete Data from App Doc Dir'),
              onPressed: () async {
                try {
                  await deleteData(_localFile);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('File deleted successfully'),
                      );
                    },
                  );
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Error: $e'),
                      );
                    },
                  );
                }
              },
            ),
            ElevatedButton(
              child: const Text('Write Data to Temp Dir'),
              onPressed: () {
                Clothing clothing = Clothing(name: 'Jeans', size: 'L');
                writeData(clothing, _tempFile);
              },
            ),
            ElevatedButton(
              child: const Text('Read Data from Temp Dir'),
              onPressed: () async {
                try {
                  Clothing clothing = await readData(_tempFile);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Name: ${clothing.name}, Size: ${clothing.size}'),
                      );
                    },
                  );
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Error: $e'),
                      );
                    },
                  );
                }
              },
            ),
            ElevatedButton(
              child: const Text('Delete Data from Temp Dir'),
              onPressed: () async {
                try {
                  await deleteData(_tempFile);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('File deleted successfully'),
                      );
                    },
                  );
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Error: $e'),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
