// ignore_for_file: must_be_immutable

import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/features/cat_details/domain/entities/CatDetailsEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget(
      {required this.e,
      // {required this.price,
      // required this.name,
      // required this.image,
      // required this.review,
      super.key});

  // String image;
  // String price;
  // String name;
  // String review;
  DataDetailsEntity e;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.proDetails,arguments: e);
      },
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(color:  const Color.fromRGBO(0, 65, 130, 0.3), width: 2.w),
                borderRadius: BorderRadius.circular(10.r)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SizedBox(
                            height: 128.h,
                            width: 192.w,
                            child: Image.network(e.imageCover ?? '',
                                fit: BoxFit.fill)),
                        const Icon(
                          Icons.favorite_border,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    e.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: poppins18W500()
                        .copyWith(color: AppColors.primary, fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'EGP ${e.price.toString()}',
                    style: poppins18W500()
                        .copyWith(color: AppColors.primary, fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Review (${e.ratingsAverage.toString()})',
                        style: poppins18W500().copyWith(
                            color: AppColors.primary, fontSize: 14.sp),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const Spacer(),
                      CircleAvatar(
                          radius: 15.r,
                          backgroundColor: AppColors.primary,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}