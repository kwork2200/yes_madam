import 'package:get_storage/get_storage.dart';

class GetStorageData {
  final storage = GetStorage();


  saveStorage(String key, var data) {
    storage.write(key, data);
  }

  getStorage(String key) {
    return storage.read(key);
  }

  removeStorage(String key) {
    storage.remove(key);
  }
}
