import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';

import '../../domain/entities/AddCartResponse.dart';

abstract class ProDetStates {}

class ProDetInitState extends ProDetStates {}

class ProLoadingState extends ProDetStates {}

class ProIncSuccessState extends ProDetStates {}

class ProErrorState extends ProDetStates {
  String e;

  ProErrorState(this.e);
}

class ProDecSuccessState extends ProDetStates {}

class AddToCartLoadingState extends ProDetStates {}

class AddToCartSuccessState extends ProDetStates {
  AddCartResponse cartResponse;

  AddToCartSuccessState(this.cartResponse);
}

class AddToCartErrorState extends ProDetStates {
  Failures failures;

  AddToCartErrorState(this.failures);
}
class UpdateQuantitySuccessState extends ProDetStates {
CartResponse cartResponse;

UpdateQuantitySuccessState(this.cartResponse);
}

class UpdateQuantityErrorState extends ProDetStates {
  Failures failures;

  UpdateQuantityErrorState(this.failures);
}