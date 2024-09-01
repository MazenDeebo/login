// lib/login_page.dart

import 'package:flutter/material.dart';
import 'list_view_example.dart'; // Import the ListViewExample page

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  // Arrays of validated emails and passwords
  final List<String> validEmails = ["mazen.com", "bassel.com", "ahmed.com"];
  final List<String> validPasswords = ["1234", "5678", "12345678"];

  // Controllers to capture input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Icon
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  size: 100.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30.0),

              // Email TextField
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),

                    // Password TextField
                    TextFormField(
                      controller: passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              // Log In Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Validate the email and password
                    String email = emailController.text;
                    String password = passwordController.text;

                    if (isValidCredentials(email, password)) {
                      // If credentials are valid, navigate to the ListViewExample page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListViewExample()),
                      );
                    } else {
                      // Show error message if credentials are invalid
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid email or password')),
                      );
                    }
                  }
                },
                child: Text('Log In'),
              ),
              SizedBox(height: 10.0),

              // Forgot Password and Sign Up
              TextButton(
                onPressed: () {
                  // Navigate to forgot password
                },
                child: Text('Forgot password?'),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to sign up
                },
                child: Text('Not a member? Sign up now'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to validate the credentials
  bool isValidCredentials(String email, String password) {
    for (int i = 0; i < validEmails.length; i++) {
      if (email == validEmails[i] && password == validPasswords[i]) {
        return true;
      }
    }
    return false;
  }
}
