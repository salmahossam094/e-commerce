import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cat_details/domain/entities/WishListResponse.dart';
import 'package:e_commerce/features/home/data/data_sources/home_tab_data_source.dart';
import 'package:e_commerce/features/home/data/models/CategoryModel.dart';
import 'package:e_commerce/features/home/data/models/GetWishListModel.dart';
import 'package:e_commerce/features/home/data/models/SubCatModel.dart';
import 'package:e_commerce/features/product_details/domain/entities/AddCartResponse.dart';
class HomeTabLocalDataSource implements HomeTabDataSource {
  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, SubCatModel>> getSubCat(String catCode) {
    // TODO: implement getSubCat
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, GetWishListModel>> getWish() {
    // TODO: implement getWish
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, AddCartResponse>> addToCart(String id) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, WishListResponse>> deleteWish(String proId) {
    // TODO: implement deleteWish
    throw UnimplementedError();
  }
}