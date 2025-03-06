import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../features/cart/presentation/cubit/cart_screen_cubit.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../routes_manager/routes.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;

  const GlobalAppBar({super.key, this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      elevation: 0,
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      title: SvgPicture.asset(
        SvgAssets.routeLogo,
        height: 30.h,
        width: 30.w,
        colorFilter:
            const ColorFilter.mode(ColorManager.textColor, BlendMode.srcIn),
      ),
      bottom: PreferredSize(
          preferredSize: const Size(AppSize.s100, AppSize.s60),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: ColorManager.primary,
                    style: getRegularStyle(
                        color: ColorManager.primary, fontSize: FontSize.s16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: AppMargin.m12.w,
                          vertical: AppMargin.m8.h),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              color: ColorManager.primary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              color: ColorManager.primary)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              color: ColorManager.primary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              color: ColorManager.primary)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              color: ColorManager.error)),
                      prefixIcon: Icon(CupertinoIcons.search,
                          size: 35.sp, color: ColorManager.primary),
                      hintText: 'what do you search for?',
                      hintStyle: getRegularStyle(
                          color: ColorManager.primary, fontSize: FontSize.s16),
                    ),
                  ),
                ),
                Badge(
                  backgroundColor: ColorManager.primary,
                  alignment: Alignment.topCenter,
                  label: CartScreenCubit.get(context)
                              .cartResponse
                              .numOfCartItems == null
                      ? Text(
                          CartScreenCubit.get(context)
                              .cartResponse
                              .numOfCartItems
                              .toString(),
                          style: getRegularStyle(
                              color: Colors.white),
                        )
                      : Text(
                          '0',
                          style: getRegularStyle(
                              color: Colors.white),
                        ),
                  child: IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.cartRoute),
                      icon: Icon(
                        Icons.shopping_cart,
                        color: ColorManager.primary,
                        size: 30.sp,
                      )),
                )
              ],
            ),
          )),
      // leading: const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(0, 130.h);
}
