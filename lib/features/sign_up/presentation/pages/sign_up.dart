import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/core/utils/components.dart';
import 'package:e_commerce/features/sign_up/presentation/manager/cubit.dart';
import 'package:e_commerce/features/sign_up/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/text_styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Center(
                  child: CircularProgressIndicator(
                color: AppColors.primary,
              )),
            ),
          );
        }

        else if (state is SignUpErrorState) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('error'),
              content: Text(state.failures.message),
            ),
          );
        }
        else if (state is SignUpSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.loginRoute, (route) => false);
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 85.h,
                ),
                Image.asset(
                  AppImages.logo,
                  height: 71.h,
                  width: 237.w,
                ),
                SizedBox(
                  height: 45.h,
                ),
                Text(
                  AppStrings.fullName,
                  style: poppins18W500(),
                ),
                SizedBox(
                  height: 24.h,
                ),
                defaultFormField(
                  inputAction: TextInputAction.next,
                    controller: SignUpCubit.get(context).nameController,
                    label: AppStrings.fullNameHint,
                    isPass: false,
                    validate: (value) {
                      return null;
                    }),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  AppStrings.mobile,
                  style: poppins18W500(),
                ),
                SizedBox(
                  height: 24.h,
                ),
                defaultFormField(
                  inputAction: TextInputAction.next,
                    controller: SignUpCubit.get(context).phoneController,
                    label: AppStrings.mobileHint,
                    isPass: false,
                    validate: (value) {
                      return null;
                    }),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  AppStrings.email,
                  style: poppins18W500(),
                ),
                SizedBox(
                  height: 24.h,
                ),
                defaultFormField(
                  inputAction: TextInputAction.next,
                    controller: SignUpCubit.get(context).emailController,
                    label: AppStrings.emailHint,
                    isPass: false,
                    validate: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value == null || value.isEmpty || !emailValid) {
                        return "Please Enter valid Email Address";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  AppStrings.password,
                  style: poppins18W500(),
                ),
                SizedBox(
                  height: 24.h,
                ),
                defaultFormField(
                  inputAction: TextInputAction.done,
                    controller: SignUpCubit.get(context).passwordController,
                    label: AppStrings.passHint,
                    isPass: true,
                    validate: (value) {
                      return null;
                    }),
                SizedBox(
                  height: 56.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    SignUpCubit.get(context).signUp();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.white,
                      fixedSize: Size(398.w, 64.h)),
                  child: Text(
                    AppStrings.signUp,
                    style: poppins24W600()
                        .copyWith(fontSize: 20, color: AppColors.primary),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.haveAcc,
                      style: poppins18W500(),
                    ),
                    TextButton(
                        onPressed: () {
                        Navigator.pushNamed(context, Routes.loginRoute);
                        },
                        child: Text(
                          AppStrings.login,
                          style: poppins18W500(),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
