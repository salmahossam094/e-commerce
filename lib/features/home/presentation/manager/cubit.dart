import 'package:e_commerce/features/home/data/repositories/home_tab_data_repo.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';
import 'package:e_commerce/features/home/domain/use_cases/get_brands_usecase.dart';
import 'package:e_commerce/features/home/domain/use_cases/home_tab_usecase.dart';
import 'package:e_commerce/features/home/presentation/manager/states.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/catgory.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/fav.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/home_tab.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/home_tab_data_source.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeTabDataSource homeTabDataSource;
  late HomeTabDomainRepo homeTabDomainRepo;

  HomeCubit(this.homeTabDataSource) : super(HomeInitState()) {
    homeTabDomainRepo = HomeTabDataRepo(homeTabDataSource);
  }

  static HomeCubit get(context) => BlocProvider.of(context);
  int bottomNavIndex = 0;
  List<Widget> tabs = [HomeTab(), CategoryTab(), FavouriteTab(), ProfileTab()];
  var searchController = TextEditingController();
  List<DataEntity> categories = [];
  List<DataEntity> Brands = [];

  void changeNav(int value) {
    emit(HomeInitState());
    bottomNavIndex = value;
    emit(ChangeNavBarState());
  }

  Future<void> getCategory() async {
    emit(HomeLoadingState());

    HomeTabUseCase homeTabUseCase = HomeTabUseCase(homeTabDomainRepo);
    var results = await homeTabUseCase.call();
    results.fold((l) {
      emit(HomeGetCategoryErrorState(l));
    }, (r) {
      categories = r.data ?? [];
      emit(HomeGetCategorySuccessState(r));
    });
  }

  Future<void> getBrands() async {
    emit(HomeLoadingState());
    GetBrandsUseCase getBrandsUseCase = GetBrandsUseCase(homeTabDomainRepo);
    var result = await getBrandsUseCase.call();
    result.fold((l) {
      emit(HomeGetBrandsErrorState(l));
    }, (r) {
      Brands = r.data ?? [];
      emit(HomeGetBrandsSuccessState(r));
    });
  }
}
