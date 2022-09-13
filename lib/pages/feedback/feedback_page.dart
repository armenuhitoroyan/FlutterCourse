// ignore_for_file: dead_code

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:indigo/models/feedback/feedback_model.dart';

import '../../api/indigo_api.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
 
   List<Question> questionsData = [];
   int length = 0;
   int count = 0;
   int correctId = 0;
   int points = 0;
   List<int> identificators = [];

    @override
  void initState() {
    getData();

    super.initState();
  }

   void getData() async {
    await IndigoAPI().feedback.getQuestionsData().then((value) => {
      questionsData = value
    });

    print(await IndigoAPI().feedback.getQuestionsData().then((value) => value.first.questionText));
    
    setState(() {
      length = questionsData.length;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (questionsData.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } 

    // print('data => ${IndigoAPI().feedback.getQuestionsData().then((value) => value.first.questionText}');
    return Container(
     child: SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: const [Text('QUESTIONS')]),
        body: Container(   
          margin: const EdgeInsets.all(10),
          child: ListView.builder(
            itemBuilder: (context, index) {
              // ignore: dead_code
            if(index == count && index < questionsData.length) {
             return Column(
                children: [
                  Row(
                    children: [
                      Text('${questionsData[index].questionText}')
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                  
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          identificators.add(questionsData[index].answers[i].answerId);
                          print('ids => $identificators');
                          searchCorrectDataMin(identificators);
                          print(correctId);
                          return Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // print('Clicked $i');
                                // print('id => ${questionsData[index].answers[i].answerId}');

                                if (questionsData[index].answers[i].answerId == correctId) {
                                  print('The answer is correct ${questionsData[index].answers[i].answerId} == $correctId');
                                  points += 1;
                                 
                                } else {
                                  print('The answer is wrong ${questionsData[index].answers[i].answerId} != $correctId');
                                 
                                }
                                
                                setState(() {
                                  count+=1;
                                  identificators = [];
                                });

                              }, 
                              child: Text('${questionsData[index].answers[i].answerText}')
                            )
                          ],
                        );
                        const SizedBox(height: 10);
                        },
                        itemCount: questionsData[index].answers.length,
                      )
                      ]
                    ),
                  )
                ],
              );
            } 
            else if (index == questionsData.length-1) {
             
              return showDialog();
              print('index => $index');
              
            }
            return Container();
            }, 
            itemCount: questionsData.length
          )
        ),
      ),
    )
    );
  }



  Widget showDialog() {
    // ignore: prefer_const_constructors
    return AlertDialog(
      icon: const Icon(Icons.comment),
      backgroundColor: Colors.indigo,
      // ignore: prefer_const_constructors
      title: Text('Դուք հավաքել եք $points միավոր'),
      titlePadding: const EdgeInsets.all(10),
      iconColor: Colors.white,
    );
  }

  int searchCorrectDataMin( List<int> list) {
  
    for (var i = 0; i < list.length-1; i++) {
      if (list[i] < list[i+1]) {
        correctId = list.reduce(min);
        break;
      } else {
        correctId = list.reduce(max);
        break;
      }
    }
    return correctId;
  }
}