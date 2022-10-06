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
            : Scaffold(
                appBar: AppBar(
                  title: const Center(
                    child: Text(
                      'LeaderBoarder',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  iconTheme: const IconThemeData(
                    color: Colors.white
                  ),  
                  backgroundColor: const Color.fromRGBO(255,102,0, 0.8),
                ),
                body: ListView.builder(
                  itemCount: value.list.length,
                  itemBuilder: (context, index) => Container(
                    child: Text('${value.list[index]}'),
                  ),
                ),
              ),
      ),
    );
  }
}
