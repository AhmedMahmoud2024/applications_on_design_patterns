import 'package:flutter/material.dart';

import 'profile_screen.dart';
import 'user_session.dart';

class LoginScreen extends StatelessWidget {
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

  Future<void>  _handleLogin(BuildContext context) async{
// simulate api call
final String mockUserId= 'user_123';

await UserSession.instance.login(mockUserId);
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => ProfileScreen()),
);
    }
   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: ()=>_handleLogin((context)) ,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
