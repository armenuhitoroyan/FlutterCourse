part of 'note_bloc.dart';

FormsState formsState = FormsState();

class NoteState extends Equatable {

  bool onClicked;
  
  int index;
  FormArray? formArray;

  NoteState({
    this.onClicked = false,
    this.index = 0,
    this.formArray,
  });

  NoteState copyWith({
    bool? onClicked,
    int? index,
    FormArray? formArray,
  }) {
    return NoteState(
      onClicked: onClicked ?? this.onClicked,
      index: index ?? this.index,
      formArray: formArray ?? this.formArray,
    );
  }

  @override
  List<Object?> get props =>
      [onClicked, index, formArray, ];
}
