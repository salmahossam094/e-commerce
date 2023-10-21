import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';

abstract class CartDTO {
  Future<Either<Failures, CartResponse>> getCart();

  Future<Either<Failures, CartResponse>> deleteItem(String itemId);

  Future<Either<Failures, CartResponse>> updateQuantity(
      String itemId, int count);
}

class RemoteCart implements CartDTO {
  Dio dio = Dio();
  var token = CacheHelper.getData("User");

  @override
  Future<Either<Failures, CartResponse>> getCart() async {
    try {
      var response = await dio.get('${Constants.baseApiUrl}${EndPoints.cart}',
          options: Options(headers: {"token": token}));
      CartResponse cartResponse = CartResponse.fromJson(response.data);
      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponse>> deleteItem(String itemId) async {
    try {
      var response = await dio.delete(
          '${Constants.baseApiUrl}${EndPoints.cart}/$itemId',
          options: Options(headers: {"token": token}));
      CartResponse cartResponse = CartResponse.fromJson(response.data);
      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartResponse>> updateQuantity(
      String itemId, int count) async {
    try {
      var response = await dio.put(
          '${Constants.baseApiUrl}${EndPoints.cart}/$itemId',
          options: Options(headers: {"token": token}),
          data: {'count': count});
      CartResponse cartResponse = CartResponse.fromJson(response.data);
      return Right(cartResponse);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}

class LocalCart implements CartDTO {
  @override
  Future<Either<Failures, CartResponse>> getCart() {
    // TODO: implement getCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CartResponse>> deleteItem(String itemId) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CartResponse>> updateQuantity(
      String itemId, int count) {
    // TODO: implement updateQuantity
    throw UnimplementedError();
  }
}
