import 'package:flutter/material.dart';

import '../../base/routes.dart';

class ResultViewQuestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return _resultView(context);
  }

  Widget _resultView(BuildContext context) {
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
                Navigator.pushReplacementNamed(context, AppRoutes.homepage);
              },
              child: const Text('Send'),
            )
          ],
        ),
      ),
    );
  }
  
}

