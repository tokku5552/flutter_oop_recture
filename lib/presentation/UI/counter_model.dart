import 'package:flutter/material.dart';
import 'package:flutter_oop_recture/domain/counter_base.dart';
import 'package:flutter_oop_recture/domain/counter_type.dart';
import 'package:flutter_oop_recture/domain/hour_counter.dart';
import 'package:flutter_oop_recture/domain/simple_counter.dart';
import 'package:flutter_oop_recture/domain/storage_repository_base.dart';

class CounterModel extends ChangeNotifier {
  CounterModel({@required StorageRepositoryBase storageRepository})
      : _storageRepository = storageRepository;

  final StorageRepositoryBase _storageRepository;

  int get count => counter?.counter;
  CounterBase counter;
  bool isChangedHourCounter = true;
  CounterType counterType;

  Future<void> init() async {
    final bool isExistKey = await _storageRepository.isExistKey(key_counter);
    if (isExistKey) {
      final String loadKey =
          await _storageRepository.loadPersistenceStorage(key_counter);
      counterType = Counter.from(loadKey);
    } else {
      counterType = CounterType.hourCounter;
    }
    switch (counterType) {
      case CounterType.hourCounter:
        isChangedHourCounter = true;
        counter = HourCounter();
        break;
      case CounterType.simpleCounter:
        isChangedHourCounter = false;
        counter = SimpleCounter();
        break;
      default:
        isChangedHourCounter = true;
        counter = HourCounter();
    }
    notifyListeners();
  }

  void increment() {
    counter.increment();
    notifyListeners();
  }

  Future<void> switchCounter() async {
    if (isChangedHourCounter) {
      counter = SimpleCounter();
      isChangedHourCounter = false;
      await _storageRepository.savePersistenceStorage(
          key_counter, CounterType.simpleCounter.value);
    } else {
      counter = HourCounter();
      isChangedHourCounter = true;
      await _storageRepository.savePersistenceStorage(
          key_counter, CounterType.hourCounter.value);
    }
    notifyListeners();
  }
}
