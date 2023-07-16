import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/SubCatEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class GetSubCatUseCase {
  HomeTabDomainRepo homeTabDomainRepo;

  GetSubCatUseCase(this.homeTabDomainRepo);

  Future<Either<Failures, SubCatEntity>> call(String catCode) =>
      homeTabDomainRepo.getSubCat(catCode);
}
