import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/AuthTokenModel.dart';
import 'package:e_commerce/features/cart/domain/entities/OrderIdModel.dart';
import 'package:e_commerce/features/cart/domain/entities/RequestTokenModel.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_domain_repo.dart';

class PaymentUseCase {
  CartDomainRepo cartDomainRepo;

  PaymentUseCase(this.cartDomainRepo);

  Future<Either<Failures, AuthTokenModel>> call() =>
      cartDomainRepo.getAuthToken();

  Future<Either<Failures, OrderIdModel>> getOrderId(
          {required String amount, required String currency}) =>
      cartDomainRepo.getOrderId(amount: amount, currency: currency);

  Future<Either<Failures, RequestTokenModel>> getRequestToken({
    required String amount,
    required String currency,
    required String email,
    required String fName,
    required String lName,
    required String phone,
  }) =>
      cartDomainRepo.getRequestToken(
          amount: amount,
          currency: currency,
          lName: lName,
          fName: fName,
          phone: phone,
          email: email);

  Future<Either<Failures, RequestTokenModel>> getRequestTokenKiosk({
    required String amount,
    required String currency,
    required String email,
    required String fName,
    required String lName,
    required String phone,
  }) =>
      cartDomainRepo.getRequestTokenKiosk(
          amount: amount,
          currency: currency,
          lName: lName,
          fName: fName,
          phone: phone,
          email: email);

  Future<Either<Failures, Map<String, dynamic>>> getReferenceCode() =>
      cartDomainRepo.getReferenceCode();
}
