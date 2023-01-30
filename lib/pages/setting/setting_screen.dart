import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_mobile_app_design/controller/setting_controller.dart';
import 'package:vpn_mobile_app_design/model/app_colors.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F5F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Quick Connect",style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),),
                  const SizedBox(height: 4,),
                  Text("Fastest",style: TextStyle(
                    color: AppColors.fontColor.withOpacity(0.6),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),),
                  const SizedBox(height: 4,),
                  Text("quick connect button connects you to selected server.",style: TextStyle(
                    color: AppColors.fontColor.withOpacity(0.4),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("VPN Accelerator",style: TextStyle(
                        color: AppColors.fontColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),),
                      const Expanded(child: SizedBox()),
                      Obx(() => SizedBox(
                        width: 50,
                        height: 30,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CupertinoSwitch(
                              activeColor: Colors.blue,
                              value: settingController.vpnAccelerator.value, onChanged: (value){
                            settingController.vpnAccelerator.value = value;
                          }),
                        ),
                      ),),
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Text("vpn accelerator enables a set unique performance enhancing technologies which can increase VPN speed up to 400%. ",style: TextStyle(
                    color: AppColors.fontColor.withOpacity(0.4),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("VPN Accelerator notifications",style: TextStyle(
                        color: AppColors.fontColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),),
                      const Expanded(child: SizedBox()),
                      Obx(() => SizedBox(
                        width: 50,
                        height: 30,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CupertinoSwitch(
                              activeColor: Colors.blue,
                              value: settingController.vpnAcceleratorNotifications.value, onChanged: (value){
                            settingController.vpnAcceleratorNotifications.value = value;
                          }),
                        ),
                      ),),
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Text("Get Notified When Vpn Accelerator Eswitches You To A Faster Server.",style: TextStyle(
                    color: AppColors.fontColor.withOpacity(0.4),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Split Tunneling",style: TextStyle(
                        color: AppColors.fontColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),),
                      const Expanded(child: SizedBox()),
                      Obx(() => SizedBox(
                        width: 50,
                        height: 30,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CupertinoSwitch(
                              activeColor: Colors.blue,
                              value: settingController.splitTunneling.value, onChanged: (value){
                            settingController.splitTunneling.value = value;
                          }),
                        ),
                      ),),
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Text("allows certain apps or IPs to be excluded from the vpn traffic.",style: TextStyle(
                    color: AppColors.fontColor.withOpacity(0.4),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("NetShield",style: TextStyle(
                        color: AppColors.fontColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),),
                      const Expanded(child: SizedBox()),
                      Obx(() => SizedBox(
                        width: 50,
                        height: 30,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CupertinoSwitch(
                              activeColor: Colors.blue,
                              value: settingController.netShield.value, onChanged: (value){
                            settingController.netShield.value = value;
                          }),
                        ),
                      ),),
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Text("block advertisements, trackers and malware.",style: TextStyle(
                    color: AppColors.fontColor.withOpacity(0.4),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox (
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Kill Switch",style: TextStyle(
                        color: AppColors.fontColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),),
                      const Expanded(child: SizedBox()),
                      Obx(() => SizedBox(
                        width: 50,
                        height: 30,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CupertinoSwitch(
                              activeColor: Colors.blue,
                              value: settingController.killSwitch.value, onChanged: (value){
                            settingController.killSwitch.value = value;
                          }),
                        ),
                      ),),
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Text("set uo how VPN behaves if your connection is disrupted.",style: TextStyle(
                    color: AppColors.fontColor.withOpacity(0.4),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
