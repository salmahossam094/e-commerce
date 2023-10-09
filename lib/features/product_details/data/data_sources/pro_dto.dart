import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';

import '../../domain/entities/AddCartResponse.dart';

abstract class ProDTO {
  Future<Either<Failures, AddCartResponse>> addToCart(String proId);

  Future<Either<Failures, CartResponse>> updateQuantity(
      String itemId, int count);
}

class RemotePro implements ProDTO {
  Dio dio = Dio();
  var token = CacheHelper.getData('User');

  @override
  Future<Either<Failures, AddCartResponse>> addToCart(String proId) async {
    try {
      var response = await dio.post('${Constants.baseApiUrl}${EndPoints.cart}',
          data: {"productId": proId},
          options: Options(headers: {"token": token}));

      AddCartResponse cartResponse = AddCartResponse.fromJson(response.data);
      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponse>> updateQuantity(
      String itemId, int count) async {
    try {
      var response =
          await dio.put('${Constants.baseApiUrl}${EndPoints.cart}/$itemId',
              options: Options(headers: {
                "token":
                    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0OTg5MGYyZjVjMGI5MDAzNGU5ZTc3MCIsIm5hbWUiOiJoYW1vdWRhIiwicm9sZSI6InVzZXIiLCJpYXQiOjE2OTQ5ODYzNzgsImV4cCI6MTcwMjc2MjM3OH0.0KUXU3uBJM5g53tPG66UXjNdTpwoWBkMQA9zhNo7wGs'
              }),
              data: {'count': count});
      CartResponse cartResponse = CartResponse.fromJson(response.data);
      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}

class LocalPro implements ProDTO {
  @override
  Future<Either<Failures, AddCartResponse>> addToCart(String proId) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CartResponse>> updateQuantity(
      String itemId, int count) {
    // TODO: implement updateQuantity
    throw UnimplementedError();
  }
}
