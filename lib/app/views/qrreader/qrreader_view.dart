import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:woodyversoar/app/views/arreader/arreader_view.dart';
import 'package:woodyversoar/app/widgets/appbar_widget.dart';

class QRReaderView extends StatefulWidget {
  const QRReaderView({super.key});

  @override
  State<QRReaderView> createState() => _QRReaderViewState();
}

class _QRReaderViewState extends State<QRReaderView> {
  Barcode? res;
  QRViewController? qRController;
  final GlobalKey qRKey = GlobalKey(debugLabel: 'QR');
  bool flashStatus = false;

  ///
  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      qRController = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        res = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    print('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  ///
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qRController!.pauseCamera();
    }
    qRController!.resumeCamera();
  }

  @override
  void dispose() {
    qRController?.dispose();
    super.dispose();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: QRView(
                    key: qRKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderColor: Colors.white,
                      borderRadius: 5,
                      borderLength: 50,
                      borderWidth: 10,
                    ),
                    onPermissionSet: (ctrl, p) =>
                        _onPermissionSet(context, ctrl, p),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      if (res?.code != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ARReaderView(
                                aRCodeURL: res!.code!,
                              );
                            },
                          ),
                        );
                      }
                    },
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          res != null
                              ? "${res!.code}"
                              : "Aponte seu celular para um código QR",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () async {
                            await qRController?.toggleFlash();
                            bool? resFlashStatus =
                                await qRController?.getFlashStatus();
                            setState(() {
                              flashStatus = resFlashStatus ?? false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            shadowColor: const Color.fromARGB(51, 0, 0, 0),
                          ),
                          child: Center(
                            child: FutureBuilder(
                              future: qRController?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return flashStatus
                                    ? const Icon(
                                        Icons.flash_on,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.flash_off,
                                        color: Colors.black,
                                      );
                              },
                            ),
                          ),
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
    );
  }
}
