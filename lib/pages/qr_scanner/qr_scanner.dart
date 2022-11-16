// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  // final GlobalKey _globalKey = GlobalKey(debugLabel: 'QR');
  // QRViewController? controller;
  // Barcode? result;

  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.pauseCamera();
  //   }
  //   // else if (Platform.isIOS) {
  //   //   controller!.resumeCamera();
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child:  Text('')
            // QRView(
            //   key: _globalKey,
            //   onQRViewCreated: _onQRViewCreated,
            // ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: 
              // (result != null)
              //     ? Text(
              //         'Barcode Type: ${result!.format}   Data: ${result!.code}',
              //       )
              //     :
                   const Text('Scan a code'),
            ),
          ),
        ],
      ),
    );
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       result = scanData;
  //     });
  //   });
  // }

  @override
  void dispose() {
    // controller?.dispose();
    super.dispose();
  }
}
