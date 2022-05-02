part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchLoading extends SearchState {
  SearchLoading({this.query});
  String? query;
}

class SearchLoaded extends SearchState {
  SearchLoaded({this.searchResponse});
  SearchResponse? searchResponse;
}

class SearchNoSuggestion extends SearchState {
  SearchNoSuggestion({this.query});
  String? query;
}

class SearchError extends SearchState {
  SearchError({this.query});
  String? query;
}
