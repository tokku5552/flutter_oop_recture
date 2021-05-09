import 'package:flutter/material.dart';
import 'package:flutter_oop_recture/domain/counter_base.dart';
import 'package:flutter_oop_recture/domain/hour_counter.dart';

class CounterModel extends ChangeNotifier {
  int get count => counter.counter;
  CounterBase counter;

  void init() {
    counter = HourCounter();
  }

  void increment() {
    counter.increment();
    notifyListeners();
  }
}
