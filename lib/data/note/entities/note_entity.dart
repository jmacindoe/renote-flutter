import 'package:cloud_firestore/cloud_firestore.dart';

class NoteEntity {
  final String id;
  final DateTime createdAt;
  final DateTime lastUpdatedAt;
  final String deckId;
  final int nextDue;
  final int dueEveryDays;
  final String body;

  NoteEntity({
    this.id,
    this.createdAt,
    this.lastUpdatedAt,
    this.deckId,
    this.nextDue,
    this.dueEveryDays,
    this.body,
  });

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'createdAt': createdAt,
      'lastUpdatedAt': lastUpdatedAt,
      'deckId': deckId,
      'nextDue': nextDue,
      'dueEveryDays': dueEveryDays,
      'body': body,
    };
  }

  static NoteEntity fromSnapshot(DocumentSnapshot snap) {
    return NoteEntity(
      id: snap.documentID,
      createdAt: snap['createdAt'],
      lastUpdatedAt: snap['lastUpdatedAt'],
      deckId: snap['deckId'],
      nextDue: snap['nextDue'],
      dueEveryDays: snap['dueEveryDays'],
      body: snap['body'],
    );
  }

  @override
  String toString() {
    return 'NoteEntity id: $id, createdAt: $createdAt, lastUpdatedAt: $lastUpdatedAt, deckId: $deckId, nextDue: $nextDue, dueEveryDays: $dueEveryDays, body: $body';
  }
}
