import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/homepage/bloc/note_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HomePage extends StatelessWidget {
  bool onClicked = false;
  HomePage({super.key});
  int count = 5;
  FormArray? formArray;
  FormGroup? formGroup;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NoteBloc()..add(AddNote(onClicked, count, formArray, formGroup)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reactive Forms'),
        ),
        body: BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            if (state is NoteInitial) {
              // print(state.formGroup!.control('relationship').value);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: const [
                                    Text('RELATIONSHIPS'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        if (state.onClicked == true) {
                                          count += 1;
                                          print(count);
                                          // print(state.relationship!.controls
                                          //     .map((e) => e.value));
                                          // print(state.relationship!.parent!.value);

                                          // print(state.formGroup!
                                          //     .control('relationship')
                                          //     .value);

                                          // state.formGroup!.controls.addAll(
                                          //     state.formGroup!.controls);

                                          // print(state.formGroup!
                                          //     .control('relationship')
                                          //     .value);

                                          print(
                                              state.formArray!.controls.length);
                                          state.formArray!.add(
                                              state.formArray!.controls.first);

                                          print(
                                              state.formArray!.controls.length);
                                        } else {
                                          print(count);
                                        }
                                      },
                                      child: const Icon(Icons.plus_one))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
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
