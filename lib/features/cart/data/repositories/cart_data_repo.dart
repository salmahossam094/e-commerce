import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/cart/data/data_sources/cart_dto.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_domain_repo.dart';
import 'package:e_commerce/features/cart/domain/entities/CartResponse.dart';

class CartDataRepo implements CartDomainRepo {
  CartDTO cartDTO;

  CartDataRepo(this.cartDTO);

  @override
  Future<Either<Failures, CartResponse>> getCart() => cartDTO.getCart();

  @override
  Future<Either<Failures, CartResponse>> deleteItem(String itemId) => cartDTO.deleteItem(itemId);
  Future<Either<Failures,CartResponse>> updateQuantity(String itemId,int count)=> cartDTO.updateQuantity(itemId,count);
}
