import 'package:flutter/material.dart';

import 'package:user_preferences/src/widgets/menu_widget.dart';

import 'package:user_preferences/src/share_prefs/user_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _name;

  TextEditingController _nameController;

  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();
    _genero = prefs.gender;
    _colorSecundario = prefs.secondColor;
    _name = prefs.name;

    _nameController = new TextEditingController(text: _name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes de usuario'),
        backgroundColor: (prefs.secondColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value) {
              setState(() {
                prefs.secondColor = value;
                _colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            groupValue: _genero,
            title: Text('Masculinos'),
            onChanged: _setSelectedGender,
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            title: Text('Femenino'),
            onChanged: _setSelectedGender,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona',
              ),
              onChanged: (value) {
                setState(() {
                  prefs.name = value;
                  _name = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  _setSelectedGender(int value) {
    setState(() {
      prefs.gender = value;
      _genero = value;
    });
  }
}
