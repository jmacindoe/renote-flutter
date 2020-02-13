import 'package:optional/optional.dart';

enum EditorMode { add, edit }

class EditorState {
  final String body;
  final Optional<int> dueDays;
  final EditorMode mode;
  final bool finishedEditing;

  EditorState(this.body, this.dueDays, this.mode, this.finishedEditing);
}
