import 'package:get_storage/get_storage.dart';

class ShopLocalStorage{
  static final ShopLocalStorage _instance = ShopLocalStorage._internal();

  factory ShopLocalStorage() {
    return _instance;
  }

  ShopLocalStorage._internal();

  final _storage = GetStorage();

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  //Generic method to read
  T? readData<T>(String key){
    return _storage.read(key);
  }

  //Generic method to remove data
  Future<void> removeData<T>(String key) async {
    await _storage.remove(key);
  }

  //Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}