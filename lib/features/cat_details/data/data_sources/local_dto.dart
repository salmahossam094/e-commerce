import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cat_details/data/data_sources/cat_details_dto.dart';
import 'package:e_commerce/features/cat_details/data/models/CatDetailsModel.dart';

class RemoteCatDetailsDataSource implements CatDetailsDto {
  @override
  Future<Either<Failures, CatDetailsModel>> getCatDetails(String catId) {
    // TODO: implement getCatDetails
    throw UnimplementedError();
  }
}
