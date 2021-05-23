import 'package:flutter/material.dart';

import 'package:user_preferences/src/widgets/menu_widget.dart';

import 'package:user_preferences/src/share_prefs/user_preferences.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.endPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.secondColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario : ${prefs.secondColor}'),
          Divider(),
          Text('Género : ${prefs.gender}'),
          Divider(),
          Text('Nombre usuario : ${prefs.name}'),
          Divider(),
        ],
      ),
    );
  }
}
