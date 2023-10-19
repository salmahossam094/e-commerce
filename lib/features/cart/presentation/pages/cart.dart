import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/features/cart/data/data_sources/cart_dto.dart';
import 'package:e_commerce/features/cart/presentation/manager/cubit.dart';
import 'package:e_commerce/features/cart/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(RemoteCart())..getCart(),
      child: BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {
          if (state is CartLoadingState) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                )),
              ),
            );
          } else if (state is GetCartSuccessState) {
            AwesomeDialog(
                    context: context,
                    animType: AnimType.rightSlide,
                    title: 'Successfully',
                    autoHide: const Duration(seconds: 3),
                    dialogType: DialogType.success)
                .show();
          } else if (state is GetCartErrorState) {
            AwesomeDialog(
                    context: context,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: state.failures.message,
                    dialogType: DialogType.error)
                .show();
          } else if (state is DeleteCartSuccessState) {
            Navigator.pop(context);
            AwesomeDialog(
                    context: context,
                    animType: AnimType.rightSlide,
                    title: 'Deleted Successfully',
                    autoHide: const Duration(seconds: 3),
                    dialogType: DialogType.success)
                .show();
          } else if (state is UpdateQuaSuccessState) {
            Navigator.pop(context);
            AwesomeDialog(
                    context: context,
                    animType: AnimType.rightSlide,
                    title: 'Successfully',
                    autoHide: const Duration(seconds: 3),
                    dialogType: DialogType.success)
                .show();
          } else if (state is UpdateQuaErrorState) {
            AwesomeDialog(
                    context: context,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    dialogType: DialogType.error)
                .show();
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              iconTheme: const IconThemeData(color: AppColors.primary),
              title: Text(
                'Cart',
                style: poppins24W600().copyWith(color: AppColors.primary),
              ),
              centerTitle: true,
            ),
            body: state is CartLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child:
                            CartCubit.get(context)
                                        .cartResponse
                                        .numOfCartItems !=
                                    0
                                ? ListView.builder(
                                    itemBuilder: (context, index) => Column(
                                      children: [
                                        Container(
                                            height: 115.h,
                                            width: 400.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                                border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        0, 65, 130, 0.3),
                                                    width: 1.w)),
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.r),
                                                      border: Border.all(
                                                          color: const Color
                                                              .fromRGBO(
                                                              0, 65, 130, 0.3),
                                                          width: 1.w)),
                                                  child: Image.network(
                                                    CartCubit.get(context)
                                                            .cartResponse
                                                            .data
                                                            ?.products![index]
                                                            .product
                                                            ?.imageCover ??
                                                        'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png?20210219185637',
                                                    height: 113.h,
                                                    width: 120.w,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8,
                                                        vertical: 8),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                CartCubit.get(
                                                                            context)
                                                                        .cartResponse
                                                                        .data
                                                                        ?.products![
                                                                            index]
                                                                        .product
                                                                        ?.title ??
                                                                    '',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                maxLines: 2,
                                                                style: poppins14W400()
                                                                    .copyWith(
                                                                        color: AppColors
                                                                            .primary),
                                                              ),
                                                            ),
                                                            const Spacer(),
                                                            IconButton(
                                                                onPressed: () {
                                                                  CartCubit.get(context).deleteItem(CartCubit.get(
                                                                              context)
                                                                          .cartResponse
                                                                          .data
                                                                          ?.products?[
                                                                              index]
                                                                          .product
                                                                          ?.sid ??
                                                                      '');
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .delete_outline_rounded,
                                                                  color: AppColors
                                                                      .primary,
                                                                  size: 24,
                                                                ))
                                                          ],
                                                        ),
                                                        Spacer(),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              CartCubit.get(
                                                                          context)
                                                                      .cartResponse
                                                                      .data!
                                                                      .products?[
                                                                          index]
                                                                      .price
                                                                      .toString() ??
                                                                  '',
                                                              style: poppins18W500()
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .primary),
                                                            ),
                                                            Spacer(),
                                                            Expanded(
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            8.h,
                                                                        horizontal:
                                                                            10.w),
                                                                decoration: BoxDecoration(
                                                                    color: const Color(
                                                                        0xff004182),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.r)),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        CartCubit.get(context)
                                                                            .proCount = int.parse(CartCubit.get(
                                                                                context)
                                                                            .cartResponse
                                                                            .data!
                                                                            .products![index]
                                                                            .count
                                                                            .toString());
                                                                        if (CartCubit.get(context).proCount <=
                                                                            1) {
                                                                          print(CartCubit.get(context)
                                                                              .cartResponse
                                                                              .data!
                                                                              .products![index]
                                                                              .count);
                                                                          CartCubit.get(context).deleteItem(CartCubit.get(context)
                                                                              .cartResponse
                                                                              .data!
                                                                              .products![index]
                                                                              .product!
                                                                              .sid!);
                                                                        } else {
                                                                          CartCubit.get(context)
                                                                              .proCount--;
                                                                          CartCubit.get(context).updateCount(
                                                                              CartCubit.get(context).cartResponse.data!.products![index].product!.sid!,
                                                                              CartCubit.get(context).proCount);
                                                                        }
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            22.r,
                                                                        height:
                                                                            22.r,
                                                                        decoration: BoxDecoration(
                                                                            border:
                                                                                Border.all(width: 2, color: Colors.white),
                                                                            borderRadius: BorderRadius.circular(11.r)),
                                                                        child:
                                                                            const Center(
                                                                          child:
                                                                              Icon(
                                                                            Icons.remove,
                                                                            size:
                                                                                15,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      CartCubit.get(context)
                                                                              .cartResponse
                                                                              .data
                                                                              ?.products?[index]
                                                                              .count
                                                                              .toString() ??
                                                                          '',
                                                                      style:
                                                                          poppins18W500(),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        CartCubit.get(context)
                                                                            .proCount = int.parse(CartCubit.get(
                                                                                context)
                                                                            .cartResponse
                                                                            .data!
                                                                            .products![index]
                                                                            .count
                                                                            .toString());
                                                                        CartCubit.get(context)
                                                                            .proCount++;
                                                                        CartCubit.get(context).updateCount(
                                                                            CartCubit.get(context).cartResponse.data!.products![index].product!.sid!,
                                                                            CartCubit.get(context).proCount);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            22.r,
                                                                        height:
                                                                            22.r,
                                                                        decoration: BoxDecoration(
                                                                            border:
                                                                                Border.all(width: 2, color: Colors.white),
                                                                            borderRadius: BorderRadius.circular(11.r)),
                                                                        child:
                                                                            const Center(
                                                                          child:
                                                                              Icon(
                                                                            Icons.add,
                                                                            size:
                                                                                10,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        SizedBox(
                                          height: 24.h,
                                        )
                                      ],
                                    ),
                                    itemCount: CartCubit.get(context)
                                        .cartResponse
                                        .data
                                        ?.products
                                        ?.length,
                                  )
                                : Center(
                                    child: Text(
                                    'Your cart is empty',
                                    style: poppins24W600()
                                        .copyWith(color: AppColors.primary),
                                  )),
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}