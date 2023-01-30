import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vpn_mobile_app_design/controller/connection_controller.dart';
import 'package:vpn_mobile_app_design/controller/navigation_controller.dart';
import 'package:vpn_mobile_app_design/model/app_colors.dart';
import 'package:vpn_mobile_app_design/pages/connect/connect_screen.dart';
import 'package:vpn_mobile_app_design/pages/home/countries_screen.dart';
import 'package:vpn_mobile_app_design/pages/setting/setting_screen.dart';

class BasePage extends StatelessWidget {
  BasePage({Key? key}) : super(key: key);

  final page = [
    HomeScreen(),
    ConnectScreen(),
    SettingScreen(),
  ];

  ConnectionController connectionController = Get.put(ConnectionController());
  NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          backgroundColor: const Color(0xffF0F5F5),
          drawer: myDrawer(context),
          drawerScrimColor: Colors.transparent,
          appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 100),
              child: Obx(() => navigationController.pageIndex.value == 0
                  ? AppBar(
                      backgroundColor: const Color(0xff185BFF),
                      leadingWidth: 0,
                      leading: const SizedBox(),
                      title: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Builder(builder: (context) {
                                    return InkWell(
                                      onTap: () {
                                        Scaffold.of(context).openDrawer();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: const Color(0xff3B74FF)),
                                        width: 40,
                                        height: 40,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              'assets/icons/ic_drawer.svg'),
                                        ),
                                      ),
                                    );
                                  }),
                                  const Expanded(child: SizedBox()),
                                  const Text(
                                    "Countries",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xff3B74FF)),
                                    width: 40,
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                          'assets/icons/ic_crown.svg'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      elevation: 0,
                      toolbarHeight: 100,
                    )
                  : AppBar(
                      backgroundColor: const Color(0xffF0F5F5),
                      leadingWidth: 0,
                      leading: const SizedBox(),
                      title: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Builder(builder: (context) {
                                    return InkWell(
                                      onTap: () {
                                        Scaffold.of(context).openDrawer();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: AppColors.fontColor
                                                .withOpacity(0.06)),
                                        width: 40,
                                        height: 40,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              'assets/icons/ic_drawer.svg',
                                              color: AppColors.fontColor),
                                        ),
                                      ),
                                    );
                                  }),
                                  const Expanded(child: SizedBox()),
                                  const Text(
                                    "Pearl Vpn",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.fontColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.fontColor
                                            .withOpacity(0.06)),
                                    width: 40,
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                          'assets/icons/ic_crown.svg',
                                          color: AppColors.fontColor),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      elevation: 0,
                      toolbarHeight: 100,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              bottomRight: Radius.circular(35))),
                    ))),
          body: Obx(
            () => page[navigationController.pageIndex.value],
          ),
          bottomNavigationBar: Container(
            height: 90,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(200, 35),
                    topLeft: Radius.elliptical(200, 35))),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  myNavigationItem(
                      picture: "assets/icons/ic_unselected_map.svg",
                      pictureSelected: "assets/icons/ic_selected_map.svg",
                      text: "Countries",
                      index: 0),
                  Obx(
                    () => myNavigationItem(
                        picture: "assets/icons/ic_unselected_radar.svg",
                        pictureSelected: "assets/icons/ic_selected_radar.svg",
                        text: connectionController.connectionStatus.value,
                        index: 1),
                  ),
                  myNavigationItem(
                      picture: "assets/icons/ic_unselected_setting.svg",
                      pictureSelected: "assets/icons/ic_selected_setting.svg",
                      text: "Setting",
                      index: 2),
                ],
              ),
            ),
          )),
    );
  }

  myNavigationItem({
    required String picture,
    required String pictureSelected,
    required String text,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        navigationController.pageIndex.value = index;
      },
      child: Obx(() => SizedBox(
            width: 85,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                navigationController.pageIndex.value == index
                    ? SvgPicture.asset(pictureSelected)
                    : SvgPicture.asset(picture),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: navigationController.pageIndex.value == index
                          ? AppColors.selectedFontColor
                          : AppColors.fontColor),
                ),
              ],
            ),
          )),
    );
  }

  myDrawer(context) {
    return SafeArea(
        child: Stack(children: [
      BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: const SizedBox.expand(),
      ),
      Drawer(
        elevation: 15,
        backgroundColor: const Color(0xffF0F5F5),
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xff185BFF),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:const Color.fromRGBO(255, 255, 255, 0.5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0,right: 8,left: 8),
                        child: SvgPicture.asset("assets/images/profile_image.svg"),
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        const SizedBox(width: 8,),
                        const Text("User Name",style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),),
                        Text("Disconnected", style:TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 11,
                          fontWeight: FontWeight.w500
                        )),
                      ]
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const Text("Main Menu",style:TextStyle(
              fontSize:16,
              fontWeight: FontWeight.w500,
              color: AppColors.fontColor
            )),
            const SizedBox(height: 25,),
            ListTile(
              onTap: (){},
              visualDensity: const VisualDensity(vertical: -2),
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 8,
              leading: SvgPicture.asset("assets/icons/ic_setting.svg"),
              title: const Text("Setting",style:TextStyle(
                color:AppColors.fontColor,
                fontSize: 14,
                fontWeight:FontWeight.w400
              )),
            ),
            ListTile(
              onTap: (){},
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              visualDensity: const VisualDensity(vertical: -2),
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 8,
              leading: SvgPicture.asset("assets/icons/ic_user_octagon.svg"),
              title: const Text("Account",style:TextStyle(
                color:AppColors.fontColor,
                fontSize: 14,
                fontWeight:FontWeight.w400
              )),
            ),
            ListTile(
              onTap: (){},
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              visualDensity: const VisualDensity(vertical: -2),
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 8,
              leading: SvgPicture.asset("assets/icons/ic_eye.svg"),
              title: const Text("Show Log",style:TextStyle(
                color:AppColors.fontColor,
                fontSize: 14,
                fontWeight:FontWeight.w400
              )),
            ),
            ListTile(
              onTap: (){},
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              visualDensity: const VisualDensity(vertical: -2),
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 8,
              leading: SvgPicture.asset("assets/icons/ic_note.svg"),
              title: const Text("Report",style:TextStyle(
                color:AppColors.fontColor,
                fontSize: 14,
                fontWeight:FontWeight.w400
              )),
            ),
            ListTile(
              onTap: (){},
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              visualDensity: const VisualDensity(vertical: -2),
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 8,
              leading: SvgPicture.asset("assets/icons/ic_emoji_happy.svg"),
              title: const Text("Help",style:TextStyle(
                color:AppColors.fontColor,
                fontSize: 14,
                fontWeight:FontWeight.w400
              )),
            ),
            ListTile(
              onTap: (){},
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              visualDensity: const VisualDensity(vertical: -2),
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 8,
              leading: SvgPicture.asset("assets/icons/ic_logout.svg"),
              title: const Text("Sign Out",style:TextStyle(
                color:AppColors.fontColor,
                fontSize: 14,
                fontWeight:FontWeight.w400
              )),
            ),
            const Expanded(child: SizedBox()),
            Center(child: Text("v1.0",style:TextStyle(
              color: AppColors.fontColor.withOpacity(0.4),
              fontSize: 10,
              fontWeight: FontWeight.w500
            )))
          ],
        ),
      ))
    ]));
  }
}
