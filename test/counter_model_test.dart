import 'package:flutter_oop_recture/domain/counter_type.dart';
import 'package:flutter_oop_recture/domain/storage_repository_base.dart';
import 'package:flutter_oop_recture/presentation/UI/counter_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'infrastructure/storage_mem_repository.dart';

void main() {
  // テスト用のメソッドを使いたいので、型はテスト用repositoryの方を指定する
  final StorageMemRepository storageRepository = StorageMemRepository();
  group('init', () {
    test('shared_preferencesに値がない場合', () async {
      storageRepository.clear();
      final model = CounterModel(storageRepository: storageRepository);
      await model.init();

      // isChangeHourCounterは初期状態のtrueのままであること
      expect(model.isChangedHourCounter, true);
      model.dispose();
    });

    test('shared_preferencesにSimpleCounterが設定してある場合', () async {
      storageRepository.clear();
      // あらかじめsimpleCounterの方をセットしておく
      await storageRepository.savePersistenceStorage(
          key_counter, CounterType.simpleCounter.value);
      final model = CounterModel(storageRepository: storageRepository);
      await model.init();

      // isChangeHourCounterはfalseであること
      expect(model.isChangedHourCounter, false);
      model.dispose();
    });
  });

  group('increment', () {
    test('increment', () async {
      storageRepository.clear();
      final model = CounterModel(storageRepository: storageRepository);
      await model.init();

      // countが0であること
      expect(model.count, 0);

      // incrementしたらcountが1になること
      model.increment();
      expect(model.count, 1);
      model.dispose();
    });
  });

  group('switchCounter', () {
    test('SimpleCounter', () async {
      storageRepository.clear();
      // あらかじめsimpleCounterの方をセットしておく
      await storageRepository.savePersistenceStorage(
          key_counter, CounterType.simpleCounter.value);
      final model = CounterModel(storageRepository: storageRepository);
      await model.init();

      // switchCounterを呼ぶ前はSimpleCounterがセットされていること
      expect(model.isChangedHourCounter, false);
      final counterType =
          await storageRepository.loadPersistenceStorage(key_counter);
      expect(Counter.from(counterType), CounterType.simpleCounter);

      await model.switchCounter();
      // switchCounterを読んだ後はHourCounterがセットされていること
      expect(model.isChangedHourCounter, true);
      final counterType1 =
          await storageRepository.loadPersistenceStorage(key_counter);
      expect(Counter.from(counterType1), CounterType.hourCounter);
      model.dispose();
    });

    test('HourCounter', () async {
      storageRepository.clear();
      // あらかじめsimpleCounterの方をセットしておく
      await storageRepository.savePersistenceStorage(
          key_counter, CounterType.hourCounter.value);
      final model = CounterModel(storageRepository: storageRepository);
      await model.init();

      // switchCounterを呼ぶ前はHourCounterがセットされていること
      expect(model.isChangedHourCounter, true);
      final counterType =
          await storageRepository.loadPersistenceStorage(key_counter);
      expect(Counter.from(counterType), CounterType.hourCounter);

      await model.switchCounter();
      // switchCounterを読んだ後はSimpleCounterがセットされていること
      expect(model.isChangedHourCounter, false);
      final counterType1 =
          await storageRepository.loadPersistenceStorage(key_counter);
      expect(Counter.from(counterType1), CounterType.simpleCounter);
      model.dispose();
    });
  });
}
