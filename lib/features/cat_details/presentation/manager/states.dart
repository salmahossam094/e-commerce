import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cat_details/domain/entities/CatDetailsEntity.dart';
import 'package:e_commerce/features/cat_details/domain/entities/WishListResponse.dart';
import 'package:e_commerce/features/product_details/domain/entities/AddCartResponse.dart';

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
class AddToCartLoadingState extends CatDetailsStates{}
class AddToCartSuccessState extends CatDetailsStates{
  AddCartResponse addCartResponse;

  AddToCartSuccessState(this.addCartResponse);
}
class AddToCartErrorState extends CatDetailsStates{
  Failures failures;

  AddToCartErrorState(this.failures);
}
class AddToWishLoadingState extends CatDetailsStates{}
class AddToWishSuccessState extends CatDetailsStates{
  WishListResponse wishListResponse;

  AddToWishSuccessState(this.wishListResponse);
}
class AddToWishErrorState extends CatDetailsStates{
  Failures failures;

  AddToWishErrorState(this.failures);
}