import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ranger/base/regexp.dart';

import '../../../config/str.dart';

part 'q_info_event.dart';
part 'q_info_state.dart';

class QrInfoBloc extends Bloc<QInfoEvent, QInfoValidState> with Texts {
  QrInfoBloc() : super(QInfoValidState()) {
    on<QInfoTextChangedEvent>(_onValidate);

    // on<QrInfoSubmittedEvent>(_onSubmitBtn);
    // on<ChangedAddressEvent>(_onValidateAddress);
    // on<ChangedpinEvent>(_onValidatePin);
  }

  _onValidate(QInfoTextChangedEvent event, Emitter<QInfoValidState> emit) {
    final regExpAdd = RegExp(RegularExpressions.address);
    final regExpPin = RegExp(RegularExpressions.pinCode);

    if (event.addressValue.isEmpty && event.pinCodeValue.isEmpty) {
      emit(
        QInfoValidState(
          isValid: false,
          errorMessage: super.errorMessage,
        ),
      );
    } 

    else if (event.addressValue.length != 13 ||
        (regExpAdd.hasMatch(event.addressValue) == false)) {
      emit(
        QInfoValidState(
          isValid: false,
          isValidAddress: true,
          errorAddress: super.emailErr,
        ),
      );
    }

    else if (event.pinCodeValue.length != 10 || 
      (regExpPin.hasMatch(event.pinCodeValue) == false)) {
      emit(
        QInfoValidState(
          isValid: false,
          isValidPinCode: true,
          errorPin: super.pinCodeError,
        ),
      );
    } 

    else {
      emit(
        QInfoValidState(
          isValid: true,
          errorMessage: '',
        ),
      );
    }
  }

  // _onValidateAddress(ChangedAddressEvent event, Emitter<QInfoValidState> emit) {
  //   final regExpAdd = RegExp(RegularExpressions.address);

  //   if (regExpAdd.hasMatch(event.addressValue) == false ||
  //       event.addressValue.length != 13) {
  //     emit(
  //       QInfoValidState(
  //         isValid: false,
  //         errorMessage: super.emailErr,
  //       ),
  //     );
  //   } 
  // }

  // _onValidatePin(ChangedpinEvent event, Emitter<QInfoValidState> emit) {
  //   final regExpPin = RegExp(RegularExpressions.address);

  //   if (regExpPin.hasMatch(event.pinCodeValue) == false ||
  //       event.pinCodeValue.length != 10) {
  //     emit(
  //       QInfoValidState(
  //         isValid: false,
  //         errorMessage: super.emailErr,
  //       ),
  //     );
  //   }
  // }
}
