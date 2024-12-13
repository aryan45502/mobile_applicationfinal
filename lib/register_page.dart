import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  DateTime? _selectedDate;
  String _role = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF800000),
        title: Text(
          'WedPlan',
          style: TextStyle(
            fontFamily: 'Cursive',
            fontWeight: FontWeight.bold,
          ),
        ),
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
                Center(
                  child: Text(
                    'Create Your Wedding Account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800000),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _fullNameController,
                  decoration: InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email Address'),
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
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Wedding Date (Optional)',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      controller: TextEditingController(
                        text: _selectedDate != null
                            ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                            : '',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Text('I am a:', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Bride',
                      groupValue: _role,
                      activeColor: Color(0xFF800000),
                      onChanged: (value) {
                        setState(() {
                          _role = value!;
                        });
                      },
                    ),
                    Text('Bride'),
                    Radio<String>(
                      value: 'Groom',
                      groupValue: _role,
                      activeColor: Color(0xFF800000),
                      onChanged: (value) {
                        setState(() {
                          _role = value!;
                        });
                      },
                    ),
                    Text('Groom'),
                    Radio<String>(
                      value: 'Wedding Planner',
                      groupValue: _role,
                      activeColor: Color(0xFF800000),
                      onChanged: (value) {
                        setState(() {
                          _role = value!;
                        });
                      },
                    ),
                    Text('Wedding Planner'),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      activeColor: Color(0xFF800000),
                      onChanged: (value) {},
                    ),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: 'I agree to the ',
                          children: [
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(color: Color(0xFF800000)),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(color: Color(0xFF800000)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF800000),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Perform registration
                      }
                    },
                    child: Text('Create Account'),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text('Or continue with'),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey),
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.g_translate, color: Color(0xFF800000)),
                      label: Text(
                        'Google',
                        style: TextStyle(color: Color(0xFF800000)),
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.facebook, color: Colors.white),
                      label: Text('Facebook'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(color: Color(0xFF800000)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    '',
                    style: TextStyle(color: Colors.grey),
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
