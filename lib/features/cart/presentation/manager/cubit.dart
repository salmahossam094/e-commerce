import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/cart/data/repositories/cart_data_repo.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_domain_repo.dart';
import 'package:e_commerce/features/cart/domain/use_cases/cart_use_case.dart';
import 'package:e_commerce/features/cart/domain/use_cases/payment_use_case.dart';
import 'package:e_commerce/features/cart/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/cart_dto.dart';

class CartCubit extends Cubit<CartStates> {
  CartDTO cartDTO;

  CartCubit(this.cartDTO) : super(CartInitState());

  static CartCubit get(context) => BlocProvider.of(context);
  CartResponse cartResponse = CartResponse();
  late int proCount;

  DateTime selected = DateTime.now();
  double? price;
  TextEditingController phone = TextEditingController();
  var formKey = GlobalKey<FormState>();
  

  Future<void> getCart() async {
    emit(CartLoadingState());
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDTO);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.call();
    result.fold((l) {
      emit(GetCartErrorState(l));
    }, (r) {
      cartResponse = r;
      emit(GetCartSuccessState(r));
    });
  }

  deleteItem(String itemId) async {
    emit(CartLoadingState());
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDTO);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.deleteItem(itemId);
    result.fold((l) {
      emit(GetCartErrorState(l));
    }, (r) {
      cartResponse = r;
      emit(DeleteCartSuccessState(r));
    });
  }

  updateCount(String itemId, int count) async {
    emit(CartLoadingState());
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDTO);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.updateQuantity(itemId, count);
    result.fold((l) {
      emit(UpdateQuaErrorState(l.toString()));
    }, (r) {
      cartResponse = r;
      emit(UpdateQuaSuccessState());
    });
  }

  getAuthTokenCard({
    required String amount,
    required String currency,
  }) async {
    emit(LoadingAuthTokenState());
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDTO);
    PaymentUseCase paymentUseCase = PaymentUseCase(cartDomainRepo);
    var model = await paymentUseCase.call();
    model.fold((l) {
      emit(ErrorAuthTokenState(l.message));
    }, (r) {
      authToken = r.token ?? 'No data Found';
      emit(SuccessAuthTokenState());
      getOrderId(
        currency: currency,
        amount: amount,
      );
    });
  }

  getOrderId({
    required String amount,
    required String currency,
  }) async {
    emit(LoadingOrderIdState());
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDTO);
    PaymentUseCase paymentUseCase = PaymentUseCase(cartDomainRepo);
    var model =
        await paymentUseCase.getOrderId(amount: amount, currency: currency);
    model.fold((l) {
      emit(ErrorOrderIdState(l.message));
    }, (r) {
      orderID = r.id.toString();

      emit(SuccessOrderIdState());
    });
  }

  getRequestTokenCard({
    required String amount,
    required String currency,
    required String email,
    required String fName,
    required String lName,
    required String phone,
  }) async {
    emit(LoadingRequestTokenState());
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDTO);
    PaymentUseCase paymentUseCase = PaymentUseCase(cartDomainRepo);
    var model = await paymentUseCase.getRequestToken(
        email: email,
        fName: fName,
        lName: lName,
        phone: phone,
        amount: amount,
        currency: currency);
    model.fold((l) {
      emit(ErrorRequestTokenState(l.message));
    }, (r) {
      requestTokenCard = r.token ?? '';
      emit(SuccessRequestTokenState());
    });
  }

  getRequestTokenKiosk({
    required String amount,
    required String currency,
    required String email,
    required String fName,
    required String lName,
    required String phone,
  }) async {
    emit(LoadingRequestTokenKioskState());
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDTO);
    PaymentUseCase paymentUseCase = PaymentUseCase(cartDomainRepo);
    var model = await paymentUseCase.getRequestTokenKiosk(
        email: email,
        fName: fName,
        lName: lName,
        phone: phone,
        amount: amount,
        currency: currency);
    model.fold((l) {
      emit(ErrorRequestTokenKioskState(l.message));
      print(l.message);
    }, (r) {
      requestTokenKiosk = r.token ?? '';
      emit(SuccessRequestTokenKioskState());
      getReferenceCode();
    });
  }

  getReferenceCode() async {
    emit(LoadingReferenceCodeState());
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDTO);
    PaymentUseCase paymentUseCase = PaymentUseCase(cartDomainRepo);
    var model = await paymentUseCase.getReferenceCode();

    model.fold((l) {
      print(l.message);

      emit(ErrorReferenceCodeState(l.message));
    }, (r) {
      reference = r['id'].toString();
      emit(SuccessReferenceCodeState());
    });
  }
}
