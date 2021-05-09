import 'package:flutter_oop_recture/domain/modular_counter.dart';

/// ModularCounterを継承したクラスとしてHourCounterを実装する
/// 12の法を持ったカウンターとするため、デフォルトコンストラクタで
/// スーパークラスのコンストラクタに12を渡してmodular = 12　を
/// 設定する
class HourCounter extends ModularCounter {
  HourCounter() : super(12);

  @override
  void increment() {
    super.counter++;
    reset();
  }

  @override
  void reset() {
    // reset機能はスーパークラスの実装をそのまま使うため
    // 内部でsuper.reset()を呼ぶだけにしておく
    super.reset();
  }
}
