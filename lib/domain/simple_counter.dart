import 'package:flutter_oop_recture/domain/counter_base.dart';

class SimpleCounter extends CounterBase {
  @override
  void increment() {
    super.counter++;
  }
}
