import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';

abstract class CartStates {}

class CartInitState extends CartStates {}

class CartLoadingState extends CartStates {}

class GetCartSuccessState extends CartStates {
  CartResponse cartResponse;

  GetCartSuccessState(this.cartResponse);
}
class DeleteCartSuccessState extends CartStates {
  CartResponse cartResponse;

  DeleteCartSuccessState(this.cartResponse);
}
class GetCartErrorState extends CartStates {
  Failures failures;

  GetCartErrorState(this.failures);
}


class UpdateQuaErrorState extends CartStates{
String failures;

UpdateQuaErrorState(this.failures);
}
class UpdateQuaSuccessState extends CartStates{

}


