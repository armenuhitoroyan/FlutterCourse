import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:indigo/base/routes.dart';
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
   List<int> ids = [];

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
                          ids.add(questionsData[index].answers[i].answerId);
                          print('ids => $ids');
                         
                          return Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print('Clicked $index');
                                print('id => ${questionsData[index].answers[i].answerId}');
                                
                                setState(() {
                                  count+=1;
                                  ids = [];
                                });

                                print(count);

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
            // else {
            //  return const AlertDialog(
            //     icon: Icon(Icons.comment),
            //     backgroundColor: Colors.indigo,
            //     title: Text('Դուք հավաքել եք 1 միավոր'),
            //     titlePadding: EdgeInsets.all(10),
            //     iconColor: Colors.white,
            //   );
            //   // Navigator.pushReplacementNamed(context, AppRoutes.homepage);
            // }
            return Container();
            }, 
            itemCount: questionsData.length
          )
        ),
      ),
    )
    );
  }


  void searchCorrectDataMin( List<int> list) {
  
    for (var i = length-1; i > 0; i--) {
      if (list[i] < list[i-1]) {
        list[i-1] = list[i];
        list[i] = list[i-1];
      } else {
        print('Correct id is $i');
      }
    }
  }
}