abstract class SearchEvent {}

class SearchQueryUpdated extends SearchEvent {
  SearchQueryUpdated(this.newQuery);

  final String newQuery;
}
