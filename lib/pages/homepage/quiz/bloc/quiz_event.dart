part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class LoadQuestionsEvent extends QuizEvent {
  List<Questions>? questions;

  LoadQuestionsEvent(
    this.questions,
  );
}

class OnChangePage extends QuizEvent { 
  PageController pc = PageController();

  OnChangePage(this.pc);
}
