import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cat_details/data/data_sources/cat_details_dto.dart';
import 'package:e_commerce/features/cat_details/domain/entities/CatDetailsEntity.dart';
import 'package:e_commerce/features/cat_details/domain/repositories/cat_details_domain_repo.dart';

class CatDetailsDataRepo implements CatDetailsDomainRepo{
  CatDetailsDto catDetailsDto;

  CatDetailsDataRepo(this.catDetailsDto);

  @override
  Future<Either<Failures, CatDetailsEntity>> getCatDetails(String catId) => catDetailsDto.getCatDetails(catId);

}