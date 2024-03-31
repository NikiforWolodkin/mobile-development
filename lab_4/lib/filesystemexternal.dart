import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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

class FileOperationExternalPage extends StatefulWidget {
  @override
  _FileOperationPageState createState() => _FileOperationPageState();
}

class _FileOperationPageState extends State<FileOperationExternalPage> {
  Future<bool> _requestStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      return true;
    } else {
      // Handle permission denied case
      return false;
    }
  }

  Future<File> get _externalFile async {
    if (await _requestStoragePermission()) {
      final directory = await getExternalStorageDirectory();
      return File('${directory!.path}/my_file.txt');
    } else {
      throw Exception('Storage permission not granted');
    }
  }

  Future<File> get _externalCacheFile async {
    if (await _requestStoragePermission()) {
      final directory = await getExternalCacheDirectories();
      return File('${directory!.first.path}/my_temp_file.txt');
    } else {
      throw Exception('Storage permission not granted');
    }
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
        title: const Text('File System External'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Write Data to External Dir'),
              onPressed: () {
                Clothing clothing = Clothing(name: 'T-Shirt', size: 'M');
                writeData(clothing, _externalFile);
              },
            ),
            ElevatedButton(
              child: const Text('Read Data from External Dir'),
              onPressed: () async {
                try {
                  Clothing clothing = await readData(_externalFile);
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
              child: const Text('Delete Data from External Dir'),
              onPressed: () async {
                try {
                  await deleteData(_externalFile);
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
              child: const Text('Write Data to External Cache Dir'),
              onPressed: () {
                Clothing clothing = Clothing(name: 'Jeans', size: 'L');
                writeData(clothing, _externalCacheFile);
              },
            ),
            ElevatedButton(
              child: const Text('Read Data from External Cache Dir'),
              onPressed: () async {
                try {
                  Clothing clothing = await readData(_externalCacheFile);
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
              child: const Text('Delete Data from External Cache Dir'),
              onPressed: () async {
                try {
                  await deleteData(_externalCacheFile);
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
