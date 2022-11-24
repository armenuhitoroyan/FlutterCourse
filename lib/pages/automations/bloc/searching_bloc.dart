import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'searching_event.dart';
part 'searching_state.dart';

Timer? _debounce;

class SearchingBloc extends Bloc<SearchingEvent, SearchingState> {
  late bool isLoad;
  String query = '';

  SearchingBloc() : super(SearchingState()) {
    on<SearchedEvent>(_onSearchEvent);
  }

  _onSearchEvent(SearchedEvent event, Emitter<SearchingState> emit) async {
    if (await _debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 0), () async {
      if (event.value.isNotEmpty) {
        isLoad = true;
        query = event.value;
        print('1 $isLoad');
      } else {
        isLoad = false;
        query = '';
        print('2 $isLoad');
      }
    });

    emit(state.copyWith(isLoaded: await isLoad, data: await query));
    // print('4 ${state.isLoaded}');
    print('data: ${state.data}');
  }
}
