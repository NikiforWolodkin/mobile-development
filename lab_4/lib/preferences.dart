import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClothingPageSharedPreferences extends StatefulWidget {
  const ClothingPageSharedPreferences({Key? key}) : super(key: key);

  @override
  _ClothingPageState createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPageSharedPreferences> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _sizeController = TextEditingController();

  String? _savedName;
  String? _savedSize;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedName = prefs.getString('name');
      _savedSize = prefs.getString('size');
    });
  }

  Future<void> _savePreferences() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', _nameController.text);
      await prefs.setString('size', _sizeController.text);
      setState(() {
        _savedName = _nameController.text;
        _savedSize = _sizeController.text;
      });
    }
  }

  Future<void> _deletePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    await prefs.remove('size');
    setState(() {
      _savedName = null;
      _savedSize = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
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
                        onPressed: _savePreferences,
                        child: const Text('Save'),
                      ),
                      ElevatedButton(
                        onPressed: _deletePreferences,
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text('Saved Name: $_savedName'),
          Text('Saved Size: $_savedSize'),
        ],
      ),
    );
  }
}