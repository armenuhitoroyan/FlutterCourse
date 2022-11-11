import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/homepage/bloc/note_bloc.dart';
import 'package:note/homepage/forms.dart';
import 'package:note/homepage/rforms.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormsState formsState = FormsState();

class HomePage extends StatelessWidget {
  bool onClicked = false;
  HomePage({super.key, required this.formArray});

  FormArray formArray = formsState.form;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc()..add(AddNote(onClicked, formArray)),
      child: Scaffold(
        body: BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            return ReactiveFormArray(
              formArray: state.formArray,
              builder: (context, formArray, child) => SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ReactiveForm(
                      formGroup: state.formArray!.controls.first as FormGroup,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        children: const [
                                          Text(
                                            'RELATIONSHIPS',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  204, 0, 1, 0.8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: const Color.fromRGBO(
                                                  204, 0, 1, 0.8),
                                            ),
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              if (state.onClicked == true) {
                                                state.formArray!.add(state
                                                    .formArray!.controls.first);
                                              }
                                            },
                                            style: const ButtonStyle(),
                                            icon: const Icon(
                                              Icons.add,
                                              color: Color.fromRGBO(
                                                  204, 0, 1, 0.8),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                              itemCount: state.formArray!.controls.length - 1,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Dismissible(
                                key: Key(state.formArray!.controls.toString()),
                                onDismissed: (direction) {
                                  state.formArray!.removeAt(index);
                                },
                                child: RForm(),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
