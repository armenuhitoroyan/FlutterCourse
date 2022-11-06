import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_at/models/quiz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../api/project_api.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizState()) {
    on<LoadQuestionsEvent>((event, emit) async {
      emit(
        state.copyWith(
          questions: event.questions,
          isLoading: true,
          isChecked: false,
        ),
      );

      final result = await ProjectAPI().quizApi.getQuizData();
      print('blog type ${result.runtimeType}');
      event.questions = result.questions;
      print('event type ${event.questions!.runtimeType}');

      emit(
        state.copyWith(
          questions: event.questions,
          isLoading: false,
          isChecked: true,
        ),
      );
    });
  }
}
