import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/cart/domain/entities/AuthTokenModel.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';
import 'package:e_commerce/features/cart/domain/entities/RequestTokenModel.dart';

import '../../domain/entities/OrderIdModel.dart';

abstract class CartDTO {
  Future<Either<Failures, CartResponse>> getCart();

  Future<Either<Failures, CartResponse>> deleteItem(String itemId);

  Future<Either<Failures, CartResponse>> updateQuantity(
      String itemId, int count);

  Future<Either<Failures, AuthTokenModel>> getAuthToken();

  Future<Either<Failures, OrderIdModel>> getOrderId(
      {required String amount, required String currency});

  Future<Either<Failures, RequestTokenModel>> getRequestToken({
    required String amount,
    required String currency,
    required String email,
    required String fName,
    required String lName,
    required String phone,
  });

  Future<Either<Failures, RequestTokenModel>> getRequestTokenKiosk({
    required String amount,
    required String currency,
    required String email,
    required String fName,
    required String lName,
    required String phone,
  });

  Future<Either<Failures, Map<String, dynamic>>> getReferenceCode();
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

  @override
  Future<Either<Failures, AuthTokenModel>> getAuthToken() async {
    try {
      var response = await dio.post('${Constants.apiUrl}${EndPoints.authToken}',
          data: {"api_key": Constants.apiKey});
      AuthTokenModel model = AuthTokenModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, OrderIdModel>> getOrderId(
      {required String amount, required String currency}) async {
    try {
      var response =
          await dio.post('${Constants.apiUrl}${EndPoints.orderID}', data: {
        "auth_token": authToken,
        "delivery_needed": "false",
        "amount_cents": amount,
        "currency": currency,
        'items': []
      });
      OrderIdModel model = OrderIdModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, RequestTokenModel>> getRequestToken({
    required String amount,
    required String currency,
    required String email,
    required String fName,
    required String lName,
    required String phone,
  }) async {
    try {
      var response =
          await dio.post('${Constants.apiUrl}${EndPoints.requestToken}', data: {
        "auth_token": authToken,
        "amount_cents": amount,
        "expiration": 2500,
        "order_id": orderID,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": fName,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lName,
          "state": "NA"
        },
        "currency": currency,
        "integration_id": Constants.integrationIdCard,
        "lock_order_when_paid": "false",
      });
      RequestTokenModel model = RequestTokenModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, RequestTokenModel>> getRequestTokenKiosk({
    required String amount,
    required String currency,
    required String email,
    required String fName,
    required String lName,
    required String phone,
  }) async {
    try {
      var response =
          await dio.post('${Constants.apiUrl}${EndPoints.requestToken}', data: {
        "auth_token": authToken,
        "amount_cents": amount,
        "expiration": 2500,
        "order_id": orderID,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": fName,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lName,
          "state": "NA"
        },
        "currency": currency,
        "integration_id": Constants.integrationIdKiosk,
        "lock_order_when_paid": "false",
      });
      RequestTokenModel model = RequestTokenModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> getReferenceCode() async {
    try {
      var response = await dio
          .post('${Constants.apiUrl}${EndPoints.referenceCode}', data: {
        "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
        "payment_token": requestTokenKiosk
      });

      return Right(response.data);
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

  @override
  Future<Either<Failures, AuthTokenModel>> getAuthToken() {
    // TODO: implement getAuthToken
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, OrderIdModel>> getOrderId(
      {required String amount, required String currency}) {
    // TODO: implement getOrderId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> getReferenceCode() {
    // TODO: implement getReferenceCode
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, RequestTokenModel>> getRequestToken(
      {required String amount,
      required String currency,
      required String email,
      required String fName,
      required String lName,
      required String phone}) {
    // TODO: implement getRequestToken
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, RequestTokenModel>> getRequestTokenKiosk(
      {required String amount,
      required String currency,
      required String email,
      required String fName,
      required String lName,
      required String phone}) {
    // TODO: implement getRequestTokenKiosk
    throw UnimplementedError();
  }
}
