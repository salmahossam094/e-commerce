import '../../../cart/domain/entities/CartResponse.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 19
/// data : {"_id":"64a6f56eea5a1a00334361c8","cartOwner":"649890f2f5c0b90034e9e770","products":[{"count":26,"_id":"64d15897fa4a7b4ce9b9f7dd","product":"6428ebc6dc1175abc65ca0b9","price":149},{"count":8,"_id":"64d24aebfa4a7b4ce9ba3a59","product":"6428ead5dc1175abc65ca0ad","price":149},{"count":1,"_id":"64d24aebfa4a7b4ce9ba3a5b","product":"6428ead5dc1175abc65ca0ad","price":149},{"count":6,"_id":"64d24afffa4a7b4ce9ba3a9a","product":"6428e5e6dc1175abc65ca084","price":499},{"count":1,"_id":"64d24afffa4a7b4ce9ba3a9c","product":"6428e5e6dc1175abc65ca084","price":499},{"count":9,"_id":"64d2a45bfa4a7b4ce9ba4189","product":"6408e1266406cd15828e8f1c","price":1045},{"count":6,"_id":"64d2a45dfa4a7b4ce9ba4191","product":"6408de536406cd15828e8f10","price":1949},{"count":1,"_id":"64d2a474fa4a7b4ce9ba41a9","product":"6408e5fd6406cd15828e8f28","price":5999},{"count":1,"_id":"64d2a47afa4a7b4ce9ba41b8","product":"6408e43a6406cd15828e8f22","price":19699},{"count":1,"_id":"64d2a47efa4a7b4ce9ba41c0","product":"6428bd0bdc1175abc65c9fdb","price":699},{"count":1,"_id":"64d4015e18b1d9a1108b32bd","product":"6428dd2edc1175abc65ca055","price":2649},{"count":1,"_id":"64d4016918b1d9a1108b32c5","product":"6428c6a9dc1175abc65ca01f","price":1629},{"count":2,"_id":"64d4016e18b1d9a1108b32cd","product":"6408e05d6406cd15828e8f16","price":3999},{"count":5,"_id":"64d40c7718b1d9a1108b381e","product":"6428e997dc1175abc65ca0a1","price":149},{"count":1,"_id":"64d40c7718b1d9a1108b3823","product":"6428e997dc1175abc65ca0a1","price":149},{"count":1,"_id":"64d4170318b1d9a1108b3dfd","product":"6428e479dc1175abc65ca078","price":199},{"count":1,"_id":"64d4e18a18b1d9a1108b693c","product":"6428eb43dc1175abc65ca0b3","price":149},{"count":1,"_id":"6508f218b15218003325bf5b","product":"6428e7ecdc1175abc65ca090","price":499},{"count":1,"_id":"650a15f0aca24d0034b716b8","product":"6428de2adc1175abc65ca05b","price":2999}],"createdAt":"2023-07-06T17:10:06.817Z","updatedAt":"2023-09-19T21:44:01.765Z","__v":38,"totalCartPrice":73220}

class AddCartResponse {
  AddCartResponse({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.data,});

  AddCartResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  num? numOfCartItems;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// _id : "64a6f56eea5a1a00334361c8"
/// cartOwner : "649890f2f5c0b90034e9e770"
/// products : [{"count":26,"_id":"64d15897fa4a7b4ce9b9f7dd","product":"6428ebc6dc1175abc65ca0b9","price":149},{"count":8,"_id":"64d24aebfa4a7b4ce9ba3a59","product":"6428ead5dc1175abc65ca0ad","price":149},{"count":1,"_id":"64d24aebfa4a7b4ce9ba3a5b","product":"6428ead5dc1175abc65ca0ad","price":149},{"count":6,"_id":"64d24afffa4a7b4ce9ba3a9a","product":"6428e5e6dc1175abc65ca084","price":499},{"count":1,"_id":"64d24afffa4a7b4ce9ba3a9c","product":"6428e5e6dc1175abc65ca084","price":499},{"count":9,"_id":"64d2a45bfa4a7b4ce9ba4189","product":"6408e1266406cd15828e8f1c","price":1045},{"count":6,"_id":"64d2a45dfa4a7b4ce9ba4191","product":"6408de536406cd15828e8f10","price":1949},{"count":1,"_id":"64d2a474fa4a7b4ce9ba41a9","product":"6408e5fd6406cd15828e8f28","price":5999},{"count":1,"_id":"64d2a47afa4a7b4ce9ba41b8","product":"6408e43a6406cd15828e8f22","price":19699},{"count":1,"_id":"64d2a47efa4a7b4ce9ba41c0","product":"6428bd0bdc1175abc65c9fdb","price":699},{"count":1,"_id":"64d4015e18b1d9a1108b32bd","product":"6428dd2edc1175abc65ca055","price":2649},{"count":1,"_id":"64d4016918b1d9a1108b32c5","product":"6428c6a9dc1175abc65ca01f","price":1629},{"count":2,"_id":"64d4016e18b1d9a1108b32cd","product":"6408e05d6406cd15828e8f16","price":3999},{"count":5,"_id":"64d40c7718b1d9a1108b381e","product":"6428e997dc1175abc65ca0a1","price":149},{"count":1,"_id":"64d40c7718b1d9a1108b3823","product":"6428e997dc1175abc65ca0a1","price":149},{"count":1,"_id":"64d4170318b1d9a1108b3dfd","product":"6428e479dc1175abc65ca078","price":199},{"count":1,"_id":"64d4e18a18b1d9a1108b693c","product":"6428eb43dc1175abc65ca0b3","price":149},{"count":1,"_id":"6508f218b15218003325bf5b","product":"6428e7ecdc1175abc65ca090","price":499},{"count":1,"_id":"650a15f0aca24d0034b716b8","product":"6428de2adc1175abc65ca05b","price":2999}]
/// createdAt : "2023-07-06T17:10:06.817Z"
/// updatedAt : "2023-09-19T21:44:01.765Z"
/// __v : 38
/// totalCartPrice : 73220

class Data {
  Data({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }

}

/// count : 26
/// _id : "64d15897fa4a7b4ce9b9f7dd"
/// product : "6428ebc6dc1175abc65ca0b9"
/// price : 149

class Products {
  Products({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  Products.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
  num? count;
  String? id;
  String? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }

}