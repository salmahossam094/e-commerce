import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';
import 'package:e_commerce/features/product_details/data/data_sources/pro_dto.dart';
import 'package:e_commerce/features/product_details/domain/repositories/pro_domain_repo.dart';

import '../../domain/entities/AddCartResponse.dart';

class ProDataRepo implements ProDomainRepo {
  ProDTO dto;

  ProDataRepo(this.dto);

  @override
  Future<Either<Failures, AddCartResponse>> addToCart(String proId) =>
      dto.addToCart(proId);

  @override
  Future<Either<Failures, CartResponse>> updateQuantity(
          String itemId, int count) =>
      dto.updateQuantity(itemId, count);
}
