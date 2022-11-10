part of 'note_bloc.dart';

class NoteState extends Equatable {

  
  // final form = formState.form;

  bool onClicked;
  // FormArray<String>? relationship;
  int index;
  FormArray? formArray;
  FormGroup? formGroup;
  // FormsState? formsState;

  NoteState(
      {this.onClicked = false,
      // this.relationship,
      this.index = 0,
      this.formArray,
      this.formGroup,
      });

  NoteState copyWith({
    bool? onClicked,
    // FormArray<String>? relationship,
    int? index,
    FormArray? formArray,
    FormGroup? formGroup,
  }) {
    return NoteState(
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
