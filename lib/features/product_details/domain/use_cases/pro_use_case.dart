import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';
import 'package:e_commerce/features/product_details/domain/entities/AddCartResponse.dart';
import 'package:e_commerce/features/cat_details/domain/entities/WishListResponse.dart';
import 'package:e_commerce/features/product_details/domain/repositories/pro_domain_repo.dart';

class ProUseCase {
  ProDomainRepo proDomainRepo;

  ProUseCase(this.proDomainRepo);

  Future<Either<Failures, AddCartResponse>> call(String proId) =>
      proDomainRepo.addToCart(proId);

  Future<Either<Failures, CartResponse>> updateQuantity(String itemId,
      int count) => proDomainRepo.updateQuantity(itemId, count);

}
