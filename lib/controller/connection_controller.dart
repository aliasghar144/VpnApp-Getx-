import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_mobile_app_design/controller/timer_controller.dart';

class ConnectionController extends GetxController {
  TimerController timerController = Get.put(TimerController());
  int min = -55;
  int max = 55;

  var connected = "Connected".obs;
  var disconnected = "Disconnect".obs;
  var connecting = "Connecting".obs;

  dynamic lastCountryConnection;
  dynamic lastServerConnection;

  var connectionStatus = 'Disconnected'.obs;

  Map currentCountryConnection = {};
  Map currentServerConnection = {};

  final List freeServers = [
    {
      "flagImage": "assets/icons/ic_flag_Italy.svg",
      "expansionIsOpen": false.obs,
      "connected": false.obs,
      "country": "Italy",
      "location": {"lat": -41, "long": 5},
      "servers": [
        {
          "city": 'Milan',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Milan',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Turin',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Turin',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        }
      ],
    },
    {
      "flagImage": "assets/icons/ic_flag_netherlands.svg",
      "country": "Netherlands",
      "expansionIsOpen": false.obs,
      "connected": false.obs,
      "location": {"lat": -35, "long": 12},
      "servers": [
        {
          "city": 'Amsterdam',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Amsterdam',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Groningen',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Arnhem',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Rotterdam',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Vianen',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Delft',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Leiden',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
      ],
    },
    {
      "flagImage": "assets/icons/ic_flag_germany.svg",
      "country": "Germany",
      "expansionIsOpen": false.obs,
      "connected": false.obs,
      "location": {"lat": -52, "long": 35},
      "servers": [
        {
          "city": 'Berlin',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Munich',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Hamburg',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Cologne',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Frankfurt',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Leipzig',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Stuttgart',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Dresden',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Wiesbaden',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
      ],
    },
  ];

  final List premiumServer = [
    {
      "flagImage": "assets/icons/ic_flag_usa.svg",
      "expansionIsOpen": false.obs,
      "connected": false.obs,
      "country": "United States",
      "servers": [
        {
          "city": 'New York',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Chicago',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'San Diego',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Los Angeles',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'San Francisco',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'San Jose',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
      ],
    },
    {
      "flagImage": "assets/icons/ic_flag_brazil.svg",
      "country": "Brazil",
      "expansionIsOpen": false.obs,
      "connected": false.obs,
      "servers": [
        {
          "city": 'Curitiba',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Manaus',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Salvador',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'São Paulo',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Rio',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
      ],
    },
    {
      "flagImage": "assets/icons/ic_flag_france.svg",
      "country": "France",
      "expansionIsOpen": false.obs,
      "connected": false.obs,
      "location": 5,
      "servers": [
        {
          "city": 'Paris',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Marseille',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Lyon',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Rouen',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Strasbourg',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Nantes',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Nice',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
      ],
    },
    {
      "flagImage": "assets/icons/ic_flag_canada.svg",
      "country": "Canada",
      "expansionIsOpen": false.obs,
      "connected": false.obs,
      "servers": [
        {
          "city": 'Toronto',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Ottawa',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Vancouver',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Montréal',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Winnipeg',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Calgary',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
        {
          "city": 'Halifax',
          "latency": Random().nextInt(100),
          "connected": false.obs,
        },
      ],
    },
  ];

  latencyColor(latency) {
    if (latency < 50) {
      return const Color(0xff00D589);
    } else if (latency >= 50 && latency <= 80) {
      return const Color(0xffFCBF49);
    } else if (latency > 80) {
      return const Color(0xffE63946);
    }
  }

  connectToServer(
      int countryIndex, int serverIndex, bool isFree, bool mainButton) async {
    if (isFree) {
      currentCountryConnection = freeServers[countryIndex];
      currentServerConnection =
          freeServers[countryIndex]["servers"][serverIndex];
    } else {
      currentCountryConnection = premiumServer[countryIndex];
      currentServerConnection =
          premiumServer[countryIndex]["servers"][serverIndex];
    }

    timerController.resetTimer();
    // below condition check app have last connection //
    if (connectionStatus.value == connected.value ||
        connectionStatus.value == connecting.value) {
      //below connection check we tap connect button again to disconnect
      if (isNowConnected(countryIndex, serverIndex) ||
          (mainButton && countryIndex == lastCountryConnection)) {
        disconnect(isFree);
        connectionStatus.value = disconnected.value;
      } else {
        if (countryIndex == 0) {
          print("connecting");
          disconnect(isFree);
          connect(countryIndex, serverIndex, isFree);

          lastCountryConnection = countryIndex;
          lastServerConnection = serverIndex;

          connectionStatus.value = connecting.value;
        } else {
          disconnect(isFree);
          connect(countryIndex, serverIndex, isFree);

          lastCountryConnection = countryIndex;
          lastServerConnection = serverIndex;

          connectionStatus.value = connected.value;
        }
      }
    } else {
      //******
      // happen for connect to vpn first time
      //******
      if (countryIndex == 0) {
        /*
        //////////// make connecting status
        */

        connect(countryIndex, serverIndex, isFree);
        lastCountryConnection = countryIndex;
        lastServerConnection = serverIndex;
        connectionStatus.value = connecting.value;
      } else {
        connect(countryIndex, serverIndex, isFree);
        lastCountryConnection = countryIndex;
        lastServerConnection = serverIndex;

        connectionStatus.value = connected.value;
      }
    }
  }

  isNowConnected(int countryIndex, int serverIndex) {
    if (freeServers[countryIndex]['connected'].value == true &&
        freeServers[countryIndex]['servers'][serverIndex]['connected'].value ==
            true) {
      return true;
    } else {
      return false;
    }
  }

  //ali0850203813

  disconnect(bool isFree) {
    if (isFree) {
      for (int i = 0; i < freeServers.length; i++) {
        for (int j = 0; j < freeServers[i]["servers"].length; j++) {
          freeServers[i]['connected'].value = false;
          freeServers[i]['servers'][j]['connected'].value = false;
        }
      }
    } else {
      for (int i = 0; i < premiumServer.length; i++) {
        for (int j = 0; j < premiumServer[i]["servers"].length; j++) {
          premiumServer[i]['connected'].value = false;
          premiumServer[i]['servers'][j]['connected'].value = false;
        }
      }
    }
  }

  connect(int countryIndex, int serverIndex, bool isFree) {
    if (isFree) {
      freeServers[countryIndex]['servers'][serverIndex]['connected'].value =
          true;
      freeServers[countryIndex]['connected'].value = true;
    } else {
      premiumServer[countryIndex]['servers'][serverIndex]['connected'].value =
          true;
      premiumServer[countryIndex]['connected'].value = true;
    }
  }
}
