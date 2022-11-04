import 'package:exam_at/models/leaderboard.dart';

import 'package:exam_at/pages/homepage/leaderboard/bloc/leaderboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/project_api.dart';

class LeaderBordS extends StatelessWidget {
  List<LeaderbordModel> leaderboardsList = [];
  // ..sort((a, b) => a.score!.compareTo(b.score as num));

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => LeaderboardBloc()
        ..add(
          LoadLeaderbordsEvent(
            leaderboardsList,
            // ..sort((a, b) => a.score!.compareTo(b.score as num)),
          ),
        ),
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
            // print('state.leaderboardsList: ${state.leaderboards.length}');

            if (state.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              // state.leaderboards = state.leaderboards
              //   ..sort((a, b) => a.score!.compareTo(b.score as num));
              return Container(
                child: ListView.builder(
                  itemCount: state.leaderboards.length,
                  itemBuilder: (context, index) => Container(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 3, bottom: 3),
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              bottomRight: Radius.circular(45),
                            ),
                            side: BorderSide(
                              color: Color.fromARGB(255, 189, 187, 187),
                              //<-- SEE HERE
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Text('${index + 1}')),
                                if (state.leaderboards[index].userImageUrl !=
                                    null)
                                  CircleAvatar(
                                    radius: 40, // Image radius
                                    backgroundImage: NetworkImage(
                                        '${state.leaderboards[index].userImageUrl}'),
                                  )
                                else
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor:
                                        const Color.fromRGBO(255, 102, 0, 0.8),
                                    child: Text(
                                      // ignore: unnecessary_string_interpolations
                                      '${state.leaderboards[index].firstName![0]}',
                                      style: const TextStyle(fontSize: 35),
                                    ),
                                  ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, right: 7),
                                  child: Text(
                                    '${state.leaderboards[index].firstName}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    child: Text(
                                      '${state.leaderboards[index].score}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
