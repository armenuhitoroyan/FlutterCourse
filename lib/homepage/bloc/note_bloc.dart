import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'note_event.dart';
part 'note_state.dart';

final form = FormGroup({
  'name': FormArray<String>([
    FormControl<String>(value: 'A T'),
  ]),
  'emails': FormArray<String>([
    FormControl<String>(value: 'at@gmail.com'),
  ]),
});

class NoteBloc extends Bloc<NoteEvent, NoteInitial> {
  NoteBloc() : super(NoteInitial()) {
    // .control('emails') as FormArray<String>;
    // final fbList = fb.array([
    //   fb.group({'name': 'Sofia', 'emails': 'sofia@gmail.com'}),
    //   fb.group({'name': 'Julia', 'emails': 'julia@gmail.com'}),
    // ]);

    final names = form.control('name') as FormArray<String>;
    final email = form.control('emails') as FormArray<String>;
    final myForm = form;

    on<AddNote>((event, emit) {
      emit(
        state.copyWith(
          onClicked: true,
          name: names,
          formGroup: event.formGroup,
        ),
      );

      // print(form.runtimeType);
      event.formGroup = myForm;

      // adding another name
      names.add(
        FormControl<String>(value: 'Anna'),
      );

      emit(
        state.copyWith(
          onClicked: true,
          name: names,
          formGroup: event.formGroup,
        ),
      );

      // print(state.formGroup!.controls.values.first.value);
    });
  }
}
