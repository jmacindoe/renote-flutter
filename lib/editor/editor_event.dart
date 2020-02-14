abstract class EditorEvent {}

class BodyUpdatedEvent extends EditorEvent {
  final String body;

  BodyUpdatedEvent(this.body);

  @override
  String toString() => 'BodyUpdatedEvent body: $body';
}

class DueDateUpdatedEvent extends EditorEvent {
  final int days;

  DueDateUpdatedEvent(this.days);

  @override
  String toString() => 'DueDateUpdatedEvent days: $days';
}

class FinishedEditingEvent extends EditorEvent {}
