import 'package:catatan_harian_bps/src/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nipController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _loginMessage = '';

  bool isLoading = false;

  void _login() {
    setState(() {
      _loginMessage = 'Login Gagal. NIP atau Password salah.';
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleLogin() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        nip: _nipController.text,
        password: _passwordController.text,
      )) {
      } else {}

      setState(() {
        isLoading = false;
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40),
              Text(
                'Selamat Datang',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 24),
              ),
              SizedBox(height: 20),
              Image.asset('assets/images/logo.png',
                  height: 100), // Logo Aplikasi
              SizedBox(height: 30),
              _buildTextField(_nipController, 'NIP', Icons.person),
              SizedBox(height: 10),
              _buildTextField(_passwordController, 'Password', Icons.lock,
                  isPassword: true),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[700],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: handleLogin,
              ),
              SizedBox(height: 10),
              Text(
                _loginMessage,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue),
        border: OutlineInputBorder(),
      ),
      obscureText: isPassword,
    );
  }
}
