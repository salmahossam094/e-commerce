import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/entities/GetWishListResponse.dart';
import 'package:e_commerce/features/home/domain/entities/SubCatEntity.dart';

import '../../../product_details/domain/entities/AddCartResponse.dart';

abstract class HomeStates {}

class HomeLoadingState extends HomeStates {}

class ChangeNavBarState extends HomeStates {}

class HomeInitState extends HomeStates {}

class HomeChangeCatState extends HomeStates {}

class HomeGetCategorySuccessState extends HomeStates {
  CategoryOrBrandEntity model;

  HomeGetCategorySuccessState(this.model);
}

class HomeGetCategoryErrorState extends HomeStates {
  Failures failures;

  HomeGetCategoryErrorState(this.failures);
}

class HomeGetBrandsSuccessState extends HomeStates {
  CategoryOrBrandEntity model;

  HomeGetBrandsSuccessState(this.model);
}

class HomeGetBrandsErrorState extends HomeStates {
  Failures failures;

  HomeGetBrandsErrorState(this.failures);
}

class HomeGetSubCatSuccessState extends HomeStates {
  SubCatEntity model;

  HomeGetSubCatSuccessState(this.model);
}

class HomeGetSubCatErrorState extends HomeStates {
  Failures failures;

  HomeGetSubCatErrorState(this.failures);
}

class HomeGetSubLoadingState extends HomeStates {}

class GetWishLoadingState extends HomeStates {}

class GetWishSuccessState extends HomeStates {
  GetWishListResponseEntity model;

  GetWishSuccessState(this.model);
}

class GetWishErrorState extends HomeStates {
  Failures failures;

  GetWishErrorState(this.failures);
}

class AddToCartLoadingState extends HomeStates {}

class AddToCartSuccessState extends HomeStates {
  AddCartResponse addCartResponse;

  AddToCartSuccessState(this.addCartResponse);
}
class AddToCartErrorState extends HomeStates {
  Failures failures;

  AddToCartErrorState(this.failures);
}
