part of 'q_info_bloc.dart';

abstract class QrInfoEvent extends Equatable {
  const QrInfoEvent();

  @override
  List<Object> get props => [];
}

class QrInfoTextChangedEvent extends QrInfoEvent {
  final String addressValue;
  final String pinCodeValue;

  QrInfoTextChangedEvent(this.addressValue, this.pinCodeValue);
}

class QrInfoSubmittedEvent extends QrInfoEvent {
  final String address;
  final String pinCode;

  QrInfoSubmittedEvent(this.address, this.pinCode);
}
