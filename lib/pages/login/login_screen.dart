import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vpn_mobile_app_design/model/app_colors.dart';
import 'package:vpn_mobile_app_design/routes/routes.dart';
import 'package:vpn_mobile_app_design/widgets/button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  FocusNode focusNode = FocusNode();
  var padding = 1.0.obs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 70),
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                            width: 75,
                            color: Colors.blue,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    "Hello Again!",
                    style: TextStyle(
                        fontSize: 24,
                        color: AppColors.fontColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Welcome Back You've\nBeen Missed!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.fontColor,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 25, top: 35),
                      labelText: "Username",
                      labelStyle: const TextStyle(
                        color: AppColors.disableLightFontColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              color: AppColors.disableFontColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: Colors.red)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 25, top: 35),
                      labelText: "Password",
                      labelStyle: const TextStyle(
                        color: AppColors.disableLightFontColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              color: AppColors.disableFontColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: Colors.red)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)))),
                        onPressed: () {},
                        child: const Text(
                          'Forget Your Password?',
                          style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 14,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 7),
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: AppColors.disableFontColor,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                          color: AppColors.background  ,
                          child: const Text("Or, Sing In With",style: TextStyle(
                            color: AppColors.disableFontColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                          ),)),
                    ),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  MyCustomButton(
                      labelText: "Sign In With Google",
                      onPress: (){},
                      icon: SvgPicture.asset("assets/icons/ic_google.svg"),
                    sizeBox: 15,
                    color: AppColors.fontColor,
                    backgroundColor: AppColors.disableBackgroundColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't Have An Account?",style: TextStyle(
                color: AppColors.fontColor,
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),),
              TextButton(onPressed: (){}, child: const Text("Sign Up"))
            ],
          ),
        ) ,
      ),
    );
  }
}
