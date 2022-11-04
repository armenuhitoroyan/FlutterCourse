part of 'leaderboard_bloc.dart';

class LeaderboardState extends Equatable {
  List<LeaderbordModel> leaderboards;
  bool isLoading;

  LeaderboardState({
    this.leaderboards = const [],
    this.isLoading = false,
  });

  LeaderboardState copyWith({
    List<LeaderbordModel>? leaderboards,
    bool? isLoading,
  }) {
    return LeaderboardState(
      leaderboards: leaderboards ?? this.leaderboards,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
    leaderboards,
    isLoading,
  ];
}
