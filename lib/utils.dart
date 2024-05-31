import 'rpe_table.dart';

double calculateE1RM(double load, int reps, String rpe) {
  double e1rm = 0.0;

  rpeTable.forEach((key, value) {
    if (key == rpe) {
      e1rm = (load / value[reps - 1]) * 100;
      e1rm = (e1rm / 2.5).roundToDouble() * 2.5;
    }
  });

  return e1rm;
}

