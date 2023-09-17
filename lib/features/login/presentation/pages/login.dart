import 'package:e_commerce/core/utils/components.dart';
import 'package:e_commerce/core/utils/text_styles.dart';
import 'package:e_commerce/features/login/data/data_sources/remote_data_source.dart';
import 'package:e_commerce/features/login/presentation/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../manager/states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRemoteDataSource()),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),
              ),
            );
          }
          else if (state is LoginErrorState)
          {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(state.failures.message),
              ),
            );
          }
          else if (state is LoginSuccessState) {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeRoute,
              arguments: state.loginEntity,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.primary,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 91.h,
                    ),
                    Image.asset(
                      AppImages.logo,
                      height: 71.h,
                      width: 237.w,
                    ),
                    SizedBox(
                      height: 86.h,
                    ),
                    Text(
                      AppStrings.welcome,
                      style: poppins24W600(),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      AppStrings.signinWith,
                      style: poppins18W500().copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      AppStrings.email,
                      style: poppins18W500(),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    defaultFormField(
                        controller: LoginCubit.get(context).emailController,
                        label: AppStrings.emailHint,
                        isPass: false,
                        validate: (value) {
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
                      controller: LoginCubit.get(context).passwordController,
                      label: AppStrings.passHint,
                      isPass: true,
                      validate: (value) {
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            AppStrings.forget,
                            style: poppins18W500(),
                          ),
                        )),
                    SizedBox(
                      height: 56.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        LoginCubit.get(context).login();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: Colors.white,
                          fixedSize: Size(398.w, 64.h)),
                      child: Text(
                        AppStrings.login,
                        style: poppins24W600()
                            .copyWith(fontSize: 20, color: AppColors.primary),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Row(
                      children: [
                        Text(
                          AppStrings.donotHave,
                          style: poppins18W500(),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.signUpRoute);
                            },
                            child: Text(AppStrings.createAcc,
                                style: poppins18W500()))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
