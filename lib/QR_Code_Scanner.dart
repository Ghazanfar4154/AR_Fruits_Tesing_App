import 'package:ar_fruits_app/ArView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'AR/Durian.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {

  void scanQR()async{
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666",
          "Cancel",
          true,
          ScanMode.QR);
      if(!mounted)
        return;
      else{
        setState(() {
          Durian durian =findDurianByName(qrCode.toString())!;
          print("********************");
          print(durian.name);
          ArFruitScreen arFruitScreen = ArFruitScreen();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
            return arFruitScreen;
          }));
        });
      }
    }on PlatformException{
       " Failed to read QR code";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scanQR();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// SizedBox(height: 38,),
// Text("$qrResult",style: TextStyle(color: Colors.black),),
// SizedBox(height: 38,),
// ElevatedButton(
// onPressed: scanQR,
// child: Text("ScanQR"))
// ],
// ),
// )