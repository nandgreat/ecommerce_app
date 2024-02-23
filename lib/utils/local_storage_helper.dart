import 'dart:convert';

import 'package:ecommerce_app/models/login/LoginResponse.dart';
import 'package:ecommerce_app/utils/helpers.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/login/User.dart';

class LocalStorageHelper {
  final storage = const FlutterSecureStorage();

  storeItem({required String key, required String value}) async {
    try {
      await storage
          .write(key: key, value: value)
          .then((value) => print("Values saved successfully"));
    } catch (e) {
      logItem(e);
    }
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<String?> retrieveItem({required String key}) async {
    try {
      return await storage.read(key: key);
    } catch (e) {
      logItem(e);
    }
    return null;
  }

  Future<User?> getUser() async {
    try {
      var userString = await storage.read(key: "user");
      User? newThing = User.fromJson(jsonDecode(userString!.trim()));

      // var newUser = LoginResponse.fromJson(json.decode(userString!.trim())).data?.user;
      return newThing;
    } catch (e) {
      logItem(e);
    }
    return null;
  }

  Future<void> clearAll() async {
    try {
      await storage.deleteAll();
    } catch (e) {
      logItem(e);
    }
  }
}
