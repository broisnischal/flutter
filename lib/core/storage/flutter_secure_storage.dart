import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class FlutterSecure {
  static Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  static Future<void> write({
    required String key,
    required String value,
  }) async {
    await storage.write(key: key, value: value);
  }

  static Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    await storage.deleteAll();
  }

  static Future<Map<String, String>?> readAll() async {
    return await storage.readAll();
  }
}
