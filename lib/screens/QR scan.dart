
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/screens/scan.dart';
import 'package:plantsshop/shared/endpoints.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  MobileScannerController cameraController = MobileScannerController();

  @override

  Widget build(BuildContext context) {

    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
    listener: (context, state) {},
    builder: (context, state) {
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
                      plantidqr = code;
                     // ShopLoginCubit.get(context).showproductidinfo(token: TOKEN, id: plantidqr);
                      ShopLoginCubit.get(context).showproductidinfo(token: TOKEN, id: 'f985a224-ee41-411e-9327-dfb9822544ab');

                      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                      print(plantidqr);
                      debugPrint('Barcode found! $code');
                      Fluttertoast.showToast(
                        msg: 'Barcode found!',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  }),


              //   QRScannerOverlay(overlayColour: Colors.black.withOpacity(.1),),


            ],

          ));
    }
    );
    }
  }