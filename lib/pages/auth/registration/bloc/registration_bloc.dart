import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationState()) {
    on<CheckValidationEvent>((event, emit) {
      state.isValid = event.isValid;

      state.copyWith(
        isValid: event.isValid,
      );
    });
  }
}
