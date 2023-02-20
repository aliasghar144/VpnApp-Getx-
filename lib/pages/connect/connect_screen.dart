import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vpn_mobile_app_design/controller/connection_controller.dart';
import 'package:vpn_mobile_app_design/controller/navigation_controller.dart';
import 'package:vpn_mobile_app_design/controller/timer_controller.dart';
import 'package:vpn_mobile_app_design/model/app_colors.dart';
import 'package:sizer/sizer.dart';

class ConnectScreen extends StatelessWidget {
  ConnectScreen({Key? key}) : super(key: key);

  TimerController timerController = Get.put(TimerController());
  ConnectionController connectionController = Get.find();
  NavigationController navigationController = Get.put(NavigationController());


  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          backgroundColor: const Color(0xffF0F5F5),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                connectionController.connectionStatus.value == "Connected"
                    ? SizedBox(
                  child: Column(children: [
                    const Text("Connecting Time",
                        style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(
                          () => Text(
                        connectionController.connectionStatus ==
                            connectionController.connected
                            ? timerController.showTimer()
                            : "disconnected",
                        style: const TextStyle(
                          color: AppColors.fontColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ]),
                )
                    : SizedBox(
                  child: Column(children: [
                    const Text(
                      "Status",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.fontColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      connectionController.connectionStatus.value ==
                          "Connecting"
                          ? 'Connecting...'
                          : 'Disconnected',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffE63946),
                      ),
                    ),
                  ]),
                ),
                connectionController.connectionStatus.value == "Connected"
                    ? SizedBox(
                  child: Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                    child: SvgPicture.asset(
                                      connectionController
                                          .currentCountryConnection[
                                      "flagImage"],
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      connectionController
                                          .currentCountryConnection[
                                      'country'],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.fontColor),
                                    ),
                                    Text(
                                      connectionController
                                          .currentServerConnection[
                                      'city'],
                                      style: TextStyle(
                                        color: AppColors.fontColor
                                            .withOpacity(0.4),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                const Expanded(child: SizedBox()),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Stealth",
                                        style: TextStyle(
                                          color: AppColors.fontColor
                                              .withOpacity(0.4),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text(
                                        "${connectionController.currentServerConnection['latency']} %",
                                        style: const TextStyle(
                                          color: AppColors.fontColor,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                ),
                                height: 60,
                                child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              color: const Color.fromRGBO(
                                                  0, 213, 137, 0.15),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(4),
                                                child: SvgPicture.asset(
                                                    "assets/icons/ic_import.svg"),
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Download:",
                                              style: TextStyle(
                                                fontSize: 10,
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.fontColor
                                                    .withOpacity(0.4),
                                              ),
                                            ),
                                            const Text(
                                              "527 MB",
                                              style: TextStyle(
                                                color: AppColors.fontColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                ),
                                height: 60,
                                child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              color: const Color.fromRGBO(
                                                  230, 57, 70, 0.15),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(4),
                                                child: SvgPicture.asset(
                                                    "assets/icons/ic_export.svg"),
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Upload:",
                                              style: TextStyle(
                                                fontSize: 10,
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.fontColor
                                                    .withOpacity(0.4),
                                              ),
                                            ),
                                            const Text(
                                              "49 MB",
                                              style: TextStyle(
                                                color: AppColors.fontColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                              )),
                        ],
                      ),
                    ],
                  ),
                )
                    : SizedBox(
                  child: Column(
                    children: [
                      connectionController.connectionStatus.value ==
                          "Connecting"
                          ? ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SvgPicture.asset(
                            connectionController
                                .currentCountryConnection[
                            "flagImage"],
                          ))
                          : connectionController
                          .currentCountryConnection.isNotEmpty
                          ? ClipRRect(
                          borderRadius:
                          BorderRadius.circular(15),
                          child: SvgPicture.asset(
                            connectionController
                                .currentCountryConnection[
                            "flagImage"],
                          ))
                          : Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(20),
                          color: AppColors
                              .disableBackgroundColor,
                        ),
                        child: const Icon(
                            Icons.question_mark_rounded),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      connectionController.connectionStatus.value ==
                          "Connecting"
                          ? Text(
                        connectionController
                            .currentCountryConnection['country'],
                        style: const TextStyle(
                          color: AppColors.fontColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                          : Text(connectionController
                          .currentCountryConnection.isNotEmpty
                          ? connectionController
                          .currentCountryConnection['country']
                          : " - - - - -"),
                      const SizedBox(
                        height: 5,
                      ),
                      connectionController.connectionStatus.value ==
                          "Connecting"
                          ? Text(
                        connectionController
                            .currentServerConnection['city'],
                        style: TextStyle(
                            color: AppColors.fontColor
                                .withOpacity(0.4),
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      )
                          : Text(
                        connectionController
                            .currentCountryConnection
                            .isNotEmpty
                            ? connectionController
                            .currentServerConnection['city']
                            : '- - - -',
                        style: TextStyle(
                            color: AppColors.fontColor
                                .withOpacity(0.4),
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                connectionController.connectionStatus.value == "Connected"
                    ? SizedBox(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: 260,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 25),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(300),
                                gradient: const RadialGradient(colors: [
                                  Color.fromRGBO(255, 255, 255, 0.1),
                                  Color.fromRGBO(72, 217, 185, 0.04),
                                ]),
                              ),
                              child: SvgPicture.asset(
                                  "assets/images/earth.svg")),
                          Positioned(
                            right:
                            MediaQuery.of(context).size.width / 3 +
                                connectionController
                                    .currentCountryConnection[
                                "location"]['lat'],
                            top: MediaQuery.of(context).size.width / 3 +
                                connectionController
                                    .currentCountryConnection[
                                "location"]['long'],
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  gradient: RadialGradient(colors: [
                                    Colors.white.withOpacity(0),
                                    Colors.white.withOpacity(0.25)
                                  ])),
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(50),
                                    gradient: RadialGradient(colors: [
                                      Colors.white.withOpacity(0),
                                      Colors.white.withOpacity(0.25),
                                    ])),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(28),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right:
                            MediaQuery.of(context).size.width / 3 +
                                connectionController
                                    .currentCountryConnection[
                                "location"]['lat'] -
                                103,
                            top: MediaQuery.of(context).size.width / 3 +
                                connectionController
                                    .currentCountryConnection[
                                "location"]['long'] +
                                3,
                            child: SvgPicture.asset(
                                "assets/images/textfield.svg"),
                          ),
                          Positioned(
                            right:
                            MediaQuery.of(context).size.width / 3 +
                                connectionController
                                    .currentCountryConnection[
                                "location"]['lat'] -
                                65,
                            top: MediaQuery.of(context).size.width / 3 +
                                connectionController
                                    .currentCountryConnection[
                                "location"]['long'] +
                                35,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Obx(() => Text(
                                  connectionController
                                      .connectionStatus ==
                                      connectionController
                                          .connected
                                      ? connectionController
                                      .currentServerConnection[
                                  'city']
                                      : "Initializing",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.fontColor,
                                  ),
                                )),
                                Obx(() => Text(
                                  connectionController
                                      .connectionStatus ==
                                      connectionController
                                          .connected
                                      ? "188.144.25.32"
                                      : "Connection..",
                                  style: connectionController
                                      .connectionStatus ==
                                      connectionController
                                          .connected
                                      ? TextStyle(
                                    fontSize: 11,
                                    fontWeight:
                                    FontWeight.w500,
                                    color: AppColors.fontColor
                                        .withOpacity(0.6),
                                  )
                                      : const TextStyle(
                                    fontSize: 12,
                                    fontWeight:
                                    FontWeight.w500,
                                    color:
                                    AppColors.fontColor,
                                  ),
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
                    : SizedBox(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 25),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(300),
                                gradient: const RadialGradient(colors: [
                                  Color.fromRGBO(255, 255, 255, 0.1),
                                  Color.fromRGBO(72, 217, 185, 0.04),
                                ]),
                              ),
                              child: SvgPicture.asset(
                                  "assets/images/earth.svg")),
                          connectionController.connectionStatus.value ==
                              "Connecting"
                              ? Positioned(
                            right: MediaQuery.of(context)
                                .size
                                .width /
                                3 +
                                connectionController
                                    .currentCountryConnection[
                                "location"]['lat'],
                            top: MediaQuery.of(context)
                                .size
                                .width /
                                3 +
                                connectionController
                                    .currentCountryConnection[
                                "location"]['long'],
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  gradient:
                                  RadialGradient(colors: [
                                    Colors.white.withOpacity(0),
                                    Colors.white.withOpacity(0.25)
                                  ])),
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(50),
                                    gradient:
                                    RadialGradient(colors: [
                                      Colors.white.withOpacity(0),
                                      Colors.white
                                          .withOpacity(0.25),
                                    ])),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(28),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                              : const SizedBox(),
                          connectionController.connectionStatus.value ==
                              "Connecting"
                              ? Positioned(
                            left: MediaQuery.of(context)
                                .size
                                .width *
                                0.116,
                            top: MediaQuery.of(context)
                                .size
                                .height *
                                0.052,
                            child: CircularPercentIndicator(
                              restartAnimation: true,
                              circularStrokeCap:
                              CircularStrokeCap.round,
                              startAngle: 180,
                              animationDuration: 5500,
                              animation: true,
                              backgroundColor:
                              const Color.fromRGBO(
                                  232, 233, 234, 0.5),
                              radius: 97,
                              progressColor: const Color.fromRGBO(
                                  230, 57, 70, 0.8),
                              percent: 1,
                              // addAutomaticKeepAlive: true,
                            ),
                          )
                              : const SizedBox(),
                          connectionController.connectionStatus.value ==
                              "Connecting"
                              ? Positioned(
                            right: MediaQuery.of(context)
                                .size
                                .width /
                                3 +
                                connectionController
                                    .currentCountryConnection[
                                "location"]['lat'] -
                                103,
                            top: MediaQuery.of(context)
                                .size
                                .width /
                                3 +
                                connectionController
                                    .currentCountryConnection[
                                "location"]['long'] +
                                3,
                            child: SvgPicture.asset(
                                "assets/images/textfield.svg"),
                          )
                              : const SizedBox(),
                          connectionController.connectionStatus.value ==
                              "Connecting"
                              ? Positioned(
                            right: MediaQuery.of(context)
                                .size
                                .width /
                                3 +
                                connectionController
                                    .currentCountryConnection[
                                "location"]['lat'] -
                                65,
                            top: MediaQuery.of(context)
                                .size
                                .width /
                                3 +
                                connectionController
                                    .currentCountryConnection[
                                "location"]['long'] +
                                35,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Obx(() => Text(
                                  connectionController
                                      .connectionStatus ==
                                      connectionController
                                          .connected
                                      ? connectionController
                                      .currentServerConnection[
                                  'city']
                                      : "Initializing",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.w500,
                                    color:
                                    AppColors.fontColor,
                                  ),
                                )),
                                Obx(() => Text(
                                  connectionController
                                      .connectionStatus ==
                                      connectionController
                                          .connected
                                      ? "188.144.25.32"
                                      : "Connection..",
                                  style: connectionController
                                      .connectionStatus ==
                                      connectionController
                                          .connected
                                      ? TextStyle(
                                    fontSize: 11,
                                    fontWeight:
                                    FontWeight.w500,
                                    color: AppColors
                                        .fontColor
                                        .withOpacity(
                                        0.6),
                                  )
                                      : const TextStyle(
                                    fontSize: 12,
                                    fontWeight:
                                    FontWeight.w500,
                                    color: AppColors
                                        .fontColor,
                                  ),
                                )),
                              ],
                            ),
                          )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
                connectionController.connectionStatus.value == "Connected"
                    ? SizedBox(
                  child: Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width,
                                  55),
                              backgroundColor: const Color(0xffE8E9EA),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(16))),
                          onPressed: () {
                            navigationController.pageIndex.value = 0;
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/ic_global.svg'),
                                const Expanded(child: SizedBox()),
                                const Text(
                                  "Change Server",
                                  style: TextStyle(
                                    color: AppColors.fontColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xff00091F),
                                  size: 18,
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      TextButton(
                          onPressed: () {
                            connectionController.disconnect(true);
                            connectionController
                                .connectionStatus.value =
                                connectionController.disconnected.value;
                          },
                          child: const Text(
                            "Disconnected",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffE63946)),
                          )),
                    ],
                  ),
                )
                    : SizedBox(
                  child: Column(
                    children: [
                      connectionController.connectionStatus.value ==
                          "Connecting"
                          ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width,
                                  55),
                              backgroundColor:
                              const Color(0xffE8E9EA),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(16))),
                          onPressed: () {
                            connectionController.disconnect(true);
                            connectionController
                                .connectionStatus.value =
                                connectionController
                                    .disconnected.value;
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Cancel Connection",
                                  style: TextStyle(
                                    color: AppColors.fontColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ))
                          : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width,
                                  55),
                              backgroundColor:
                              const Color(0xffE8E9EA),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(16))),
                          onPressed: () {
                            navigationController.pageIndex.value =
                            0;
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/ic_global.svg'),
                                const Expanded(child: SizedBox()),
                                const Text(
                                  "Choose a Server",
                                  style: TextStyle(
                                    color: AppColors.fontColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xff00091F),
                                  size: 18,
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      connectionController.connectionStatus.value ==
                          "Connecting"
                          ? TextButton(
                          onPressed: () {
                            connectionController.disconnect(true);
                            connectionController
                                .connectionStatus.value =
                                connectionController
                                    .disconnected.value;
                          },
                          child: const Text(
                            "Disconnected",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffE63946)),
                          ))
                          : const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ));
    },);
  }
}
