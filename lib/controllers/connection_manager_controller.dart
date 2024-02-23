import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/helpers.dart';

class ConnectionManagerController extends GetxController {
  //0 = No Internet, 1 = WIFI Connected ,2 = Mobile Data Connected.
  var connectionType = 0.obs;

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<ConnectivityResult> _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    getConnectivityType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  Future<void> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    logItem("ˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆ");
    logItem(connectivityResult);
    return _updateState(connectivityResult);
  }

  Future<void> getConnectivityType2() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    logItem("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        if (Get.isSnackbarOpen) {
          Get.closeCurrentSnackbar();
        }
        break;
      case ConnectivityResult.mobile:
        connectionType.value = 2;
        if (Get.isSnackbarOpen) {
          Get.closeCurrentSnackbar();
        }
        break;
      case ConnectivityResult.none:
        {
          connectionType.value = 0;
          // Get.rawSnackbar(
          //     messageText: const Text(
          //         'PLEASE CONNECT TO THE INTERNET',
          //         style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 14
          //         )
          //     ),
          //     isDismissible: false,
          //     duration: const Duration(days: 1),
          //     backgroundColor: Colors.red[400]!,
          //     icon: const Icon(Icons.wifi_off, color: Colors.white, size: 35,),
          //     margin: EdgeInsets.zero,
          //     snackStyle: SnackStyle.GROUNDED
          // );
        }
        break;
      default:
        // showSnackBar(context,
        //     title: 'Error',
        //     message: 'Failed to get connection type',
        //     type: 'danger');
        break;
    }

    logItem("===0!!!!!!!!!!!!!!!!!!!!!!!");
    logItem(connectionType.value);
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}
