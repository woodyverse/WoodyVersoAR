import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      appBar: AppBarWidget(context, false, false),
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
                  Visibility(
                    visible: res == null,
                    child: const Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          "Aponte seu celular para um código QR",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: res != null,
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "${res?.code}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      res = null;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    backgroundColor: Colors.red,
                                    shadowColor:
                                        const Color.fromARGB(25, 0, 0, 0),
                                  ),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.times,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
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
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    backgroundColor: Colors.green,
                                    shadowColor:
                                        const Color.fromARGB(25, 0, 0, 0),
                                  ),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.check,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4),
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
                            shadowColor: const Color.fromARGB(25, 0, 0, 0),
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
