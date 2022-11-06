import 'package:exam_at/pages/homepage/quiz/bloc/quiz_bloc.dart';
import 'package:exam_at/pages/homepage/quiz/build_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/quiz.dart';
import '../../../styles/style_of_container.dart';

class QuestionW extends StatelessWidget {
  QuestionW({super.key});
  List<Questions> questionsList = [];
  int index = 0;
  bool checkAnswer = false;

  ColorsContainer colorsContainer = ColorsContainer();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc()
        ..add(LoadQuestionsEvent(questionsList)),
      child: Stack(alignment: Alignment.topCenter, children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(204, 0, 1, 0.8),
          ),
          body: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              if (state.isLoading == true) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Color.fromRGBO(204, 0, 1, 0.8),
                  ),
                );
              } else {
                return Question();
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                color: const Color.fromRGBO(204, 0, 1, 0.8),
                width: 4.0,
              ),
            ),
            child: const Center(),
          ),
        ),
      ]),
    );
  }

  Widget Question() {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        return Scrollbar(
          child: Column(
            children: <Widget>[
              Row(children: [
                SizedBox(
                  width: 200,
                  height: 70,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: state.questions.length,
                    ),
                    itemCount: state.questions.length,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                ),
              ]),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: ((value) => state.currentQuestionIndex),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        BuildQuestions(state.questions[index]),
                      ],
                    );
                  },
                  itemCount: state.questions.length,
                  scrollDirection: Axis.horizontal,
                  controller: state.pageController,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
