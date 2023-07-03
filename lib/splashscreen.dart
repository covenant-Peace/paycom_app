
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paycom_app/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  void _navigateHome() async {
    await Future.delayed(const Duration(milliseconds: 4500), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SignUp(),
          ),
      );
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF176b87),
      body: Center(
        child: AnimatedSize(
          duration: const Duration(milliseconds: 4000),
          curve: Curves.bounceOut,
          child: SvgPicture.asset('assets/home.svg'),
        ),
      ),
    );
  }
}
