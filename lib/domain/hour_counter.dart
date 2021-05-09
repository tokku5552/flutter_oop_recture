import 'package:flutter_oop_recture/domain/modular_counter.dart';

class HourCounter extends ModularCounter {
  HourCounter() : super(12);

  @override
  void increment() {
    super.counter++;
    reset();
  }

  @override
  void reset() {
    super.reset();
  }
}
