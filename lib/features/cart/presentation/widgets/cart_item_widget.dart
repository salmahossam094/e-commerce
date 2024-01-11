import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  CartItem(
      {required this.title,
      required this.price,
      required this.image,
      required this.deleteItem,
      required this.updateQuan,
      required this.addQuan,
      required this.quantity,
      super.key});

  String image;
  String title;
  String price;
  String quantity;
  Function deleteItem;
  Function updateQuan;
  Function addQuan;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 120.h,
            width: 400.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r).w,
                border: Border.all(
                    color: const Color.fromRGBO(0, 65, 130, 0.3), width: 1.w)),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r).w,
                      border: Border.all(
                          color: const Color.fromRGBO(0, 65, 130, 0.3),
                          width: 1.w)),
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(20).w,
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: AppColors.primary,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h).r,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                title,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 2,
                                style: poppins14W400()
                                    .copyWith(color: AppColors.primary),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  deleteItem();
                                },
                                icon: const Icon(
                                  Icons.delete_outline_rounded,
                                  color: AppColors.primary,
                                  size: 24,
                                ))
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              price,
                              style: poppins18W500()
                                  .copyWith(color: AppColors.primary),
                            ),
                            const Spacer(),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 10.w)
                                    .r,
                                decoration: BoxDecoration(
                                    color: const Color(0xff004182),
                                    borderRadius: BorderRadius.circular(20).w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        updateQuan();
                                      },
                                      child: Container(
                                        width: 22.w,
                                        height: 22.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2.w,
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(11).w),
                                        child: const Center(
                                          child: Icon(
                                            Icons.remove,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                     quantity,
                                      style: poppins18W500(),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        addQuan();
                                      },
                                      child: Container(
                                        width: 22.r,
                                        height: 22.r,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2.w,
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(11).w),
                                        child: const Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }
}
