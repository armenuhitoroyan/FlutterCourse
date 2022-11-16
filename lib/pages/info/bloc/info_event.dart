part of 'info_bloc.dart';


abstract class InfoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InformationEvent extends InfoEvent {
  TextEditingController address;
  TextEditingController pinCode;

  InformationEvent(
    this.address,
    this.pinCode,
  );

  @override
  List<Object> get props => [];
}
