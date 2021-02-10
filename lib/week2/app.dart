import 'package:flutter/material.dart';

import 'backdrop.dart';
import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'category_menu_page.dart';
import 'model/product.dart';
import 'supplemental/cut_corners_border.dart';

// tODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatefulWidget {
  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  final ThemeData _kShrineTheme = _buildShrineTheme();
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category c) {
    setState(() {
      _currentCategory = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      theme: _kShrineTheme,
      home: Backdrop(
        currentCategory: _currentCategory,
        frontLayer: HomePage(
          category: _currentCategory,
        ),
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text('SHRINE'),
        backTitle: Text('MENU'),
      ),
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
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonColor: kShrinePink100,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    buttonTheme: tdLight.buttonTheme.copyWith(
      buttonColor: kShrinePink100,
      colorScheme: tdLight.colorScheme.copyWith(
        secondary: kShrineBrown900,
      ),
    ),
    buttonBarTheme: tdLight.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.accent,
    ),
    primaryIconTheme: tdLight.iconTheme.copyWith(color: kShrineBrown900),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kShrinePurple,
        ),
      ),
      border: CutCornersBorder(),
    ),
    textTheme: _buildShrineTextTheme(tdLight.textTheme),
    primaryTextTheme: _buildShrineTextTheme(tdLight.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(tdLight.accentTextTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme td) {
  return td
      .copyWith(
        headline5: td.headline5.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: td.headline6.copyWith(fontSize: 18.0),
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
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}
