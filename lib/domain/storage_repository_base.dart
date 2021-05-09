abstract class StorageRepositoryBase {
  Future<void> savePersistenceStorage(String key, String value);
  Future<String> loadPersistenceStorage(String key);
  Future<bool> isExistKey(String key);
  Future<void> remove(String key);
}

const String key_counter = 'key_counter';
