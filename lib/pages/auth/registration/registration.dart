import 'package:exam_at/pages/auth/registration/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../base/routes.dart';
import '../../../widgets/buttons/button.dart';

String regFullName = r"^(?=.*[A-Za-z\s])";
final form = FormGroup({
  'fullname': FormControl<String>(validators: [
    Validators.required,
    Validators.pattern(regFullName),
  ]),
  'email':
      FormControl<String>(validators: [Validators.required, Validators.email]),
  // 'emailConfirmation': FormControl<String>(),
  'password': FormControl<String>(
      validators: [Validators.required, Validators.minLength(8)]),
  'passwordConfirmation': FormControl<String>(),
}, validators: [
  // Validators.mustMatch('email', 'emailConfirmation'),
  Validators.mustMatch('password', 'passwordConfirmation'),
]);

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContext(context);
  }

  Widget _buildContext(BuildContext context) {
    RegistrationBloc regB = RegistrationBloc();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
          return Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ReactiveForm(
                  formGroup: form,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ReactiveTextField(
                        formControlName: 'fullname',
                        decoration:
                            const InputDecoration(label: Text('Full name')),
                        validationMessages: {
                          'required': (error) =>
                              'The fullname must not be empty',
                          'pattern': (error) =>
                              'The fullname must have only letters'
                        },
                      ),
                      ReactiveTextField(
                        formControlName: 'email',
                        decoration: const InputDecoration(label: Text('Email')),
                      ),
                      ReactiveTextField(
                        formControlName: 'password',
                        decoration:
                            const InputDecoration(label: Text('Password')),
                        obscureText: true,
                      ),
                      ReactiveTextField(
                        formControlName: 'passwordConfirmation',
                        decoration: const InputDecoration(
                            label: Text('Comfirm Password')),
                        obscureText: true,
                      ),
                      ReactiveFormConsumer(
                          builder: (context, formGroup, child) {
                        return newButton();
                        // ElevatedButton(
                        //     onPressed: () {
                        //       if (form.valid) {
                        //         print('ok');
                        //       } else {
                        //         print('no');
                        //       }
                        //     },
                        //     child: child
                        // );

                        //     RadButton(
                        //   callback: () {
                        //     regB.add(CheckValidationEvent(state.isValid));
                        //     state.isValid
                        //         ? Navigator.pushNamed(
                        //             context,
                        //             AppRoutes.loginpage,
                        //           )
                        //         : null;
                        //   },
                        //   context: context,
                        //   page: AppRoutes.registration,
                        //   textBtn: 'Submit',
                        //   btnColor: const Color.fromRGBO(204, 0, 1, 0.8),
                        // );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class newButton extends StatelessWidget {
  const newButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ReactiveForm.of(context)!.valid ? Navigator.pushNamed(context, AppRoutes.loginpage) : print('Ooops');
      },
      child: Text('Login'),
    );
  }
}
