import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'note_event.dart';
part 'note_state.dart';

final form = FormArray([
  FormGroup({
    'relationship': FormArray<String>([
      FormControl<String>(value: 'rel'),
    ]),
    'position': FormArray<String>([
      FormControl<String>(),
    ]),
    'note': FormArray<String>([
      FormControl<String>(),
    ]),
  })
]);

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteState()) {
    // final relationship = form.control('relationship') as FormArray<String>;
    // final position = form.control('position') as FormArray<String>;
    // final note = form.control('note') as FormArray<String>;
    final formArray = form;
    // FormArray? formArray ;

    print(state.formGroup.runtimeType);

    on<AddNote>((event, emit) {
      emit(
        state.copyWith(
          onClicked: false,
          // relationship: relationship,
          formArray: event.formArray,
          formGroup: event.formGroup,
        ),
      );

      // print(form.runtimeType);
      print(form.controls.first.runtimeType);
      print(form.controls.first.value);

      print(event.formGroup.runtimeType);
      event.formGroup = form.controls.first as FormGroup;

      event.formArray = form;
      // event.formGroup = form.controls.first.value as FormGroup;
      print(event.formGroup.runtimeType);

      // adding another relationship

      // relationship.add(
      //   FormControl<String>(value: 'relationship'),
      // );
      // position.add(
      //   FormControl<String>(value: 'position'),
      // );

      emit(
        state.copyWith(
          onClicked: true,
          // relationship: relationship,
          formArray: event.formArray,
          formGroup: event.formGroup,
        ),
      );

      print(state.formGroup.runtimeType);

      // print(state.formGroup!.controls.values.first.value);
    });
  }
}
