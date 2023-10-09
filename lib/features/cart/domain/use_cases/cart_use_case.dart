import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_domain_repo.dart';

class CartUseCase {
  CartDomainRepo cartDomainRepo;

  CartUseCase(this.cartDomainRepo);

  Future<Either<Failures, CartResponse>> call() => cartDomainRepo.getCart();

  Future<Either<Failures, CartResponse>> deleteItem(String itemId) =>
      cartDomainRepo.deleteItem(itemId);

  Future<Either<Failures, CartResponse>> updateQuantity(
          String itemId, int count) =>
      cartDomainRepo.updateQuantity(itemId, count);
}
