import 'dart:io';

import 'package:UCskincare/core/utils/app_colors.dart';
import 'package:UCskincare/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../view_model/routine_provider.dart';

class RoutineLabel extends StatelessWidget {
  const RoutineLabel({
    super.key,
    required this.productName,
    required this.product,
    required this.imageWithTime,
  });
  final String product;
  final String productName;
  final ImageWithTime? imageWithTime;

  @override
  Widget build(BuildContext context) {
    final appColor = AppColorsTheme.light();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 8.h,
            width: 16.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 2,
                  color: appColor.bgColor,
                ),
                color: appColor.bgColor),
            child: imageWithTime != null
                ? Image.file(File(imageWithTime!.image.path), fit: BoxFit.cover)
                : const Icon(Icons.check),
          ),
          SizedBox(
            width: 4.w,
          ),
          SizedBox(
            width: 50.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.defaultTextBold(
                  product,
                  context: context,
                  size: 16.sp,
                ),
                AppText.subtitleDefaultBold(
                  productName,
                  context: context,
                  size: 16.sp,
                )
              ],
            ),
          ),
          const Spacer(),
          Image.asset('assets/camera.png'),
          SizedBox(
            width: 2.w,
          ),
          if (imageWithTime != null) // Show time if image is selected
            AppText.subtitleDefaultBold(
              DateFormat.jm()
                  .format(imageWithTime!.time), // Format time in AM/PM
              context: context,
              size: 13.sp,
            ),
        ],
      ),
    );
  }
}
