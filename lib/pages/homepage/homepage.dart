import 'package:exam_at/base/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.leaderBoard);
      },
      child: Text('LeaderBoarder'),
    );
  }
}
