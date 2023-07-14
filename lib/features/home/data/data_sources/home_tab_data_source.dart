import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/models/CategoryModel.dart';

abstract class HomeTabDataSource {
  Future<Either<Failures, CategoryOrBrandModel>> getCategories();

  Future<Either<Failures, CategoryOrBrandModel>> getBrands();
}
