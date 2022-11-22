part of 'scanner_bloc.dart';

class ScannerState extends Equatable {
  String data;
  Function? scan;
  ScannerState({this.data = '', this.scan});

  ScannerState copyWith({String? data, Function? scan}) {
    return ScannerState(
      data: data ?? this.data,
      scan: scan ?? this.scan
    );
  }

  @override
  List<Object> get props => [data];
}
