import 'package:exam_at/base/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/buttons/button.dart';
import '../../../widgets/buttons/text_button.dart';
import 'bloc/login_bloc.dart';

class LoginPageWidget extends StatelessWidget {
  bool isChecked = false;
  bool showPassword = false;
  LoginBloc? loginBloc;
  @override
  Widget build(BuildContext context) {
    // loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            // ignore: unnecessary_type_check
            if (state is LoginState) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/asset161.png',
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: TextField(
                        controller: state.usernameCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Email', //at@gmail.com
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: TextField(
                        controller: state.passwordCtrl,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              loginBloc!.add(ShowPassword(!state.showPassword));
                              state.passwordCtrl;
                            },
                            icon: state.showPassword
                                ? const Icon(
                                    Icons.visibility,
                                  )
                                // ignore: dead_code
                                : const Icon(
                                    Icons.visibility_off,
                                  ),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: state.isChecked != true
                              ? Colors.white
                              : const Color.fromRGBO(255, 102, 0, 0.8),
                          value: state.isChecked,
                          onChanged: (bool? value) {
                            loginBloc!.add(LogEvent(value!));
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Remember password'),
                        )
                      ],
                    ),
                    RadButton(
                      callback: () {
                        // value.onLogin();
                        // if (value.isChangePage == true) {
                        Navigator.pushNamed(context, AppRoutes.pages);
                        // }
                      },
                      context: context,
                      page: AppRoutes.pages,
                      textBtn: 'Login',
                      btnColor: const Color.fromRGBO(204, 0, 1, 0.8),
                    ),
                    TextBtn(
                      onClick: () {},
                      textBtn: 'Forget Passsword',
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, AppRoutes.registration),
                      child: TextBtn(
                        onClick: (){},
                        textBtn: 'Sign up',
                      ),
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
