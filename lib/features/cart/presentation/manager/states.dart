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

class UpdateQuaErrorState extends CartStates {
  String failures;

  UpdateQuaErrorState(this.failures);
}

class UpdateQuaSuccessState extends CartStates {}

class LoadingAuthTokenState extends CartStates {}

class SuccessAuthTokenState extends CartStates {}

class ErrorAuthTokenState extends CartStates {
  String message;

  ErrorAuthTokenState(this.message);
}

class LoadingOrderIdState extends CartStates {}

class SuccessOrderIdState extends CartStates {}

class ErrorOrderIdState extends CartStates {
  String message;

  ErrorOrderIdState(this.message);
}
class LoadingRequestTokenState extends CartStates {}
class SuccessRequestTokenState extends CartStates {}

class ErrorRequestTokenState extends CartStates {
  String message;

  ErrorRequestTokenState(this.message);

}
class LoadingRequestTokenKioskState extends CartStates {}
class SuccessRequestTokenKioskState extends CartStates {}

class ErrorRequestTokenKioskState extends CartStates {
  String message;

  ErrorRequestTokenKioskState(this.message);

}
class LoadingReferenceCodeState extends CartStates {}
class SuccessReferenceCodeState extends CartStates {}

class ErrorReferenceCodeState extends CartStates {
  String message;

  ErrorReferenceCodeState(this.message);

}