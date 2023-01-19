import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:woodyversoar/app/widgets/packagemanager_widget.dart';

class TermsOfUseRoute {
  void welcomeDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: const Center(
          child: Text(
            "Bem vindo!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                  text:
                      "Para utilizar o Woodyverso AR você precisa aceitar os nossos "),
              TextSpan(
                text: "termos e condições.",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).pop();
                    termsOfUse(context);
                  },
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 25, 255),
                ),
              ),
            ],
            style: const TextStyle(fontSize: 18),
          ),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Center(
            child: SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                ),
                child: const Text(
                  "ACEITAR",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void termsOfUse(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      builder: (BuildContext context) => Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Termos de uso",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  child: ScrollConfiguration(
                    behavior: CustomScroll(),
                    child: ListView(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text:
                                        "A sua privacidade é importante para nós. É política do WoodyversoAR respeitar a sua privacidade em relação a qualquer informação sua que possamos coletar no aplicativo WoodyversoAR que possuímos e operamos."),
                                TextSpan(
                                    text:
                                        "\nSolicitamos informações pessoais apenas quando realmente precisamos delas para lhe fornecer um serviço. Fazemo-lo por meios justos e legais, com o seu conhecimento e consentimento. Também informamos por que estamos coletando e como será usado."),
                                TextSpan(
                                    text:
                                        "\nApenas retemos as informações coletadas pelo tempo necessário para fornecer o serviço solicitado. Quando armazenamos dados, protegemos dentro de meios comercialmente aceitáveis ​​para evitar perdas e roubos, bem como acesso, divulgação, cópia, uso ou modificação não autorizados."),
                                TextSpan(
                                    text:
                                        "\nNão compartilhamos informações de identificação pessoal publicamente ou com terceiros, exceto quando exigido por lei."),
                                TextSpan(
                                    text:
                                        "\nO nosso aplicativo faz uso da câmera e do microfone do dispositivo para a leitura de códigos de realidade aumentada."),
                                TextSpan(
                                    text:
                                        "\nO nosso aplicativo pode ter links para sites externos que não são operados por nós. Esteja ciente de que não temos controle sobre o conteúdo e práticas desses sites e não podemos aceitar responsabilidade por suas respectivas políticas de privacidade."),
                                TextSpan(
                                    text:
                                        "\nVocê é livre para recusar a nossa solicitação de informações pessoais, entendendo que talvez não possamos fornecer alguns dos serviços desejados."),
                                TextSpan(
                                    text:
                                        "\nO uso continuado de nosso aplicativo será considerado como aceitação de nossas práticas em torno de privacidade e informações pessoais. Se você tiver alguma dúvida sobre como lidamos com dados do usuário e informações pessoais, entre em contacto connosco."),
                                TextSpan(
                                  text: "\nCompromisso do Usuário",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                    text:
                                        "\nO usuário se compromete a fazer uso adequado dos conteúdos e da informação que o WoodyversoAR oferece no aplicativo e com caráter enunciativo, mas não limitativo:"),
                                TextSpan(
                                    text:
                                        "\nA) Não se envolver em atividades que sejam ilegais ou contrárias à boa fé a à ordem pública;"),
                                TextSpan(
                                    text:
                                        "\nB) Não difundir propaganda ou conteúdo de natureza racista, xenofóbica, ERROR ou azar, qualquer tipo de pornografia ilegal, de apologia ao terrorismo ou contra os direitos humanos;"),
                                TextSpan(
                                    text:
                                        "\nC) Não causar danos aos sistemas físicos (hardwares) e lógicos (softwares) do WoodyversoAR, de seus fornecedores ou terceiros, para introduzir ou disseminar vírus informáticos ou quaisquer outros sistemas de hardware ou software que sejam capazes de causar danos anteriormente mencionados."),
                                TextSpan(
                                    text:
                                        "Esta política é efetiva a partir de "),
                                TextSpan(
                                  text: "20 November 2022 20:05",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
                      child: const Text(
                        "ACEITAR",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
