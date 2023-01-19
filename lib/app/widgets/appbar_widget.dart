import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woodyversoar/app/views/home/home_view.dart';
import 'package:woodyversoar/app/views/profile/profile_view.dart';

PreferredSizeWidget AppBarWidget(
    BuildContext context, bool inHome, bool inProfile) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(100),
    child: AppBar(
      flexibleSpace: SvgPicture.asset(
        "assets/svgs/LogoWoodyverso.svg",
        fit: BoxFit.fitHeight,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: !inHome,
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomeView();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                      shadowColor: const Color.fromARGB(25, 0, 0, 0),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.question_mark,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !inHome && !inProfile,
                child: const Padding(
                  padding: EdgeInsets.all(5),
                ),
              ),
              Visibility(
                visible: !inProfile,
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ProfileView();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                      shadowColor: const Color.fromARGB(25, 0, 0, 0),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
      toolbarHeight: 100,
      backgroundColor: Colors.black,
    ),
  );
}
