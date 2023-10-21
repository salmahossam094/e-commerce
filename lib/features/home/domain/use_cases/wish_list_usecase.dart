import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cat_details/domain/entities/WishListResponse.dart';
import 'package:e_commerce/features/home/domain/entities/GetWishListResponse.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class WishListUseCase {
  HomeTabDomainRepo homeTabDomainRepo;

  WishListUseCase(this.homeTabDomainRepo);

  Future<Either<Failures, GetWishListResponseEntity>> call() =>
      homeTabDomainRepo.getWish();
  Future<Either<Failures,WishListResponse>> deleteWish(String proId)=> homeTabDomainRepo.deleteWish(proId);
}
