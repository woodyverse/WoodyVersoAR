import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woodyversoar/app/controllers/login_controller.dart';
import 'package:woodyversoar/app/controllers/profile_controller.dart';
import 'package:woodyversoar/app/models/profile_model.dart';
import 'package:woodyversoar/app/updates/profile_update.dart';
import 'package:woodyversoar/app/widgets/packagemanager_widget.dart';

import '../../widgets/appbar_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool awaitRequest = false;

  ///
  PostInfoUserUpdate? postInfoUserUpdate;
  _postInfoUser() async {
    setState(() {
      awaitRequest = true;
    });

    SharedPreferences _prefs = await SharedPreferences.getInstance();

    String? id = _prefs.getString("API:id");

    if (id != null) {
      await ProfileController()
          .postInfoUser(PostInfoUserModel(id))
          .then((value) {
        setState(() {
          postInfoUserUpdate = value;
          _email.text = postInfoUserUpdate?.email ?? "";
        });
      });
    } else {
      String errorMensage =
          "Erro ao pegar dados do perfil! Contate um adminstrador.";

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            errorMensage,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      );
    }
    setState(() {
      awaitRequest = false;
    });
  }

  ///
  @override
  void initState() {
    super.initState();
    _postInfoUser();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWidget(context, false, true),
      body: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: !awaitRequest
            ? ScrollConfiguration(
                behavior: CustomScroll(),
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              LoginController().deleteLogin(context);
                            },
                            child: const Text("LOGOUT"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${postInfoUserUpdate?.nome}",
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    foregroundColor: Colors.grey,
                                  ),
                                  child: const FaIcon(
                                    FontAwesomeIcons.pencil,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 25,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: Stack(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    children: [
                                      const SizedBox(
                                        width: 115,
                                        height: 115,
                                        child: CircleAvatar(
                                          backgroundColor: Color.fromARGB(
                                              255, 232, 232, 232),
                                          child: FaIcon(
                                            FontAwesomeIcons.userAstronaut,
                                            color: Color.fromARGB(
                                                255, 174, 174, 174),
                                            size: 50,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            shape: const CircleBorder(),
                                            backgroundColor: Colors.white,
                                            shadowColor: const Color.fromARGB(
                                                25, 0, 0, 0),
                                          ),
                                          child: const Center(
                                            child: FaIcon(
                                              FontAwesomeIcons.pencil,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(4),
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: TextFormField(
                                        controller: _email,
                                        textAlign: TextAlign.start,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(5),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 0.5,
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          suffixIcon: TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              foregroundColor: Colors.grey,
                                            ),
                                            child: const FaIcon(
                                              FontAwesomeIcons.pencil,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Digite o email";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Senha",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(4),
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: TextFormField(
                                        controller: _password,
                                        textAlign: TextAlign.start,
                                        obscureText: true,
                                        obscuringCharacter: "*",
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(5),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 0.5,
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 1,
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          suffixIcon: TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              foregroundColor: Colors.grey,
                                            ),
                                            child: const FaIcon(
                                              FontAwesomeIcons.pencil,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Digite o senha";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: PackageManagerWidget(),
                    ),
                  ],
                ),
              )
            : const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              ),
      ),
    );
  }
}
