import 'package:hive/hive.dart';

part 'cart_items.g.dart';

@HiveType(typeId: 1)
class CartItem {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? image;

  @HiveField(2)
  String? description;

  @HiveField(3)
  double? rating;

  @HiveField(4)
  int? amount;

  @HiveField(5)
  int? quantity;

  @HiveField(6)
  int? totalAmount;

  CartItem({this.title, this.image, this.description, this.rating, this.amount,
      this.quantity, this.totalAmount});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['title'] = title;
    map['image'] = image;
    map['description'] = description;
    map['rating'] = rating;
    map['amount'] = amount;
    map['quantity'] = quantity;
    map['totalAmount'] = totalAmount;

    return map;
  }
}
