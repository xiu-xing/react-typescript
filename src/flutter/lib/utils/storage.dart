import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static late SharedPreferences sharedPreferences;

  static Future<bool> getSPInstance() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return true;
  }
}

class SecureStorage {
  static final storage = new FlutterSecureStorage();

  static Future<String?> readValue({required String key}) async {
    return await storage.read(key: key);
  }

  static Future<bool> containersKey({required String key}) async {
    return await storage.containsKey(key: key);
  }

  static Future<void> writeValue(
      {required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  // Delete value
  static void deleteValue({required String key}) async {
    await storage.delete(key: key);
  }
}
