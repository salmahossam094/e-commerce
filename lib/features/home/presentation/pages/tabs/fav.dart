import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/features/home/presentation/manager/cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/states.dart';
import 'package:e_commerce/features/home/presentation/widgets/wish_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(

      builder: (context, state) {
        return HomeCubit.get(context).wishList.isEmpty
            ? Center(
                child: Text(
                  'Your wishlist is empty',
                  style: poppins24W600().copyWith(color: AppColors.primary),
                ),
              )
            : ListView.builder(
                itemCount: HomeCubit.get(context).wishList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: WishItemWidget(
                      wishlist: HomeCubit.get(context).wishList[index]),
                ),
              );
      },
      listener: (BuildContext context, HomeStates state) {
        if (state is DeleteWishLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Center(
                  child: CircularProgressIndicator(
                color: AppColors.primary,
                backgroundColor: Colors.transparent,
              )),
            ),
          );
        } else if (state is DeleteWishSuccessState) {
          Navigator.pop(context);
          AwesomeDialog(
            context: context,
            autoHide: const Duration(seconds: 3),
            dialogType: DialogType.success,
            title: "Deleted from wishlist Successfully",
          ).show();
        } else if (state is DeleteWishErrorState) {
          Navigator.pop(context);
          AwesomeDialog(
            context: context,
            autoHide: const Duration(seconds: 3),
            dialogType: DialogType.error,
            title: "Error",
          ).show();
        } else if (state is AddToCartLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (state is AddToCartSuccessState) {
          Navigator.pop(context);
          AwesomeDialog(
            context: context,
            autoHide: const Duration(seconds: 3),
            dialogType: DialogType.success,
            title: "Add To Cart Successfully",
          ).show();
        } else if (state is AddToCartErrorState) {
          Navigator.pop(context);
          AwesomeDialog(
                  context: context,
                  autoHide: const Duration(seconds: 3),
                  dialogType: DialogType.error,
                  title: "Error",
                  desc: state.failures.message)
              .show();
        }
      },
    );
  }
}
