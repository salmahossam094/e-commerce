import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/cat_details/data/data_sources/cat_details_dto.dart';
import 'package:e_commerce/features/cat_details/data/models/CatDetailsModel.dart';
import 'package:e_commerce/features/cat_details/domain/entities/WishListResponse.dart';
import 'package:e_commerce/features/product_details/domain/entities/AddCartResponse.dart';

import '../../../../core/utils/cache_helper.dart';

class RemoteCatDetailsDataSource implements CatDetailsDto {
  Dio dio = Dio();
  var token = CacheHelper.getData('User');

  @override
  Future<Either<Failures, CatDetailsModel>> getCatDetails(String catId) async {
    try {
      var response = await dio.get(
          '${Constants.baseApiUrl}${EndPoints.getProduct}',
          queryParameters: {
            'category[in]': catId,
          });

      CatDetailsModel model = CatDetailsModel.fromJson(response.data);
      return Right(model);
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

  @override
  Future<Either<Failures, WishListResponse>> addToWish(String proId) async {
    try {
      var response = await dio.post('${Constants.baseApiUrl}${EndPoints.wish}',
          options: Options(headers: {"token": token}),
          data: {
            "productId": proId,
          });
      WishListResponse wish = WishListResponse.fromJson(response.data);
      return Right(wish);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
