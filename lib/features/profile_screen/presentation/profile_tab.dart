import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../../../../core/helpers/local/cache_helper.dart';
import '../../../../core/widget/validators.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  bool isFullNameReadOnly = true;
  bool isEmailReadOnly = true;
  bool isPasswordReadOnly = true;
  bool isMobileNumberReadOnly = true;
  bool isAddressReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome, Mohamed',
                    style: getSemiBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s18),
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      CacheHelper.removeData(key: 'token');
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.signInRoute, (route) => false);
                    },
                  ),
                ],
              ),
              Text(
                'mohamed.N@gmail.com',
                style: getRegularStyle(
                    color: ColorManager.primary.withAlpha(125),
                    fontSize: FontSize.s14),
              ),
              SizedBox(height: AppSize.s18.h),
              // name
              CustomTextField(
                borderBackgroundColor: ColorManager.primary.withAlpha(125),
                readOnly: isFullNameReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your full name',
                label: 'Full Name',
                controller: TextEditingController(text: 'Mohamed Mohamed Nabil'),
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: IconButton(
                  icon: isFullNameReadOnly ? const Icon(Icons.edit_off_outlined) : const Icon(Icons.mode_edit_outline_rounded),
                  onPressed: () {
                    setState(() {
                      isFullNameReadOnly = !isFullNameReadOnly;
                    });
                  },
                ),
                validation: AppValidators.validateFullName,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              // email
              CustomTextField(
                borderBackgroundColor: ColorManager.primary.withAlpha(125),
                readOnly: isEmailReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your email address',
                label: 'E-mail address',
                controller: TextEditingController(text: 'mohamed.N@gmail.com'),
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: IconButton(
                  icon: isEmailReadOnly ? const Icon(Icons.edit_off_outlined) : const Icon(Icons.mode_edit_outline_rounded),
                  onPressed: () {
                    setState(() {
                      isEmailReadOnly = !isEmailReadOnly;
                    });
                  },
                ),
                textInputType: TextInputType.emailAddress,
                validation: AppValidators.validateEmail,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              CustomTextField(
                onTap: () {},
                controller: TextEditingController(text: '123456789123456'),
                borderBackgroundColor: ColorManager.primary.withAlpha(125),
                readOnly: isPasswordReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your password',
                label: 'Password',
                isObscured: true,
                labelTextStyle: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s18),
                validation: AppValidators.validatePassword,
                hintTextStyle: getRegularStyle(color: ColorManager.primary).copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              // mobile number
              CustomTextField(
                controller: TextEditingController(text: '01122118855'),
                borderBackgroundColor: ColorManager.primary.withAlpha(125),
                readOnly: isMobileNumberReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your mobile no.',
                label: 'Your mobile number',
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: IconButton(
                  icon: isMobileNumberReadOnly ? const Icon(Icons.edit_off_outlined) : const Icon(Icons.mode_edit_outline_rounded),
                  onPressed: () {
                    setState(() {
                      isMobileNumberReadOnly = !isMobileNumberReadOnly;
                    });
                  },
                ),
                textInputType: TextInputType.phone,
                validation: AppValidators.validatePhoneNumber,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              // address
              CustomTextField(
                controller:
                    TextEditingController(text: '6th October, street 11.....'),
                borderBackgroundColor: ColorManager.primary.withAlpha(125),
                readOnly: isAddressReadOnly,
                backgroundColor: ColorManager.white,
                hint: '6th October, street 11.....',
                label: 'Your Address',
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: IconButton(
                  icon: isAddressReadOnly ? const Icon(Icons.edit_off_outlined) : const Icon(Icons.mode_edit_outline_rounded),
                  onPressed: () {
                    setState(() {
                      isAddressReadOnly = !isAddressReadOnly;
                    });
                  },
                ),
                textInputType: TextInputType.streetAddress,
                validation: AppValidators.validateFullName,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s50.h),
            ],
          ),
        ),
      ),
    );
  }
}
