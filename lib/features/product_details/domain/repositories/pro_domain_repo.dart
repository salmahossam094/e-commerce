import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';

import '../entities/AddCartResponse.dart';

abstract class ProDomainRepo {
  Future<Either<Failures, AddCartResponse>> addToCart(String proId);
  Future<Either<Failures,CartResponse>> updateQuantity(String itemId , int count);
}
