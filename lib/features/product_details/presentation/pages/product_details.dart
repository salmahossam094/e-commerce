// ignore_for_file: must_be_immutable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/cat_details/domain/entities/CatDetailsEntity.dart';
import 'package:e_commerce/features/cat_details/presentation/widgets/search_delgate.dart';
import 'package:e_commerce/features/product_details/data/data_sources/pro_dto.dart';
import 'package:e_commerce/features/product_details/presentation/manager/cubit.dart';
import 'package:e_commerce/features/product_details/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({required this.entity, super.key});

  DataDetailsEntity entity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProdCubit(RemotePro()),
      child: BlocConsumer<ProdCubit, ProDetStates>(
        listener: (context, state) {
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
                  )),
            );
          } else if (state is AddToCartErrorState) {
            Navigator.pop(context);
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              autoHide: const Duration(seconds: 3),
              title: 'Error',
              desc: state.failures.message,
            ).show();
          } else if (state is AddToCartSuccessState) {
            Navigator.pop(context);
            AwesomeDialog(
                    autoHide: const Duration(seconds: 5),
                    context: context,
                    animType: AnimType.rightSlide,
                    title: 'Successfully',
                    desc: 'Added to Cart',
                    dialogType: DialogType.success)
                .show();
          } else if (state is UpdateQuantityErrorState) {
            AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    autoHide: const Duration(seconds: 3),
                    title: 'Error',
                    desc: 'Please add product to cart')
                .show();
          } else if (state is UpdateQuantitySuccessState) {
            AwesomeDialog(
                    autoHide: const Duration(seconds: 5),
                    context: context,
                    animType: AnimType.rightSlide,
                    title: 'Successfully',
                    desc: 'Up to Cart',
                    dialogType: DialogType.success)
                .show();
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.onPrimary,
            appBar: AppBar(
              backgroundColor: AppColors.onPrimary,
              elevation: 0.0,
              iconTheme: const IconThemeData(color: AppColors.hintColor),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_sharp,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context, delegate: MySearchDelegate());
                    },
                    icon: const Icon(
                      Icons.search_outlined,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.cart);
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                    )),
              ],
              title: Text(
                'Product Details',
                style: poppins18W500().copyWith(color: AppColors.hintColor),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r).w,
                        border: Border.all(
                            color: const Color(0xff004182).withOpacity(.3),
                            width: 2.w)),
                    child: ImageSlideshow(
                        autoPlayInterval: 3000,
                        indicatorRadius: 4.r,
                        height: 300.h,
                        width: double.infinity.w,
                        isLoop: true,
                        disableUserScrolling: true,
                        children: List.generate(
                          entity.images!.length,
                          (index) => ClipRRect(
                            borderRadius: BorderRadius.circular(15.r).w,
                            child: CachedNetworkImage(
                              imageUrl: entity.images![index],
                              width: double.infinity.w,
                              height: 300.h,
                              fit: BoxFit.fill,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          entity.title ?? '',
                          style: poppins18W500()
                              .copyWith(color: AppColors.primary),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Text(
                        "EGP ${entity.price.toString()}",
                        style:
                            poppins18W500().copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16)
                            .r,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.w, color: AppColors.primary),
                            borderRadius: BorderRadius.circular(20.r).w),
                        child: Text(
                          "${entity.sold.toString()} Sold",
                          style: poppins18W500()
                              .copyWith(color: AppColors.primary),
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      Text(
                        ' ${entity.ratingsAverage.toString()}(${entity.ratingsQuantity.toString()})',
                        style: poppins18W500().copyWith(
                            color: AppColors.primary, fontSize: 14.sp),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                                  vertical: 11, horizontal: 16)
                              .r,
                          decoration: BoxDecoration(
                              color: const Color(0xff004182),
                              borderRadius: BorderRadius.circular(20.r).w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                focusColor: Colors.red,
                                autofocus: true,
                                onTap: () {
                                  if (ProdCubit.get(context).proCount > 1) {
                                    ProdCubit.get(context).proCount--;
                                    ProdCubit.get(context).updateQuantity(
                                        entity.sid!,
                                        ProdCubit.get(context).proCount);
                                  }
                                },
                                child: Container(
                                  width: 22.w,
                                  height: 22.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2.w, color: Colors.white),
                                      borderRadius:
                                          BorderRadius.circular(11).w),
                                  child: const Center(
                                    child: Icon(
                                      Icons.remove,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                ProdCubit.get(context).proCount.toString(),
                                style: poppins18W500(),
                              ),
                              InkWell(
                                onTap: () {
                                  if (ProdCubit.get(context).isAdded) {
                                    ProdCubit.get(context).proCount++;
                                    ProdCubit.get(context).updateQuantity(
                                        entity.sid!,
                                        ProdCubit.get(context).proCount);
                                    ProdCubit.get(context).totalPrice =
                                        int.parse(ProdCubit.get(context)
                                                .cart
                                                .data
                                                ?.totalCartPrice
                                                .toString() ??
                                            '0');
                                  } else {
                                    AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.error,
                                            autoHide:
                                                const Duration(seconds: 3),
                                            title: 'Error',
                                            desc: 'Please add product to cart')
                                        .show();
                                  }
                                },
                                child: Container(
                                  width: 22.w,
                                  height: 22.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2.w, color: Colors.white),
                                      borderRadius:
                                          BorderRadius.circular(11).w),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Description',
                    style: poppins18W500().copyWith(color: AppColors.primary),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    entity.description ?? '',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: const Color.fromRGBO(6, 0, 79, 0.6)),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total Price',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: const Color.fromRGBO(6, 0, 79, 0.6)),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              'EGP ${ProdCubit.get(context).totalPrice}',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: const Color.fromRGBO(6, 0, 79, 1)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 33.w,
                        ),
                        Expanded(
                            child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              backgroundColor: AppColors.primary,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32.w, vertical: 15.h)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.shopping_cart_outlined,
                              ),
                              SizedBox(
                                width: 24.w,
                              ),
                              Text(
                                'Add to cart',
                                style: poppins18W500(),
                              )
                            ],
                          ),
                          onPressed: () {
                            ProdCubit.get(context)
                                .addToCart(entity.id.toString());
                          },
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
