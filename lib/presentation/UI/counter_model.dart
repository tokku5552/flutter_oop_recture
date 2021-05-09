import 'package:flutter/material.dart';
import 'package:flutter_oop_recture/domain/counter_base.dart';
import 'package:flutter_oop_recture/domain/hour_counter.dart';
import 'package:flutter_oop_recture/domain/simple_counter.dart';

class CounterModel extends ChangeNotifier {
  int get count => counter.counter;
  CounterBase counter;
  bool isChangedHourCounter;

  void init() {
    isChangedHourCounter = true;
    counter = HourCounter();
  }

  void increment() {
    counter.increment();
    notifyListeners();
  }

  void switchCounter() {
    if (isChangedHourCounter) {
      counter = SimpleCounter();
      isChangedHourCounter = false;
    } else {
      counter = HourCounter();
      isChangedHourCounter = true;
    }
    notifyListeners();
  }
}
