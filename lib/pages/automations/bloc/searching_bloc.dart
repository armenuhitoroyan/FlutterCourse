import 'dart:async';
import 'dart:js_util';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ranger/pages/homepage/bloc/scanner_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/streams.dart';

part 'searching_event.dart';
part 'searching_state.dart';

Timer? _debounce;

class SearchingBloc extends Bloc<SearchingEvent, SearchingState> {
  late bool isLoad;
  String query = '';

  SearchingBloc() : super(SearchingState()) {
    on<SearchedEvent>(
      _onSearchEvent,
      transformer: (events, mapper) => events
        .debounceTime(const Duration(seconds: 1))
        .switchMap(mapper),
    );
  }

  _onSearchEvent(
      SearchedEvent searchedEvent, Emitter<SearchingState> emit) async {
    // if (_debounce?.isActive ?? false) _debounce!.cancel();
    // _debounce = Timer(const Duration(milliseconds: 500), () {
    //   // do something with query
    // });

    List<String> list = [];
    var debouncedThing = Stream.fromIterable([query]);

    if (debouncedThing.isBroadcast == false) {
      debouncedThing.doOnCancel(() => debouncedThing);
    }

    if (searchedEvent.value.isNotEmpty) {
      // debouncedThing.debounce(
      //     (_) => TimerStream(isLoad, const Duration(milliseconds: 2000)));
      // debouncedThing.listen(print);
      isLoad = true;
      query = searchedEvent.value;
      print('1 $isLoad');
    } else {
      // debouncedThing.debounce(
      //     (_) => TimerStream(isLoad, const Duration(milliseconds: 2000)));
      isLoad = false;
      query = '';
      print('2 $isLoad');
    }

    // debouncedThing.forEach((element) {
    //   print('element: $element');
    //   print('element type: ${element.runtimeType}');

    //   list.add(element);
    //  
    //   debouncedThing.listen(print);

    //   print('state data: ${state.data}');
    // });

    emit(state.copyWith(isLoaded: isLoad, data: query));

    print('length: ${list.length}');
  }
}
