/// Counterの基本となる抽象クラス
/// フィールドにはcounterを持ち
/// incrementというcounterをインクリメントするメソッドの
/// 実装を強制する
abstract class CounterBase {
  int counter = 0;
  void increment();
}
