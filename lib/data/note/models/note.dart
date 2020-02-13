import 'package:flutter/foundation.dart';
import 'package:renote/data/note/entities/note_entity.dart';
import 'package:renote/data/note/models/due_data.dart';
import 'package:time_machine/time_machine.dart';

class Note {
  final String id;
  final DateTime createdAt;
  final DateTime lastUpdatedAt;
  final String deckId;
  final DueData due;
  final String body;

  factory Note({
    String id,
    String createdAt,
    String lastUpdatedAt,
    String deckId,
    @required DueData due,
    @required String body,
  }) {
    final now = DateTime.now();
    return Note._internal(
        id, createdAt ?? now, lastUpdatedAt ?? now, deckId, due, body);
  }

  Note._internal(
    this.id,
    this.createdAt,
    this.lastUpdatedAt,
    this.deckId,
    this.due,
    this.body,
  );

  Note copyWith({
    String id,
    DateTime createdAt,
    DateTime lastUpdatedAt,
    String deckId,
    DueData due,
    String body,
  }) {
    return Note._internal(
      id ?? this.id,
      createdAt ?? this.createdAt,
      lastUpdatedAt ?? this.lastUpdatedAt,
      deckId ?? this.deckId,
      due ?? this.due,
      body ?? this.body,
    );
  }

  @override
  String toString() {
    return 'Note id: $id, createdAt: $createdAt, lastUpdatedAt: $lastUpdatedAt, deckId: $deckId, due: $due, body: $body';
  }

  NoteEntity toEntity() {
    return NoteEntity(
      id: id,
      createdAt: createdAt,
      lastUpdatedAt: lastUpdatedAt,
      deckId: deckId,
      nextDue: due.nextDue.epochDay,
      dueEveryDays: due.dueEveryDays,
      body: body,
    );
  }

  static Note fromEntity(NoteEntity entity) {
    return Note._internal(
        entity.id,
        entity.createdAt,
        entity.lastUpdatedAt,
        entity.deckId,
        DueData(LocalDate.fromEpochDay(entity.nextDue), entity.dueEveryDays),
        entity.body);
  }
}
