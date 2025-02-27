import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/custom_button.dart';


class TotalPriceAndCheckout extends StatelessWidget {
  const TotalPriceAndCheckout(
      {super.key, required this.totalPrice, required this.checkoutButtonOnTap});
  final int totalPrice;
  final void Function() checkoutButtonOnTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total price',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getMediumStyle(
                color: ColorManager.textColor.withOpacity(0.6),
                fontSize: AppSize.s18.sp,
              ),
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: 90.w,
              child: Text(
                '$totalPrice EGP',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: getMediumStyle(
                  color: ColorManager.textColor,
                  fontSize: AppSize.s18.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 18.h),
        Expanded(
          child: CustomButton(
            label: 'Check Out',
            onTap: checkoutButtonOnTap,
            suffixIcon: Icon(
              Icons.arrow_forward,
              color: ColorManager.white,
            ),
          ),
        )
      ],
    );
  }
}
