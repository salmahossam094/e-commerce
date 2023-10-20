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
          Image.network(
            wishlist.imageCover ?? '',
            width: 120.w,
            height: 113.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                wishlist.title ?? '',
                style: poppins18W500().copyWith(color: AppColors.primary),
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
          Spacer(),
          Column(
            children: [
              InkWell(
                onTap: () {

                },
                child: Icon(
                 HomeCubit.get(context).isFav==false? Icons.favorite_border:Icons.favorite,
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
                    child: Icon(
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
