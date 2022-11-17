import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MobScan extends StatefulWidget {
  MobScan({super.key});

  @override
  State<MobScan> createState() => _MobScanState();
}

class _MobScanState extends State<MobScan> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: MobileScanner(
        allowDuplicates: false,
        controller: cameraController,
        onDetect: _foundBarcode
      ),
    );
  }

  void _foundBarcode(Barcode barcode, MobileScannerArguments? arguments) {
    /// open screen
    if (!_screenOpened) {
      final String code = barcode.rawValue ?? '...';
      debugPrint('Barcode found $code');
      _screenOpened = true;
      Navigator.push(context, MaterialPageRoute(builder: (context) => 
        BrCScanner(value: code, screenClosed: _screenMasClosed)));
    }
  }

  void _screenMasClosed() {
    _screenOpened = false;
  }
}

class BrCScanner extends StatefulWidget {
  final String value;
  final Function screenClosed;

  const BrCScanner(
      {super.key, required this.value, required this.screenClosed});

  @override
  State<BrCScanner> createState() => _BrCScannerState();
}

class _BrCScannerState extends State<BrCScanner> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Column(
              children: [
                const Text(
                  'Scanned code:',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.value,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          )),
    );
  }
}
