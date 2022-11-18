part of 'q_info_bloc.dart';

abstract class QrInfoState extends Equatable {
  const QrInfoState();

  @override
  List<Object> get props => [];
}

class QrIcfoInitial extends QrInfoState {}

class QrInfoValidState extends QrInfoState {}

class QrInfoErrorState extends QrInfoState {
  final String errorMessage;
  QrInfoErrorState(this.errorMessage);
}

class QrInfoLoadingState extends QrInfoState {}
