import 'package:time_machine/time_machine.dart';

class DueData {
  final LocalDate nextDue;
  final int dueEveryDays;

  DueData(this.nextDue, this.dueEveryDays);
}
