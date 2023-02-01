import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InitAlert {
  formatNotAcceptedError(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        icon: const Center(
          child: FaIcon(
            FontAwesomeIcons.solidTimesCircle,
            color: Colors.redAccent,
            size: 75,
          ),
        ),
        title: const Text(
          "Formato não aceito!",
          style: TextStyle(
            fontSize: 24,
            color: Colors.redAccent,
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: const [
              Text(
                "Adicionar um arquivo de áudio, imagem, video ou 3D nos formatos:",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                ),
              ),
              Text(
                "MP3, JPG/JPEG, MP4, GLTF, GLB, GLB.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          SizedBox(
            width: 100,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.redAccent,
                side: const BorderSide(
                  width: 2,
                  color: Colors.redAccent,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
              child: const Text(
                "OK",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  confirmDeletePackage(
    BuildContext context,
    String packageName,
  ) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        icon: const Center(
          child: FaIcon(
            FontAwesomeIcons.trashCan,
            color: Colors.black,
            size: 75,
          ),
        ),
        title: const Text(
          "Deseja excluir o pacote?",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Text(
                'Tem certeza que quer excluir o pacote "${packageName}"? Esta ação não pode ser desfeita.',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          SizedBox(
            width: 100,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: const BorderSide(
                  width: 2,
                  color: Colors.black,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
              child: const Text(
                "Não",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                side: const BorderSide(
                  width: 2,
                  color: Colors.black,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
              child: const Text(
                "Excluir",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  invalidPackageCode(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        icon: const Center(
          child: FaIcon(
            FontAwesomeIcons.solidTimesCircle,
            color: Colors.redAccent,
            size: 75,
          ),
        ),
        title: const Text(
          "CÓDIGO INVÁLIDO",
          style: TextStyle(
            fontSize: 24,
            color: Colors.redAccent,
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: const [
              Text(
                "Insira novamente o código",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          SizedBox(
            width: 100,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.redAccent,
                side: const BorderSide(
                  width: 2,
                  color: Colors.redAccent,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
              child: const Text(
                "OK",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
