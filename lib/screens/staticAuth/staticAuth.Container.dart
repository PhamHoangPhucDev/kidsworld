import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authen/authen.Container.dart';
import '../authen/authen.Controller.dart';
import '../main/main.Container.dart';
import '../main/main.Controller.dart';
import 'staticAuth.Controller.dart';

class StaticAuthScreen extends GetWidget<StaticAuthController> {
  StaticAuthController staticAuthController = Get.find();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return MainScreen();
        } else {
          Get.delete<MainController>();         
          return AuthenScreen();
        }
      },
    );
  }
}
