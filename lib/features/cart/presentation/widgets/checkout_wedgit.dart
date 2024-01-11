import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/cart/presentation/manager/cubit.dart';
import 'package:e_commerce/features/cart/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CheckoutWidget extends StatelessWidget {
  CheckoutWidget({required this.totalPrice, super.key});

  String totalPrice;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
      bloc: BlocProvider.of<CartCubit>(context),
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total price',
                style: poppins24W600()
                    .copyWith(color: AppColors.primary.withOpacity(0.6)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                totalPrice,
                style: poppins24W600().copyWith(color: AppColors.primary),
              )
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
