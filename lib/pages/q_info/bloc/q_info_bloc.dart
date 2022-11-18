import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ranger/base/regexp.dart';

part 'q_info_event.dart';
part 'q_info_state.dart';

class QrInfoBloc extends Bloc<QInfoEvent, QInfoValidState> {
  QrInfoBloc() : super(QInfoValidState()) {
    on<QInfoTextChangedEvent>(_onValidate);

    // on<QrInfoSubmittedEvent>(_onSubmitBtn);
  }

  _onValidate(QInfoTextChangedEvent event, Emitter<QInfoValidState> emit) {
    final regExpAdd = RegExp(RegularExpressions.address);
    final regExpPin = RegExp(RegularExpressions.pinCode);

    if (event.addressValue.isEmpty && event.pinCodeValue.isEmpty) {
      emit(
        QInfoValidState(
            isValid: false,
            errorMessage: 'Field must not be empty',
            errorEmail: '',
            errorPin: ''),
      );
    } else {
      emit(
        QInfoValidState(
            isValid: true, errorMessage: '', errorEmail: '', errorPin: ''),
      );
    }

    if (regExpAdd.hasMatch(event.addressValue) == false ||
        event.addressValue.length != 13) {
      emit(
        QInfoValidState(
            isValid: false,
            errorMessage: '',
            errorEmail: 'Please enter a valid address',
            errorPin: ''),
      );
    }
    if (regExpPin.hasMatch(event.pinCodeValue) == false ||
        event.pinCodeValue.length != 10) {
      emit(
        QInfoValidState(
            isValid: false,
            errorMessage: '',
            errorEmail: '',
            errorPin: 'Please enter a valid pin code'),
      );
    }
  }
}
