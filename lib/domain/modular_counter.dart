import 'package:flutter_oop_recture/domain/counter_base.dart';

abstract class ModularCounter extends CounterBase {
  ModularCounter(this.modular);
  final int modular;
  void reset() {
    if (counter >= modular) {
      counter = 0;
    }
  }
}
