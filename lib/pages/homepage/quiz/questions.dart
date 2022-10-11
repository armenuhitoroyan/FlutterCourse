import 'package:exam_at/pages/homepage/quiz/build_question.dart';
import 'package:exam_at/pages/homepage/quiz/questions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../styles/style_of_container.dart';
import '../../../widgets/diagonally_shaped_card.dart';

class QuestionsWidget extends StatelessWidget {
  QuestionsWidget({super.key});
  int index = 0;

  ColorsContainer colorsContainer = ColorsContainer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorsContainer.colors.elementAt(index + 3),
      ),
      body: ChangeNotifierProvider(
        create: (context) => QuestionsProvider(),
        child: Consumer<QuestionsProvider>(builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Question(value);
          }
        }),
      ),
    );
  }

  Widget Question(questionProvider) {
    return Container(
      child: Scrollbar(
        child: Column(
          children: <Widget> [
            Row(
              children: [ SizedBox(
                width: 200,
                height: 70,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: questionProvider.questionsData.length,
                  ),
                  itemCount: questionProvider.questionsData.length,
                  itemBuilder: (context, index) {
                    return DiagonallyShapedCard(index: index+1, width: 80, height: 50,);
                  },
                ),
              ), ]
            ),
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: ((value) => questionProvider.onChangeIndex(value)),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BuildQuestions(questionProvider.questionsData[index]),
                    ],
                  );
                },
                itemCount: questionProvider.questionsData.length,
                scrollDirection: Axis.horizontal,
                controller: questionProvider.pageController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
