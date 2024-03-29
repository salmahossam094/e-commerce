import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/data/data_sources/cart_dto.dart';
import 'package:e_commerce/features/cart/domain/entities/AuthTokenModel.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';
import 'package:e_commerce/features/cart/domain/entities/OrderIdModel.dart';
import 'package:e_commerce/features/cart/domain/entities/RequestTokenModel.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_domain_repo.dart';

class CartDataRepo implements CartDomainRepo {
  CartDTO cartDTO;

  CartDataRepo(this.cartDTO);

  @override
  Future<Either<Failures, CartResponse>> getCart() => cartDTO.getCart();

  @override
  Future<Either<Failures, CartResponse>> deleteItem(String itemId) =>
      cartDTO.deleteItem(itemId);

  @override
  Future<Either<Failures, CartResponse>> updateQuantity(
          String itemId, int count) =>
      cartDTO.updateQuantity(itemId, count);

  @override
  Future<Either<Failures, AuthTokenModel>> getAuthToken() =>
      cartDTO.getAuthToken();

  @override
  Future<Either<Failures, OrderIdModel>> getOrderId(
          {required String amount, required String currency}) =>
      cartDTO.getOrderId(amount: amount, currency: currency);

  @override
  Future<Either<Failures, RequestTokenModel>> getRequestToken({
    required String amount,
    required String currency,
    required String email,
    required String fName,
    required String lName,
    required String phone,
  }) =>
      cartDTO.getRequestToken(
          amount: amount,
          currency: currency,
          email: email,
          fName: fName,
          lName: lName,
          phone: phone);

  @override
  Future<Either<Failures, RequestTokenModel>> getRequestTokenKiosk({
    required String amount,
    required String currency,
    required String email,
    required String fName,
    required String lName,
    required String phone,
  }) =>
      cartDTO.getRequestToken(
          amount: amount,
          currency: currency,
          email: email,
          fName: fName,
          lName: lName,
          phone: phone);

  @override
  Future<Either<Failures, Map<String, dynamic>>> getReferenceCode() =>
      cartDTO.getReferenceCode();
}
