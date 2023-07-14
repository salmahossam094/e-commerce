import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class HomeTabUseCase {
  HomeTabDomainRepo homeTabDomainRepo;

  HomeTabUseCase(this.homeTabDomainRepo);

  Future<Either<Failures, CategoryOrBrandEntity>> call() =>
      homeTabDomainRepo.getCategories();
}
