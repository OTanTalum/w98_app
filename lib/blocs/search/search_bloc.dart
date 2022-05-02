import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:w98app/models/search.dart';

import '../../servieces/api_repository.dart';
import '../../servieces/debouncer.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchNoSuggestion()) {
    Debouncer _debouncer = Debouncer(milliseconds: 500);

    on<SearchTypeEvent>((event, emit) async {
      await _debouncer.run();
      if (event.query!.length <= 3) return;
      emit(SearchLoading(query: event.query));
      add(SearchTypeRequestEvent(query: event.query));
    });

    on<SearchTypeRequestEvent>((event, emit) async {
      while (event.query!.isEmpty) {
        await Future.delayed(Duration(seconds: 1));
      }
      SearchResponse searchResponse = await Api().searchLocation(
        query: event.query,
      );
      emit(SearchLoaded(searchResponse: searchResponse));
      add(SearchTypingCompleteEvent(searchResponse: searchResponse));
    });

    on<SearchTypingCompleteEvent>((event, emit) {
      log("Finish Search");
    });
  }
}
