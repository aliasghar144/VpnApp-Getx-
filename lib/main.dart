import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_mobile_app_design/base_page.dart';
import 'package:vpn_mobile_app_design/pages/intro/intro_screen.dart';
import 'package:vpn_mobile_app_design/pages/login/login_screen.dart';
import 'package:vpn_mobile_app_design/routes/routes.dart';
import 'package:vpn_mobile_app_design/services/notif_service.dart';

void main(){

  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme : ThemeData(
        fontFamily: 'Gilroy'
      ),
      home: IntroScreen(),
      getPages: [
        GetPage(name: HOME , page:() =>  BasePage()),
        GetPage(name: LOGIN , page:() => LoginScreen()),
      ],
    )
  );
}
