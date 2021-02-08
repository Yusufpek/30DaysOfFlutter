import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _clear() {
    _usernameController.clear();
    _passwordController.clear();
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
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('SHRINE'),
              ],
            ),
            SizedBox(height: 120.0),
            // tODO: Wrap Username with AccentColorOverride (103)
            // tODO: Remove filled: true values (103)
            // tODO: Wrap Password with AccentColorOverride (103)
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
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
                ),
                RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Next !'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
