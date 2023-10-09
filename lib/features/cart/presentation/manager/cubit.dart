import 'package:e_commerce/features/cart/data/repositories/cart_data_repo.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_domain_repo.dart';
import 'package:e_commerce/features/cart/domain/use_cases/cart_use_case.dart';
import 'package:e_commerce/features/cart/presentation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/cart_dto.dart';

class CartCubit extends Cubit<CartStates> {
  CartDTO cartDTO;

  CartCubit(this.cartDTO) : super(CartInitState());

  static CartCubit get(context) => BlocProvider.of(context);
  CartResponse cartResponse = CartResponse();
  late int proCount ;

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
      cartResponse=r;
      emit(UpdateQuaSuccessState());
    });
  }
}
