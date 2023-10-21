// ignore_for_file: must_be_immutable, file_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/cat_details/data/data_sources/remote_cat_dto.dart';
import 'package:e_commerce/features/cat_details/presentation/manager/cubit.dart';
import 'package:e_commerce/features/cat_details/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../manager/states.dart';

class CatDetails extends StatelessWidget {
  String cat;

  CatDetails(this.cat, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            CatCubit(RemoteCatDetailsDataSource())..getCatDetails(cat),
        child: BlocConsumer<CatCubit, CatDetailsStates>(
          listener: (context, state) {
            if (state is CatLoadingState) {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  title: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              );
            }
            if (state is CatErrorState) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Error"),
                  content: Text(state.failures.message),
                ),
              );
            }
            if (state is AddToCartLoadingState) {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  title: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              );
            } else if (state is AddToCartErrorState) {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Error"),
                  content: Text(state.failures.message),
                ),
              );
            } else if (state is AddToCartSuccessState) {
              Navigator.pop(context);
              AwesomeDialog(
                      context: context,
                      title: 'Successful',
                      dialogType: DialogType.success)
                  .show();
            }else  if (state is AddToWishLoadingState) {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  title: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              );
            } else if (state is AddToWishErrorState) {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Error"),
                  content: Text(state.failures.message),
                ),
              );
            } else if (state is AddToWishSuccessState) {
              Navigator.pop(context);

              AwesomeDialog(
                  context: context,
                  title: 'Successful',
                  autoHide: const Duration(seconds: 4),
                  dialogType: DialogType.success)
                  .show();
            }
          },
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  title: Image.asset(AppImages.appBarLogo),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  iconTheme: const IconThemeData(color: AppColors.primary),
                ),
                body: state is CatLoadingState
                    ? const AlertDialog(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        title: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    : CatCubit.get(context).catDet.isEmpty
                        ? Center(
                            child: Text("There's No data here",
                                style: poppins18W500().copyWith(
                                    color: AppColors.primary, fontSize: 24.sp)))
                        : SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    height: 800.h,
                                    child: GridView.count(
                                      scrollDirection: Axis.vertical,
                                      childAspectRatio: 3.3 / 5,
                                      shrinkWrap: true,
                                      crossAxisCount: 2,
                                      children: CatCubit.get(context)
                                          .catDet
                                          .map((e) => ProductWidget(
                                                // price: e.price.toString(),
                                                // name: e.title ?? "",
                                                // image: e.imageCover ?? '',
                                                // review:
                                                //     e.ratingsAverage.toString(),
                                                e: e,
                                              ))
                                          .toList(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ));
          },
        ));
  }
}
