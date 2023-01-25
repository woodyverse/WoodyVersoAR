import 'package:flutter/material.dart';

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
        icon: const Icon(
          Icons.cancel,
          color: Colors.redAccent,
          size: 150,
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
}
