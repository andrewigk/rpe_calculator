class RPELabel {
  final String label;
  final double value;

  const RPELabel(this.label, this.value);

  // Define your RPE levels as constants
  static const RPELabel rpe6 = RPELabel('6', 6.0);
  static const RPELabel rpe65 = RPELabel('6.5', 6.5);
  static const RPELabel rpe7 = RPELabel('7', 7.0);
  static const RPELabel rpe75 = RPELabel('7.5', 7.5);
  static const RPELabel rpe8 = RPELabel('8', 8.0);
  static const RPELabel rpe85 = RPELabel('8.5', 8.5);
  static const RPELabel rpe9 = RPELabel('9', 9.0);
  static const RPELabel rpe95 = RPELabel('9.5', 9.5);
  static const RPELabel rpe10 = RPELabel('10', 10);


  // Add a list of all RPE options
  static const List<RPELabel> allRPEs = [
    rpe6, rpe65, rpe7, rpe75, rpe8, rpe85, rpe9, rpe95, rpe10
  ];
}

class RepLabel {
  final String label;
  final double value;

  const RepLabel(this.label, this.value);

  // Define your RPE levels as constants
  static const RepLabel oneRep = RepLabel('1', 1);
  static const RepLabel twoReps = RepLabel('2', 2);
  static const RepLabel threeReps = RepLabel('3', 3);
  static const RepLabel fourReps = RepLabel('4', 4);
  static const RepLabel fiveReps = RepLabel('5', 5);
  static const RepLabel sixReps = RepLabel( '6', 6);
  static const RepLabel sevenReps = RepLabel( '7', 7);
  static const RepLabel eightReps = RepLabel('8', 8);
  static const RepLabel nineReps = RepLabel('9', 9);
  static const RepLabel tenReps = RepLabel('10', 10);


  // Add a list of all RPE options
  static const List<RepLabel> allREPS = [
      oneRep, twoReps, threeReps, fourReps, fiveReps, sixReps, sevenReps,
    eightReps, nineReps, tenReps
  ];
}