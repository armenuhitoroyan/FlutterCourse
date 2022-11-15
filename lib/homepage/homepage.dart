import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/homepage/bloc/note_bloc.dart';
import 'package:note/homepage/forms.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormsState formsState = FormsState();

class HomePage extends StatelessWidget {
  bool onClicked = false;
  int index = 0;
  HomePage({super.key, required this.formArray});

  FormArray formArray = formsState.form;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NoteBloc()..add(AddNote(onClicked, index, formArray)),
      child: Scaffold(
        body: BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            index = state.index;
            return ReactiveFormArray(
              formArray: state.formArray,
              builder: (context, formArray, child) => SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
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
                                            color:
                                                Color.fromRGBO(204, 0, 1, 0.8),
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
                                            // if (state.onClicked == true) {
                                            state.formArray!.add(
                                              FormGroup({
                                                'relationship':
                                                    FormControl<String>(),
                                                'position':
                                                    FormControl<String>(),
                                                'note': FormControl<String>(),
                                              }),

                                              // state.formArray!
                                              //     .controls[state.index]

                                              // formsState.form.controls[index],
                                            );

                                            state.index++;
                                            index = state.index;

                                            // index = index + 1;
                                            // print(formsState.form);
                                            print(state.index);
                                            // }
                                          },
                                          style: const ButtonStyle(),
                                          icon: const Icon(
                                            Icons.add,
                                            color:
                                                Color.fromRGBO(204, 0, 1, 0.8),
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
                              child: _buildcontent(
                                  formArray.controls[index] as FormGroup,
                                  state,
                                  index),
                            ),
                          )
                        ],
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

Widget _buildcontent(FormGroup formGroup, NoteState state, int i) {
  List<DropdownMenuItem<dynamic>> list = <String>[
    'One',
    'Two',
    'Free',
    'Four',
  ].map<DropdownMenuItem<String>>((String value) {
    print(state.runtimeType);
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  return Card(
    color: Colors.grey[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ReactiveForm(
        formGroup: state.formArray!.controls[i] as FormGroup,
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 10),
                    child: ReactiveDropdownField(
                      formControlName: 'relationship',
                      items: list,
                      decoration: const InputDecoration(
                        labelText: 'Relationship',
                      ),
                      // validationMessages: '',
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: ReactiveTextField(
                      formControlName: 'position',
                      decoration: const InputDecoration(
                        labelText: 'Position',
                      ),
                      textCapitalization: TextCapitalization.words,
                      style: const TextStyle(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ReactiveTextField(
                      formControlName: 'note',
                      decoration: const InputDecoration(
                        labelText: 'Note',
                      ),
                      textCapitalization: TextCapitalization.words,
                      style: const TextStyle(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              formGroup.reset();
                            },
                            icon: const Icon(
                              Icons.close,
                            ),
                          ),
                          const Text('Cancel'),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.save_sharp,
                            ),
                          ),
                          const Text('Save'),
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // state.formArray!.removeAt(state.index);
                    removeGroup(formGroup.parent as FormArray, i);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

removeGroup(FormArray fa, int num) {
  // remove address from the list
  fa.removeAt(num);
 
}
