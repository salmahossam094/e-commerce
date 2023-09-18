import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle poppins24W600() => GoogleFonts.poppins(
    fontSize: 24.sp, color: AppColors.onPrimary, fontWeight: FontWeight.w600);

TextStyle poppins18W500() => GoogleFonts.poppins(
    fontSize: 18.sp, color: AppColors.onPrimary, fontWeight: FontWeight.w500);
TextStyle poppins14W400()=>  GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: const Color.fromRGBO(6, 0, 79, 0.6));
