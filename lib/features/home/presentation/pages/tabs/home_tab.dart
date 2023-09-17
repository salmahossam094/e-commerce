import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/states.dart';
import 'package:e_commerce/features/home/presentation/widgets/search_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchWidget(),
                SizedBox(
                  height: 16.h,
                ),
                ImageSlideshow(
                    autoPlayInterval: 3000,
                    isLoop: true,
                    disableUserScrolling: true,
                    children: [
                      Image.asset(AppImages.image1),
                      Image.asset(AppImages.image2),
                      Image.asset(AppImages.image3),
                    ]),
                Text(
                  'Categories',
                  style: poppins18W500().copyWith(color: AppColors.primary),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 270.h,
                  child: state is HomeLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, crossAxisSpacing: 2),
                          itemCount: HomeCubit.get(context).categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.catDetails,
                                    arguments: HomeCubit.get(context)
                                        .categories[index]
                                        .id);
                              },
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100.h,
                                    width: 100.w,
                                    child: ClipOval(
                                      child: Image.network(
                                        HomeCubit.get(context)
                                                .categories[index]
                                                .image ??
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy0iQbDTKhlpXDKFfRjPGm2FsII2G8MoowXFGfbZfL&s',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    HomeCubit.get(context)
                                            .categories[index]
                                            .name ??
                                        '',
                                    style: poppins18W500().copyWith(
                                        fontSize: 14.sp,
                                        color: AppColors.primary),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Brands',
                  style: poppins18W500().copyWith(color: AppColors.primary),
                ),
                SizedBox(
                  height: 270.h,
                  child: state is HomeLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, crossAxisSpacing: 2),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 100.h,
                                  width: 100.w,
                                  child: ClipOval(
                                    child: Image.network(
                                      HomeCubit.get(context)
                                              .brands[index]
                                              .image ??
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy0iQbDTKhlpXDKFfRjPGm2FsII2G8MoowXFGfbZfL&s',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  HomeCubit.get(context).brands[index].name ??
                                      "",
                                  style: poppins18W500().copyWith(
                                      color: AppColors.primary,
                                      fontSize: 14.sp),
                                ),
                              ],
                            );
                          },
                          itemCount: HomeCubit.get(context).brands.length,
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
