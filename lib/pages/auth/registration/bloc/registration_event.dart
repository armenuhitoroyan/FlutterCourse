part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class CheckValidationEvent extends RegistrationEvent {
  bool isValid = true;

  CheckValidationEvent(this.isValid);
}
