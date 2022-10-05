import 'package:exam_at/pages/homepage/leaderboard/leaderboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeaderBord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LeaderBoarderProvider(),
      child: Consumer<LeaderBoarderProvider>(
        builder: (context, value, child) => value.isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView.builder(
          itemCount: value.list.length,
          itemBuilder: (context, index) => 
            Text('${value.list[index]}'),
        ),
      ),
    );
  }
}
