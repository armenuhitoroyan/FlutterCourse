part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  // TextEditingController usernameCtrl = TextEditingController();
  // TextEditingController passwordCtrl = TextEditingController();

  @override
  List<Object> get props => [];
}

class LogEvent extends LoginEvent {
  bool isChecked;
  
  LogEvent(this.isChecked);

}

class ShowPassword extends LoginEvent {
  bool showPassword;

  ShowPassword(this.showPassword);
}
