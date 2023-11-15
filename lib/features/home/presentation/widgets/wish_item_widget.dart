// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/home/domain/entities/GetWishListResponse.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishItemWidget extends StatelessWidget {
  DataWishEntity wishlist;

  WishItemWidget({required this.wishlist, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.primary.withOpacity(0.5))),
      child: Row(
        children: [
          CachedNetworkImage(
            width: 120.w,
            height: 113.h,
            imageUrl: wishlist.imageCover ??
                "https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-15.png",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wishlist.title ?? '',
                  style: poppins18W500().copyWith(color: AppColors.primary),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'EGP ${wishlist.price.toString()} ',
                  style: poppins18W500().copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              InkWell(
                onTap: () {
                  HomeCubit.get(context).deleteWish(wishlist.id ?? '');
                },
                child: const Icon(
                  Icons.favorite,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: AppColors.primary,
                      width: 3.w,
                    )),
                child: InkWell(
                    onTap: () {
                      HomeCubit.get(context).addToCart(wishlist.id ?? '');
                    },
                    child: const Icon(
                      Icons.add,
                      color: AppColors.primary,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
