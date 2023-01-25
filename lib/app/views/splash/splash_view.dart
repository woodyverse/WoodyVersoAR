import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:woodyversoar/app/views/home/home_view.dart';
import 'package:woodyversoar/app/views/loginoptions/loginoptions_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  ///
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/images/LogoWoodyverso.png"),
      logoWidth: 125,
      backgroundColor: Colors.black,
      navigator: const LoginOptionsView(),
      durationInSeconds: 5,
    );
  }
}
