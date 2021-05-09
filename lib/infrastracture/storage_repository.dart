import 'package:flutter_oop_recture/domain/storage_repository_base.dart';
import 'package:flutter_oop_recture/infrastracture/persistant_storage_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository implements StorageRepositoryBase {
  final PersistenceStorageProvider _instance =
      PersistenceStorageProvider.instance;

  @override
  Future<void> savePersistenceStorage(String key, String value) async {
    final SharedPreferences pref = await _instance.prefs;
    await pref.setString(key, value);
  }

  @override
  Future<String> loadPersistenceStorage(String key) async {
    final SharedPreferences pref = await _instance.prefs;
    return pref.getString(key);
  }

  @override
  Future<bool> isExistKey(String key) async {
    final SharedPreferences pref = await _instance.prefs;
    return pref.containsKey(key);
  }

  @override
  Future<void> remove(String key) async {
    final SharedPreferences pref = await _instance.prefs;
    await pref.remove(key);
  }
}
