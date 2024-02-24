import 'dart:convert';

import 'Product.dart';


DummyProductsResponse dummyProductsResponseFromJson(String str) => DummyProductsResponse.fromJson(json.decode(str));
String dummyProductsResponseToJson(DummyProductsResponse data) => json.encode(data.toJson());
class DummyProductsResponse {
  DummyProductsResponse({
      List<Products>? products, 
      num? total, 
      num? skip, 
      num? limit,}){
    _products = products;
    _total = total;
    _skip = skip;
    _limit = limit;
}

  DummyProductsResponse.fromJson(dynamic json) {
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _total = json['total'];
    _skip = json['skip'];
    _limit = json['limit'];
  }
  List<Products>? _products;
  num? _total;
  num? _skip;
  num? _limit;
DummyProductsResponse copyWith({  List<Products>? products,
  num? total,
  num? skip,
  num? limit,
}) => DummyProductsResponse(  products: products ?? _products,
  total: total ?? _total,
  skip: skip ?? _skip,
  limit: limit ?? _limit,
);
  List<Products>? get products => _products;
  num? get total => _total;
  num? get skip => _skip;
  num? get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    map['skip'] = _skip;
    map['limit'] = _limit;
    return map;
  }

}
