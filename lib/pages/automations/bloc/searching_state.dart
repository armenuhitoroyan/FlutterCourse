part of 'searching_bloc.dart';

class SearchingState extends Equatable {
  bool isLoaded;
  String data;

  SearchingState({
    this.isLoaded = false,
    this.data = '',
  });

  SearchingState copyWith({
    bool? isLoaded,
    String? data,
  }) {
    return SearchingState(
      isLoaded: isLoaded ?? this.isLoaded,
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => [];
}
