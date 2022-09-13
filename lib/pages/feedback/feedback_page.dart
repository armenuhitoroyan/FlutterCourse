import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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

    @override
  void initState() {
    getData();

    super.initState();
  }

   void getData() async {
    await IndigoAPI().feedback.getQuestionsData().then((value) => {
      questionsData = value
    });

    print(await IndigoAPI().feedback.getQuestionsData().then((value) => value.first));
    
    setState(() {
      length = questionsData.length;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (questionsData == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } 

    // print('data => ${IndigoAPI().feedback.getFeedbackData().then((value) => value.map((e) => e.questions.first.toJson().values.first))}');
    return Container(
     child: SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [Text('QUESTIONS')]),
        body: Container(   
          margin: const EdgeInsets.all(10),
          child: ListView.separated(
            itemBuilder: (context, index) {
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
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print('Clicked $index');
                              }, 
                              child: Text('feedbackData0')
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print('Clicked $index');
                              }, 
                              child: Text('feedbackData1')
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print('Clicked $index');
                              }, 
                              child: Text('feedbackData2')
                            )
                          ],
                        ),
                      ]
                    ),
                  )
                ],
              );
            }, 
            separatorBuilder: (context, index) => const Divider(),
            itemCount: questionsData != null ? questionsData.length : 0
          )
        ),
      ),
    )
    );
  }
}