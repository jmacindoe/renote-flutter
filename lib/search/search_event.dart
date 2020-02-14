abstract class SearchEvent {}

class SearchQueryUpdated extends SearchEvent {
  final String newQuery;

  SearchQueryUpdated(this.newQuery);

  @override
  String toString() => 'SearchQueryUpdated newQuery: $newQuery';
}
