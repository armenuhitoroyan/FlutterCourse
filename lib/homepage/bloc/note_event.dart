part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddNote extends NoteEvent {
  bool onClicked;
  final int count;

  AddNote(this.onClicked, this.count);
}
