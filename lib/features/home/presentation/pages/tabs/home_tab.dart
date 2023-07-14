import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/states.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 348.w,
                      height: 50.h,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search_rounded,
                              color: AppColors.primary,
                              size: 35,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    const BorderSide(color: AppColors.primary)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    const BorderSide(color: AppColors.primary)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    const BorderSide(color: AppColors.primary)),
                            hintText: 'what do you search for?',
                            filled: true,
                            hintStyle: poppins18W500().copyWith(
                              color: AppColors.hintColor,
                              fontWeight: FontWeight.w100,
                            ),
                            contentPadding: const EdgeInsets.only(top: 25)),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.primary,
                    )
                  ],
                ),
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
                      ? Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: HomeCubit.get(context).categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 100.h,
                                  width: 100.w,
                                  child: ClipOval(
                                    child: Image.network(
                                      HomeCubit.get(context)
                                          .categories[index]
                                          .image!,
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
                      ? Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
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
                                          .Brands[index]
                                          .image!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  HomeCubit.get(context).Brands[index].name ?? "",
                                  style: poppins18W500()
                                      .copyWith(color: AppColors.primary,fontSize: 14.sp),
                                ),
                              ],
                            );
                          },
                          itemCount: HomeCubit.get(context).Brands.length,
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
