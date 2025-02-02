import 'package:flutter/material.dart';
import 'package:supabase_auth_app/auth/auth_service.dart';
import 'package:supabase_auth_app/pages/profile_page.dart';
import 'package:supabase_auth_app/pages/signin_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Get auth service
  final AuthService authService = AuthService();

  // Text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Login button pressed
  Future<void> login() async {
  // Validate inputs
  if (_emailController.text.trim().isEmpty || _passwordController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fill in all fields'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  try {
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    final response = await authService.signInWithEmailPassword(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
    
    // Hide loading indicator
    if (context.mounted) Navigator.pop(context);
    
    if (response.user != null) {
      if (context.mounted) {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      }
    }
  } catch (error) {
    // Hide loading indicator if still showing
    if (context.mounted && Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: ${error.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Center(
                child: Text("Don't have an account ? Sign up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
