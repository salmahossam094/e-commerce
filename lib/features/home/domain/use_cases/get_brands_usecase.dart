import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class GetBrandsUseCase {
  HomeTabDomainRepo homeTabDomainRepo;

  GetBrandsUseCase(this.homeTabDomainRepo);

  Future<Either<Failures, CategoryOrBrandEntity>> call() =>
      homeTabDomainRepo.getBrands();
}
