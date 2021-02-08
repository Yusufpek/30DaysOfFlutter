import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

// tODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      // tODO: Change home: to a Backdrop with a HomePage frontLayer (104)
      home: HomePage(),
      // tODO: Make currentCategory field take _currentCategory (104)
      // tODO: Pass _currentCategory for frontLayer (104)
      // tODO: Change backLayer field value to CategoryMenuPage (104)
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      // tODO: Add a theme (103)
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}
