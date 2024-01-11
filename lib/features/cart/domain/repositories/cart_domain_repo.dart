import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/AuthTokenModel.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';
import 'package:e_commerce/features/cart/domain/entities/OrderIdModel.dart';
import 'package:e_commerce/features/cart/domain/entities/RequestTokenModel.dart';

abstract class CartDomainRepo {
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
