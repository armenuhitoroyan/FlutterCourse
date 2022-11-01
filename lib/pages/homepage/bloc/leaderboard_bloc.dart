import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../api/project_api.dart';
import '../../../models/leaderboard.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  List<LeaderbordModel> list = [];
  final ProjectAPI _projectAPI;
  LeaderboardBloc(this._projectAPI) : super(LeaderboardLoadingState()) {
    on<LoadLeaderbordEvent>((event, emit) async {
      emit(LeaderboardLoadingState());
      try {
        final leaderboards =
            await _projectAPI.leaderbordApi.getLeaderBoardData();
        emit(LeaderboardLoadedState(leaderboards));
      } catch (e) {
        emit(LeaderboardErrorState(e.toString()));
      }

    });
  }
}
