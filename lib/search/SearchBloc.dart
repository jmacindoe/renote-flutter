import 'package:bloc/bloc.dart';
import 'package:renote/model/Note.dart';
import 'package:renote/search/SearchEvent.dart';
import 'package:renote/search/SearchRepository.dart';
import 'package:renote/search/SearchState.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository;

  SearchBloc(this._searchRepository);

  @override
  SearchState get initialState => SearchState([]);

  @override
  Stream<SearchState> mapEventToState(event) async* {
    if (event is SearchQueryUpdated) {
      // TODO: error handling
      final results = await _searchRepository.search(event.newQuery);
      yield SearchState(results);
    } else {
      throw ArgumentError("Unknown event: $event");
    }
  }
}
