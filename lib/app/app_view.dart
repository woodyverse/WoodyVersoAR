import 'package:flutter/material.dart';
import 'package:woodyversoar/app/views/home/home_view.dart';
import 'package:woodyversoar/app/views/splash/splash_view.dart';

class WoodyversoARView extends StatelessWidget {
  const WoodyversoARView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Woodyverso AR",
      home: SplashView(),
    );
  }
}
