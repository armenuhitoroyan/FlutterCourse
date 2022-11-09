import 'package:exam_at/pages/auth/registration/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../base/routes.dart';
import '../../../widgets/buttons/button.dart';

String regFullName = r"^(?=.*[A-Za-z\s])";
final form = FormGroup({
  'username': FormControl<String>(validators: [
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
    // final RegistrationBloc regBloc = BlocProvider.of<RegistrationBloc>(context);
    bool isValid = form.valid;
    // regBloc.add(CheckValidationEvent(isValid));

    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'Field must not be empty'
      },
      child: BlocProvider(
        create: (context) =>
            RegistrationBloc()..add(CheckValidationEvent(isValid)),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Registration'),
          ),
          body: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ReactiveForm(
                  formGroup: form,
                  child: BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ReactiveTextField(
                            formControlName: 'username',
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
                            decoration:
                                const InputDecoration(label: Text('Email')),
                            validationMessages: {
                              'email': (error) =>
                                  'The email value must be a valid email'
                            },
                          ),
                          ReactiveTextField(
                            formControlName: 'password',
                            decoration:
                                const InputDecoration(label: Text('Password')),
                            validationMessages: {
                              'minLength': (error) =>
                                  'The password must have at least 8 characters'
                            },
                            obscureText: true,
                          ),
                          ReactiveTextField(
                            formControlName: 'passwordConfirmation',
                            decoration: const InputDecoration(
                                label: Text('Comfirm Password')),
                            validationMessages: {
                              'mastMatch': (error) =>
                                  'The password must have at least 8 characters and it is mast be equales password'
                            },
                            obscureText: true,
                          ),
                          ReactiveFormConsumer(
                              builder: (context, formGroup, child) {
                            // print(formGroup.valid);
                            return RadiusButton(
                              callback: () {
                                state.isLoading = formGroup.valid;
                                // regBloc
                                //     .add(CheckValidationEvent(formGroup.valid));
                                //  print(formGroup.valid);
                                state.isLoading
                                    // formGroup.valid
                                    ? Navigator.pushNamed(
                                        context,
                                        AppRoutes.loginpage,
                                      )
                                    : form.markAllAsTouched();
                              },
                              context: context,
                              page: AppRoutes.pages,
                              textBtn: 'Registration',
                              btnColor: const Color.fromRGBO(204, 0, 1, 0.8),
                            );
                          }),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
