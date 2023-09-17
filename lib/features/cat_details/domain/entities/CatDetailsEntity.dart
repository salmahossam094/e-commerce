// ignore_for_file: must_be_immutable, file_names

import 'package:equatable/equatable.dart';

class CatDetailsEntity extends Equatable {
  CatDetailsEntity({
    this.results,
    this.data,
  });

  int? results;
  List<DataDetailsEntity>? data;

  @override
  // TODO: implement props
  List<Object?> get props => [results, data];
}

class DataDetailsEntity {
  DataDetailsEntity(
      {this.sold,
      this.images,
      // this.subcategory,
      this.ratingsQuantity,
      this.id,
      this.title,
      this.slug,
      this.description,
      this.quantity,
      this.price,
      this.availableColors,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.sid});

  int? sold;
  List<dynamic>? images;
  // List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  List<dynamic>? availableColors;
  String? imageCover;
  Category? category;
  Brand? brand;
  num? ratingsAverage;
  String? sid;
}

class Brand extends Equatable {
  Brand({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  Brand.fromJson(dynamic json)
      : this(
            id: json['_id'],
            image: json['image'],
            name: json['name'],
            slug: json['slug']);

  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, slug, image];
}

class Category extends Equatable {
  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  Category.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, slug, image];
}

class Subcategory extends Equatable {
  Subcategory({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  String? id;
  String? name;
  String? slug;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name, id, slug, category];
}
