import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/resources/color_manager.dart';
import '../cubit/home_tab_cubit.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorColor: ColorManager.primaryDark,
      indicatorBackgroundColor: ColorManager.white,
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
      children: HomeScreenCubit.get(context).sliderImages
          .map((url) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          url,
          fit: BoxFit.fill,
          width: 210.w,
          height: 210.h,
        ),
      ))
          .toList(),
    );
  }
}
