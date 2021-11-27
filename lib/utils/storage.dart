import 'package:storage_wrapper/storage_wrapper.dart';
import 'package:stripling_wallet/utils/enums.dart';

class StorageSystem {
  StorageWrapper? storage;

  StorageSystem(StorageType storageType) {
    if (storageType == StorageType.Common) {
      storage = StorageWrapper.common();
    } else {
      storage = StorageWrapper.secure();
    }
  }

  Future<void> setItem(String key, String value) async {
    await storage!.write(key: key, value: value);
  }

  Future<void> getItem(String key) async {
    await storage!.read(key: key);
  }

  Future<void> deleteItem(String key) async {
    await storage!.delete(key: key);
  }

  Future<void> deleteAll() async {
    await storage!.deleteAll();
  }

  Future<bool> containsKey(String key) async {
    return await storage!.containsKey(key: key);
  }

  Future<Map<String, dynamic>> getAllItems() async {
    return await storage!.getAll();
  }
}
