import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:platform_device_id/platform_device_id.dart';

class Utils{
  static void fireToast(msg){
    Fluttertoast.showToast(msg: msg,
    toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
  static Future<Map<String,String>> deviceParams() async {
    Map<String,String> params = {};
    var getDeviceId = await PlatformDeviceId.getDeviceId;
    String fcmToken = "";
    if(Platform.isAndroid){
      params.addAll({
        'device_id': getDeviceId!,
        'device_type': "A",
        'device_token': fcmToken,
      });
    }else{
      params.addAll({
        'device_id': getDeviceId!,
        'device_type': "I",
        'device_token': fcmToken,
      });
    }
    return params;
  }
}