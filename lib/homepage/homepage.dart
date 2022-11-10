import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/homepage/bloc/note_bloc.dart';
import 'package:note/homepage/forms.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormsState formsState = FormsState();

class HomePage extends StatelessWidget {
  bool onClicked = false;
  HomePage({super.key, required this.formArray});
  int i = 0;

  FormArray formArray = formsState.form;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc()..add(AddNote(onClicked, i, formArray)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reactive Forms'),
        ),
        body: BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            if (state is NoteState) {
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
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: const [
                                            Text('RELATIONSHIPS'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                if (state.onClicked == true) {
                                                  i += 1;
                                                  state.index++;
                                                  state.formArray!.add(state
                                                      .formArray!
                                                      .controls
                                                      .first);
                                                }
                                              },
                                              child: const Icon(Icons.plus_one))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                itemCount: state.formArray!.controls.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    _buildcontent(),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

Widget _buildcontent() {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: const BorderSide(
        color: Colors.greenAccent,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ReactiveTextField(
            formControlName: 'relationship',
            decoration: const InputDecoration(
              labelText: 'Relationship',
            ),
            textCapitalization: TextCapitalization.words,
            style: const TextStyle(
              backgroundColor: Colors.white,
            ),
          ),
          ReactiveTextField(
            formControlName: 'position',
            decoration: const InputDecoration(
              labelText: 'Position',
            ),
            textCapitalization: TextCapitalization.words,
            style: const TextStyle(
              backgroundColor: Colors.white,
            ),
          ),
          ReactiveTextField(
            formControlName: 'note',
            decoration: const InputDecoration(
              labelText: 'Note',
            ),
            textCapitalization: TextCapitalization.words,
            style: const TextStyle(
              backgroundColor: Colors.white,
            ),
          ),
          ElevatedButton(onPressed: (){

          }, child: const Text('remove'))
        ],
      ),
    ),
  );
}
