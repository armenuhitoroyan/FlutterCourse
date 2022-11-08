part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  bool isValid;

  RegistrationState({
    this.isValid = false,
  });

  RegistrationState copyWith({bool? isValid}) {
    return RegistrationState(
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [
    isValid
  ];
}
