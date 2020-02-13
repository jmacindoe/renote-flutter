import 'package:renote/model/Note.dart';

class SearchRepository {
  Future<List<Note>> search(String query) {
    final notes = [1, 2, 3, 4].map((n) => Note("$n", "$query $n", n)).toList();
    return Future.value(notes);
  }
}
