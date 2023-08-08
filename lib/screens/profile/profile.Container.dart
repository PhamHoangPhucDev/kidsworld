import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'elements/bodyProfile.Element.dart';
import 'profile.Controller.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  final ProfileController profileController = Get.find();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    profileController.context = context;
    // return StreamBuilder<User?>(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshot) {
    //     if(snapshot.hasData) {
    //       return BodyProfileElement();
    //     } else {
    //       return AuthenScreen();
    //     }
    //   },
    // );
    return BodyProfileElement();
  }
}
