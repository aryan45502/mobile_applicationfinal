import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wedding_planner/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:wedding_planner/features/auth/presentation/view_model/signup/register_event.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _gap = const SizedBox(height: 16);
  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: '');
  final _lnameController = TextEditingController(text: '');
  final _phoneController = TextEditingController(text: '');
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  // Define custom maroon color
  final Color maroonColor = const Color(0xFF800000); // Maroon color

  File? _img;
  String? path;

  @override
  void initState() {
    super.initState();
    Hive.openBox('users'); // Open Hive box for users
  }

  Future<void> checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  Future _browseImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
          print(image.path);
          path = image.path.split('/').last;
          print("path var imagepath : $path");
          // Send image to server
          context.read<RegisterBloc>().add(
                UploadImage(file: _img!),
              );
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maroonColor, // Maroon color
        title: const Text(
          'Register',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // White background for a professional look
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Create Your Account",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.grey[300],
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (context) => Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      checkCameraPermission();
                                      _browseImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.camera),
                                    label: const Text('Camera'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: maroonColor,
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _browseImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.image),
                                    label: const Text('Gallery'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: maroonColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: maroonColor.withOpacity(0.1),
                            backgroundImage: _img != null
                                ? FileImage(_img!)
                                : const AssetImage('assets/images/profile.png')
                                    as ImageProvider,
                            child: _img == null
                                ? const Icon(
                                    Icons.camera_alt,
                                    size: 40,
                                    color: Colors.black54,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      buildTextField(
                        controller: _fnameController,
                        labelText: 'First Name',
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                      _gap,
                      buildTextField(
                        controller: _lnameController,
                        labelText: 'Last Name',
                        icon: Icons.person_outline,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter last name';
                          }
                          return null;
                        },
                      ),
                      _gap,
                      buildTextField(
                        controller: _phoneController,
                        labelText: 'Phone Number',
                        icon: Icons.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                      ),
                      _gap,
                      buildTextField(
                        controller: _usernameController,
                        labelText: 'Username',
                        icon: Icons.account_circle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                      ),
                      _gap,
                      buildTextField(
                        controller: _passwordController,
                        labelText: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: maroonColor, // Maroon color
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            if (_key.currentState!.validate()) {
                              final registerState =
                                  context.read<RegisterBloc>().state;
                              final imageName = registerState.imageName;
                              print("image name : $imageName");
                              context.read<RegisterBloc>().add(RegisterStudent(
                                    context: context,
                                    fName: _fnameController.text,
                                    lName: _lnameController.text,
                                    image: path,
                                    username: _usernameController.text,
                                    phone: _phoneController.text,
                                    password: _passwordController.text,
                                  ));
                            }
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
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

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    String? Function(String?)? validator,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: maroonColor),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: maroonColor, width: 2),
        ),
      ),
      style: const TextStyle(color: Colors.black),
      validator: validator,
    );
  }
}
