import 'package:flutter/material.dart';
import 'package:yi_30_days_of_flutter/week2/color.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Color _unfocusedColor = Colors.grey[600];
  Color _focusedColor;
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  //
  final _circularBorder = BeveledRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(7.0)),
  );
  void _clear() {
    _usernameController.clear();
    _passwordController.clear();
  }

  @override
  void initState() {
    _usernameFocusNode.addListener(() => setState(() {}));
    _passwordFocusNode.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _focusedColor = Theme.of(context).accentColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/diamond.png',
                  color: kShrineBlack,
                ),
                SizedBox(height: 16.0),
                Text('SHRINE'),
              ],
            ),
            SizedBox(height: 120.0),
            TextField(
              controller: _usernameController,
              focusNode: _usernameFocusNode,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: _usernameFocusNode.hasFocus
                      ? _focusedColor
                      : _unfocusedColor,
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: _passwordFocusNode.hasFocus
                      ? _focusedColor
                      : _unfocusedColor,
                ),
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  onPressed: _clear,
                  child: Text('Cancel !'),
                  shape: _circularBorder,
                ),
                RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Next !'),
                  elevation: 8,
                  shape: _circularBorder,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
