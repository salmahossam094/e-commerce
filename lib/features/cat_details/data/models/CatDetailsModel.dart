// ignore_for_file: must_be_immutable, file_names

import 'package:e_commerce/features/cat_details/domain/entities/CatDetailsEntity.dart';
import 'package:equatable/equatable.dart';



class CatDetailsModel extends CatDetailsEntity {
  CatDetailsModel({
    super.results,
    this.metadata,
    super.data,
  });

  CatDetailsModel.fromJson(dynamic json)

    {
      results = json['results'];
      metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
      if (json['data'] != null) {
        data = [];
        json['data'].forEach((v) {
          data?.add(Data.fromJson(v));
        });
      }
    }

  Metadata? metadata;
}

class Data extends DataDetailsEntity {
  Data({
    super.sold,
    super.images,
    // super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.availableColors,
    super.imageCover,

    super.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    super.sid
  });

  Data.fromJson(dynamic json)
      : this(
            sold: json['sold'],
            id: json['id'],
            title: json['title'],
            slug: json['slug'],
            updatedAt: json['updatedAt'],
            createdAt: json['createdAt'],
            availableColors: json['availableColors'],

            description: json['description'],
            imageCover: json['imageCover'],
            images: json['images'],
            price: json['price'],
            quantity: json['quantity'],
            ratingsAverage: json['ratingsAverage'],
            ratingsQuantity: json['ratingsQuantity'],
            // subcategory: json['subcategory'],
    sid: json['_id'],
  );

  String? createdAt;
  String? updatedAt;
}

class Metadata extends Equatable {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  num? currentPage;
  num? numberOfPages;
  num? limit;



  @override
  // TODO: implement props
  List<Object?> get props => [currentPage, numberOfPages, limit];
}
