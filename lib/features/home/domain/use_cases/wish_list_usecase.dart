import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/GetWishListResponse.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class WishListUseCase {
  HomeTabDomainRepo homeTabDomainRepo;

  WishListUseCase(this.homeTabDomainRepo);

  Future<Either<Failures, GetWishListResponseEntity>> call() =>
      homeTabDomainRepo.getWish();
}
