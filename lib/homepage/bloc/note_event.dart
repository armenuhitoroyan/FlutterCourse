part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddNote extends NoteEvent {
  bool onClicked;
  int i;
  FormArray formArray;

  @override
  AddNote(
    this.onClicked,
    this.i,
    this.formArray,
  );
}
