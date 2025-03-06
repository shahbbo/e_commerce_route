import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class ImageSlider extends StatelessWidget {

  final List<String> images;
  const ImageSlider({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
              color: ColorManager.grey, width: 2)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: ImageSlideshow(
            indicatorColor: ColorManager.primaryDark,
            indicatorBackgroundColor: ColorManager.white,
            indicatorBottomPadding: 20.h,
            autoPlayInterval: 3000,
            isLoop: true,
            children: images
                .map((url) => CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: url,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator(
                    color: ColorManager.primaryDark,
                  )),
              errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ))
                .toList()),
      ),
    );
  }
}
