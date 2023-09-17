// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/cat_details/domain/entities/CatDetailsEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({required this.entity, super.key});

  DataDetailsEntity entity;

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
              )),
          IconButton(
              onPressed: () {},
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
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
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
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image.network(
                        entity.images![index],
                        width: double.infinity.w,
                        height: 300.h,
                        fit: BoxFit.fill,
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
                    style: poppins18W500().copyWith(color: AppColors.primary),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  ),
                ),
                const Spacer(),
                Text(
                  "EGP ${entity.price.toString()}",
                  style: poppins18W500().copyWith(color: AppColors.primary),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: AppColors.primary),
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Text(
                    "${entity.sold.toString()} Sold",
                    style: poppins18W500().copyWith(color: AppColors.primary),
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
                  style: poppins18W500()
                      .copyWith(color: AppColors.primary, fontSize: 14.sp),
                ),
                const Spacer(),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 11.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                        color: const Color(0xff004182),
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Container(
                            width: 22.r,
                            height: 22.r,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(11.r)),
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
                          '1',
                          style: poppins18W500(),
                        ),
                        InkWell(
                          child: Container(
                            width: 22.r,
                            height: 22.r,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(11.r)),
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
              padding: EdgeInsets.all(16.0),
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
                        'EGP 3500',
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
                        Icon(
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
                    onPressed: () {},
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
