import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedplan/app/di/di.dart';
import 'package:wedplan/app_theme/theme.dart';
import 'package:wedplan/features/auth/presentation/view/register_page.dart';
import 'package:wedplan/features/auth/presentation/view_model/register/register_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: BlocProvider.value(
        value: getIt<RegisterBloc>(),
        child: const RegisterPage(),
      ),
    );
  }
}
