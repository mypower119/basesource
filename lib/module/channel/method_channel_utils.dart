import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'channel_constant.dart';

class MethodChannelUtils {
  static const String _methodChannel = 'posapp_channel';

  MethodChannel methodChannel;

  static MethodChannelUtils INSTANCE = null;

  static MethodChannelUtils getInstance() {
    if (INSTANCE == null) {
      INSTANCE = new MethodChannelUtils();
    }
    return INSTANCE;
  }

  MethodChannelUtils() {
    methodChannel = new MethodChannel(_methodChannel);
  }
//
//
//  Future<ShopInfoEmbedModel> getShopInfoEmbed() async {
//    try {
//      String result = await methodChannel.invokeMethod(SIGNAL_GET_SHOP_ID);
//
//      return ShopInfoEmbedModel.fromJson(jsonDecode(result));
//    } on PlatformException {}
//  }
//
//  existApp() async {
//    try {
//      methodChannel.invokeMethod(SIGNAL_DESTROY_ACTIVITY);
//    } on PlatformException {}
//  }
//
//  Future<void> sendBase64ToPrint(String base64Data){
//    try {
//      methodChannel.invokeMethod(SIGNAL_BASE64_IMAGE_PRINT, <String, dynamic>{
//        PRINT_PARAM_IMAGE:base64Data,
//      });
//    } on PlatformException {}
//  }
//
//  Future<List<ItemModel3>> getShopData(String dataType) async {
//    try {
//      var json = await methodChannel.invokeMethod(SIGNAL_GET_SHOP_DATA, <String, dynamic>{
//        SHOP_DATA_PARAM: dataType,
//      });
//      List<dynamic> list = jsonDecode(json);
//      List<ItemModel3> itemData = new List();
//      list.forEach((item) {
//        itemData.add(ItemModel3.fromJson(item));
//      });
//      return itemData;
//    } on PlatformException catch (e) {
//      throw 'get shop data fail';
//    }
//  }
//

//  Future<List<Role>> getPermissions() async {
//    try {
//      var json = await methodChannel.invokeMethod(SIGNAL_GET_PERMISSION);
//      List<dynamic> list = jsonDecode(json);
//      List<Role> itemData = new List();
//      list.forEach((item) {
//        itemData.add(Role.fromJson(item));
//      });
//      return itemData;
//    } on PlatformException catch (e) {
//      throw 'get shop data fail';
//    }
//  }
//
//  getAchiemvent(Function success) async {
//    try {
//      var json = await methodChannel.invokeMethod(SIGNAL_GET_ALL_ACHIEVEMENT);
//      List<dynamic> list = jsonDecode(json);
//      List<Achievement2> achievements = new List();
//      list.forEach((item) {
//        achievements.add(Achievement2.fromJson(item));
//      });
//      success(achievements);
//    } on PlatformException catch (e) {
//      throw 'fail ten ten ten';
//    }
//  }
//
//  getAchivementState(Function success) async {
//    try {
//      var json = await methodChannel.invokeMethod(SIGNAL_GET_ACHIEVEMENT_STATE);
//      List<dynamic> list = jsonDecode(json);
//      List<AchievementState> achievements = new List();
//      list.forEach((item) {
//        achievements.add(AchievementState.fromJson(item));
//      });
//      success(achievements);
//    } on PlatformException catch (e) {
//      throw 'fail ten ten ten';
//    }
//  }
//
//  getReportInMonth(int month, Function success) async {
//    try {
//      var json = await methodChannel
//          .invokeMethod(SIGNAL_GET_SCHEDULE_REPORT, <String, dynamic>{
//        PARAM_REPORT_MONTH: month,
//      });
//      List<dynamic> list = jsonDecode(json);
//      List<Schedule> schedules = new List();
//
//      Schedule scheduleReport = Schedule.empty();
//
//      list.forEach((item) {
//        Schedule newItem = Schedule.fromJson(item);
//        scheduleReport.mergetData(newItem);
//        schedules.add(newItem);
//      });
//
//      if (schedules.length > 0) {
//        scheduleReport.month = schedules[0].month;
//      }
//
//      success(schedules, scheduleReport);
//    } on PlatformException catch (e) {
//      throw 'fail ten ten ten';
//    }
//  }
//
//  getPre30Schedule(Function success) async {
//    try {
//      var json = await methodChannel.invokeMethod(SIGNAL_GET_30_PRE_SCHEDULE);
//      List<dynamic> list = jsonDecode(json);
//      List<Schedule> schedule = new List();
//
//      list.forEach((item) {
//        schedule.add(Schedule.fromJson(item));
//      });
//      success(schedule);
//    } on PlatformException catch (e) {
//      throw 'fail ten ten ten';
//    }
//  }
//
////
//  getAppConfig(Function success) async {
//    try {
//      var json = await methodChannel.invokeMethod(SIGNAL_GET_CONFIG);
//      Config config = Config.fromJson(jsonDecode(json));
//      success(config);
//    } on PlatformException catch (e) {
//      throw 'fail ten ten ten';
//    }
//  }
//
//  saveConfig(Config config) async {
//    try {
//      methodChannel.invokeMethod(SIGNAL_SAVE_CONFIG,
//          <String, dynamic>{PARAM_CONFIG: config.toJson().toString()});
//    } on PlatformException catch (e) {
//      throw 'fail ten ten ten';
//    }
//  }
//
//  getListMonth(Function success) async {
//    try {
//      var json = await methodChannel.invokeMethod(SIGNAL_GET_LIST_MONTH);
//      List<dynamic> monthsObject = jsonDecode(json);
//      List<int> months = new List();
//      monthsObject.forEach((month) {
//        months.add(month as int);
//      });
//      success(months);
//    } on PlatformException catch (e) {
//      throw 'fail ten ten ten';
//    }
//  }
//
//  resetTodaySchedule() async {
//    try {
//      methodChannel.invokeMethod(SIGNAL_RESET_SCHEDULE_TODAY);
//    } on PlatformException catch (e) {
//      throw 'fail ten ten ten';
//    }
//  }
//
//  getAllExercise(Function success) async {
//    try {
//      var json = await methodChannel.invokeMethod(SIGNAL_GET_SCHEDULE_EXERCISE);
//      List<dynamic> list = jsonDecode(json);
//      List<Schedule> schedule = new List();
//
//      list.forEach((item) {
//        schedule.add(Schedule.fromJson(item));
//      });
//      success(schedule);
//    } on PlatformException catch (e) {
//      throw 'fail ten ten ten';
//    }
//  }
//
//  getAllSchedule(Function success) async {
//    try {
//      var json = await methodChannel.invokeMethod(SIGNAL_GET_ALL_SCHEDULE);
//      List<dynamic> list = jsonDecode(json);
//      List<Schedule> schedule = new List();
//
//      list.forEach((item) {
//        schedule.add(Schedule.fromJson(item));
//      });
//      success(schedule);
//    } on PlatformException catch (e) {
//      throw 'fail ten ten ten';
//    }
//  }
//
//  removeSchedule(List<Schedule> schedules) async {
//    try {
//      List json = new List();
//      schedules.forEach((item) {
//        json.add(item.toJson());
//      });
//      String jsonSchedule = jsonEncode(json);
//
//
//      methodChannel.invokeMethod(SIGNAL_REMOVE_SCHEDULE, <String, dynamic>{
//        PARAM_REMOVE_SCHEDULE_DATA: jsonSchedule
//      });
//    } on PlatformException catch (e) {
//      throw 'fail ten ten ten';
//    }
//  }
}
