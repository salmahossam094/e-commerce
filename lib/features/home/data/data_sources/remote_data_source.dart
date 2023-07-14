import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/home/data/data_sources/home_tab_data_source.dart';
import 'package:e_commerce/features/home/data/models/CategoryModel.dart';

class HomeTabRemoteDataSource implements HomeTabDataSource {
  Dio dio = Dio();

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getCategories() async {
    try {
      var response =
          await dio.get('${Constants.baseApiUrl}${EndPoints.getCategory}');
      CategoryOrBrandModel model = CategoryOrBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandModel>> getBrands() async {
    try {
      var response =
          await dio.get('${Constants.baseApiUrl}${EndPoints.getBrand}');
      CategoryOrBrandModel model = CategoryOrBrandModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
