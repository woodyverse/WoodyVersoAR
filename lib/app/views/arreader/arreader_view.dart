import 'dart:io';
import 'dart:math';

import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:woodyversoar/app/widgets/appbar_widget.dart';
import 'package:vector_math/vector_math_64.dart' as vectorMath;

class ARReaderView extends StatefulWidget {
  final String aRCodeURL;
  const ARReaderView({
    super.key,
    required this.aRCodeURL,
  });

  @override
  State<ARReaderView> createState() => _ARReaderViewState();
}

class _ARReaderViewState extends State<ARReaderView> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  HttpClient? httpClient;
  ARNode? localObjectNode;
  ARNode? webObjectNode;

  ///
  onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;

    this.arSessionManager!.onInitialize(
          customPlaneTexturePath: "assets/images/ImagemDeTeste.png",
          showAnimatedGuide: false,
          showPlanes: false,
          handleTaps: true,
          handlePans: true,
          handleRotation: true,
        );
    this.arObjectManager!.onInitialize();
  }

  ///
  Future<void> onWebObjectAtOriginButtonPressed() async {
    if (webObjectNode != null) {
      arObjectManager!.removeNode(webObjectNode!);
      webObjectNode = null;
    } else {
      var newNode = ARNode(
        type: NodeType.webGLB,
        uri:
            "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb",
        scale: vectorMath.Vector3(0.05, 0.05, 0.05),
      );
      bool? didAddWebNode = await arObjectManager!.addNode(newNode);
      webObjectNode = (didAddWebNode!) ? newNode : null;
    }
  }

  ///
  @override
  void dispose() {
    super.dispose();
    arSessionManager!.dispose();
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
            ARView(
              onARViewCreated: onARViewCreated,
              planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: onWebObjectAtOriginButtonPressed,
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            shadowColor: const Color.fromARGB(51, 0, 0, 0),
                          ),
                          child: const Center(
                            child: Text(
                              "...",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
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
