import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LogEvent>((event, emit) {
      emit(
        state.copyWith(isChecked: event.isChecked),
      );
    });

    on<ShowPassword>((event, emit) {
      emit(
        state.copyWith(showPassword: event.showPassword),
       
      );
      print(event.showPassword);
      
    });
  }
}
