import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';

class CustomButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Color? color;
  final double? radius;
  final void Function() onTap;
  final TextStyle? textStyle;
  final bool border;

  const CustomButton(
      {super.key,
      this.prefixIcon,
      this.textStyle,
      this.border = true,
      this.color,
      this.radius,
      this.suffixIcon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: border
              ? const StadiumBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.r)),
          backgroundColor: color ?? ColorManager.primary,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon ?? const SizedBox(),
            SizedBox(
              width: 24.w,
            ),
            Text(
              label,
              style: textStyle ??
                  getMediumStyle(color: ColorManager.white)
                      .copyWith(fontSize: 20.sp),
            ),
            SizedBox(
              width: 27.w,
            ),
            suffixIcon ?? const SizedBox()
          ],
        ));
  }
}
