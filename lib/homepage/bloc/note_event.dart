part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddNote extends NoteEvent {
  bool onClicked;
  final int count;
  FormGroup? formGroup;

  AddNote(this.onClicked, this.count, this.formGroup);
}
