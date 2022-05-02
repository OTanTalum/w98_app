part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchTypeEvent extends SearchEvent {
  SearchTypeEvent({this.query});
  String? query;

  @override
  List<Object?> get props => [query];
}

class SearchTypeRequestEvent extends SearchEvent {
  SearchTypeRequestEvent({this.query});
  String? query;

  @override
  List<Object?> get props => [query];
}

class SearchTypingCompleteEvent extends SearchEvent {
  SearchTypingCompleteEvent({required this.searchResponse});
  SearchResponse? searchResponse;

  @override
  List<Object?> get props => [];
}
