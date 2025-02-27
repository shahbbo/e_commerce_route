import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../domain/entities/category_or_brand_entity.dart';

class CustomCategoryOrBrandWidget extends StatelessWidget {
 final CategoryOrBrandEntity categoryOrBrand ;
  const CustomCategoryOrBrandWidget({super.key, required this.categoryOrBrand});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 115.h,
          width: 115.w,
          fit: BoxFit.cover,
          imageUrl: categoryOrBrand.image??'',
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
        ),
        SizedBox(height: 8.h),
        Text(
          categoryOrBrand.name??'',
          style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
        ),
      ],
    );
  }
}
