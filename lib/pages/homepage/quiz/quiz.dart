import 'package:exam_at/pages/homepage/quiz/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/quiz.dart';

class Quiz extends StatelessWidget {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: Scaffold(
        appBar: clicked == true ? AppBar() : null,
        body: Consumer<QuizProvider>(
          builder: (context, value, child) => value.isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              // ignore: avoid_unnecessary_containers
              : Container(
                  decoration: BoxDecoration(
                    color: value.index - 1 > 0
                        ? value.colors[value.index - 1]
                        : value.isChangeText != true
                            ? value.colors[value.index]
                            : Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 5,
                    ),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: value.index > 0
                          ? null
                          : () {
                              value.changeText();
                              clicked = true;
                            },
                      child: value.isChangeText != true
                          ? Text(
                              value.text,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 25),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: 150,
                                        height: 70,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: GridView.builder(
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  value.questions!.length,
                                            ),
                                            itemCount: value.questions?.length,
                                            itemBuilder: (context, index) =>
                                                Container(
                                              decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    249, 249, 249, 0.8),
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  bottomRight:
                                                      Radius.circular(20.0),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '$index',
                                                  style: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        220, 220, 220, 0.8),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${value.questions![0].questionText}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        Image.network('${value.questions?[0].questionImageUrl}'),
                                        // Expanded(child: Image.network('${value.questions?[0].questionImageUrl}')),
                                        const SizedBox(height: 20),
                                        Column(
                                          children: value.questions![0].answers!
                                              .map<Widget>(
                                                (a) => _answerOption(a),
                                              )
                                              .toList(),
                                        ),
                                        const SizedBox(height: 100),
                                      ],
                                    ),
                                  ),
                                ]),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _answerOption(
    Answers answerData,
  ) {
    return Consumer<QuizProvider>(
      builder: ((context, provider, child) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              provider.answerPressed(answerData.answerId);
            },
            child: Text('${answerData.answerText}'),
          ),
        );
      }),
    );
  }
}
