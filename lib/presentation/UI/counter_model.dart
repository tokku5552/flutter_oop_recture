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

  // 本来あまり望ましくないが、初期化処理の中で_counterを初期化するので
  // _counterから安全呼び出しでcountの値を読み込んでいる
  int get count => _counter?.counter;
  bool isChangedHourCounter = true;
  CounterBase _counter;
  CounterType _counterType;

  /// このmodelの初期化処理
  /// shared_preferencesに保存されているCounterのタイプがあるかどうかを判断して
  /// あればそのCounterを代入し、なければHourCounterを代入する
  Future<void> init() async {
    final bool isExistKey = await _storageRepository.isExistKey(key_counter);
    if (isExistKey) {
      final String loadKey =
          await _storageRepository.loadPersistenceStorage(key_counter);
      _counterType = Counter.from(loadKey);
    } else {
      _counterType = CounterType.hourCounter;
    }
    switch (_counterType) {
      case CounterType.hourCounter:
        isChangedHourCounter = true;
        _counter = HourCounter();
        break;
      case CounterType.simpleCounter:
        isChangedHourCounter = false;
        _counter = SimpleCounter();
        break;
      default:
        isChangedHourCounter = true;
        _counter = HourCounter();
    }
    notifyListeners();
  }

  /// Counterのincrementメソッドを呼ぶ
  /// counterにはスーパークラスにincrementが定義されているので
  /// SimpleCounterでもHourCounterでもincrementを呼び出すことが出来る
  void increment() {
    _counter.increment();
    notifyListeners();
  }

  /// SwitchがtrueかfalseかでCounterを切り替えて
  /// 同時にshared_preferencesに保存する
  Future<void> switchCounter() async {
    if (isChangedHourCounter) {
      _counter = SimpleCounter();
      isChangedHourCounter = false;
      await _storageRepository.savePersistenceStorage(
          key_counter, CounterType.simpleCounter.value);
    } else {
      _counter = HourCounter();
      isChangedHourCounter = true;
      await _storageRepository.savePersistenceStorage(
          key_counter, CounterType.hourCounter.value);
    }
    notifyListeners();
  }
}
