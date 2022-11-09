import 'package:exam_at/base/routes.dart';
import 'package:exam_at/pages/homepage/purchases/bloc/purchases_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../widgets/buttons/button.dart';
import '../../../widgets/buttons/text_button.dart';
import 'bloc/login_bloc.dart';

final form = FormGroup(
  {
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(
      validators: [Validators.required, Validators.minLength(8)],
    ),
  },
);

class LoginPageWidget extends StatelessWidget {
  bool isChecked = false;
  bool showPassword = false;
  LoginBloc? loginBloc;
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color(0xFFFFFFFF),
      Color.fromRGBO(255, 102, 0, 0.8),
    ];
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'Field must not be empty'
      },
      child: Scaffold(
          body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ReactiveForm(
            formGroup: form,
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
                ReactiveTextField(
                  formControlName: 'email',
                  decoration: const InputDecoration(label: Text('Email')),
                  validationMessages: {
                    'email': (error) => 'The email value must be a valid email'
                  },
                ),
                ReactiveTextField(
                  formControlName: 'password',
                  decoration: const InputDecoration(label: Text('Password')),
                  validationMessages: {
                    'minLength': (error) =>
                        'The password must have at least 8 characters'
                  },
                  obscureText: true,
                ),
                Row(
                  children: [
                    // ReactiveCheckboxListTile(
                    //   activeColor: const Color(0xFFFFFFFF),
                    //   selectedTileColor: const Color.fromRGBO(255, 102, 0, 0.8),
                    //   onChanged: (control) => !isChecked,
                    // ),

                    Checkbox(
                      value: isChecked,
                      activeColor: isChecked == true
                        ? const Color.fromRGBO(255, 102, 0, 0.8)
                        : const Color(0xFFFFFFFF),
                      onChanged: (bool? newValue) {
                        isChecked = !newValue!;
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Remember password'),
                    )
                  ],
                ),
                ReactiveFormConsumer(builder: (context, formGroup, child) {
                  return RadiusButton(
                    callback: () {
                      formGroup.valid
                          ? Navigator.pushNamed(
                              context,
                              AppRoutes.pages,
                            )
                          : form.markAllAsTouched();
                    },
                    context: context,
                    page: AppRoutes.pages,
                    textBtn: 'Login',
                    btnColor: const Color.fromRGBO(204, 0, 1, 0.8),
                  );
                }),
                TextBtn(
                  onClick: () {},
                  textBtn: 'Forget Passsword',
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.registration),
                  child: TextBtn(
                    onClick: () {},
                    textBtn: 'Sign up',
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
