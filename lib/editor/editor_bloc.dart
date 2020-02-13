import 'package:bloc/bloc.dart';
import 'package:optional/optional.dart';
import 'package:renote/data/note/models/note.dart';
import 'package:renote/editor/editor_event.dart';
import 'package:renote/editor/editor_state.dart';

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  final Note initialNote;

  EditorBloc(this.initialNote);

  @override
  EditorState get initialState => EditorState(
      initialNote?.body ?? "",
      Optional.ofNullable(initialNote?.due),
      initialNote == null ? EditorMode.add : EditorMode.edit,
      false);

  @override
  Stream<EditorState> mapEventToState(EditorEvent event) async* {
    if (event is BodyUpdatedEvent) {
      yield EditorState(
          event.body, state.dueDays, state.mode, state.finishedEditing);
    } else if (event is DueDateUpdatedEvent) {
      yield EditorState(state.body, Optional.of(event.days), state.mode,
          state.finishedEditing);
    } else if (event is FinishedEditingEvent) {
      yield EditorState(state.body, state.dueDays, state.mode, true);
    } else {
      throw ArgumentError("Unknown event: $event");
    }
  }
}
