import 'package:flutter/material.dart';

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
  final TextEditingController _packageName = TextEditingController();

  int option = 0;
  List<String> itens = [
    "Pacote 1",
    "Pacote 2",
    "Pacote 3",
    "Pacote 4",
    "Pacote 5",
  ];

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
                        child: Icon(
                          Icons.remove_red_eye_outlined,
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
                        child: Icon(
                          Icons.add,
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
                    child: const Icon(
                      Icons.arrow_back_ios,
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
                                      setState(() {
                                        option = 3;
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      foregroundColor: Colors.grey,
                                    ),
                                    child: const Icon(
                                      Icons.mode_edit_outline_outlined,
                                      color: Colors.grey,
                                      size: 20,
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
                    child: const Icon(
                      Icons.arrow_back_ios,
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
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: SizedBox(
                          height: 35,
                          child: TextFormField(
                            controller: _packageName,
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
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              foregroundColor: Colors.grey,
                            ),
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.file_open_outlined,
                                  color: Colors.grey,
                                  size: 50,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                ),
                                Text(
                                  "arquivo.mp3",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              foregroundColor: Colors.grey,
                            ),
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.image_outlined,
                                  color: Colors.grey,
                                  size: 50,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                ),
                                Text(
                                  "arquivo.mp3",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
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
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Adicionar",
                            style: TextStyle(fontSize: 16),
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

  Widget EditPackage() {
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
                        option = 1;
                      });
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: Colors.grey,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Editar pacote",
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
              child: ScrollConfiguration(
                behavior: CustomScroll(),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: SizedBox(
                        height: 35,
                        child: TextFormField(
                          controller: _packageName,
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
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    const Icon(
                      Icons.file_open_outlined,
                      color: Colors.grey,
                      size: 50,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    const Text(
                      "arquivo.mp3",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Editar",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
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
      case 3:
        renderWidget = EditPackage();
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
