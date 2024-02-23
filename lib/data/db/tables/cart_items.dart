import 'package:hive/hive.dart';
part 'cart_items.g.dart';

@HiveType(typeId: 1)
class CartItem {

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

  @HiveField(5)
  late int quantity;

  @HiveField(6)
  late int totalAmount;
}