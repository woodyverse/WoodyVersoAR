import 'package:flutter/material.dart';
import 'package:woodyversoar/app/views/home/home_view.dart';

class WoodyversoARView extends StatelessWidget {
  const WoodyversoARView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Woodyverso AR",
      //Check theme
      home: HomeView(),
    );
  }
}
