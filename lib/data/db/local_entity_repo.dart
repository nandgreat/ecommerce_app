import 'dart:convert';
import 'package:hive/hive.dart';
import 'local_entity.dart';

class LocalEntityRepository {

  final String boxName;

  LocalEntityRepository({required this.boxName});

  Future<void> createOrUpdate(LocalEntity data) async {
    await Hive.box<String>(boxName)
        .put(data.key, jsonEncode(data));
  }
  Future<void> saveList(LocalEntity data) async {
    await Hive.box<String>(boxName)
        .put(data.key, jsonEncode(data));
  }

  Future<void> deleteData(String id) async {
    Hive.box<String>(boxName).delete(id);
  }
}