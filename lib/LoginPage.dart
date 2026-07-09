import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart'; // Ensure you import your main.dart or home page
import 'SignUpPage.dart'; // Import the sign-up page

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('users');

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Retrieve the user data from Firebase Realtime Database
        DatabaseEvent event = await _dbRef.once();
        DataSnapshot snapshot = event.snapshot;
        bool found = false;

        Map<dynamic, dynamic> users = snapshot.value as Map<dynamic, dynamic>;
        users.forEach((key, value) {
          if (value['email'] == _emailController.text && value['password'] == _passwordController.text) {
            found = true;
          }
        });

        if (found) {
          // Login successful, navigate to HomePage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          // Invalid email or password
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Invalid email or password'),
          ));
        }
      } catch (e) {
        // Handle any errors
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.5),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF304c82)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF304c82)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF304c82)),
                      ),
                      prefixIcon: const Icon(Icons.email, color: Color(0xFF304c82)),
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: const Color(0xFF304c82),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.5),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF304c82)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF304c82)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF304c82)),
                      ),
                      prefixIcon: const Icon(Icons.lock, color: Color(0xFF304c82)),
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                    obscureText: true,
                    cursorColor: const Color(0xFF304c82),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF304c82),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Don't have an account? Sign Up line
                  GestureDetector(
                    onTap: () {
                      // Navigate to Sign Up Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(
                        color: Color(0xFF304c82),
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
