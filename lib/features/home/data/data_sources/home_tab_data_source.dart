import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cat_details/domain/entities/WishListResponse.dart';
import 'package:e_commerce/features/home/data/models/CategoryModel.dart';
import 'package:e_commerce/features/home/data/models/GetWishListModel.dart';
import 'package:e_commerce/features/home/data/models/SubCatModel.dart';

import '../../../product_details/domain/entities/AddCartResponse.dart';


abstract class HomeTabDataSource {
  Future<Either<Failures, CategoryOrBrandModel>> getCategories();

  Future<Either<Failures, CategoryOrBrandModel>> getBrands();
  Future<Either<Failures, SubCatModel>> getSubCat(String catCode);
  Future<Either<Failures,GetWishListModel>> getWish();
  Future<Either<Failures,AddCartResponse>> addToCart(String id);
  Future<Either<Failures,WishListResponse>> deleteWish(String proId);
}
