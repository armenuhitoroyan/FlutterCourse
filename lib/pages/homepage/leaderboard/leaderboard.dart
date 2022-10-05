import 'package:exam_at/pages/homepage/leaderboard/leaderboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeaderBord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LeaderBoarderProvider(),
      child: Consumer<LeaderBoarderProvider>(
        builder: (context, value, child) => ListView.builder(
            itemCount: 2, itemBuilder: (context, index) => Text('${value.leaderbordModel?.firstName}')),
      ),
    );
  }
}
