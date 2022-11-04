part of 'login_bloc.dart';

class LoginState extends Equatable {
  bool isChecked;
  bool showPassword;
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  LoginState({
    this.isChecked = false,
    this.showPassword = false,
  });

  LoginState copyWith({bool? isChecked, bool? showPassword}) {
    return LoginState(
      isChecked: isChecked ?? this.isChecked,
      showPassword: showPassword ?? this.showPassword);
  }
  
  @override
  List<Object> get props => [
    isChecked,
    showPassword,   
  ];
}
