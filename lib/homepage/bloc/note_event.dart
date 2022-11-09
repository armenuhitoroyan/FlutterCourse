part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddNote extends NoteEvent {
  bool onClicked;
  final int index;

  FormArray? formArray;
  FormGroup? formGroup;

  AddNote(this.onClicked, this.index, this.formArray, this.formGroup);
}
