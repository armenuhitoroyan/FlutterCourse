import 'package:exam_at/models/leaderboard.dart';

import 'package:exam_at/pages/homepage/leaderboard/bloc/leaderboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/project_api.dart';

class LeaderBordS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeaderboardBloc(
        RepositoryProvider.of<ProjectAPI>(context),
      )..add(LoadLeaderbordEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'LeaderBoarder',
              style: TextStyle(color: Colors.white),
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromRGBO(255, 102, 0, 0.8),
        ),
        body: BlocBuilder<LeaderboardBloc, LeaderboardState>(
          builder: (context, state) {
            if (state is LeaderboardLoadingState) {
              //
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromRGBO(255, 102, 0, 0.8),
                ),
              );
            }

            if (state is LeaderboardLoadedState) {
              List<LeaderbordModel> listLeaderBoards = state.leaderboards;
              return Container(
                  child: ListView.builder(
                itemCount: listLeaderBoards.length,
                itemBuilder: (context, index) {
                  return Text('${listLeaderBoards[index].firstName}');
                },
              ));
            }

            return Container();

            if (state is LeaderboardErrorState) {
              return Center(
                child: Text('Error'),
              );
            }
          },
        ),
      ),
    );
  }
}
