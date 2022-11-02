import 'package:exam_at/base/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../widgets/buttons/button.dart';
import '../../../widgets/buttons/text_button.dart';
import 'bloc/login_bloc.dart';
import 'login_provider.dart';

class LoginPage extends StatelessWidget {
  // bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc()..add(LogEvent()),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginS) {
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
                            onPressed: () {},
                            icon: true
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
                          checkColor: state.isChacked != true
                              ? Colors.white
                              : const Color.fromRGBO(255, 102, 0, 0.8),
                          value: state.isChacked,
                          onChanged: (bool? checked) {
                            // state.checkCheckBox();
                            state.isChacked = checked!;
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
                        //   Navigator.pushNamed(context, AppRoutes.pages);
                        // }
                      },
                      context: context,
                      page: AppRoutes.pages,
                      textBtn: 'Login',
                      btnColor: const Color.fromRGBO(204, 0, 1, 0.8),
                    ),
                    TextBtn(
                      textBtn: 'Forget Passsword',
                    ),
                    TextBtn(
                      textBtn: 'Sign up',
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
