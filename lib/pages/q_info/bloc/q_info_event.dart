part of 'q_info_bloc.dart';

abstract class QInfoEvent extends Equatable {
  const QInfoEvent();

  @override
  List<Object> get props => [];
}

class QInfoTextChangedEvent extends QInfoEvent {
  final String addressValue;
  final String pinCodeValue;

  QInfoTextChangedEvent(this.addressValue, this.pinCodeValue);
}

