import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ranger/base/regexp.dart';

part 'q_info_event.dart';
part 'q_info_state.dart';

class QrInfoBloc extends Bloc<QrInfoEvent, QrInfoState> {
  QrInfoBloc() : super(QrIcfoInitial()) {
    on<QrInfoTextChangedEvent>(_onValidate);

    on<QrInfoSubmittedEvent>(_onSubmitBtn);
  }

  _onValidate(QrInfoTextChangedEvent event, Emitter<QrInfoState> emit) {
    final regExpAdd = RegExp(RegularExpressions.address);
    final regExpPin = RegExp(RegularExpressions.pinCode);

    if (event.addressValue.isEmpty && event.pinCodeValue.isEmpty) {
      emit(QrInfoErrorState('Field must not be empty'));
    }
    //  else {
    else if (regExpAdd.hasMatch(event.addressValue) == false ||
      event.addressValue.length < 13) {
      emit(QrInfoErrorState('Please enter a valid address'));
    }
    else if (regExpPin.hasMatch(event.pinCodeValue) == false ||
      event.pinCodeValue.length < 10) {
      emit(QrInfoErrorState('Please enter a valid pin code'));
    } 
    else {
      emit(QrInfoValidState());
    }
      
    // }
  }

  _onSubmitBtn(QrInfoSubmittedEvent event, Emitter<QrInfoState> emit) {
    emit(QrInfoLoadingState());
  }
}
