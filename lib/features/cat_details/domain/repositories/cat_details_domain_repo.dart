import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cat_details/domain/entities/CatDetailsEntity.dart';
import 'package:e_commerce/features/product_details/domain/entities/AddCartResponse.dart';

import '../entities/WishListResponse.dart';

abstract class CatDetailsDomainRepo {
  Future<Either<Failures, CatDetailsEntity>> getCatDetails(String catId);
  Future<Either<Failures,AddCartResponse>> addToCart(String proId);
  Future<Either<Failures,WishListResponse>> addToWish(String proId);
}
