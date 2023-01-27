import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woodyversoar/app/views/home/home_view.dart';
import 'package:woodyversoar/app/views/login/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isLogged = false;

  _isLogged() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getString("API:token") != null) {
      setState(() {
        isLogged = true;
      });
    } else {
      setState(() {
        isLogged = false;
      });
    }
  }

  ///
  @override
  void initState() {
    super.initState();
    _isLogged();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/images/LogoWoodyverso.png"),
      logoWidth: 125,
      backgroundColor: Colors.black,
      navigator: isLogged ? const HomeView() : const LoginView(),
      durationInSeconds: 5,
    );
  }
}
