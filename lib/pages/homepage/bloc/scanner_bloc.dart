import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc() : super(ScannerState()) {
    on<ScanEvent>(_selectDropdownItemEvent);
  }

  _selectDropdownItemEvent(ScanEvent event, Emitter<ScannerState> emit) async {
    String data = '';
    result() async => await FlutterBarcodeScanner.scanBarcode(
          '#000000',
          'Cansel',
          true,
          ScanMode.BARCODE,
        ).then((value) => () => data = value);
    emit(state.copyWith(data: event.data, scan: result));

    event.scan = result;

    emit(state.copyWith(data: event.data, scan: event.scan));

    // add(event.scan as ScannerEvent);
  }
}
