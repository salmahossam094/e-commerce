import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 348.w,
          height: 50.h,
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.primary,
                  size: 35,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide:
                    const BorderSide(color: AppColors.primary)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide:
                    const BorderSide(color: AppColors.primary)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide:
                    const BorderSide(color: AppColors.primary)),
                hintText: 'what do you search for?',
                filled: true,
                hintStyle: poppins18W500().copyWith(
                  color: AppColors.hintColor,
                  fontWeight: FontWeight.w100,
                ),
                contentPadding: const EdgeInsets.only(top: 25)),
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.shopping_cart_outlined,
          color: AppColors.primary,
        )
      ],
    );
  }
}
