import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/states.dart';
import 'package:e_commerce/features/home/presentation/widgets/search_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
      if (state is HomeChangeCatState) {
        Navigator.pop(context);
        HomeCubit.get(context).getSubCat(HomeCubit.get(context)
                .categories[HomeCubit.get(context).selectedValue]
                .id ??
            '');
      }
      if (state is HomeGetSubLoadingState) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Center(child: CircularProgressIndicator()),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        );
      }
      if (state is HomeGetSubCatSuccessState) {
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return HomeCubit.get(context).categories.isEmpty &&
              HomeCubit.get(context).subCat.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0).w,
              child: Column(
                children: [
                  const SearchWidget(),
                  SizedBox(
                    height: 16.h,
                  ),
                  state is HomeLoadingState
                      ? const CircularProgressIndicator()
                      : Expanded(
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 180.w,
                                decoration: BoxDecoration(
                                    border: Border(
                                  top: BorderSide(
                                      color: AppColors.primary, width: 1.w),
                                  left: BorderSide(
                                      color: AppColors.primary, width: 1.w),
                                )),
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                        onTap: () {
                                          HomeCubit.get(context)
                                              .changeCat(index);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, bottom: 10, top: 10).w,
                                          decoration: BoxDecoration(
                                            color: HomeCubit.get(context)
                                                        .selectedValue ==
                                                    index
                                                ? Colors.white
                                                : AppColors.primary
                                                    .withOpacity(0.2),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 5.w,
                                                height: 60.h,
                                                margin: const EdgeInsets.only(
                                                  right: 5,
                                                ).r,
                                                decoration: BoxDecoration(
                                                    color: HomeCubit.get(
                                                                    context)
                                                                .selectedValue ==
                                                            index
                                                        ? AppColors.primary
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.r).w),
                                                    border: Border.all(
                                                      width: 5.w,
                                                      color: HomeCubit.get(
                                                                      context)
                                                                  .selectedValue ==
                                                              index
                                                          ? AppColors.primary
                                                          : Colors.transparent,
                                                    )),
                                              ),
                                              Text(
                                                  HomeCubit.get(context)
                                                          .categories[index]
                                                          .name ??
                                                      "",
                                                  style:
                                                      poppins18W500().copyWith(
                                                    color: AppColors.primary,
                                                  )),
                                            ],
                                          ),
                                        ));
                                  },
                                  itemCount:
                                      HomeCubit.get(context).categories.length,
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0).w,
                                    child: Text(
                                      HomeCubit.get(context)
                                              .categories[HomeCubit.get(context)
                                                  .selectedValue]
                                              .name ??
                                          '',
                                      style: poppins18W500()
                                          .copyWith(color: AppColors.primary),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0).w,
                                        child: GridView.count(
                                          crossAxisCount: 2,
                                          childAspectRatio: 4 / 5,
                                          shrinkWrap: true,
                                          children: HomeCubit.get(context)
                                              .subCat
                                              .map((e) => InkWell(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          Routes.catDetails,
                                                          arguments: e.category);
                                                    },
                                                    child: Text(
                                                      e.name ?? '',
                                                      style: poppins18W500()
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primary,
                                                              fontSize: 15.sp),
                                                    ),
                                                  ))
                                              .toList(),
                                        )),
                                  )
                                ],
                              ))
                            ],
                          ),
                        )
                ],
              ),
            );
    });
  }
}
