import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/cat_details/data/data_sources/cat_details_dto.dart';
import 'package:e_commerce/features/cat_details/data/models/CatDetailsModel.dart';

class RemoteCatDetailsDataSource implements CatDetailsDto {
  Dio dio = Dio();

  @override
  Future<Either<Failures, CatDetailsModel>> getCatDetails(String catId) async {
    try {
      var response = await dio.get(
          '${Constants.baseApiUrl}${EndPoints.getProduct}',
          queryParameters: {
            'category[in]': catId,
          });

      CatDetailsModel model = CatDetailsModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }
}
