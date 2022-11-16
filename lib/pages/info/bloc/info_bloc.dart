import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(InfoState()) {
    on<InformationEvent>((event, emit) {
      emit(state.copyWith(address: event.address, pinCode: event.pinCode));

      event.address = TextEditingController();
      event.pinCode = TextEditingController();

      void enterQrInfo(InformationEvent event, Emitter<InfoState> emit) {
        emit(
          state.copyWith(address: event.address, pinCode: event.pinCode),
        );
      }
    });
  }
}
