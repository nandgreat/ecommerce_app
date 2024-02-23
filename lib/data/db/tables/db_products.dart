import 'package:hive/hive.dart';
part 'db_products.g.dart';

@HiveType(typeId: 1)
class Product {

  @HiveField(0)
  late String title;

  @HiveField(1)
  late String image;

  @HiveField(2)
  late String description;

  @HiveField(3)
  late double rating;

  @HiveField(4)
  late int amount;
}