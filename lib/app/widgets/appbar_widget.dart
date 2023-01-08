import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSizeWidget AppBarWidget() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(100),
    child: AppBar(
      flexibleSpace: SvgPicture.asset(
        "assets/svgs/LogoWoodyverso.svg",
        fit: BoxFit.fitHeight,
      ),
      toolbarHeight: 100,
      backgroundColor: Colors.black,
    ),
  );
}
