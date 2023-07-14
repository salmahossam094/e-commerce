import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/data/data_sources/home_tab_data_source.dart';
import 'package:e_commerce/features/home/data/models/CategoryModel.dart';

class HomeTabLocalDataSource implements HomeTabDataSource {
  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() {
    // TODO: implement getBrands
    throw UnimplementedError();
  }
}