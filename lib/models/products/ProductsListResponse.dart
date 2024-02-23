import 'dart:convert';
ProductsListResponse productsListResponseFromJson(String str) => ProductsListResponse.fromJson(json.decode(str));
String productsListResponseToJson(ProductsListResponse data) => json.encode(data.toJson());
class ProductsListResponse {
  ProductsListResponse({
      String? status, 
      Pagination? pagination, 
      List<Products>? products,}){
    _status = status;
    _pagination = pagination;
    _products = products;
}

  ProductsListResponse.fromJson(dynamic json) {
    _status = json['status'];
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  String? _status;
  Pagination? _pagination;
  List<Products>? _products;
ProductsListResponse copyWith({  String? status,
  Pagination? pagination,
  List<Products>? products,
}) => ProductsListResponse(  status: status ?? _status,
  pagination: pagination ?? _pagination,
  products: products ?? _products,
);
  String? get status => _status;
  Pagination? get pagination => _pagination;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      Image? image, 
      String? productType, 
      List<dynamic>? categories, 
      List<dynamic>? tags, 
      List<dynamic>? manufacturers, 
      List<dynamic>? authors, 
      bool? isDeleted, 
      String? name,
      String? description, 
      num? price, 
      String? shopId, 
      num? quantity, 
      List<Attributes>? attributes, 
      List<Gallery>? gallery, 
      String? user, 
      String? createdAt, 
      String? updatedAt, 
      String? slug, 
      List<Shop>? shop, 
      List<dynamic>? type, 
      String? id,}){
    _image = image;
    _productType = productType;
    _categories = categories;
    _tags = tags;
    _manufacturers = manufacturers;
    _authors = authors;
    _isDeleted = isDeleted;
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _shopId = shopId;
    _quantity = quantity;
    _attributes = attributes;
    _gallery = gallery;
    _user = user;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _slug = slug;
    _shop = shop;
    _type = type;
    _id = id;
}

  Products.fromJson(dynamic json) {
    _image = json['image'] != null ? Image.fromJson(json['image']) : null;
    _productType = json['product_type'];
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(v.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(v.fromJson(v));
      });
    }
    if (json['manufacturers'] != null) {
      _manufacturers = [];
      json['manufacturers'].forEach((v) {
        _manufacturers?.add(v.fromJson(v));
      });
    }
    if (json['authors'] != null) {
      _authors = [];
      json['authors'].forEach((v) {
        _authors?.add(v.fromJson(v));
      });
    }
    _isDeleted = json['isDeleted'];
    _id = json['_id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _shopId = json['shop_id'];
    _quantity = json['quantity'];
    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(Attributes.fromJson(v));
      });
    }
    if (json['gallery'] != null) {
      _gallery = [];
      json['gallery'].forEach((v) {
        _gallery?.add(Gallery.fromJson(v));
      });
    }
    _user = json['user'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _slug = json['slug'];
    if (json['shop'] != null) {
      _shop = [];
      json['shop'].forEach((v) {
        _shop?.add(Shop.fromJson(v));
      });
    }
    if (json['type'] != null) {
      _type = [];
      json['type'].forEach((v) {
        _type?.add(v.fromJson(v));
      });
    }
    _id = json['id'];
  }
  Image? _image;
  String? _productType;
  List<dynamic>? _categories;
  List<dynamic>? _tags;
  List<dynamic>? _manufacturers;
  List<dynamic>? _authors;
  bool? _isDeleted;
  String? _name;
  String? _description;
  num? _price;
  String? _shopId;
  num? _quantity;
  List<Attributes>? _attributes;
  List<Gallery>? _gallery;
  String? _user;
  String? _createdAt;
  String? _updatedAt;
  String? _slug;
  List<Shop>? _shop;
  List<dynamic>? _type;
  String? _id;
Products copyWith({  Image? image,
  String? productType,
  List<dynamic>? categories,
  List<dynamic>? tags,
  List<dynamic>? manufacturers,
  List<dynamic>? authors,
  bool? isDeleted,
  String? name,
  String? description,
  num? price,
  String? shopId,
  num? quantity,
  List<Attributes>? attributes,
  List<Gallery>? gallery,
  String? user,
  String? createdAt,
  String? updatedAt,
  String? slug,
  List<Shop>? shop,
  List<dynamic>? type,
  String? id,
}) => Products(  image: image ?? _image,
  productType: productType ?? _productType,
  categories: categories ?? _categories,
  tags: tags ?? _tags,
  manufacturers: manufacturers ?? _manufacturers,
  authors: authors ?? _authors,
  isDeleted: isDeleted ?? _isDeleted,
  name: name ?? _name,
  description: description ?? _description,
  price: price ?? _price,
  shopId: shopId ?? _shopId,
  quantity: quantity ?? _quantity,
  attributes: attributes ?? _attributes,
  gallery: gallery ?? _gallery,
  user: user ?? _user,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  slug: slug ?? _slug,
  shop: shop ?? _shop,
  type: type ?? _type,
  id: id ?? _id,
);
  Image? get image => _image;
  String? get productType => _productType;
  List<dynamic>? get categories => _categories;
  List<dynamic>? get tags => _tags;
  List<dynamic>? get manufacturers => _manufacturers;
  List<dynamic>? get authors => _authors;
  bool? get isDeleted => _isDeleted;
  String? get name => _name;
  String? get description => _description;
  num? get price => _price;
  String? get shopId => _shopId;
  num? get quantity => _quantity;
  List<Attributes>? get attributes => _attributes;
  List<Gallery>? get gallery => _gallery;
  String? get user => _user;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get slug => _slug;
  List<Shop>? get shop => _shop;
  List<dynamic>? get type => _type;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    map['product_type'] = _productType;
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    if (_manufacturers != null) {
      map['manufacturers'] = _manufacturers?.map((v) => v.toJson()).toList();
    }
    if (_authors != null) {
      map['authors'] = _authors?.map((v) => v.toJson()).toList();
    }
    map['isDeleted'] = _isDeleted;
    map['_id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    map['shop_id'] = _shopId;
    map['quantity'] = _quantity;
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    if (_gallery != null) {
      map['gallery'] = _gallery?.map((v) => v.toJson()).toList();
    }
    map['user'] = _user;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['slug'] = _slug;
    if (_shop != null) {
      map['shop'] = _shop?.map((v) => v.toJson()).toList();
    }
    if (_type != null) {
      map['type'] = _type?.map((v) => v.toJson()).toList();
    }
    map['id'] = _id;
    return map;
  }

}

Shop shopFromJson(String str) => Shop.fromJson(json.decode(str));
String shopToJson(Shop data) => json.encode(data.toJson());
class Shop {
  Shop({
      Address? address, 
      List<dynamic>? staffs, 
      bool? isActive, 
      List<String>? categories, 
      bool? isVerified, 
      bool? isSuspended, 
      bool? isDeleted, 
      String? name,
      String? description, 
      String? ownerId, 
      String? createdAt, 
      String? updatedAt, 
      String? slug, 
      num? v, 
      String? id,}){
    _address = address;
    _staffs = staffs;
    _isActive = isActive;
    _categories = categories;
    _isVerified = isVerified;
    _isSuspended = isSuspended;
    _isDeleted = isDeleted;
    _id = id;
    _name = name;
    _description = description;
    _ownerId = ownerId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _slug = slug;
    _v = v;
    _id = id;
}

  Shop.fromJson(dynamic json) {
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['staffs'] != null) {
      _staffs = [];
      json['staffs'].forEach((v) {
        _staffs?.add(v.fromJson(v));
      });
    }
    _isActive = json['is_active'];
    _categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    _isVerified = json['isVerified'];
    _isSuspended = json['isSuspended'];
    _isDeleted = json['isDeleted'];
    _id = json['_id'];
    _name = json['name'];
    _description = json['description'];
    _ownerId = json['owner_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _slug = json['slug'];
    _v = json['__v'];
    _id = json['id'];
  }
  Address? _address;
  List<dynamic>? _staffs;
  bool? _isActive;
  List<String>? _categories;
  bool? _isVerified;
  bool? _isSuspended;
  bool? _isDeleted;
  String? _name;
  String? _description;
  String? _ownerId;
  String? _createdAt;
  String? _updatedAt;
  String? _slug;
  num? _v;
  String? _id;
Shop copyWith({  Address? address,
  List<dynamic>? staffs,
  bool? isActive,
  List<String>? categories,
  bool? isVerified,
  bool? isSuspended,
  bool? isDeleted,
  String? name,
  String? description,
  String? ownerId,
  String? createdAt,
  String? updatedAt,
  String? slug,
  num? v,
  String? id,
}) => Shop(  address: address ?? _address,
  staffs: staffs ?? _staffs,
  isActive: isActive ?? _isActive,
  categories: categories ?? _categories,
  isVerified: isVerified ?? _isVerified,
  isSuspended: isSuspended ?? _isSuspended,
  isDeleted: isDeleted ?? _isDeleted,
  name: name ?? _name,
  description: description ?? _description,
  ownerId: ownerId ?? _ownerId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  slug: slug ?? _slug,
  v: v ?? _v,
  id: id ?? _id,
);
  Address? get address => _address;
  List<dynamic>? get staffs => _staffs;
  bool? get isActive => _isActive;
  List<String>? get categories => _categories;
  bool? get isVerified => _isVerified;
  bool? get isSuspended => _isSuspended;
  bool? get isDeleted => _isDeleted;
  String? get name => _name;
  String? get description => _description;
  String? get ownerId => _ownerId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get slug => _slug;
  num? get v => _v;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_staffs != null) {
      map['staffs'] = _staffs?.map((v) => v.toJson()).toList();
    }
    map['is_active'] = _isActive;
    map['categories'] = _categories;
    map['isVerified'] = _isVerified;
    map['isSuspended'] = _isSuspended;
    map['isDeleted'] = _isDeleted;
    map['_id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['owner_id'] = _ownerId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['slug'] = _slug;
    map['__v'] = _v;
    map['id'] = _id;
    return map;
  }

}

Address addressFromJson(String str) => Address.fromJson(json.decode(str));
String addressToJson(Address data) => json.encode(data.toJson());
class Address {
  Address({
      String? zip, 
      String? city, 
      String? state, 
      String? country, 
      String? streetAddress, 
      Location? location,}){
    _zip = zip;
    _city = city;
    _state = state;
    _country = country;
    _streetAddress = streetAddress;
    _location = location;
}

  Address.fromJson(dynamic json) {
    _zip = json['zip'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _streetAddress = json['street_address'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }
  String? _zip;
  String? _city;
  String? _state;
  String? _country;
  String? _streetAddress;
  Location? _location;
Address copyWith({  String? zip,
  String? city,
  String? state,
  String? country,
  String? streetAddress,
  Location? location,
}) => Address(  zip: zip ?? _zip,
  city: city ?? _city,
  state: state ?? _state,
  country: country ?? _country,
  streetAddress: streetAddress ?? _streetAddress,
  location: location ?? _location,
);
  String? get zip => _zip;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  String? get streetAddress => _streetAddress;
  Location? get location => _location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['zip'] = _zip;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['street_address'] = _streetAddress;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    return map;
  }

}

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
      String? type, 
      List<num>? coordinates,}){
    _type = type;
    _coordinates = coordinates;
}

  Location.fromJson(dynamic json) {
    _type = json['type'];
    _coordinates = json['coordinates'] != null ? json['coordinates'].cast<num>() : [];
  }
  String? _type;
  List<num>? _coordinates;
Location copyWith({  String? type,
  List<num>? coordinates,
}) => Location(  type: type ?? _type,
  coordinates: coordinates ?? _coordinates,
);
  String? get type => _type;
  List<num>? get coordinates => _coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['coordinates'] = _coordinates;
    return map;
  }

}

Gallery galleryFromJson(String str) => Gallery.fromJson(json.decode(str));
String galleryToJson(Gallery data) => json.encode(data.toJson());
class Gallery {
  Gallery({
      String? id, 
      String? original, 
      String? thumbnail,}){
    _id = id;
    _original = original;
    _thumbnail = thumbnail;
}

  Gallery.fromJson(dynamic json) {
    _id = json['_id'];
    _original = json['original'];
    _thumbnail = json['thumbnail'];
  }
  String? _id;
  String? _original;
  String? _thumbnail;
Gallery copyWith({  String? id,
  String? original,
  String? thumbnail,
}) => Gallery(  id: id ?? _id,
  original: original ?? _original,
  thumbnail: thumbnail ?? _thumbnail,
);
  String? get id => _id;
  String? get original => _original;
  String? get thumbnail => _thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['original'] = _original;
    map['thumbnail'] = _thumbnail;
    return map;
  }

}

Attributes attributesFromJson(String str) => Attributes.fromJson(json.decode(str));
String attributesToJson(Attributes data) => json.encode(data.toJson());
class Attributes {
  Attributes({
      String? id, 
      String? name, 
      List<Values>? values,}){
    _id = id;
    _name = name;
    _values = values;
}

  Attributes.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    if (json['values'] != null) {
      _values = [];
      json['values'].forEach((v) {
        _values?.add(Values.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  List<Values>? _values;
Attributes copyWith({  String? id,
  String? name,
  List<Values>? values,
}) => Attributes(  id: id ?? _id,
  name: name ?? _name,
  values: values ?? _values,
);
  String? get id => _id;
  String? get name => _name;
  List<Values>? get values => _values;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    if (_values != null) {
      map['values'] = _values?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Values valuesFromJson(String str) => Values.fromJson(json.decode(str));
String valuesToJson(Values data) => json.encode(data.toJson());
class Values {
  Values({
      num? price, 
      String? id, 
      String? value,}){
    _price = price;
    _id = id;
    _value = value;
}

  Values.fromJson(dynamic json) {
    _price = json['price'];
    _id = json['_id'];
    _value = json['value'];
  }
  num? _price;
  String? _id;
  String? _value;
Values copyWith({  num? price,
  String? id,
  String? value,
}) => Values(  price: price ?? _price,
  id: id ?? _id,
  value: value ?? _value,
);
  num? get price => _price;
  String? get id => _id;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = _price;
    map['_id'] = _id;
    map['value'] = _value;
    return map;
  }

}

Image imageFromJson(String str) => Image.fromJson(json.decode(str));
String imageToJson(Image data) => json.encode(data.toJson());
class Image {
  Image({
      String? original, 
      String? thumbnail,}){
    _original = original;
    _thumbnail = thumbnail;
}

  Image.fromJson(dynamic json) {
    _original = json['original'];
    _thumbnail = json['thumbnail'];
  }
  String? _original;
  String? _thumbnail;
Image copyWith({  String? original,
  String? thumbnail,
}) => Image(  original: original ?? _original,
  thumbnail: thumbnail ?? _thumbnail,
);
  String? get original => _original;
  String? get thumbnail => _thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['original'] = _original;
    map['thumbnail'] = _thumbnail;
    return map;
  }

}

Pagination paginationFromJson(String str) => Pagination.fromJson(json.decode(str));
String paginationToJson(Pagination data) => json.encode(data.toJson());
class Pagination {
  Pagination({
      dynamic prevPage, 
      num? currentPage, 
      dynamic nextPage, 
      num? pageTotal, 
      num? pageSize, 
      num? total,}){
    _prevPage = prevPage;
    _currentPage = currentPage;
    _nextPage = nextPage;
    _pageTotal = pageTotal;
    _pageSize = pageSize;
    _total = total;
}

  Pagination.fromJson(dynamic json) {
    _prevPage = json['prevPage'];
    _currentPage = json['currentPage'];
    _nextPage = json['nextPage'];
    _pageTotal = json['pageTotal'];
    _pageSize = json['pageSize'];
    _total = json['total'];
  }
  dynamic _prevPage;
  num? _currentPage;
  dynamic _nextPage;
  num? _pageTotal;
  num? _pageSize;
  num? _total;
Pagination copyWith({  dynamic prevPage,
  num? currentPage,
  dynamic nextPage,
  num? pageTotal,
  num? pageSize,
  num? total,
}) => Pagination(  prevPage: prevPage ?? _prevPage,
  currentPage: currentPage ?? _currentPage,
  nextPage: nextPage ?? _nextPage,
  pageTotal: pageTotal ?? _pageTotal,
  pageSize: pageSize ?? _pageSize,
  total: total ?? _total,
);
  dynamic get prevPage => _prevPage;
  num? get currentPage => _currentPage;
  dynamic get nextPage => _nextPage;
  num? get pageTotal => _pageTotal;
  num? get pageSize => _pageSize;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['prevPage'] = _prevPage;
    map['currentPage'] = _currentPage;
    map['nextPage'] = _nextPage;
    map['pageTotal'] = _pageTotal;
    map['pageSize'] = _pageSize;
    map['total'] = _total;
    return map;
  }

}