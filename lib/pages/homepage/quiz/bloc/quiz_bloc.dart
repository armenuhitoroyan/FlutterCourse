import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_at/models/quiz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../api/project_api.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  int index = 0;
  PageController pageController;
  QuizBloc(this.pageController) : super(QuizState(pageController: pageController)) {
    on<LoadQuestionsEvent>((event, emit) async {
      emit(
        state.copyWith(
            questions: event.questions,
            isLoading: true,
            isChecked: false,
            currentQuestionIndex: index),
      );

      final result = await ProjectAPI().quizApi.getQuizData();
      // print('blog type ${result.runtimeType}');
      event.questions = result.questions;
      // print('event type ${event.questions!.runtimeType}');

      emit(
        state.copyWith(
            questions: event.questions,
            isLoading: false,
            isChecked: true,
            pageController: PageController(),
            currentQuestionIndex: index + 1),
        // pageController.animateToPage(currentQuestionIndex + 1,
        //   curve: Curves.easeInOut, duration: const Duration(milliseconds: 700));
      );
    });
  }
}
