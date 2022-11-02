part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LogEvent extends LoginEvent {
  bool isChecked = false;
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  // LogEvent(this.isChecked);

  @override
  List<Object> get props => [];
}
