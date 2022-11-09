part of 'note_bloc.dart';

class NoteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NoteInitial extends NoteState {
  bool onClicked;
  FormArray<String>? name;
  int count;
  FormGroup? formGroup;

  NoteInitial(
      {this.onClicked = false, this.name, this.count = 1, this.formGroup});

  NoteInitial copyWith(
      {bool? onClicked,
      FormArray<String>? name,
      int? count,
      FormGroup? formGroup}) {
    return NoteInitial(
        onClicked: onClicked ?? this.onClicked,
        name: name ?? this.name,
        count: count ?? this.count,
        formGroup: formGroup ?? formGroup);
  }

  @override
  List<Object?> get props => [onClicked, name, count, formGroup];
}
