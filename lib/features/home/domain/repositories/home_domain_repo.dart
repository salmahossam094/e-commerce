import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/entities/GetWishListResponse.dart';

import '../../../product_details/domain/entities/AddCartResponse.dart';
import '../entities/SubCatEntity.dart';

abstract class HomeTabDomainRepo {
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories();

  Future<Either<Failures, CategoryOrBrandEntity>> getBrands();

  Future<Either<Failures, SubCatEntity>> getSubCat(String catCode);
  Future <Either<Failures,GetWishListResponseEntity>> getWish();
  Future<Either<Failures,AddCartResponse>> addToCart(String id);
}
