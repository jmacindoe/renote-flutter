class Strings {
  static const appName = "Renote";
  static final home = HomeStrings();
  static final search = SearchStrings();
  static final editor = EditorStrings();
}

class HomeStrings {
  final addNoteTooltip = "Add Note";
  final startReview = "Start Review";
}

class SearchStrings {
  final screenName = "Search";
}

class EditorStrings {
  final screenNameAdd = "Add Note";
  final screenNameEdit = "Edit Note";
  final showEveryDays = "Show every n days";
  final confirmDiscardEditTitle = "Discard changes?";
  final confirmDiscardAddTitle = "Discard note?";
  final confirmDiscardConfirmAction = "Discard";
  final confirmDiscardAbortAction = "Keep editing";
}
