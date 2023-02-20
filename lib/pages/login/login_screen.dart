import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vpn_mobile_app_design/model/app_colors.dart';
import 'package:vpn_mobile_app_design/routes/routes.dart';
import 'package:vpn_mobile_app_design/widgets/button.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  FocusNode focusNode = FocusNode();
  var padding = 1.0.obs;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GestureDetector(
        onTap: () {
          return FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 5.h),
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0.w),
                child: Column(
                  children: [
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () async {
                        padding.value = 1.1;
                        await Future.delayed(const Duration(milliseconds: 150));
                        padding.value = 1;
                        await Future.delayed(const Duration(milliseconds: 150));
                        padding.value = 1.1;
                        await Future.delayed(const Duration(milliseconds: 150));
                        padding.value = 1;
                      },
                      child: Obx(() => AnimatedScale(
                        duration: const Duration(milliseconds: 150),
                        scale: padding.value,
                        child: SvgPicture.asset(
                          "assets/icons/logo.svg",
                          width: 15.w,
                          color: Colors.blue,
                        ),
                      )),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Hello Again!",
                      style: TextStyle(
                          fontSize: 22.5.sp,
                          color: AppColors.fontColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Welcome Back You've\nBeen Missed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: AppColors.fontColor,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 4.5.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 6.5.h,
                      child:                     TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 5.5.w, top: 4.5.h),
                          labelText: "Username",
                          labelStyle: const TextStyle(
                            color: AppColors.disableLightFontColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.sp),
                              borderSide: const BorderSide(
                                  color: AppColors.disableFontColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.sp),
                              borderSide: const BorderSide(color: Colors.red)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height:6.5.h ,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 5.5.w, top: 4.5.h),
                          labelText: "Password",
                          labelStyle: const TextStyle(
                            color: AppColors.disableLightFontColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.sp),
                              borderSide: const BorderSide(
                                  color: AppColors.disableFontColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.sp),
                              borderSide: const BorderSide(color: Colors.red)),
                        ),
                      )
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.sp)))),
                          onPressed: () {},
                          child: Text(
                            'Forget Your Password?',
                            style: TextStyle(
                              color: AppColors.fontColor,
                              fontSize: 11.5.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                    ),
                    MyCustomButton(
                        labelText: "Sign In",
                        onPress: () {
                          Get.toNamed(HOME);
                        },
                        icon: const SizedBox()),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Stack(children: [
                      Container(
                        margin: EdgeInsets.only(top: 0.5.h),
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: AppColors.disableFontColor,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            alignment: Alignment.center,
                            width: 28.0.w,
                            color: AppColors.background  ,
                            child: Text("Or, Sing In With",style: TextStyle(
                                color: AppColors.disableFontColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500
                            ),)),
                      ),
                    ]),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    MyCustomButton(
                      labelText: "Sign In With Google",
                      onPress: (){},
                      icon: SvgPicture.asset("assets/icons/ic_google.svg"),
                      sizeBox: 3.5.w,
                      color: AppColors.fontColor,
                      backgroundColor: AppColors.disableBackgroundColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 0.50.h),
            child: Container(
              height: 5.5.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have An Account?",style: TextStyle(
                      color: AppColors.fontColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400
                  ),),
                  TextButton(onPressed: (){}, child: const Text("Sign Up"))
                ],
              ),
            ),
          ) ,
        ),
      );
    },);
  }
}
