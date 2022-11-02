import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  bool isChecked = false;
  
  LoginBloc() : super(LoginS(false)) {
    on<LogEvent>((event, emit) {
      isChecked = event.isChecked;
      if (isChecked) {
        emit(LoginS(!isChecked));
      }
    });
  }
}
