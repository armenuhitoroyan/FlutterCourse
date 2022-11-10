part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  FormGroup? formGroup;
  @override
  List<Object?> get props => [formGroup];
}

class AddNote extends NoteEvent {
  bool onClicked;
  final int index;

  FormArray? formArray;
  @override
  FormGroup? formGroup;
 

  AddNote(this.onClicked, this.index, this.formArray,  this.formGroup);
}
