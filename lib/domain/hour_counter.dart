import 'package:flutter_oop_recture/domain/modular_counter.dart';

class HourCounter extends ModularCounter {
  HourCounter(int modular) : super(modular);

  @override
  void increment() {
    super.counter++;
  }

  @override
  void reset() {
    // TODO: implement reset
  }
}
