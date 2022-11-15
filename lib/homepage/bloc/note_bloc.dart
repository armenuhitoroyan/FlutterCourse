import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:note/homepage/forms.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'note_event.dart';
part 'note_state.dart';

FormsState form = FormsState();

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteState(formArray: form.form)) {
    final formArray = form.form;

    on<AddNote>((event, emit) {
      emit(
        state.copyWith(
          onClicked: false,
          index: event.i,
          formArray: event.formArray,
        ),
      );

      event.formArray = form.form;

      emit(
        state.copyWith(
          onClicked: true,
          index: event.i,
          formArray: event.formArray,
        ),
      );
    });
  }
}
