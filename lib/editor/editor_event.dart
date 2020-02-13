abstract class EditorEvent {}

class BodyUpdatedEvent extends EditorEvent {
  final String body;

  BodyUpdatedEvent(this.body);
}

class DueDateUpdatedEvent extends EditorEvent {
  final int days;

  DueDateUpdatedEvent(this.days);
}

class FinishedEditingEvent extends EditorEvent {}
