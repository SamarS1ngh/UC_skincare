import 'package:UCskincare/core/utils/app_string.dart';
import 'package:UCskincare/core/widgets/app_text.dart';
import 'package:UCskincare/feature/routine/view/widgets/routine_label.dart';
import 'package:UCskincare/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../core/widgets/centred_text_button.dart';

class RoutineScreen extends ConsumerWidget {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(routineProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText.defaultTextBold(
          AppString.dailySkincare,
          context: context,
          size: 20.sp,
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              ref.read(routineProvider.notifier).pickImage(0);
            },
            child: RoutineLabel(
              product: AppString.cleanser,
              productName: AppString.cleanserName,
              imageWithTime: images[0],
            ),
          ),
          GestureDetector(
            onTap: () {
              ref.read(routineProvider.notifier).pickImage(1);
            },
            child: RoutineLabel(
              product: AppString.toner,
              productName: AppString.tonerName,
              imageWithTime: images[1],
            ),
          ),
          GestureDetector(
            onTap: () {
              ref.read(routineProvider.notifier).pickImage(2);
            },
            child: RoutineLabel(
              product: AppString.moisturizer,
              productName: AppString.moisturizerName,
              imageWithTime: images[2],
            ),
          ),
          GestureDetector(
            onTap: () {
              ref.read(routineProvider.notifier).pickImage(3);
            },
            child: RoutineLabel(
              product: AppString.sunscreen,
              productName: AppString.sunscreenName,
              imageWithTime: images[3],
            ),
          ),
          GestureDetector(
            onTap: () {
              ref.read(routineProvider.notifier).pickImage(4);
            },
            child: RoutineLabel(
              product: AppString.lipBalm,
              productName: AppString.lipBalmName,
              imageWithTime: images[4],
            ),
          ),
          const Spacer(),
          Center(
            child: CenteredTextButton.primary(
                label: 'Done for today!',
                onTap: () {
                  ref.read(routineProvider.notifier).uploadImages();
                },
                context: context),
          ),
          SizedBox(height: 5.h)
        ],
      ),
    );
  }
}
