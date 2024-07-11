import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'AR/Durian.dart';
import 'Quiz/Home_Page.dart';

class ArFruitScreen extends StatefulWidget {
  ArFruitScreen({Key? key}) : super(key: key);

  @override
  State<ArFruitScreen> createState() => _ArFruitScreenState();
}

class _ArFruitScreenState extends State<ArFruitScreen> {
  final Durian durian = Durian(
    name: "Musang King",
    code: "D197",
    dateOfRegistration: "9 December 1993",
    origin: "Wee Chong Beng, Tanah Merah, Kelantan",
    flavor: "Sweet yet bitter yet creamy and it melts in your mouth",
    imagePath: "assets/images/fruits/musang_king.webp", // Example image path
  );

  late ArCoreController arCoreController;

  @override
  void dispose() {
    // Remove AR nodes when disposing the screen
    // arCoreController.removeNode(nodeName: "durian_cube");
    // arCoreController.removeNode(nodeName: "details_cube");
    // arCoreController.dispose();
    super.dispose();
  }

  void onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    _addFruits(arCoreController);
    setState(() {

    });
  }

  Future<void> _addFruits(ArCoreController controller) async {
    try {
      final ByteData textureBytes =
      await rootBundle.load(durian.imagePath);
      final texture = ArCoreMaterial(
        textureBytes: textureBytes.buffer.asUint8List(),
        color: Colors.transparent,
      );

      final cube = ArCoreCube(
        materials: [texture],
        size: vector64.Vector3(0.3, 0.3, 0.3),
      );

      final node = ArCoreNode(
        shape: cube,
        position: vector64.Vector3(0, 0, -1.5),
        name: "durian_cube",
      );

      controller.addArCoreNode(node);

      await _addDetailsCube(controller);
    } catch (e) {
      print('Error loading texture: $e');
    }
  }

  Future<void> _addDetailsCube(ArCoreController controller) async {
    final detailsText = "Name: ${durian.name}\n"
        "Code: ${durian.code}\n"
        "Date: ${durian.dateOfRegistration}\n"
        "Origin: ${durian.origin}\n"
        "Flavor: ${durian.flavor}";

    final imageBytes = await _createTextImage(detailsText);
    final texture = ArCoreMaterial(
      color: Colors.transparent,
      textureBytes: imageBytes,
    );

    final cube = ArCoreCube(
      materials: [texture, texture, texture, texture, texture, texture],
      size: vector64.Vector3(0.5, 0.4, 0.01),
    );

    final node = ArCoreNode(
      shape: cube,
      position: vector64.Vector3(0, -0.4, -1.5),
      name: "details_cube",
    );

    controller.addArCoreNode(node);
    
  }
  
  Future<Uint8List> _createTextImage(String text) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(fontSize: 40, color: Colors.black),
      ),
      textDirection: TextDirection.ltr,
    );

    painter.layout();
    painter.paint(canvas, Offset.zero);

    final picture = recorder.endRecording();
    final img = await picture.toImage(painter.width.toInt(), painter.height.toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AR Fruits"),
          leading: IconButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (_){
                    dispose();
                    return HomePage();
                  }));
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: PopScope(
          onPopInvoked: (value) async {
            // Ensure dispose is called when navigating back
            dispose();
          },
          canPop: true,
          child: ArCoreView(
            onArCoreViewCreated: (value){
              onArCoreViewCreated(value);
            },
          ),
        ),
    );
  }
}


// void _addFruit(ArCoreController controller) async {
//   try {
//     // Load the image
//     final ByteData imageData = await rootBundle.load('assets/images/durian_blackthorn.png');
//     final Uint8List bytes = imageData.buffer.asUint8List();
//     final ArCoreImage image = ArCoreImage(bytes: bytes, width: 100, height: 100); // Adjust width and height if needed
//
//     // Create a node with the image
//     final ArCoreNode node = ArCoreNode(
//       image: image,
//       position: vector64.Vector3(0, 0, -1.5),
//       name: 'fruit_image',
//         scale: vector64.Vector3.all(0.5)
//     );
//
//     // Add the node to the AR scene
//     controller.addArCoreNode(node);
//     print('Node added successfully: $node');
//   } catch (e) {
//     print('Error loading image or creating node: $e');
//   }
// }