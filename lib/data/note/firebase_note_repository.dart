import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:renote/data/note/models/note.dart';

import 'entities/note_entity.dart';
import 'note_repository.dart';

class FirebaseNoteRepository implements NoteRepository {
  final noteCollection = Firestore.instance.collection('notes');

  @override
  String newDocumentId() {
    return noteCollection.document().documentID;
  }

  @override
  Future<void> add(Note note) {
    return noteCollection
        .document(note.id)
        .setData(note.toEntity().toDocument());
  }

  @override
  Future<void> delete(Note note) {
    return noteCollection.document(note.id).delete();
  }

  @override
  Future<void> update(Note note) {
    return noteCollection
        .document(note.id)
        .updateData(note.toEntity().toDocument());
  }

  @override
  Stream<List<Note>> dueToday() {
    // TODO: select only due notes
    return noteCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Note.fromEntity(NoteEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<List<Note>> search(String query) {
    // TODO: implement search
    return Future.value([]);
  }
}
