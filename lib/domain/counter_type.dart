enum CounterType {
  simpleCounter,
  hourCounter,
  none,
}

extension Counter on CounterType {
  String get value => toString().split('.').last;
  static CounterType from(String value) =>
      CounterType.values.firstWhere((type) => type.value == value,
          orElse: () => CounterType.none);
}
