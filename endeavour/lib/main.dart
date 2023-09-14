import 'package:endeavour/Screens/Login.dart';
import 'package:endeavour/Screens/Register.dart';
import 'package:endeavour/Screens/SplashScreen.dart';
import 'package:endeavour/Screens/createtask.dart';
import 'package:endeavour/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(
    const MainConnect(),
  );
}

class MainConnect extends StatelessWidget {
  const MainConnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splashscreen',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageTransition(
              duration: const Duration(milliseconds: 250),
              child: const LoginScreen(),
              type: PageTransitionType.bottomToTop,
            );
          case '/register':
            return PageTransition(
              duration: const Duration(milliseconds: 250),
              child: const Register(),
              type: PageTransitionType.bottomToTop,
            );
          case '/splashscreen':
            return PageTransition(
              duration: const Duration(milliseconds: 250),
              child: const SplashScreen(),
              type: PageTransitionType.bottomToTop,
            );
          case '/homescreen':
            return PageTransition(
              duration: const Duration(milliseconds: 250),
              child: const HomeScreen(),
              type: PageTransitionType.bottomToTop,
            );
          case '/createtask':
            return PageTransition(
              duration: const Duration(milliseconds: 250),
              child: const CreateTask(),
              type: PageTransitionType.bottomToTop,
            );
        }
        return null;
      },
      title: 'Endeavour',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 252, 143, 128),
          brightness: Brightness.dark,
          surface: Colors.white,
        ),
      ),
    );
  }
}
