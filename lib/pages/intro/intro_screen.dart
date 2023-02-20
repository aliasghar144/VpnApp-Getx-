import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vpn_mobile_app_design/model/app_colors.dart';
import 'package:vpn_mobile_app_design/routes/routes.dart';
import 'package:vpn_mobile_app_design/widgets/button.dart';
import 'package:sizer/sizer.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: SizedBox(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 40.h,
                              width: MediaQuery.of(context).size.width,
                              child: SvgPicture.asset("assets/images/intro.svg",
                                  fit: BoxFit.contain),
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Text("secure browsing \n with no limits",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.fontColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                )),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                                "With Our Encrypted VPN Tunnel, Your \n Data Stay Safe, Even Over Public Or \n Untrusted Internet Connections.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.fontColor,
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.w400,
                                ))
                          ],
                        );
                      },
                    ),
                  ),
                  SmoothPageIndicator(
                      onDotClicked: (index) => pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 225),
                            curve: Curves.easeInOut,
                          ),
                      controller: pageController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Color(0xff90979F),
                        dotColor: Color(0xffBEC4C8),
                        spacing: 4,
                        dotHeight: 6,
                        dotWidth: 6,
                      )),
                  SizedBox(
                    height: 2.75.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.5.h),
                    child: MyCustomButton(
                      icon: const SizedBox(),
                      labelText: "Create An Account",
                      onPress: () {
                        Get.toNamed(LOGIN);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.5.h),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Sign In"),
                      )),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
