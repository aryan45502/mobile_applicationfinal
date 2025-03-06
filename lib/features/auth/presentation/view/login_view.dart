import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive/hive.dart';
import 'package:wedding_planner/features/auth/presentation/view/register_view.dart';
import 'package:wedding_planner/features/auth/presentation/view_model/login/login_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final PageController _pageController = PageController();
  final _gap = const SizedBox(height: 16);
  int _currentPage = 0;

  // Define custom maroon color
  final Color maroonColor = const Color(0xFF800000);

  final List<String> _images = [
    'assets/images/wed3.png',
    'assets/images/wed2.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    Hive.openBox('users'); // Open Hive box for users
    _startImageAutoChange();
  }

  void _startImageAutoChange() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % _images.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        );
        _currentPage = nextPage;
      }
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Slideshow
          Positioned.fill(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                );
              },
            ),
          ),
          Container(
            color:
                Colors.black.withOpacity(0.4), // Dark overlay for readability
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Login to your account',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Username Field
                      _buildInputField(
                          'Username', _usernameController, Icons.person),
                      _gap,
                      // Password Field
                      _buildInputField(
                          'Password', _passwordController, Icons.lock,
                          isPassword: true),
                      const SizedBox(height: 32),
                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(
                                  LoginCustomerEvent(
                                    context: context,
                                    username: _usernameController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: maroonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 64),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Register Button
                      TextButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(
                                NavigateRegisterScreenEvent(
                                  destination: RegisterView(),
                                  context: context,
                                ),
                              );
                        },
                        child: Text(
                          'Don’t have an account? Register',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(
      String label, TextEditingController controller, IconData icon,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.white70),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label.toLowerCase()';
            }
            return null;
          },
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
