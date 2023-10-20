import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/home/data/data_sources/home_tab_data_source.dart';
import 'package:e_commerce/features/home/data/models/CategoryModel.dart';
import 'package:e_commerce/features/product_details/domain/entities/AddCartResponse.dart';

import '../models/GetWishListModel.dart';
import '../models/SubCatModel.dart';

class HomeTabRemoteDataSource implements HomeTabDataSource {
  Dio dio = Dio();
  var token = CacheHelper.getData('User');

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() async {
    try {
      var response =
          await dio.get('${Constants.baseApiUrl}${EndPoints.getCategory}');
      CategoryOrBrandModel model = CategoryOrBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() async {
    try {
      var response =
          await dio.get('${Constants.baseApiUrl}${EndPoints.getBrand}');
      CategoryOrBrandModel model = CategoryOrBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, SubCatModel>> getSubCat(String catCode) async {
    try {
      var response = await dio.get(
          '${Constants.baseApiUrl}${EndPoints.getCategory}/$catCode/subcategories');
      SubCatModel model = SubCatModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetWishListModel>> getWish() async {
    try {
      var response = await dio.get('${Constants.baseApiUrl}${EndPoints.wish}',
          options: Options(headers: {"token": token}));
      GetWishListModel wishListModel = GetWishListModel.fromJson(response.data);
      return Right(wishListModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddCartResponse>> addToCart(String proId) async {
    try {
      var response = await dio.post('${Constants.baseApiUrl}${EndPoints.cart}',
          data: {
            "productId": proId,
          },
          options: Options(headers: {"token": token}));
      AddCartResponse cartResponse = AddCartResponse.fromJson(response.data);
      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
