import 'package:bloc/bloc.dart';
import 'package:renote/data/note/note_repository.dart';
import 'package:renote/search/search_event.dart';
import 'package:renote/search/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final NoteRepository _noteRepository;

  SearchBloc(this._noteRepository);

  @override
  SearchState get initialState => SearchState([]);

  @override
  Stream<SearchState> mapEventToState(event) async* {
    if (event is SearchQueryUpdated) {
      // TODO: error handling, loading and empty states
      final results = await _noteRepository.search(event.newQuery);
      yield SearchState(results);
    } else {
      throw ArgumentError("Unknown event: $event");
    }
  }
}
