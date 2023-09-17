import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cat_details/data/models/CatDetailsModel.dart';

abstract class CatDetailsDto {
  Future<Either<Failures, CatDetailsModel>> getCatDetails(String catId);
}
