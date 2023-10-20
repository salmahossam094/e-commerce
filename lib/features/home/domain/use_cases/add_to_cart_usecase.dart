import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';

import '../../../product_details/domain/entities/AddCartResponse.dart';

class AddToCartUseCase {

HomeTabDomainRepo homeTabDomainRepo;

AddToCartUseCase(this.homeTabDomainRepo);

Future<Either<Failures, AddCartResponse>> call(String id) => homeTabDomainRepo.addToCart(id);
}