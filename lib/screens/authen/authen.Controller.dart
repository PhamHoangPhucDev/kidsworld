import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/apps/deviceDetail.Model.dart';
import '../../utility/app.Utility.dart';
import 'pages/signIn/signIn.Container.dart';
import 'pages/signIn/signIn.Controller.dart';
import 'pages/signUp/signUp.Container.dart';
import 'pages/signUp/signUp.Controller.dart';

class AuthenController extends GetxController {
  static AuthenController get instance => Get.put(AuthenController());
  RxInt tabIndex = 0.obs;
  late List<String> myTabs = <String>[];
  late List<Widget> myListPage = <Widget>[];
  late DeviceDetailsModel deviceInfo;

  @override
  void onInit() {
    myTabs = [
      'Đăng nhập',
      'Đăng ký',
    ];
    myListPage = [SignInScreen(),SignUpScreen()];
    super.onInit();
  }

  void deleteSignInUp(){
    SignInController.instance.clearController();
    SignUpController.instance.clearController();
  }

  @override
  void onReady() async {
    if(await getSharedPreferences("token", "String") == null){
      deviceInfo = await getDeviceDetails();
    }
    super.onReady();
  }

 }
