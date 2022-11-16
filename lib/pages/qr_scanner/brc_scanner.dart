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
      appBar: AppBar(
        title: const Text('Mobile Scanner!'),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state as CameraFacing) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mobile Scanner'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              widget.screenClosed();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
          ),
        ));
  }
}
