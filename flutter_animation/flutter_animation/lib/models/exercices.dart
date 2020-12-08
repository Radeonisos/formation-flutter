import 'dart:math';

class Exercices {
  int week;
  List<int> runs;

  Exercices(this.week) {
    runs = [];
    for (var x = 0; x < 7; x++) {
      runs.add(Random().nextInt(15));
    }
  }
}
