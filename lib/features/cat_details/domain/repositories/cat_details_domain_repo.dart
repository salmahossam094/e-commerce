import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cat_details/domain/entities/CatDetailsEntity.dart';

abstract class CatDetailsDomainRepo {
  Future<Either<Failures, CatDetailsEntity>> getCatDetails(String catId);
}
