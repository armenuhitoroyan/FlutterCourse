part of 'searching_bloc.dart';

abstract class SearchingEvent extends Equatable {
  const SearchingEvent();

  @override
  List<Object> get props => [];
}

class SearchedEvent extends SearchingEvent {
  final String value;

  SearchedEvent(this.value);
}
