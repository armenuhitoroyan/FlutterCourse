part of 'leaderboard_bloc.dart';

@immutable
abstract class LeaderboardEvent extends Equatable {
  const LeaderboardEvent();
}

class LoadLeaderbordEvent extends LeaderboardEvent {

  @override
  List<Object> get props => [];
}
