import 'package:flutter/material.dart';

import 'package:user_preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Carlos';

  TextEditingController _nombre_controller;

  @override
  void initState() {
    super.initState();

    _nombre_controller = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes de usuario'),
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
                _colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            groupValue: _genero,
            title: Text('Masculinos'),
            onChanged: (value) {
              setState(() {
                _genero = value;
              });
            },
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            title: Text('Femenino'),
            onChanged: (value) {
              setState(() {
                _genero = value;
              });
            },
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _nombre_controller,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona',
              ),
              onChanged: (value) {
                setState(() {
                  _nombre = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
