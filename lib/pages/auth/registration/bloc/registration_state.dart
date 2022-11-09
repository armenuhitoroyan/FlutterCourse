part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  bool isLoading;

  RegistrationState({
    this.isLoading = false,
  });

  RegistrationState copyWith({bool? isLoading}) {
    return RegistrationState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [isLoading];
}
