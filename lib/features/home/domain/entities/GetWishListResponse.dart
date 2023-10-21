// ignore: duplicate_ignore
// ignore_for_file: must_be_immutable, duplicate_ignore, file_names

import 'package:equatable/equatable.dart';

import '../../../cat_details/domain/entities/CatDetailsEntity.dart';

// ignore: must_be_immutable

class GetWishListResponseEntity extends Equatable {
  GetWishListResponseEntity({
    this.count,
    this.data,
  });

  num? count;
  List<DataWishEntity>? data;

  @override
  // TODO: implement props
  List<Object?> get props => [count, data];
}



class DataWishEntity {
  DataWishEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,

    this.sid,
  });

  num? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  Category? category;
  Brand? brand;
  num? ratingsAverage;

  String? sid;


}




