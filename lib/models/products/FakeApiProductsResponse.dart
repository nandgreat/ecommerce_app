import 'dart:convert';

import 'package:ecommerce_app/models/products/AnotherFakeApiProduct.dart';
import 'package:ecommerce_app/utils/helpers.dart';

FakeApiProductsResponse productsListResponseFromJson(String str) => FakeApiProductsResponse.fromJson(json.decode(str));

class FakeApiProductsResponse {
  FakeApiProductsResponse({List<AnotherFakeApiProduct>? products}) {
    _products = products;
  }


  FakeApiProductsResponse.fromJson(dynamic json) {
    _products = [];

    json.forEach((v) {
      var newthing = AnotherFakeApiProduct.fromJson(v);
      logItem(_products.runtimeType);
      _products?.add(newthing);
    });

  }

  List<AnotherFakeApiProduct>? _products;



  FakeApiProductsResponse copyWith({
    List<AnotherFakeApiProduct>? products,
  }) => FakeApiProductsResponse(
    products: products ?? _products,
  );

  List<AnotherFakeApiProduct>? get products => _products;

  Map<String, dynamic> toJson() {
    dynamic map;

    if (_products != null) {
      map = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
