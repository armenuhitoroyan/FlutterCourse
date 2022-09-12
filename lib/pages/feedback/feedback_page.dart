import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../api/indigo_api.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  var feedbackData;

    @override
  void initState() {
    getData();

    super.initState();
  }

  void getData() async {
    feedbackData = await IndigoAPI().feedback.getFeedbackData();
    int i = 0;
   
    setState(() {
       print('feedbackData => $feedbackData');
    });
  }

  @override
  Widget build(BuildContext context) {

    if (feedbackData == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      print(feedbackData);
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
                      Text('${feedbackData[index]['question_text']}')
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
                              child: Text('${feedbackData[0]['answers'][index]['answer_text']}')
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
                              child: Text('${feedbackData[0]['answers'][index+=1]['answer_text']}')
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
                              child: Text('${feedbackData[0]['answers'][index < feedbackData[0]['answers'].length-2 ? index+=1 : index]['answer_text']}')
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
            itemCount: feedbackData.length
          )
        ),
      ),
    )
    );
  }
}