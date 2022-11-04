part of 'leaderboard_bloc.dart';

@immutable
abstract class LeaderboardEvent extends Equatable {
  const LeaderboardEvent();

  @override
  List<Object> get props => [];
}

class LoadLeaderbordsEvent extends LeaderboardEvent {
  List<LeaderbordModel>? leaderboards;
  // bool isLoading;

  LoadLeaderbordsEvent(
    this.leaderboards,
    // this.isLoading,
  );
}