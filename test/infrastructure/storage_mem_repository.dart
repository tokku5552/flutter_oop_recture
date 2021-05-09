import 'package:flutter_oop_recture/domain/storage_repository_base.dart';

class StorageMemRepository implements StorageRepositoryBase {
  final Map<String, String> _data = <String, String>{};

  void clear() {
    _data.clear();
  }

  @override
  Future<bool> isExistKey(String key) {
    return Future<bool>.value(_data[key] != null);
  }

  @override
  Future<String> loadPersistenceStorage(String key) {
    return Future<String>.value(_data[key]);
  }

  @override
  Future<void> savePersistenceStorage(String key, String value) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    _data[key] = value;
  }

  @override
  Future<void> remove(String key) async {
    _data[key] = null;
  }
}
