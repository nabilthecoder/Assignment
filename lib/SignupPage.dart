// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'homeScreen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ageController = TextEditingController();
  final _birthdateController = TextEditingController();

  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Sign Up')),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _usernameController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _ageController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: 'Age',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            int age = int.tryParse(value) ?? 0;
                            if (age <= 0) {
                              return 'Please enter a valid age';
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _birthdateController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: 'Birth Date',
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                          child: const Text('Sign Up'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final userProfile = UserProfile(
                                name: _nameController.text,
                                username: _usernameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                age: int.tryParse(_ageController.text),
                                birthdate: _birthdateController.text,
                              );
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      HomeScreen(userProfile: userProfile),
                                ),
                              );
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class UserProfile {
  final String name;
  final String username;
  final String email;
  final String password;
  final int? age;
  final String? birthdate;

  UserProfile({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    this.age,
    this.birthdate,
  });
}
