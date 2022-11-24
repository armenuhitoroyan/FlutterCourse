import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/streams.dart';

part 'searching_event.dart';
part 'searching_state.dart';


class SearchingBloc extends Bloc<SearchingEvent, SearchingState> {
  late bool isLoad;
  String query = '';

  SearchingBloc() : super(SearchingState()) {
    on<SearchedEvent>(_onSearchEvent);
  }

  _onSearchEvent(SearchedEvent event, Emitter<SearchingState> emit) async {

    Stream.fromIterable([])
        .debounce((_) => TimerStream(true, Duration(seconds: 0)))
        .listen(print); //

    if (event.value.isNotEmpty) {
      isLoad = true;
      query = event.value;
      print('1 $isLoad');
    } else {
      isLoad = false;
      query = '';
      print('2 $isLoad');
    }

    emit(state.copyWith(isLoaded: await isLoad, data: await query));
    // print('4 ${state.isLoaded}');
    print('data: ${state.data}');
  }
}
