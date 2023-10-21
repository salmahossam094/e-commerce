import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:e_commerce/features/home/data/repositories/home_tab_data_repo.dart';
import 'package:e_commerce/features/home/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce/features/home/domain/entities/GetWishListResponse.dart';
import 'package:e_commerce/features/home/domain/entities/SubCatEntity.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';
import 'package:e_commerce/features/home/domain/use_cases/add_to_cart_usecase.dart';
import 'package:e_commerce/features/home/domain/use_cases/get_brands_usecase.dart';
import 'package:e_commerce/features/home/domain/use_cases/get_sub_cat_usecase.dart';
import 'package:e_commerce/features/home/domain/use_cases/home_tab_usecase.dart';
import 'package:e_commerce/features/home/domain/use_cases/wish_list_usecase.dart';
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

  List<Widget> tabs = [
    const HomeTab(),
    const CategoryTab(),
    const FavouriteTab(),
    const ProfileTab()
  ];
  bool isFav = true;

  var searchController = TextEditingController();
  List<DataEntity> categories = [];
  List<DataEntity> brands = [];
  List<SubDataEntity> subCat = [];
  int selectedValue = 0;
  List<DataWishEntity> wishList = [];
  String userName = CacheHelper.getData('UserName');

  String email = CacheHelper.getData('Email');

  void changeNav(int value) {
    emit(HomeInitState());
    bottomNavIndex = value;
    emit(ChangeNavBarState());
  }

  void changeCat(int value) {
    emit(HomeLoadingState());
    selectedValue = value;
    emit(HomeChangeCatState());
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
      brands = r.data ?? [];
      emit(HomeGetBrandsSuccessState(r));
    });
  }

  Future<void> getSubCat(String catCode) async {
    emit(HomeGetSubLoadingState());
    GetSubCatUseCase getSubCatUseCase = GetSubCatUseCase(homeTabDomainRepo);
    var result = await getSubCatUseCase.call(catCode);
    result.fold((l) {
      emit(HomeGetSubCatErrorState(l));
    }, (r) {
      subCat = r.data ?? [];
      emit(HomeGetSubCatSuccessState(r));
    });
  }

  GetWishListResponseEntity r1 = GetWishListResponseEntity();

  getWishList() async {
    emit(GetWishLoadingState());
    WishListUseCase wishListUseCase = WishListUseCase(homeTabDomainRepo);
    var result = await wishListUseCase.call();
    result.fold((l) {

      emit(GetWishErrorState(l));
    }, (r) {
      r1 = r;
      wishList = r.data ?? [];

      emit(GetWishSuccessState(r));
    });
  }

  addToCart(String id) async {
    emit(AddToCartLoadingState());
    AddToCartUseCase addToCartUseCase = AddToCartUseCase(homeTabDomainRepo);
    var result = await addToCartUseCase.call(id);
    result.fold((l) {
      emit(AddToCartErrorState(l));
    }, (r) {
      emit(AddToCartSuccessState(r));
    });
  }

  deleteWish(String proId) async {
    emit(DeleteWishLoadingState());
    WishListUseCase wishListUseCase = WishListUseCase(homeTabDomainRepo);
    var result = await wishListUseCase.deleteWish(proId);
    result.fold((l) {
      emit(DeleteWishErrorState(l));
    }, (r) {
      isFav = false;
      emit(DeleteWishSuccessState(r));
    });
  }
}
