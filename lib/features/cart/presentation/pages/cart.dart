import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/features/cart/data/data_sources/cart_dto.dart';
import 'package:e_commerce/features/cart/presentation/manager/cubit.dart';
import 'package:e_commerce/features/cart/presentation/manager/states.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var mybloc = CartCubit(RemoteCart());
    return BlocProvider(
      create: (context) => mybloc..getCart(),
      child: BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {
          if (state is CartLoadingState) {
            showDialog(
              context: context,
              builder: (context) =>
              const AlertDialog(
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
          } else if (state is SuccessOrderIdState) {
            Navigator.pushNamed(context, Routes.checkout, arguments: mybloc);
          } else if (state is ErrorOrderIdState) {
            showDialog(
              context: context,
              builder: (context) =>
              const AlertDialog(
                title: Text('Your Cart is empty'),
              ),
            );
          } else if (state is SuccessRequestTokenState) {
            Navigator.pushNamed(context, Routes.visa);
          } else if (state is ErrorRequestTokenState) {
            showDialog(
              context: context,
              builder: (context) =>
              const AlertDialog(
                title: Text('This order is paid'),
              ),
            );
          } else if (state is ErrorReferenceCodeState) {
            showDialog(
              context: context,
              builder: (context) =>
              const AlertDialog(
                title: Text('This order is paid'),
              ),
            );
            print(CacheHelper.getData('User'));
          } else if (state is SuccessReferenceCodeState) {
            showModalBottomSheet(
              context: context,
              isDismissible: false,
              builder: (context) =>
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'go to supermarket with reference code:  $reference',
                              style: poppins24W600()
                                  .copyWith(color: AppColors.primary),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
            );
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
                  child: CartCubit
                      .get(context)
                      .cartResponse
                      .numOfCartItems ==
                      0 ||
                      state is GetCartErrorState
                      ? Center(
                      child: Text(
                        'Your cart is empty',
                        style: poppins24W600()
                            .copyWith(color: AppColors.primary),
                      ))
                      : ListView.builder(
                    itemBuilder: (context, index) =>
                        CartItem(
                          title: CartCubit
                              .get(context)
                              .cartResponse
                              .data
                              ?.products![index]
                              .product
                              ?.title ??
                              '',
                          price: CartCubit
                              .get(context)
                              .cartResponse
                              .data
                              ?.products?[index]
                              .price
                              .toString() ??
                              '',
                          image: CartCubit
                              .get(context)
                              .cartResponse
                              .data
                              ?.products![index]
                              .product
                              ?.imageCover ??
                              "https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-15.png",
                          deleteItem: () {
                            CartCubit.get(context).deleteItem(
                                CartCubit
                                    .get(context)
                                    .cartResponse
                                    .data
                                    ?.products?[index]
                                    .product
                                    ?.sid ??
                                    '');
                          },
                          updateQuan: () {
                            CartCubit
                                .get(context)
                                .proCount = int.parse(
                                CartCubit
                                    .get(context)
                                    .cartResponse
                                    .data!
                                    .products![index]
                                    .count
                                    .toString());
                            if (CartCubit
                                .get(context)
                                .proCount <= 1) {
                              CartCubit.get(context).deleteItem(
                                  CartCubit
                                      .get(context)
                                      .cartResponse
                                      .data!
                                      .products![index]
                                      .product!
                                      .sid!);
                            } else {
                              CartCubit
                                  .get(context)
                                  .proCount--;
                              CartCubit.get(context).updateCount(
                                  CartCubit
                                      .get(context)
                                      .cartResponse
                                      .data!
                                      .products![index]
                                      .product!
                                      .sid!,
                                  CartCubit
                                      .get(context)
                                      .proCount);
                            }
                          },
                          quantity: CartCubit
                              .get(context)
                              .cartResponse
                              .data
                              ?.products?[index]
                              .count
                              .toString() ??
                              '',
                          addQuan: () {
                            CartCubit
                                .get(context)
                                .proCount = int.parse(
                                CartCubit
                                    .get(context)
                                    .cartResponse
                                    .data!
                                    .products![index]
                                    .count
                                    .toString());
                            CartCubit
                                .get(context)
                                .proCount++;
                            CartCubit.get(context).updateCount(
                                CartCubit
                                    .get(context)
                                    .cartResponse
                                    .data!
                                    .products![index]
                                    .product!
                                    .sid!,
                                CartCubit
                                    .get(context)
                                    .proCount);
                          },
                        ),
                    itemCount: CartCubit
                        .get(context)
                        .cartResponse
                        .data
                        ?.products
                        ?.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total price',
                            style: poppins24W600().copyWith(
                                fontSize: 18.sp,
                                color: const Color.fromRGBO(
                                    0, 65, 130, 0.6)),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            CartCubit
                                .get(context)
                                .cartResponse
                                .data
                                ?.totalCartPrice
                                .toString() ??
                                '0',
                            style: poppins18W500()
                                .copyWith(color: AppColors.primary),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  textStyle: poppins18W500(),
                                  backgroundColor: AppColors.primary),
                              onPressed: () {
                                CartCubit
                                    .get(context)
                                    .cartResponse
                                    .numOfCartItems ==
                                    0 ||
                                    state is GetCartErrorState

                                    ? showDialog(
                                  context: context,
                                  builder: (context) =>
                                  const AlertDialog(
                                    title:
                                    Text('Your cart is empty'),
                                  ),
                                ):CartCubit.get(context)
                                    .getAuthTokenCard(
                                    amount: CartCubit.get(context)
                                        .cartResponse
                                        .data
                                        ?.totalCartPrice
                                        .toString() ??
                                        '',
                                    currency: "EGP");
                              },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'checkout',
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  const Icon(Icons.arrow_forward_rounded)
                                ],
                              )))
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
