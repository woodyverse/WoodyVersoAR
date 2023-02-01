import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:woodyversoar/app/controllers/packagemanager_controller.dart';
import 'package:woodyversoar/app/models/packagemanager_model.dart';
import 'package:woodyversoar/app/routes/initalert_route.dart';

class PackageManagerWidget extends StatefulWidget {
  const PackageManagerWidget({super.key});

  @override
  State<PackageManagerWidget> createState() => _PackageManagerWidgetState();
}

class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class _PackageManagerWidgetState extends State<PackageManagerWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _packageCode = TextEditingController();

  bool awaitRequest = false;

  ///
  int option = 0;
  List<String> itens = [
    "Pacote 1",
    "Pacote 2",
    "Pacote 3",
    "Pacote 4",
    "Pacote 5",
  ];

  ///
  deletePackage(
    BuildContext context,
    String packageName,
  ) async {
    InitAlert().confirmDeletePackage(
      context,
      packageName,
    );
  }

  ///
  _postWoodyversoArPacks() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        awaitRequest = true;
      });

      String packageCode = _packageCode.text;

      await PackageManagerController()
          .postWoodyversoArPacks(PostWoodyversoArPacksModel(packageCode))
          .then((value) {
        if (value!.listPacks!.isNotEmpty) {
          setState(() {
            awaitRequest = false;
          });
        } else {
          setState(() {
            awaitRequest = false;
          });
          InitAlert().invalidPackageCode(context);
        }
      });
    }
  }

  ///
  Widget SelectOption() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 25,
      ),
      child: Column(
        children: [
          const Text(
            "Pacotes",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          option = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                        shadowColor: const Color.fromARGB(127, 0, 0, 0),
                      ),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.eye,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  const Text(
                    "Editar/ver pacotes",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          option = 2;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                        shadowColor: const Color.fromARGB(127, 0, 0, 0),
                      ),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.plus,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  const Text(
                    "Adicionar pacote",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget ListPackage() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        option = 0;
                      });
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: Colors.grey,
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Pacotes",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(5),
          ),
          SizedBox(
            height: 175,
            width: 250,
            child: Scrollbar(
              thickness: 5,
              radius: const Radius.circular(25),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ScrollConfiguration(
                  behavior: CustomScroll(),
                  child: ListView(
                    children: [
                      for (String valueX in itens)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  valueX,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: TextButton(
                                    onPressed: () {
                                      deletePackage(context, "teste-teste");
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      foregroundColor: Colors.grey,
                                    ),
                                    child: const FaIcon(
                                      FontAwesomeIcons.trashCan,
                                      color: Colors.grey,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            const Padding(
                              padding: EdgeInsets.all(5),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget AddPackage() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        option = 0;
                      });
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: Colors.grey,
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Adicionar pacote",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(5),
          ),
          SizedBox(
            height: 175,
            width: 250,
            child: Scrollbar(
              thickness: 5,
              radius: const Radius.circular(25),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ScrollConfiguration(
                  behavior: CustomScroll(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Column(
                        children: [
                          const Text(
                            "Insira o código do pacote",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(4),
                          ),
                          Form(
                            key: _formKey,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: TextFormField(
                                controller: _packageCode,
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.text,
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 0.5,
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Digite um código';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: ElevatedButton(
                          onPressed: () {
                            _postWoodyversoArPacks();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
                          child: !awaitRequest
                              ? const Text(
                                  "Adicionar",
                                  style: TextStyle(fontSize: 16),
                                )
                              : const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ///
  @override
  Widget build(BuildContext context) {
    Widget renderWidget = SelectOption();

    switch (option) {
      case 0:
        renderWidget = SelectOption();
        break;
      case 1:
        renderWidget = ListPackage();
        break;
      case 2:
        renderWidget = AddPackage();
        break;
      default:
        renderWidget = SelectOption();
        break;
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(25, 0, 0, 0),
            offset: Offset(0, 5),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: renderWidget,
    );
  }
}
