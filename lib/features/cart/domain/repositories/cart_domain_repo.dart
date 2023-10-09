import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';

abstract class CartDomainRepo {
  Future<Either<Failures,CartResponse>> getCart();
  Future<Either<Failures,CartResponse>> deleteItem(String itemId);
  Future<Either<Failures,CartResponse>> updateQuantity(String itemId,int count);
}