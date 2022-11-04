part of 'quiz_bloc.dart';

class QuizState extends Equatable {
  List<Questions> questions;
  bool isLoading;
  bool isChecked;

  QuizState({
    this.questions = const [],
    this.isLoading = false,
    this.isChecked = false
  });

  QuizState copyWith({
    List<Questions>? questions,
    bool? isLoading,
    bool? isChecked
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      isLoading: isLoading ?? this.isLoading,
      isChecked: isChecked ?? this.isChecked
    );
  }

  @override
  List<Object> get props => [
        questions,
        isLoading,
      ];
}
