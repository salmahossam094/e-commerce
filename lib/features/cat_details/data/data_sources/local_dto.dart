import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cat_details/data/data_sources/cat_details_dto.dart';
import 'package:e_commerce/features/cat_details/data/models/CatDetailsModel.dart';
import 'package:e_commerce/features/cat_details/domain/entities/WishListResponse.dart';
import 'package:e_commerce/features/product_details/domain/entities/AddCartResponse.dart';

class LocalCatDetailsDataSource implements CatDetailsDto {
  @override
  Future<Either<Failures, CatDetailsModel>> getCatDetails(String catId) {
    // TODO: implement getCatDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, AddCartResponse>> addToCart(String proId) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, WishListResponse>> addToWish(String proId) {
    // TODO: implement addToWish
    throw UnimplementedError();
  }
}
