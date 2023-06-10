import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile.Controller.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  final ProfileController profileController = Get.find();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Center(child: Container(child: Text("Profile"),));
  }
}
