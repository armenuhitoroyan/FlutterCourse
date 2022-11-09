part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NoteInitial extends NoteState {
  bool onClicked;
  // FormArray<String>? relationship;
  int index;
  FormArray? formArray;
  FormGroup? formGroup;

  NoteInitial({
    this.onClicked = false,
    // this.relationship,
    this.index = 0,
    this.formArray,
    this.formGroup,
  });

  NoteInitial copyWith({
    bool? onClicked,
    // FormArray<String>? relationship,
    int? index,
    FormArray? formArray,
    FormGroup? formGroup,
  }) {
    return NoteInitial(
      onClicked: onClicked ?? this.onClicked,
      // relationship: relationship ?? this.relationship,
      index: index ?? this.index,
      formArray: formArray ?? formArray,
      formGroup: formGroup ?? formGroup,
    );
  }

  @override
  List<Object?> get props =>
      [onClicked, /* relationship, */ index, formArray, formGroup];
}
