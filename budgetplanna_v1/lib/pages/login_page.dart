import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'budget_planer_page.dart';
import 'register_page.dart';
import '../components/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SharedPreferencesService.initializeAdmin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anmelden'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Benutzername',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Passwort',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                final username = _usernameController.text;
                final password = _passwordController.text;

                if (await SharedPreferencesService.isAdminLogin(
                    username, password)) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BudgetPlanerPage()),
                  );
                  return;
                }

                final credentials =
                    await SharedPreferencesService.getCredentials();
                if (credentials['username'] == username &&
                    credentials['password'] == password) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BudgetPlanerPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Benutzername oder Passwort falsch!')),
                  );
                }
              },
              child: Text('Anmelden'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationPage()),
                );
              },
              child: Text('Noch kein Konto? Hier registrieren'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
