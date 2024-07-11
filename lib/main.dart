import 'package:ar_fruits_app/ArView.dart';
import 'package:ar_fruits_app/Game/Game_GUI.dart';
import 'package:ar_fruits_app/QR_Code_Scanner.dart';
import 'package:ar_fruits_app/Quiz/Home_Page.dart';
import 'package:ar_fruits_app/Quiz/Quiz_GUI.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

// MaterialApp(
// home: Scaffold(
// appBar: AppBar(title: Text("Qr Code Scanner"),),
// body: QrCodeScanner(),),
// )

class HelloWorld extends StatefulWidget {
  @override
  _HelloWorldState createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  ArCoreController arCoreController = ArCoreController(
      id: 1
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Argument reality app'),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;

    _addSphere(arCoreController);
    _addCylinder(arCoreController);
    _addCube(arCoreController);
  }

  void _addSphere(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.black,
    );
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.1,
    );
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);
  }

  void _addCylinder(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.red,
      reflectance: 1.0,
    );
    final cylinder = ArCoreCylinder(
      materials: [material],
      radius: 0.5,
      height: 0.3,
    );
    final node = ArCoreNode(
      shape: cylinder,
      position: vector.Vector3(0.0, -0.5, -2.0),
    );
    controller.addArCoreNode(node);
  }

  void _addCube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.5, 0.5, 0.5),
    );
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(-0.5, 0.5, -3.5),
    );

    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
