part of 'scanner_bloc.dart';

class ScannerState extends Equatable {
  String data;
  
  ScannerState({ this.data = '',});

  ScannerState copyWith({String? data, Function? scan}) {
    return ScannerState(
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => [data];
}
