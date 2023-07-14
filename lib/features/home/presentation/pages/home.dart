import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/features/home/data/data_sources/remote_data_source.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeTabRemoteDataSource())..getCategory()..getBrands(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is ChangeNavBarState) {}
          if (state is HomeLoadingState) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          }
          if (state is HomeGetCategoryErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(

            appBar: AppBar(
              title: Image.asset(AppImages.appBarLogo),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: BottomNavigationBar(
                  currentIndex: HomeCubit.get(context).bottomNavIndex,
                  backgroundColor: AppColors.primary,
                  iconSize: 30,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.primary,
                  unselectedItemColor: Colors.white,
                  onTap: (value) {
                    HomeCubit.get(context).changeNav(value);
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: const Icon(Icons.home),
                        label: '',
                        activeIcon: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.home_outlined),
                        )),
                    BottomNavigationBarItem(
                        icon: const Icon(Icons.category_outlined),
                        label: '',
                        activeIcon: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.category_outlined),
                        )),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.favorite_border),
                      label: '',
                      activeIcon: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.favorite_border),
                      ),
                    ),
                    BottomNavigationBarItem(
                        icon: const Icon(Icons.person_outline),
                        label: '',
                        activeIcon: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.person_outline),
                        )),
                  ],
                ),
              ),
            ),
            body: HomeCubit.get(context)
                .tabs[HomeCubit.get(context).bottomNavIndex],
          );
        },
      ),
    );
  }
}
