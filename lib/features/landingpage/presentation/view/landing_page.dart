import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedplan/app/di/di.dart';
import 'package:wedplan/features/auth/presentation/view/login_page.dart';
import 'package:wedplan/features/auth/presentation/view_model/login/login_bloc.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController = PageController();
  final List<String> imagePaths = [
    'assets/images/wed1.jpeg',
    'assets/images/wed3.jpeg',
    'assets/images/wed4.jpeg',
    'assets/images/wed2.avif',
  ];
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('WedPlan'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          // PageView for sliding images
          SizedBox(
            height: 200.0,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: imagePaths.map((path) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(path),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Dots indicator
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imagePaths.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                height: 8.0,
                width: _currentIndex == index ? 16.0 : 8.0,
                decoration: BoxDecoration(
                  color:
                      _currentIndex == index ? theme.primaryColor : Colors.grey,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              );
            }),
          ),
          // Text sections
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Plan Your Perfect Day with WedPlan',
              textAlign: TextAlign.center,
              style: theme.textTheme.displayLarge,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Discover the best venues, photographers, and services to make your wedding unforgettable.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
          ),
          // Get Started Button
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider<LoginBloc>(
                        create: (context) => LoginBloc(
                            registerBloc: getIt(),
                            homeCubit: getIt(),
                            loginUseCase: getIt()),
                      ),
                      // Add other BLoCs here if needed
                    ],
                    child: const LoginPage(),
                  ),
                ),
              );
            },
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}
