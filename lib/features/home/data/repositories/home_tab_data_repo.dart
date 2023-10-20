import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/data_sources/home_tab_data_source.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/entities/GetWishListResponse.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

import '../../../product_details/domain/entities/AddCartResponse.dart';
import '../../domain/entities/SubCatEntity.dart';

class HomeTabDataRepo implements HomeTabDomainRepo {
  HomeTabDataSource homeTabDataSource;

  HomeTabDataRepo(this.homeTabDataSource);

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories() =>
      homeTabDataSource.getCategories();

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getBrands() =>
      homeTabDataSource.getBrands();

  @override
  Future<Either<Failures, SubCatEntity>> getSubCat(String catCode) =>
      homeTabDataSource.getSubCat(catCode);

  @override
  Future<Either<Failures, GetWishListResponseEntity>> getWish() =>
      homeTabDataSource.getWish();

  Future<Either<Failures, AddCartResponse>> addToCart(String id) =>
      homeTabDataSource.addToCart(id);
}
