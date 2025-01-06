import 'package:UCskincare/core/utils/app_colors.dart';
import 'package:UCskincare/core/widgets/app_text.dart';
import 'package:UCskincare/core/widgets/centred_text_button.dart';
import 'package:UCskincare/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_string.dart';

class StreaksScreen extends ConsumerWidget {
  const StreaksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.read(routineProvider.notifier).streakCount;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText.defaultTextBold(
          AppString.streaks,
          context: context,
          size: 20.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppText.bigTextBold(
                  AppString.goals,
                  context: context,
                  size: 20.sp,
                ),
                SizedBox(width: 2.w),
                AppText.bigTextBold(
                  "${count + 1}",
                  context: context,
                  size: 20.sp,
                ),
                SizedBox(width: 2.w),
                AppText.bigTextBold(
                  AppString.streakDays,
                  context: context,
                  size: 20.sp,
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Container(
              padding: EdgeInsets.fromLTRB(5.w, 3.h, 5.w, 3.h),
              height: 15.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColorsTheme.light().bgColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.defaultTextBold(
                    AppString.streakDays,
                    context: context,
                    size: 17.sp,
                  ),
                  SizedBox(height: 1.h),
                  AppText.bigTextBold(
                    count.toString(),
                    context: context,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.h),
            AppText.bigTextDefault(
              "Daily Streak",
              context: context,
              size: 18.sp,
            ),
            SizedBox(height: 1.h),
            AppText.bigTextDefault(
              count.toString(),
              context: context,
            ),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 5.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColorsTheme.light().bgColor,
              ),
              child: const Text(AppString.getStarted),
            ),
            SizedBox(height: 2.h)
          ],
        ),
      ),
    );
  }
}
