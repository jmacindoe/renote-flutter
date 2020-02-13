import 'package:renote/data/note/models/due_data.dart';
import 'package:renote/data/note/models/note.dart';
import 'package:time_machine/time_machine.dart';

class SearchRepository {
  Future<List<Note>> search(String query) {
    final notes = [1, 2, 3, 4]
        .map((n) => Note(
            id: "$n", body: "$query $n", due: DueData(LocalDate.today(), n)))
        .toList();
    return Future.value(notes);
  }
}
