import 'package:flutter/material.dart';
import 'package:woodyversoar/app/routes/termsofuse_route.dart';
import 'package:woodyversoar/app/views/qrreader/qrreader_view.dart';
import 'package:woodyversoar/app/widgets/appbar_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ///
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) TermsOfUseRoute().welcomeDialog(context);
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 229, 229),
      appBar: AppBarWidget(context, true, false),
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset("assets/images/ExampleOfUse.png"),
              ),
              IconButton(
                iconSize: 75,
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QRReaderView(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.keyboard_arrow_right_sharp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(25, 0, 0, 0),
                  spreadRadius: 5,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  const Expanded(
                    child: Text(
                      "Este é um aplicativo de realidade aumentada, para iniciar basta clicar no botão “Escanear imagem“ a seguir e apontar sua câmera para o cartão.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(178, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
