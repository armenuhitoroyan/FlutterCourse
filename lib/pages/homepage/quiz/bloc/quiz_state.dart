part of 'quiz_bloc.dart';

class QuizState extends Equatable {
  List<Questions> questions;
  bool isLoading;
  bool isChecked;
  PageController pageController = PageController();
  int currentQuestionIndex;

  QuizState({
    this.questions = const [],
    this.isLoading = false,
    this.isChecked = false,
    this.currentQuestionIndex = 0
  });

  QuizState copyWith({
    List<Questions>? questions,
    bool? isLoading,
    bool? isChecked,
    int? currentQuestionIndex
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      isLoading: isLoading ?? this.isLoading,
      isChecked: isChecked ?? this.isChecked,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex
    );
  }

  @override
  List<Object> get props => [
    questions,
    isLoading,
    isChecked,
    pageController,
    currentQuestionIndex
  ];
}
