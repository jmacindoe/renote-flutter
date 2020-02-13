import 'package:renote/data/note/models/note.dart';

abstract class NoteRepository {
  String newDocumentId();
  Future<void> add(Note note);
  Future<void> delete(Note note);
  Future<void> update(Note note);
  Stream<List<Note>> dueToday();
  Future<List<Note>> search(String query);
}
