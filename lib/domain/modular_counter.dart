import 'package:flutter_oop_recture/domain/counter_base.dart';

/// 法をもつカウンターの抽象クラス
/// コンストラクタで初期化されるフィールド modularを持ち
/// modularの法を持ったカウンターを作成する
abstract class ModularCounter extends CounterBase {
  ModularCounter(this.modular);
  final int modular;

  /// ModularCounterにはリセット機能を実装するよう強制する
  /// スーパークラスのcounterを用いて実装しておく
  void reset() {
    // 明示的にsuper.counterと書かなくとも、スーパークラスのフィールドが使える
    if (counter >= modular) {
      counter = 0;
    }
  }
}
