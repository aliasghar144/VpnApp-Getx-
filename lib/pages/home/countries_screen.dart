import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vpn_mobile_app_design/controller/connection_controller.dart';
import 'package:vpn_mobile_app_design/controller/user_controller.dart';
import 'package:vpn_mobile_app_design/model/app_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var expansionIsOpen = false.obs;
  ConnectionController connectionController = Get.put(ConnectionController());
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff185BFF),
            leadingWidth: 0,
            leading: const SizedBox(),
            title: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          children: [
                            const Expanded(child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search For Country Or City",
                                  hintStyle: TextStyle(
                                    color: AppColors.disableLightFontColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )
                              ),
                            )),
                            const SizedBox(width: 10,),
                            InkWell(
                              onTap: (){},
                              child: SvgPicture.asset("assets/icons/ic_search_normal.svg"),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            elevation: 0,
            toolbarHeight: 85,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35))),
          ),
          backgroundColor: const Color(0xffF0F5F5),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 25),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Free Location (${connectionController.freeServers.length})",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.disableLightFontColor),
                    ),
                    const Icon(
                      Icons.info,
                      color: AppColors.disableLightFontColor,
                      size: 18,
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: connectionController.freeServers.length,
                  separatorBuilder: (context, index) {
                   return const SizedBox(height: 8,);
                  },
                  itemBuilder: (context, countryIndex) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Theme(
                          data: ThemeData(
                            fontFamily: 'Gilroy',
                          ).copyWith(
                            dividerColor: Colors.transparent,
                          ),
                          child: ExpansionTile(
                            trailing: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.disableBackgroundColor),
                              child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Obx(
                                        () => connectionController.freeServers[countryIndex]["expansionIsOpen"].value
                                        ? SvgPicture.asset("assets/icons/ic_arrow_up.svg")
                                        : SvgPicture.asset(
                                        "assets/icons/ic_arrow_right.svg"),
                                  )),
                            ),
                            title: Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: SvgPicture.asset(
                                      connectionController.freeServers[countryIndex]["flagImage"],
                                    )),
                                const SizedBox(width: 8,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      connectionController.freeServers[countryIndex]["country"],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.fontColor),
                                    ),
                                    Text( "${connectionController.freeServers[countryIndex]["servers"].length} Location",
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.disableLightFontColor),
                                    )
                                  ],
                                ),
                                const Expanded(child: SizedBox()),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.disableBackgroundColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: InkWell(
                                        onTap: () {
                                          connectionController.connectToServer(countryIndex,0,true,true);
                                        },
                                        child: Obx(() => SvgPicture.asset(
                                          "assets/icons/ic_power.svg",
                                          color: connectionController.freeServers[countryIndex]["connected"].value ? Colors.blue : Colors.black,
                                        ),)),
                                  ),
                                )
                              ],
                            ),
                            tilePadding: EdgeInsets.zero,
                            onExpansionChanged: (value) {
                              connectionController.freeServers[countryIndex]["expansionIsOpen"].value = value;
                            },
                            children: [
                              const SizedBox(height: 8,),
                              ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 15,);
                                },
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: connectionController.freeServers[countryIndex]["servers"].length,
                                itemBuilder: (context, serverIndex) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${connectionController.freeServers[countryIndex]["country"]}#${serverIndex+1}",style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.fontColor
                                              ),),
                                              Text("${connectionController.freeServers[countryIndex]["servers"][serverIndex]["city"]}",style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color:AppColors.disableLightFontColor
                                              ),),
                                            ],
                                          ),
                                          const Expanded(child: SizedBox()),
                                           Text("${connectionController.freeServers[countryIndex]["servers"][serverIndex]["latency"]}%",style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.fontColor
                                          ),),
                                          const SizedBox(width: 5,),
                                          SvgPicture.asset("assets/icons/ic_wifi.svg",width: 20,
                                          color: connectionController.latencyColor(connectionController.freeServers[countryIndex]["servers"][serverIndex]["latency"]),),
                                          const SizedBox(width: 15,),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color: AppColors.disableBackgroundColor),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: InkWell(
                                                  onTap: () {
                                                    connectionController.connectToServer(countryIndex,serverIndex,true,false);
                                                  },
                                                  child: Obx(() => SvgPicture.asset(
                                                    "assets/icons/ic_power.svg",
                                                    color: connectionController.freeServers[countryIndex]["servers"][serverIndex]["connected"].value ? Colors.blue : Colors.black,
                                                  ),)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                },),
                              const SizedBox(height: 8,),
                            ],
                          )
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Premium Location (${connectionController.premiumServer.length})",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.disableLightFontColor),
                    ),
                    const Icon(
                      Icons.info,
                      color: AppColors.disableLightFontColor,
                      size: 18,
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: connectionController.premiumServer.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 8,);
                  },
                  itemBuilder: (context, countryIndex) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Theme(
                          data: ThemeData(
                            fontFamily: 'Gilroy',
                          ).copyWith(
                            dividerColor: Colors.transparent,
                          ),
                          child: ExpansionTile(
                            trailing: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.disableBackgroundColor),
                              child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Obx(
                                        () => connectionController.premiumServer[countryIndex]["expansionIsOpen"].value
                                        ? SvgPicture.asset("assets/icons/ic_arrow_up.svg")
                                        : SvgPicture.asset(
                                        "assets/icons/ic_arrow_right.svg"),
                                  )),
                            ),
                            title: Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: SvgPicture.asset(
                                      connectionController.premiumServer[countryIndex]["flagImage"],
                                    )),
                                const SizedBox(width: 8,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${connectionController.premiumServer[countryIndex]["country"]}",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.fontColor),
                                    ),
                                    Text(
                                      "${connectionController.premiumServer[countryIndex]["servers"].length} Location",
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.disableLightFontColor),
                                    )
                                  ],
                                ),
                                const Expanded(child: SizedBox()),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.disableBackgroundColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: InkWell(
                                        onTap: () {
                                          if(userController.premiumUser.value){
                                          connectionController.connectToServer(countryIndex, 1, false,true);
                                          }else{
                                            print("buy premium plane");
                                          }
                                        },
                                        child: Obx(() => SvgPicture.asset(
                                          userController.premiumUser.value ? "assets/icons/ic_power.svg":"assets/icons/ic_crown.svg",
                                          color: connectionController.premiumServer[countryIndex]["connected"].value ? Colors.blue : Colors.black,
                                        ),)),
                                  ),
                                )
                              ],
                            ),
                            tilePadding: EdgeInsets.zero,
                            onExpansionChanged: (value) {
                              connectionController.premiumServer[countryIndex]["expansionIsOpen"].value = value;
                            },
                            children: [
                              const SizedBox(height: 8,),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 15,);
                                },
                                shrinkWrap: true,
                                itemCount: connectionController.premiumServer[countryIndex]["servers"].length,
                                itemBuilder: (context, serverIndex) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${connectionController.premiumServer[countryIndex]["country"]}#${serverIndex+1}",style:const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.fontColor
                                              ),),
                                              Text("${connectionController.premiumServer[countryIndex]["servers"][serverIndex]["city"]}",style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color:AppColors.disableLightFontColor
                                              ),),
                                            ],
                                          ),
                                          const Expanded(child: SizedBox()),
                                          Text("${connectionController.premiumServer[countryIndex]["servers"][serverIndex]['latency']}%",style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.fontColor
                                          ),),
                                          const SizedBox(width: 5,),
                                          SvgPicture.asset("assets/icons/ic_wifi.svg",width: 20,
                                          color: connectionController.latencyColor(connectionController.premiumServer[countryIndex]["servers"][serverIndex]['latency']),
                                          ),
                                          const SizedBox(width: 15,),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color: AppColors.disableBackgroundColor),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: InkWell(
                                                  onTap: () {
                                                    if(userController.premiumUser.value){
                                                      connectionController.connectToServer(countryIndex, serverIndex, false,false);
                                                    }
                                                    print("buy a premium plan");
                                                  },
                                                  child: Obx(() => SvgPicture.asset(
                                                    userController.premiumUser.value ? "assets/icons/ic_power.svg" : "assets/icons/ic_crown.svg",
                                                    color: connectionController.premiumServer[countryIndex]["servers"][serverIndex]["connected"].value ? Colors.blue : Colors.black,
                                                  ),)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                },),
                              const SizedBox(height: 8,),
                            ],
                          )
                      ),
                    );
                  },
                ),
              ]),
            ),
          )),
    );
  }
}
