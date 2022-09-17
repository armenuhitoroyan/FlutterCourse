import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:indigo/api/indigo_api.dart';
import 'package:indigo/base/routes.dart';
import 'package:indigo/models/feedback/feedback_model.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
  
  void updateBody(Widget viewPager) {}
}

class _FeedBackState extends State<FeedBack> {
  FeedBackModel? feedbackData;
  List<Question> questionsData = [];
  int currentQuestionIndex = 0;
  bool showResult = false;
  late int i;
  Function? updateBody;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
 
  @override
  void initState() {
    getData().then((data) {
      setState(() {
        feedbackData = data;
        questionsData = data.questions;
        i = questionsData.length;
      });
    });


    super.initState();
  }

  Future<FeedBackModel> getData() async {
    return await IndigoAPI().feedback.getFeedbackData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        title: const Text('QUESTIONS'),
      ),
      body: feedbackData == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : showResult
              ? _resultView()
              : _buildContent()
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        LinearProgressIndicator(
          value: currentQuestionIndex+1/questionsData.length,
          semanticsLabel: 'Linear progress indicator',
        ),
        _buildQuestion(
          questionsData[currentQuestionIndex],
        )
      ],
    );
  }

  Widget _buildQuestion(Question questionData) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questionData.questionText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: questionData.answers
                .map<Widget>(
                  (a) => _answerOption(
                    a,
                    answerPressed,
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _answerOption(
    Answer answerData,
    Function(int) onAnswerPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onAnswerPressed(answerData.answerId);
           
           setState(() {
             widget.updateBody(viewPager());
           });
        },
       
        child: Text(answerData.answerText),
      ),
    );
  }

  Widget _resultView() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
            color: Colors.indigo.shade400,
            borderRadius: BorderRadius.circular(
              15,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Thank you for your feedback'),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {
                // Navigator.pushNamed(context, AppRoutes.homepage);
              },
              child: Text('Send'),
            )
          ],
        ),
      ),
    );
  }

  Widget viewPager() {

    return Center(
      child: Container(
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (value) => questionsData.length-1,
          itemBuilder: (context, index) {
            // return Text('data${currentQuestionIndex < questionsData.length - 1 ? 
            //   currentQuestionIndex++ : currentQuestionIndex--}');
      
            if (_pageController.hasClients) {     
              _pageController.animateToPage(
                questionsData.length,
                duration: const Duration(milliseconds: 20000),
                curve: Curves.easeIn,
              );
            }
      
            return _buildQuestion(currentQuestionIndex < questionsData.length - 1 ? 
            questionsData[currentQuestionIndex++] : questionsData[currentQuestionIndex--]);
          },
          itemCount: i, 
        ),
      ),
    );  
  }

  void answerPressed(int answerId) {
    if (currentQuestionIndex == questionsData.length - 1) {
      setState(() {
        showResult = true;
      });
    } else {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

 
}
