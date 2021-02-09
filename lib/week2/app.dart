import 'package:flutter/material.dart';

import 'color.dart';
import 'home.dart';
import 'login.dart';
import 'supplemental/cut_corners_border.dart';

// tODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatelessWidget {
  final ThemeData _kShrineTheme = _buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      theme: _kShrineTheme,

      // tODO: Change home: to a Backdrop with a HomePage frontLayer (104)
      home: HomePage(),
      // tODO: Make currentCategory field take _currentCategory (104)
      // tODO: Pass _currentCategory for frontLayer (104)
      // tODO: Change backLayer field value to CategoryMenuPage (104)
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
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

ThemeData _buildShrineTheme() {
  final ThemeData tdLight = ThemeData.light();
  return tdLight.copyWith(
    primaryColor: kShrinePurple,
    buttonTheme: tdLight.buttonTheme.copyWith(
        buttonColor: kShrinePurple,
        textTheme: ButtonTextTheme.accent,
        colorScheme: ColorScheme.light().copyWith(primary: kShrinePurple)),
    scaffoldBackgroundColor: kShrineSurfaceWhite,
    textTheme: _buildShrineTextTheme(tdLight.textTheme),
    primaryTextTheme: _buildShrineTextTheme(tdLight.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(tdLight.accentTextTheme),
    primaryIconTheme: tdLight.iconTheme.copyWith(color: kShrineSurfaceWhite),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kShrinePurple,
        ),
      ),
      border: CutCornersBorder(),
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme td) {
  return td
      .copyWith(
        headline5: td.headline5.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: td.headline6.copyWith(
          fontSize: 18.0,
        ),
        caption: td.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: td.bodyText1.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
      );
}
