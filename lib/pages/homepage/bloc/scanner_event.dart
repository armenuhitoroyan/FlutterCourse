part of 'scanner_bloc.dart';

abstract class ScannerEvent extends Equatable {
  const ScannerEvent();

  @override
  List<Object> get props => [];
}

class ScanEvent extends ScannerEvent {
  Function scan;
  String data;

  ScanEvent(
    this.scan,
    this.data
  );
}
