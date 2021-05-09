import 'package:shared_preferences/shared_preferences.dart';

class PersistenceStorageProvider {
  PersistenceStorageProvider._();

  static final PersistenceStorageProvider instance =
      PersistenceStorageProvider._();
  SharedPreferences _prefs;

  Future<SharedPreferences> get prefs async {
    return _prefs ??= await initSharedPreferences();
  }

  Future<SharedPreferences> initSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }
}
