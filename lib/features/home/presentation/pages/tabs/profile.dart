import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/cache_helper.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome, ${HomeCubit.get(context).userName.toUpperCase()}',
            style: poppins18W500().copyWith(color: AppColors.primary),
          ),
          Text(
            HomeCubit.get(context).email,
            style: poppins14W400(),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                'Sign out',
                style: poppins18W500().copyWith(color: AppColors.primary),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  CacheHelper.removeData('User');
                  CacheHelper.removeData('UserName');
                  CacheHelper.removeData('Email');
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.loginRoute, (route) => false);
                },
                child: const Icon(
                  Icons.logout,
                  color: AppColors.primary,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
