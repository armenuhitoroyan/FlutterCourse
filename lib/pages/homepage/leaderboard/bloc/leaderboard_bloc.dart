import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../api/project_api.dart';
import '../../../../models/leaderboard.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc() : super(LeaderboardState()) {
    on<LoadLeaderbordsEvent>((event, emit) async {
      emit(
        state.copyWith(
          leaderboards: event.leaderboards,
          isLoading: true,
        ),
      );

      final result = await ProjectAPI().leaderbordApi.getLeaderBoardData();
      event.leaderboards = result;

      print(event.leaderboards!.length);

      emit(
        state.copyWith(
          leaderboards: event.leaderboards,
          isLoading: false,
        ),
      );
    });
  }
}
