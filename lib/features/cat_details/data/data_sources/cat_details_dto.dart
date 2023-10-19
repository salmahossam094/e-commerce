import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cat_details/data/models/CatDetailsModel.dart';
import 'package:e_commerce/features/cat_details/domain/entities/WishListResponse.dart';
import 'package:e_commerce/features/product_details/domain/entities/AddCartResponse.dart';

abstract class CatDetailsDto {
  Future<Either<Failures, CatDetailsModel>> getCatDetails(String catId);
  Future<Either<Failures,AddCartResponse>> addToCart(String proId);
  Future<Either<Failures,WishListResponse>> addToWish(String proId);
}
