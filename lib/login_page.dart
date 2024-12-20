// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   // Custom Maroon Color
//   final Color maroonColor = const Color(0xFF800000);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: maroonColor,
//         title: const Text(
//           'WedPlan',
//           style: TextStyle(
//             fontFamily: 'Cursive',
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Text(
//                     'Welcome Back!',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: maroonColor,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const Center(
//                   child: Text(
//                     'Login to continue planning your perfect day',
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email Address',
//                     prefixIcon: Icon(Icons.email, color: maroonColor),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                       return 'Enter a valid email';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     prefixIcon: Icon(Icons.lock, color: maroonColor),
//                   ),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your password';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'Forgot Password?',
//                       style: TextStyle(color: maroonColor),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Center(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: maroonColor,
//                       minimumSize: const Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Navigate to HomePage after validation
//                         Navigator.pushNamed(context, '/home');
//                       }
//                     },
//                     child: const Text('Login'),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Center(
//                   child: Text('Or continue with',
//                       style: TextStyle(fontSize: 14, color: Colors.grey)),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         side: const BorderSide(color: Colors.grey),
//                       ),
//                       onPressed: () {},
//                       icon: Icon(Icons.g_translate, color: maroonColor),
//                       label: Text(
//                         'Google',
//                         style: TextStyle(color: maroonColor),
//                       ),
//                     ),
//                     ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue[800],
//                       ),
//                       onPressed: () {},
//                       icon: const Icon(Icons.facebook, color: Colors.white),
//                       label: const Text('Facebook'),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Center(
//                   child: Text.rich(
//                     TextSpan(
//                       text: 'Don\'t have an account? ',
//                       children: [
//                         TextSpan(
//                           text: 'Register',
//                           style: TextStyle(color: maroonColor),
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () {
//                               // Navigate to Register Page
//                               Navigator.pushNamed(context, '/register');
//                             },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Login to continue planning your perfect day',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/home');
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Or continue with',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.g_translate),
                      label: Text(
                        'Google',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.facebook, color: Colors.white),
                      label: const Text('Facebook'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'Don\'t have an account? ',
                      children: [
                        TextSpan(
                          text: 'Register',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/register');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
