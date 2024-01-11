import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/cart/presentation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Checkout extends StatefulWidget {
  Checkout({required this.mybloc, super.key});

  CartCubit mybloc;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: widget.mybloc,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: AppColors.primary,
              ),
              backgroundColor: Colors.transparent,
              title: Text(
                'Payment data',
                style: poppins24W600().copyWith(color: AppColors.primary),
              ),
              centerTitle: true,
              elevation: 0.0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: widget.mybloc.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Items ${widget.mybloc.cartResponse.data?.products?.length}",
                      style: poppins24W600().copyWith(color: AppColors.primary),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => Column(
                          children: [
                            Container(
                                height: 120.h,
                                width: 400.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r).w,
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            0, 65, 130, 0.3),
                                        width: 1.w)),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.r).w,
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  0, 65, 130, 0.3),
                                              width: 1.w)),
                                      child: ClipRRect(
                                        clipBehavior: Clip.antiAlias,
                                        borderRadius:
                                            BorderRadius.circular(20).w,
                                        child: CachedNetworkImage(
                                          imageUrl: widget
                                                  .mybloc
                                                  .cartResponse
                                                  .data
                                                  ?.products?[index]
                                                  .product
                                                  ?.imageCover ??
                                              '',
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              CircularProgressIndicator(
                                            value: downloadProgress.progress,
                                            color: AppColors.primary,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                                horizontal: 8.w, vertical: 8.h)
                                            .r,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    widget
                                                            .mybloc
                                                            .cartResponse
                                                            .data
                                                            ?.products?[index]
                                                            .product
                                                            ?.title ??
                                                        '',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    maxLines: 2,
                                                    style: poppins24W600()
                                                        .copyWith(
                                                            color: AppColors
                                                                .primary),
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  '${double.parse(widget.mybloc.cartResponse.data?.products?[index].price.toString() ?? '0') * double.parse(widget.mybloc.cartResponse.data?.products?[index].count.toString() ?? '1')}',
                                                  style: poppins18W500()
                                                      .copyWith(
                                                          color:
                                                              AppColors.primary,
                                                          fontSize: 22.sp),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: 15.h,
                            )
                          ],
                        ),
                        itemCount:
                            widget.mybloc.cartResponse.data?.products?.length,
                      ),
                    ),
                    Text(
                      'Please Enter your phone Number',
                      style: poppins24W600().copyWith(color: AppColors.primary),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please, Enter password';
                        } else if (value.length < 11) {
                          return "Please, Enter at least 6 characters";
                        }
                        return null;
                      },
                      controller: widget.mybloc.phone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Phone',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Colors.transparent))),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8).w,
                      margin: const EdgeInsets.all(8).w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Column(
                        children: [
                          Text(
                            'Order Details',
                            style: poppins24W600()
                                .copyWith(color: AppColors.primary),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              Text(
                                'Number of Items',
                                style: poppins18W500().copyWith(
                                    color: AppColors.primary, fontSize: 20.sp),
                              ),
                              Spacer(),
                              Text(
                                widget.mybloc.cartResponse.data?.products
                                        ?.length
                                        .toString() ??
                                    '',
                                style: poppins18W500().copyWith(
                                    color: AppColors.primary, fontSize: 20.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              Text(
                                'Total Price',
                                style: poppins18W500().copyWith(
                                    color: AppColors.primary, fontSize: 20.sp),
                              ),
                              Spacer(),
                              Text(
                                widget.mybloc.cartResponse.data?.totalCartPrice
                                        .toString() ??
                                    '',
                                style: poppins18W500().copyWith(
                                    color: AppColors.primary, fontSize: 20.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            'Payment Method',
                            style: poppins24W600()
                                .copyWith(color: AppColors.primary),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      widget.mybloc.formKey.currentState!
                                              .validate()
                                          ? widget.mybloc.getRequestTokenCard(
                                              amount: (double.parse(widget
                                                              .mybloc
                                                              .cartResponse
                                                              .data!
                                                              .totalCartPrice
                                                              .toString()) *
                                                          100.0)
                                                      .toString() ??
                                                  '0',
                                              currency: 'EGP',
                                              email:
                                                  CacheHelper.getData('Email'),
                                              fName: CacheHelper.getData(
                                                  'UserName'),
                                              lName: CacheHelper.getData(
                                                  'UserName'),
                                              phone: widget.mybloc.phone.text)
                                          : null;
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        textStyle: poppins18W500()),
                                    child: Text('Visa'),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.h,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      widget.mybloc.formKey.currentState!
                                              .validate()
                                          ? widget.mybloc.getRequestTokenKiosk(
                                              amount: (double.parse(widget
                                                              .mybloc
                                                              .cartResponse
                                                              .data!
                                                              .totalCartPrice
                                                              .toString()) *
                                                          100.0)
                                                      .toString() ??
                                                  '0',
                                              currency: 'EGP',
                                              email:
                                                  CacheHelper.getData('Email'),
                                              fName: CacheHelper.getData(
                                                  'UserName'),
                                              lName: CacheHelper.getData(
                                                  'UserName'),
                                              phone: widget.mybloc.phone.text)
                                          : null;
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        textStyle: poppins18W500()),
                                    child: Text('Kiosk'),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
