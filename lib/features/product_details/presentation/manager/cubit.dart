import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';
import 'package:e_commerce/features/product_details/data/data_sources/pro_dto.dart';
import 'package:e_commerce/features/product_details/data/repositories/pro_data_repo.dart';
import 'package:e_commerce/features/product_details/domain/repositories/pro_domain_repo.dart';
import 'package:e_commerce/features/product_details/domain/use_cases/pro_use_case.dart';
import 'package:e_commerce/features/product_details/presentation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/AddCartResponse.dart';

class ProdCubit extends Cubit<ProDetStates> {
  ProdCubit(this.dto) : super(ProDetInitState());
  ProDTO dto;

  static ProdCubit get(context) => BlocProvider.of(context);
   int proCount =1;

  int totalPrice = 0;
  bool isAdded=false;
  CartResponse cart=CartResponse();

  AddCartResponse cartResponse = AddCartResponse();

  Future<void> addToCart(String proId) async {
    emit(AddToCartLoadingState());
    ProDomainRepo proDomainRepo = ProDataRepo(dto);
    ProUseCase proUseCase = ProUseCase(proDomainRepo);
    print(proId);
    var results = await proUseCase.call(proId);
    results.fold((l) {
      emit(AddToCartErrorState(l));
    }, (r) {
      cartResponse = r;
      totalPrice=int.parse(cartResponse.data!.totalCartPrice.toString());
      isAdded=true;
      emit(AddToCartSuccessState(r));
    });
  }

  Future<void> updateQuantity(String itemId, int count) async {
    emit(ProLoadingState());
    ProDomainRepo proDomainRepo = ProDataRepo(dto);
    ProUseCase proUseCase = ProUseCase(proDomainRepo);
    var result = await proUseCase.updateQuantity(itemId, count);
    result.fold((l) {
      emit(UpdateQuantityErrorState(l));
    }, (r) {
      cart=r;
      totalPrice=int.parse(cart.data!.totalCartPrice.toString());
      emit(UpdateQuantitySuccessState(r));
    });
  }
}
