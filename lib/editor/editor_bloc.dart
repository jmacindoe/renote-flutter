import 'package:bloc/bloc.dart';
import 'package:optional/optional.dart';
import 'package:renote/data/note/models/due_data.dart';
import 'package:renote/data/note/models/note.dart';
import 'package:renote/data/note/note_repository.dart';
import 'package:renote/editor/editor_event.dart';
import 'package:renote/editor/editor_state.dart';
import 'package:time_machine/time_machine.dart';

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  final Optional<Note> initialNote;
  final NoteRepository noteRepository;

  EditorBloc(this.initialNote, this.noteRepository);

  String get uneditedBody => initialNote.map((note) => note.body).orElse("");
  Optional<int> get uneditedDueDays =>
      initialNote.map((note) => note.due.dueEveryDays);

  @override
  EditorState get initialState {
    if (initialNote.isPresent) {
      final note = initialNote.value;
      return EditorState(note.body, Optional.of(note.due.dueEveryDays),
          EditorMode.edit, false);
    } else {
      return EditorState(
        "",
        Optional.empty(),
        EditorMode.add,
        false,
      );
    }
  }

  @override
  Stream<EditorState> mapEventToState(EditorEvent event) async* {
    if (event is BodyUpdatedEvent) {
      yield EditorState(
          event.body, state.dueDays, state.mode, state.finishedEditing);
    } else if (event is DueDateUpdatedEvent) {
      yield EditorState(state.body, Optional.of(event.days), state.mode,
          state.finishedEditing);
    } else if (event is FinishedEditingEvent) {
      yield* _mapFinishedEditingToState();
    } else {
      throw ArgumentError("Unknown event: $event");
    }
  }

  Stream<EditorState> _mapFinishedEditingToState() async* {
    if (state.mode == EditorMode.add) {
      // TODO: progress indicator for this
      // TODO: will throw if due date not selected. Enforce this in the UI.
      await noteRepository.add(Note(
          id: noteRepository.newDocumentId(),
          due: _buildDueData(state.dueDays.value),
          body: state.body));
    } else {
      await noteRepository.update(initialNote.value.copyWith(
          due: _buildDueData(state.dueDays.value),
          body: state.body,
          lastUpdatedAt: DateTime.now()));
    }
    yield EditorState(state.body, state.dueDays, state.mode, true);
  }

  DueData _buildDueData(int dueDays) {
    return DueData(
        LocalDate.today().addDays(state.dueDays.value), state.dueDays.value);
  }
}
