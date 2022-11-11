part of 'note_bloc.dart';

FormsState formsState = FormsState();

class NoteState extends Equatable {

  bool onClicked;
  
  FormArray? formArray;

  NoteState({
    this.onClicked = false,
    this.formArray,
  });

  NoteState copyWith({
    bool? onClicked,
    FormArray? formArray,
  }) {
    return NoteState(
      onClicked: onClicked ?? this.onClicked,
      formArray: formArray ?? this.formArray,
    );
  }

  @override
  List<Object?> get props =>
      [onClicked, formArray, ];
}
