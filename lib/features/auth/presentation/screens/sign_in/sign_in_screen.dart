import 'package:e_commerce_route/core/widget/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/routes_manager/routes.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../core/widget/custom_text_field.dart';
import '../../../../../core/helpers/local/cache_helper.dart';
import '../../../../../core/widget/validators.dart';
import 'cubit/sign_in_states.dart';
import 'cubit/sign_in_cubit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.status == SignInStateStatus.error) {
          Toasts.error(context, state.failures!.errorMessage);
        } else if (state.status == SignInStateStatus.success) {
          Toasts.success(context, 'Login Successfully');
          CacheHelper.saveData(key: 'token', value: state.responseEntity!.token);
          Navigator.of(context).pushNamedAndRemoveUntil(Routes.mainRoute, (route) => false);
        }
      },
      builder: (context, state) {
        final cubit = context.read<SignInCubit>();
        return Scaffold(
          backgroundColor: ColorManager.primary,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      Text(
                        'Welcome Back To Route',
                        style: getBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s24.sp),
                      ),
                      Text(
                        'Please sign in with your mail',
                        style: getLightStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(
                        height: AppSize.s50.h,
                      ),
                      CustomTextField(
                        backgroundColor: ColorManager.white,
                        hint: 'enter your email',
                        label: 'Email',
                        textInputType: TextInputType.emailAddress,
                        validation: (value) => AppValidators.validateEmail(value),
                        controller: cubit.emailController,
                      ),
                      SizedBox(
                        height: AppSize.s28.h,
                      ),
                      CustomTextField(
                        hint: 'enter your password',
                        backgroundColor: ColorManager.white,
                        label: 'Password',
                        validation: (value) => AppValidators.validatePassword(value),
                        isObscured: true,
                        controller: cubit.passwordController,
                      ),
                      SizedBox(
                        height: AppSize.s8.h,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forget password?',
                                style: getMediumStyle(color: ColorManager.white)
                                    .copyWith(fontSize: FontSize.s18.sp),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s60.h,
                      ),
                      Center(
                        child: SizedBox(
                          // width: MediaQuery.of(context).size.width * .8,
                          child: CustomButton(
                            // borderRadius: AppSize.s8,
                            border: false,
                            label: 'Login',
                            color: ColorManager.white,
                            textStyle: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s18),
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                cubit.login();
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: getSemiBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: FontSize.s16.sp),
                          ),
                          SizedBox(
                            width: AppSize.s8.w,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, Routes.signUpRoute),
                            child: Text(
                              'Create Account',
                              style: getSemiBoldStyle(color: ColorManager.white)
                                  .copyWith(fontSize: FontSize.s16.sp),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
