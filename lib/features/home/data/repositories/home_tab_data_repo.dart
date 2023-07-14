import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/data_sources/home_tab_data_source.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

class HomeTabDataRepo implements HomeTabDomainRepo {
  HomeTabDataSource homeTabDataSource;

  HomeTabDataRepo(this.homeTabDataSource);

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories() =>
      homeTabDataSource.getCategories();

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getBrands() =>
      homeTabDataSource.getBrands();
}
