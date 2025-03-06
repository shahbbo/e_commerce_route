import 'package:e_commerce_route/core/widget/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helpers/local/cache_helper.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/routes_manager/routes.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../core/widget/custom_text_field.dart';
import '../../../../../core/widget/validators.dart';
import 'cubit/sign_up_states.dart';
import 'cubit/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {


  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocConsumer<SignUpCubit,SignUpState>(
      listener: (context,state){
        if(state.status == SignUpStateStatus.error){
          Toasts.error(context, state.failures!.errorMessage);
        }else if(state.status == SignUpStateStatus.success){
          Toasts.success(context, 'Register Successfully.');
          CacheHelper.saveData(key: 'token', value: state.responseEntity!.token);
          Navigator.of(context).pushNamedAndRemoveUntil(Routes.mainRoute, (route) => false);
        }
      },
      builder: (context,state){
        final cubit = context.read<SignUpCubit>();
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
                      CustomTextField(
                        backgroundColor: ColorManager.white,
                        hint: 'enter your full name',
                        label: 'Full Name',
                        textInputType: TextInputType.name,
                        validation: (value) => AppValidators.validateFullName(value),
                        controller: cubit.nameController,
                      ),
                      SizedBox(
                        height: AppSize.s18.h,
                      ),
                      CustomTextField(
                        hint: 'enter your mobile no.',
                        backgroundColor: ColorManager.white,
                        label: 'Mobile Number',
                        validation: (value) => AppValidators.validatePhoneNumber(value),
                        textInputType: TextInputType.phone,
                        controller: cubit.phoneController,
                      ),
                      SizedBox(
                        height: AppSize.s18.h,
                      ),
                      CustomTextField(
                        hint: 'enter your email address',
                        backgroundColor: ColorManager.white,
                        label: 'E-mail address',
                        validation: (value) => AppValidators.validateEmail(value),
                        textInputType: TextInputType.emailAddress,
                        controller: cubit.emailController,
                      ),
                      SizedBox(
                        height: AppSize.s18.h,
                      ),
                      CustomTextField(
                        hint: 'enter your password',
                        backgroundColor: ColorManager.white,
                        label: 'password',
                        validation: (value) => AppValidators.validatePassword(value),
                        isObscured: true,
                        controller: cubit.passwordController,
                      ),
                      SizedBox(
                        height: AppSize.s18.h,
                      ),
                      CustomTextField(
                        hint: 'reEnter your Password',
                        backgroundColor: ColorManager.white,
                        label: 'Confirm password',
                        validation: (value) => AppValidators.validateConfirmPassword(value, cubit.passwordController.text),
                        isObscured: true,
                        controller: cubit.rePasswordController,
                      ),
                      SizedBox(
                        height: AppSize.s50.h,
                      ),
                      Center(
                        child: SizedBox(
                          height: AppSize.s60.h,
                          width: MediaQuery.of(context).size.width * .9,
                          child: CustomButton(
                            label: 'Sign Up',
                            color: ColorManager.white,
                            textStyle: getBoldStyle(
                                color: ColorManager.primary, fontSize: AppSize.s20),
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                cubit.register();
                              }
                              // Navigator.pushNamed(context, Routes.mainRoute);
                            },
                          ),
                        ),
                      ),
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
