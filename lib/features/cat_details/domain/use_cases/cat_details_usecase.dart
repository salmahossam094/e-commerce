import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cat_details/domain/entities/CatDetailsEntity.dart';
import 'package:e_commerce/features/cat_details/domain/repositories/cat_details_domain_repo.dart';
import 'package:e_commerce/features/product_details/domain/entities/AddCartResponse.dart';

import '../entities/WishListResponse.dart';

class CatDetailsUseCase {
  CatDetailsDomainRepo catDetailsDomainRepo;

  CatDetailsUseCase(this.catDetailsDomainRepo);

  Future<Either<Failures, CatDetailsEntity>> call(String catId) =>
      catDetailsDomainRepo.getCatDetails(catId);

  Future<Either<Failures, AddCartResponse>> addToCart(String proId) =>
      catDetailsDomainRepo.addToCart(proId);

  Future<Either<Failures, WishListResponse>> addToWish(String proId) =>
      catDetailsDomainRepo.addToWish(proId);
}