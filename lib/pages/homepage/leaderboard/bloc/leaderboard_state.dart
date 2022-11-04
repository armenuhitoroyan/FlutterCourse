part of 'leaderboard_bloc.dart';

abstract class LeaderboardState extends Equatable {}

class LeaderboardLoadingState extends LeaderboardState {
  @override
  List<Object> get props => [];
}

class LeaderboardLoadedState extends LeaderboardState {
  final List<LeaderbordModel> leaderboards;

  LeaderboardLoadedState(this.leaderboards);

  @override
  List<Object> get props => [leaderboards];
}

class LeaderboardErrorState extends LeaderboardState {
  final String error;
  LeaderboardErrorState(this.error);

  @override
  List<Object> get props => [error];
}
