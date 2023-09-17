import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cat_details/domain/entities/CatDetailsEntity.dart';

abstract class CatDetailsStates{}
class CatInitState extends CatDetailsStates{}
class CatLoadingState extends CatDetailsStates{}
class CatSuccessState extends CatDetailsStates{
  CatDetailsEntity catDetailsEntity;

  CatSuccessState(this.catDetailsEntity);
}
class CatErrorState extends CatDetailsStates{
  Failures failures;

  CatErrorState(this.failures);
}