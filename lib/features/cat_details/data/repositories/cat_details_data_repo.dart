import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cat_details/data/data_sources/cat_details_dto.dart';
import 'package:e_commerce/features/cat_details/domain/entities/CatDetailsEntity.dart';
import 'package:e_commerce/features/cat_details/domain/entities/WishListResponse.dart';
import 'package:e_commerce/features/cat_details/domain/repositories/cat_details_domain_repo.dart';
import 'package:e_commerce/features/product_details/domain/entities/AddCartResponse.dart';

class CatDetailsDataRepo implements CatDetailsDomainRepo {
  CatDetailsDto catDetailsDto;

  CatDetailsDataRepo(this.catDetailsDto);

  @override
  Future<Either<Failures, CatDetailsEntity>> getCatDetails(String catId) =>
      catDetailsDto.getCatDetails(catId);

  @override
  Future<Either<Failures, AddCartResponse>> addToCart(String proId) =>
      catDetailsDto.addToCart(proId);

  @override
  Future<Either<Failures, WishListResponse>> addToWish(String proId) =>
      catDetailsDto.addToWish(proId);
}
