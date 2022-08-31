
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';
import 'package:plantsshop/screens/scan.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  MobileScannerController cameraController = MobileScannerController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            MobileScanner(
                allowDuplicates: false,
                controller: cameraController,
                onDetect: (barcode, args) {
                  if (barcode.rawValue == null) {
                    debugPrint('Failed to scan Barcode');
                  } else {
                    final String code = barcode.rawValue!;
                    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                    debugPrint('Barcode found! $code');

                  }
                }),


         //   QRScannerOverlay(overlayColour: Colors.black.withOpacity(.1),),


          ],

        ));
  }
}

